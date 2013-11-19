package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.dao.ItinerarioDao;
import br.usp.ime.engsoft.entidade.Itinerarie;

@Resource
public class ItinerariesController {
	ItinerarioDao dao;
	Result result;
	
	
	public ItinerariesController(ItinerarioDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/itineraries")
	public List<Itinerarie> index(String busca) {
		List<Itinerarie> itineraries;
		if (busca == null) 
			itineraries = new ArrayList<Itinerarie>();
		else
			itineraries = this.dao.buscaItinerarie(busca);
		return itineraries;
	}
	
	public void ver(Long id) {
		this.result.include("itinerarie", this.dao.carrega(id));
	}
	
	
}

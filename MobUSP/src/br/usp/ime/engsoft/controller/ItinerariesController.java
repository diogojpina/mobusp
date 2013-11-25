package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.dao.ItinerarieDao;
import br.usp.ime.engsoft.entidade.Itinerarie;

@Resource
public class ItinerariesController {
	ItinerarieDao dao;
	Result result;
	
	
	public ItinerariesController(ItinerarieDao dao, Result result) {
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
	
	public Itinerarie ver(Long id) {
		Itinerarie iti = this.dao.carrega(id);
		this.result.include("itinerarie", iti);
		return iti;
	}
	
	
}

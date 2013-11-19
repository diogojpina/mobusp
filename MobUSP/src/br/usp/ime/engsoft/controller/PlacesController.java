package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.dao.PlaceDao;
import br.usp.ime.engsoft.entidade.Place;

@Resource
public class PlacesController {
	private PlaceDao dao;
	private final Result result;
	
	public PlacesController(PlaceDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/places")
	public List<Place> index(String busca) {
		List<Place> places;
		if (busca == null) 
			places = new ArrayList<Place>();
		else
			places = this.dao.buscaPlace(busca);
		return places;
	}
	
	public void ver(Long id) {
		this.result.include("place", this.dao.carrega(id));
	}
	
	public List<Place> lista() {
		return dao.listaTudo();		
	}
	
	public Place formulario(Long id) {
		Place place;
		if (id == 0)
			place = new Place();
		else
			place = this.dao.carrega(id);
			
		return place;
	}
}

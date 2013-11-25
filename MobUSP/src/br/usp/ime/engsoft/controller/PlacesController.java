package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
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
	

	
	public Place ver(Long id) {
		Place place = this.dao.carrega(id);
		this.result.include("place", place);
		return place;
	}
	
	public List<Place> lista() {
		return dao.listaTudo();		
	}
	
	public void listaJson() {
		List<Place> places = dao.listaTudo();	
		this.result.use(Results.json()).from(places).serialize();		
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

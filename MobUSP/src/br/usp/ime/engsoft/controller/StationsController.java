package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.dao.ItinerarieDao;
import br.usp.ime.engsoft.dao.StationDao;
import br.usp.ime.engsoft.entidade.Station;

@Resource
public class StationsController {
	StationDao dao;
	Result result;
	
	public StationsController(StationDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}	
	
	@Path("/stations")
	public List<Station> index(String busca) {
		List<Station> stations;
		if (busca == null) 
			stations = new ArrayList<Station>();
		else
			stations = this.dao.buscaStation(busca);
		return stations;
	}
	
	
	public Station ver(Long id) {
		Station station = this.dao.carrega(id);
		this.result.include("station", station);
		return station;
	}	
}

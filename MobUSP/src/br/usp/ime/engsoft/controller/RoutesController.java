package br.usp.ime.engsoft.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.dao.PlaceDao;
import br.usp.ime.engsoft.entidade.Itinerarie;
import br.usp.ime.engsoft.entidade.Place;
import br.usp.ime.engsoft.entidade.Station;


@Resource
public class RoutesController {
	PlaceDao dao;
	Result result;
	
	
	public RoutesController(PlaceDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/routes")
	public void index(Long id1, Long id2) {
		Place place1;
		Place place2;
		
		this.result.include("places", this.dao.listaTudo());
		this.result.include("id1", id1);
		this.result.include("id2", id2);
		
		if (id1 != null && id2 != null) {
			Itinerarie iti = null;
			Itinerarie iti1;
			Itinerarie iti2;
			List<Itinerarie> itis1;
			List<Itinerarie> itis2;
			
			place1 = this.dao.carrega(id1);
			place2 = this.dao.carrega(id2);
			
			itis1 = this.dao.listItinerates(place1);
			itis2 = this.dao.listItinerates(place2);
			
			Iterator<Itinerarie> i = itis1.iterator();
			Iterator<Itinerarie> j = itis2.iterator();
			
			while (i.hasNext()) {
				iti1 = i.next();
				while (j.hasNext()) {
					iti2 = j.next();
					if (iti1.getId() == iti2.getId())
						iti = iti1;
				}
				if (iti != null)
					break;
			}
			
			if (iti == null) {
				System.out.println("Não foi possível encontrar rota.");
			}
			else {
				System.out.println(iti.getName());
			}
			
			this.result.include("itinerario", iti);	

			
		}
		else {
			place1 = new Place();
			place2 = new Place();			
		}
			
		 

	}	

}

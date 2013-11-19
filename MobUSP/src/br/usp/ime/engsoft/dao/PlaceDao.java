package br.usp.ime.engsoft.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hsqldb.lib.HashSet;

import br.com.caelum.vraptor.ioc.Component;
import br.usp.ime.engsoft.entidade.Itinerarie;
import br.usp.ime.engsoft.entidade.Place;
import br.usp.ime.engsoft.entidade.Station;

@Component
public class PlaceDao {
	private Session session;
	
	public PlaceDao() {
		this.session = CriadorDeSession.getSession();
	}
	
	public void setSession(Session session) {
		this.session = session;
	}
	
	public List<Place> listaTudo() {
		return this.session.createCriteria(Place.class).list();
	}	
	
	public Place carrega(Long id) {
		return (Place) this.session.get(Place.class, id);
	}
	
	public void salva(Place place) {
		Transaction tx = session.beginTransaction();
		if (place.getId() == 0)
			session.save(place);
		else
			session.update(place);
		tx.commit();
	}
	
	public void remove(Place place) {
		Transaction tx = session.beginTransaction();
		this.session.delete(place);
		tx.commit();		
	}
	
	public List<Place> buscaPlace(String busca) {
		List<Place> places = session.createCriteria(Place.class)
				.add(Restrictions.or(Restrictions.like("name", busca, MatchMode.ANYWHERE), Restrictions.like("description", busca, MatchMode.ANYWHERE)))
				.list();
		return places;		
	}
	
	private Long isItinerarie(Long id, List<Itinerarie> itineraries) {
		Iterator<Itinerarie> i = itineraries.iterator();
		while (i.hasNext()) {
			if (id == i.next().getId())
				return id;
		}
		
		return (long) 0;
	}
	
	public List<Itinerarie> listItinerates(Place place) {
		List<Itinerarie> itineraries = new ArrayList<Itinerarie>();
		Itinerarie itinerarie;
		Station station;
		
		Iterator i = place.getStations().iterator();
		
		while (i.hasNext()) {
			station = (Station) i.next();
			Iterator j = station.getItineraries().iterator();
			while (j.hasNext()) {
				itinerarie = (Itinerarie) j.next();
				if (isItinerarie(itinerarie.getId(), itineraries) == 0)
					itineraries.add(itinerarie);
			}
		}		
		
		return itineraries;
	}

}

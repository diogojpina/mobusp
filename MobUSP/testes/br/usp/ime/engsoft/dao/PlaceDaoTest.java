package br.usp.ime.engsoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import org.mockito.MockitoAnnotations;

import br.usp.ime.engsoft.entidade.Itinerarie;
import br.usp.ime.engsoft.entidade.Place;
import br.usp.ime.engsoft.entidade.Station;

public class PlaceDaoTest {
	
	private PlaceDao placeDao;
	private List<Place> places;	
	private Place place;
	
	private @Mock Session session;
	private @Mock Transaction tx;
	private @Mock Criteria criteria;
	
	
	
	@Before
    public void setUp(){
		MockitoAnnotations.initMocks(this);
		
		
		placeDao = new PlaceDao();
		placeDao.setSession(session);
		
		List<Itinerarie> itis = new ArrayList<Itinerarie>();
		Itinerarie iti = new Itinerarie();
		iti.setId((long) 1);
		iti.setName("Butant� USP");
		iti.setCode("ABC");
		itis.add(iti);
		
		List<Station> stations = new ArrayList<Station>();
		Station station = new Station();
		station.setId((long) 1);
		station.setName("Ponto do IME");		
		station.setItineraries(itis);
		stations.add(station);	
		
		
		
		places = new ArrayList<Place>();
		
		place = new Place();
		place.setId((long) 1);
		place.setName("IME");
		place.setAddress("Rua do Mat�o");	
		place.setStations(stations);
		places.add(place);
		
		when(session.beginTransaction()).thenReturn(tx);
		when(session.createCriteria(Place.class)).thenReturn(criteria);
		when(criteria.list()).thenReturn(places);	
		

	}
	
	
	@Test
	public void listaTudo() {
		List<Place> places = placeDao.listaTudo();
		assertTrue(places.size() > 0);
	}	
	
	@Test
	public void carrega() {
		Long id = (long) 1;		
		
		when(session.get(Place.class, id)).thenReturn(place);
		Place place = placeDao.carrega(id);
		assertEquals(place.getName(), "IME");
	}
	
	@Test
	public void salva() {	
		Place place = new Place();
		place.setId((long) 0);
		place.setName("IME");
		place.setAddress("Rua do Mat�o");		
		
		placeDao.salva(place);
		
		verify(session).save(place);
		verify(tx).commit();
	}
	
	@Test
	public void atualiza() {	
		placeDao.salva(place);
		verify(session).update(place);
		verify(tx).commit();
	}	
	
	@Test
	public void remove() {
		placeDao.remove(place);
		
		verify(session).delete(place);
		verify(tx).commit();
	}
	
	@Test
	public void busca() {
		placeDao.buscaPlace("IME");
		assertTrue(places.size() > 0);
	}
	
	@Test
	public void listItineraries() {
		List<Itinerarie> itis = placeDao.listItinerates(place);
		assertTrue(itis.size() > 0);		
	}

}

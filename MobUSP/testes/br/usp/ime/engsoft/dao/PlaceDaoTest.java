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

import br.usp.ime.engsoft.entidade.Place;

public class PlaceDaoTest {
	
	private PlaceDao placeDao;
	private List<Place> places;	
	
	private @Mock Session session;
	
	
	
	@Before
    public void setUp(){
		MockitoAnnotations.initMocks(this);
		
		
		placeDao = new PlaceDao();
		placeDao.setSession(session);
		
		places = new ArrayList<Place>();
		
		Place place = new Place();
		place.setId((long) 1);
		place.setName("IME");
		place.setAddress("Rua do Matão");		
		places.add(place);
		
		when(session.get(Place.class, (long) 1)).thenReturn(place);
		when(session.createCriteria(Place.class).list()).thenReturn(places);
	}
	
	
	public void listaTudo() {
		List<Place> places = placeDao.listaTudo();		
	}	
	
	@Test
	public void carrega() {
		Long id = (long) 1;		
		Place place = placeDao.carrega(id);
		assertEquals(place.getName(), "IME");
	}
	


}

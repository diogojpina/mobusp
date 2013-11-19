package br.usp.ime.engsoft.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.dao.PlaceDao;
import br.usp.ime.engsoft.entidade.Place;

public class PlacesControllerTest {
	
	private PlacesController placesC;
	private PlaceDao placeDao;
	private List<Place> places;	
	private MockResult result;
	
	@Before
    public void SetUp() {  
		result = spy(new MockResult());
		placeDao = mock(PlaceDao.class);		
		placesC = new PlacesController(placeDao, result);
		
		places = new ArrayList<Place>();
		
		Place place = new Place();
		place.setId((long) 1);
		place.setName("IME");
		place.setAddress("Rua do Matão");		
		places.add(place);
		
		when(placeDao.buscaPlace("IME")).thenReturn(places);
		when(placeDao.carrega((long) 1)).thenReturn(place); 
		when(placeDao.listaTudo()).thenReturn(places);
		
	}
	
	
	@Test
	public void busca() {
		List<Place> places = this.placesC.index("IME");
		verify(placeDao).buscaPlace("IME");
		assertTrue(places.size() > 0);
	}
	
	@Test 
		public void buscaVazia() {
		List<Place> places = this.placesC.index(null);
		assertEquals(places.size(), 0);
	}
	
	@Test
	public void ver() {
		Long id = (long) 1;
		this.placesC.ver(id);
		verify(placeDao).carrega(id);
	}
	
	@Test
	public void lista() {
		List<Place> places = this.placesC.lista();
		assertTrue(places.size() > 0);	
	}
	
	@Test
	public void formCad() {
		Long id = (long) 0;
		Place place = this.placesC.formulario(id);
		assertNull(place.getName());
	}
	
	@Test
	public void formAlt() {
		Long id = (long) 1;
		Place place = this.placesC.formulario(id);
		assertEquals(place.getName(), "IME");	
	}

}

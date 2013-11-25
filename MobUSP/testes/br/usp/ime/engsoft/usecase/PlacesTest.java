package br.usp.ime.engsoft.usecase;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.controller.PlacesController;
import br.usp.ime.engsoft.dao.PlaceDao;
import br.usp.ime.engsoft.entidade.Place;

public class PlacesTest {
	
	PlaceDao dao;
	MockResult result;
	PlacesController placesC;
	
	@Before
    public void SetUp() {
		dao = new PlaceDao();
		result = spy(new MockResult());
		placesC = new PlacesController(dao, result);	
	}
	
	@Test
	public void search() {
		List<Place> places = placesC.index("IME");		
		assertTrue(places.size() > 0);
		
		places = placesC.index("PAULISTA");		
		assertTrue(places.size() == 0);				
	}
	
	@Test
	public void ver() {
		Place place = placesC.ver((long) 1);		
		equals(place.getId() == (long) 1);	
	}

}

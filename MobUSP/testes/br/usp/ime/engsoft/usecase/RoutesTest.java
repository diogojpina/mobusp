package br.usp.ime.engsoft.usecase;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.spy;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.controller.ItinerariesController;
import br.usp.ime.engsoft.controller.RoutesController;
import br.usp.ime.engsoft.dao.ItinerarieDao;
import br.usp.ime.engsoft.dao.PlaceDao;
import br.usp.ime.engsoft.entidade.Itinerarie;

public class RoutesTest {
	PlaceDao dao;
	MockResult result;
	RoutesController routesC;
	
	
	@Before
    public void SetUp() {
		dao = new PlaceDao();
		result = spy(new MockResult());
		routesC = new RoutesController(dao, result);		
	}
	
	@Test
	public void search() {
		List<Itinerarie> itis = routesC.index((long) 1, (long) 2);
		
		assertTrue(itis.size() > 0);
	}

}

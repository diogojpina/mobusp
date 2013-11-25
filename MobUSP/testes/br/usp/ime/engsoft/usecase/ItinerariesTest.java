package br.usp.ime.engsoft.usecase;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.spy;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.controller.ItinerariesController;
import br.usp.ime.engsoft.dao.ItinerarieDao;
import br.usp.ime.engsoft.entidade.Itinerarie;

public class ItinerariesTest {

	ItinerarieDao dao;
	MockResult result;
	ItinerariesController itiC;
	
	
	@Before
    public void SetUp() {
		dao = new ItinerarieDao();
		result = spy(new MockResult());
		itiC = new ItinerariesController(dao, result);		
	}
	
	@Test
	public void search() {
		List<Itinerarie> itis = itiC.index("USP");
		assertTrue(itis.size() > 0);
		
		itis = itiC.index("QUALQUER COISA");
		assertTrue(itis.size() == 0);
	}
	
	@Test
	public void ver() {
		Itinerarie iti = itiC.ver((long) 1);
		equals(iti.getId() == (long) 1);	
	}
}

package br.usp.ime.engsoft.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.dao.ItinerarioDao;
import br.usp.ime.engsoft.entidade.Itinerarie;

public class ItinerariesControllerTest {

	private ItinerariesController itiC;
	private ItinerarioDao itiDao;
	private List<ItinerariesController> itis;
	private MockResult result;	
	
	@Before
	public void SetUp() {  
		result = spy(new MockResult());
		itiDao = mock(ItinerarioDao.class);
		itiC = new ItinerariesController(itiDao, result);
		
		List<Itinerarie> itis = new ArrayList<Itinerarie>();
		
		Itinerarie iti = new Itinerarie();
		iti.setId((long) 0);
		iti.setName("Butant� USP");
		iti.setCode("ABC");
		itis.add(iti);		
		
		when(itiDao.buscaItinerarie("USP")).thenReturn(itis);
		
	}
	
	
	@Test
	public void busca() {
		List<Itinerarie> itis = this.itiC.index("USP");
		verify(itiDao).buscaItinerarie("USP");
		assertTrue(itis.size() > 0);
	}
}


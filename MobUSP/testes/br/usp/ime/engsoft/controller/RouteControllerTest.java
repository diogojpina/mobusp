package br.usp.ime.engsoft.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.dao.PlaceDao;

public class RouteControllerTest {
	
	private RoutesController routesC;
	private PlaceDao placeDao;
	private MockResult result;	
	
	
	@Before
	public void SetUp() {  
		result = spy(new MockResult());
		placeDao = mock(PlaceDao.class);
		routesC = new RoutesController(placeDao, result);
	}
	
	@Test
	public void buscaRotasVazias() {
		routesC.index(null, null);
		verify(result).include("itinerarie", null);
	}
	
	
	

}

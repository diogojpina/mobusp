package br.usp.ime.engsoft.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.dao.ItinerarieDao;
import br.usp.ime.engsoft.dao.StationDao;
import br.usp.ime.engsoft.entidade.Station;

public class StationsControllerTest {
	
	private StationsController stationC;
	private StationDao stationDao;
	private List<Station> stations;
	private MockResult result;	
	
	@Before
	public void SetUp() {  
		result = spy(new MockResult());
		stationDao = mock(StationDao.class);
		stationC = new StationsController(stationDao, result);
		
		
		stations = new ArrayList<Station>();
		Station station = new Station();
		station.setId((long) 1);
		station.setName("Ponto do IME");
		stations.add(station);			
		
		
		when(stationDao.buscaStation("IME")).thenReturn(stations);
		
	}
	
	@Test 
	public void busca() {
		List<Station> stations = stationC.index("IME");
		assertTrue(stations.size() > 0);
	}
	
	@Test
	public void buscaVazia() {
		List<Station> stations = stationC.index(null);
		assertTrue(stations.size() == 0);
	}
	
	@Test
	public void ver() {
		Long id = (long) 1;
		stationC.ver(id);
		verify(stationDao).carrega(id);		
	}
	
	
	
	
	

	
	
}

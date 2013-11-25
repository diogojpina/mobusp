package br.usp.ime.engsoft.usecase;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.spy;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;
import br.usp.ime.engsoft.controller.StationsController;
import br.usp.ime.engsoft.dao.StationDao;
import br.usp.ime.engsoft.entidade.Station;

public class StationsTest {

	StationDao dao;
	MockResult result;
	StationsController stationsC;
	
	
	@Before
    public void SetUp() {
		dao = new StationDao();
		result = spy(new MockResult());
		stationsC = new StationsController(dao, result);
	}
	
	@Test
	public void search() {
		List<Station> stations = stationsC.index("IME");
		assertTrue(stations.size() > 0);
		
		stations = stationsC.index("PAULISTA");
		assertTrue(stations.size() == 0);
	}
	
	@Test
	public void ver() {
		Station station = stationsC.ver((long) 1);
		equals(station.getId() == (long) 1);	
	}
}

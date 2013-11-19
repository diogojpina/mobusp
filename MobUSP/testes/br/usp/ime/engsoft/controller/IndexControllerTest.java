package br.usp.ime.engsoft.controller;

import static org.mockito.Mockito.spy;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.util.test.MockResult;

public class IndexControllerTest {
	
	private IndexController indexC;
	
	private MockResult result;
	
	@Before
    public void SetUp() {  
		result = spy(new MockResult());
		indexC = new IndexController(result);
	}
	
	@Test
	public void index() {
		this.indexC.index();
		verify(result).include("titulo", "MobUSP");
	} 

}

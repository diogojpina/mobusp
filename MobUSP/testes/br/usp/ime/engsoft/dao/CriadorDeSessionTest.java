package br.usp.ime.engsoft.dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.hibernate.Session;

public class CriadorDeSessionTest {

	@Test
	public void getSession() {
		Session session = CriadorDeSession.getSession();
		assertNotNull(session);
	}
	
}

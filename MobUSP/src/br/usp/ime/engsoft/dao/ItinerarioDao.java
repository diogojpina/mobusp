package br.usp.ime.engsoft.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.usp.ime.engsoft.entidade.Itinerarie;
import br.usp.ime.engsoft.entidade.Place;

@Component
public class ItinerarioDao {
	private final Session session;
	
	public ItinerarioDao() {
		this.session = CriadorDeSession.getSession();
	}
	
	public List<Itinerarie> listaTudo() {
		return this.session.createCriteria(Itinerarie.class).list();
	}
	
	public List<Itinerarie> buscaItinerarie(String busca) {
		List<Itinerarie> itineraries = session.createCriteria(Itinerarie.class)
				.add(Restrictions.or(Restrictions.like("name", busca, MatchMode.ANYWHERE), Restrictions.like("description", busca, MatchMode.ANYWHERE)))
				//.add(Restrictions.like("name", busca))				
				.list();
		return itineraries;		
	}	
	
	public Itinerarie carrega(Long id) {
		return (Itinerarie) this.session.get(Itinerarie.class, id);
	}

}

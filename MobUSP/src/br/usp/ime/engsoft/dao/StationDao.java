package br.usp.ime.engsoft.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.usp.ime.engsoft.entidade.Place;
import br.usp.ime.engsoft.entidade.Station;

@Component
public class StationDao {
	private final Session session;
	
	public StationDao() {
		this.session = CriadorDeSession.getSession();
	}	
	
	public List<Station> listaTudo() {
		return this.session.createCriteria(Station.class).list();
	}	
	
	public Station carrega(Long id) {
		return (Station) this.session.get(Station.class, id);
	}
	
	public void salva(Station station) {
		Transaction tx = session.beginTransaction();
		if (station.getId() == 0)
			session.save(station);
		else
			session.update(station);
		tx.commit();
	}
	
	public void remove(Station station) {
		Transaction tx = session.beginTransaction();
		this.session.delete(station);
		tx.commit();		
	}
	
	public List<Station> buscaStation(String busca) {
		List<Station> stations = session.createCriteria(Place.class)
				.add(Restrictions.or(Restrictions.like("name", busca, MatchMode.ANYWHERE), Restrictions.like("description", busca, MatchMode.ANYWHERE)))
				//.add(Restrictions.like("name", busca))				
				.list();
		return stations;		
	}

}

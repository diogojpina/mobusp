package br.usp.ime.engsoft.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.ioc.Component;
import br.usp.ime.engsoft.Produto;

@Component
public class ProdutoDao {
	private final Session session;

	public ProdutoDao() {
		this.session = CriadorDeSession.getSession();
	}

	public List<Produto> listaTudo() {
		return this.session.createCriteria(Produto.class).list();
	}

	public Produto carrega(Long id) {
		return (Produto) this.session.load(Produto.class, id);
	}

	public void salva(Produto produto) {
		Transaction tx = session.beginTransaction();
		if (produto.getId() == 0)
			session.save(produto);
		else
			session.update(produto);
		tx.commit();
	}

	public void remove(Produto produto) {
		Transaction tx = session.beginTransaction();
		this.session.delete(produto);
		tx.commit();
	}
	
	
}

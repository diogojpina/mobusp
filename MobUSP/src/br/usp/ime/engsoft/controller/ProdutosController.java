package br.usp.ime.engsoft.controller;

import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.ime.engsoft.Produto;
import br.usp.ime.engsoft.dao.ProdutoDao;

@Resource
public class ProdutosController {

	private ProdutoDao dao;
	private final Result result;

	public ProdutosController(ProdutoDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}

	@Path("/produtos")
	public List<Produto> lista() {
		return dao.listaTudo();
	}

	public Produto formulario(Long id) {
		Produto produto;
		if (id == 0)
			produto = new Produto();
		else
			produto = dao.carrega(id);
		return produto;
	}

	public void salva(Produto produto) {
		dao.salva(produto);
		result.redirectTo(this).lista();
	}

	public void remove(Long id) {
		Produto produto = dao.carrega(id);
		dao.remove(produto);
		result.redirectTo(this).lista();
	}
}

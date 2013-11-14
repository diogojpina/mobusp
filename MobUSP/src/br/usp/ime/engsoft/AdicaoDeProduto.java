package br.usp.ime.engsoft;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import br.usp.ime.engsoft.dao.CriadorDeSession;
import br.usp.ime.engsoft.dao.ProdutoDao;

public class AdicaoDeProduto {
	public static void main(String[] args) {
		

		Produto produto = criaProduto();

		new ProdutoDao().salva(produto);
	}



	private static Produto criaProduto() {
		Produto produto = new Produto();
		produto.setNome("Prateleira");
		produto.setDescricao("Uma prateleira para colocar livros");
		produto.setPreco(35.90);
		return produto;
	}

}

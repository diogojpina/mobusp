<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Descrição</th>
      <th>Preço</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${produtoList}" var="produto">
      <tr>
        <td>${produto.nome}</td>
        <td>${produto.descricao}</td>
        <td>${produto.preco}</td>
        <td>
        	<a href="produtos/formulario?id=${produto.id}">Editar</a>
        	<a href="produtos/remove?id=${produto.id}">Remover</a>        
        </td>
      </tr>          
    </c:forEach>
  </tbody>
</table>

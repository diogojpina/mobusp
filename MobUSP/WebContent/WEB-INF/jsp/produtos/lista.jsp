<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Descri��o</th>
      <th>Pre�o</th>
      <th>A��es</th>
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

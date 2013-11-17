Procurar Local:
<form method="post">
<input type="text" name="busca" />
<input type="submit" />
</form>
<br /><br />


<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Endereço</th>
      <th>Latitudo</th>
      <th>Longitude</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${placeList}" var="place">
      <tr>
        <td>${place.name}</td>
        <td>${place.address}</td>
        <td>${produto.lat}</td>
        <td>${produto.lon}</td>
        <td>
        	<a href="produtos/formulario?id=${place.id}">Editar</a>
        	<a href="produtos/remove?id=${place.id}">Remover</a>        
        </td>
      </tr>      
</c:forEach>
</tbody>
</table>
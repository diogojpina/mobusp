Procurar Itiner�rio:
<form method="post">
<input type="text" name="busca" />
<input type="submit" />
</form>
<br /><br />


<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Codigo</th>
      <th>Descri��o</th>
      <th>A��es</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${itinerarieList}" var="itinerarie">
      <tr>
        <td>${itinerarie.name}</td>
        <td>${itinerarie.code}</td>
        <td>${itinerarie.description}</td>
        <td>
        	<a href="itineraries/ver?id=${itinerarie.id}">Detalhes</a>       
        </td>
      </tr>      
</c:forEach>
</tbody>
</table>
${place.name}
<br />
${place.address }
<br />
${place.description }
<br /><br />
Esta��es:
<br /><br />
<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Endere�o</th>
      <th>Descri��o</th>
      <th>A��es</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${place.stations}" var="station">
      <tr>
      	<td>${station.name}</td>
      	<td>${station.address}</td>
	  	<td>${station.description}</td>
        <td>
        	<a href="http://localhost:8080/MobUSP/stations/ver?id=${station.id}">Detalhes</a>       
        </td>	  
      </tr>
</c:forEach>
</tbody>
</table>
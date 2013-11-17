${station.name}
<br />
${station.address}
<br />
${station.description}
<br />
${station.lat}
<br />
${station.lon}
<br /><br />

Itiner�rios:
<br />
<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>C�digo</th>
      <th>Descri��o</th>
      <th>A��es</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${station.itineraries}" var="itinerarie">
      <tr>
      	<td>${itinerarie.name}</td>
      	<td>${itinerarie.code }</td>
      	<td>${itinerarie.description }</td>
        <td>
        	<a href="http://localhost:8080/MobUSP/itineraries/ver?id=${itinerarie.id}">Detalhes</a>       
        </td>	      	
</c:forEach>
</tbody>
</table>

<br /><br />
Locais:
<br />
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
<c:forEach items="${station.places}" var="place">
      <tr>
      	<td>${place.name}</td>
      	<td>${place.address }</td>
      	<td>${place.description }</td>
        <td>
        	<a href="http://localhost:8080/MobUSP/places/ver?id=${place.id}">Detalhes</a>       
        </td>	      	
</c:forEach>
</tbody>
</table>
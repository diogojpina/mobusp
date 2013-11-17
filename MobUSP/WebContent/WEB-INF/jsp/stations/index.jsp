Procurar Estações:
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
      <th>Descrição</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${stationList}" var="station">
      <tr>
        <td>${station.name}</td>
        <td>${station.address}</td>
        <td>${station.description}</td>
        <td>
        	<a href="stations/ver?id=${station.id}">Detalhes</a>       
        </td>
      </tr>      
</c:forEach>
</tbody>
</table>
<form method="post">

<select name="id1">
	<option value="0" >Origem...</option>
	<c:forEach items="${places}" var="place">
		<option value="${place.id}" <c:if test="${place.id == id1}">selected="selected"</c:if> >
		${place.name }</option>
	</c:forEach>
</select>

<select name="id2">
	<option value="0" >Destino...</option>
	<c:forEach items="${places}" var="place">
		<option value="${place.id}" <c:if test="${place.id == id2}">selected="selected"</c:if> >
			${place.name}</option>
	</c:forEach>
</select>

<input type="submit" value="Encontrar" />
</form>


<br /><br />


<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Codigo</th>
      <th>Descrição</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${itineraries}" var="itinerarie">
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


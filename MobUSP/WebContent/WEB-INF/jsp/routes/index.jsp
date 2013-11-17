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

<c:if test="${itinerario != null}">
Pegue o seguinte Ônibus:
<br />
${itinerario.name }
<br />
${itinerario.code }
<br />
${itinerario.description }
</c:if>
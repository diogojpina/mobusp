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
      <th>Descri��o</th>
      <th>A��es</th>
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


	<div data-bind='simpleGrid: gridViewModel'></div>
	<button data-bind='click: addItem'>Add item</button>

	<button data-bind='click: sortByName'>Sort by name</button>

	<button
		data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
		Jump to first page</button>
</body>

<script type="text/javascript">
	var initialData = [
		{ name: "Itiner�rio A", code: "C�digo A", ds: "Descri��o A", action: "A��o A" },
		{ name: "Itiner�rio B", code: "C�digo B", ds: "Descri��o B", action: "A��o B" },
		{ name: "Itiner�rio C", code: "C�digo C", ds: "Descri��o C", action: "A��o C" },
		{ name: "Itiner�rio D", code: "C�digo D", ds: "Descri��o D", action: "A��o D" },
		{ name: "Itiner�rio E", code: "C�digo E", ds: "Descri��o E", action: "A��o E" },
		{ name: "Itiner�rio F", code: "C�digo F", ds: "Descri��o F", action: "A��o F" },
		{ name: "Itiner�rio G", code: "C�digo G", ds: "Descri��o G", action: "A��o G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Itiner�rio Novo", code: "C�digo Novo", ds: "Descri��o Nova", action: "A��o Nova" });
        };
        
        this.sortByName = function() {
        	this.items.sort(function(a, b) {
            	return a.name < b.name ? -1 : 1;
            });
        };
                
        this.jumpToFirstPage = function() {
        	this.gridViewModel.currentPageIndex(0);
        };
                
        this.gridViewModel = new ko.simpleGrid.viewModel({
        	data: this.items,
            columns: [
            	{ headerText: "Nome", rowText: "name" },
                { headerText: "C�digo", rowText: "code" },
                { headerText: "Descri��o", rowText: "ds" },
                { headerText: "A��es", rowText: "action" } 
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
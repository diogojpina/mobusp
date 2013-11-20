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


	<div data-bind='simpleGrid: gridViewModel'></div>
	<button data-bind='click: addItem'>Add item</button>

	<button data-bind='click: sortByName'>Sort by name</button>

	<button
		data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
		Jump to first page</button>
</body>

<script type="text/javascript">
	var initialData = [
		{ name: "Itinerário A", code: "Código A", ds: "Descrição A", action: "Ação A" },
		{ name: "Itinerário B", code: "Código B", ds: "Descrição B", action: "Ação B" },
		{ name: "Itinerário C", code: "Código C", ds: "Descrição C", action: "Ação C" },
		{ name: "Itinerário D", code: "Código D", ds: "Descrição D", action: "Ação D" },
		{ name: "Itinerário E", code: "Código E", ds: "Descrição E", action: "Ação E" },
		{ name: "Itinerário F", code: "Código F", ds: "Descrição F", action: "Ação F" },
		{ name: "Itinerário G", code: "Código G", ds: "Descrição G", action: "Ação G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Itinerário Novo", code: "Código Novo", ds: "Descrição Nova", action: "Ação Nova" });
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
                { headerText: "Código", rowText: "code" },
                { headerText: "Descrição", rowText: "ds" },
                { headerText: "Ações", rowText: "action" } 
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
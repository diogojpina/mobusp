Procurar Itinerário:
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
      <th>Descrição</th>
      <th>Ações</th>
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


	<div data-bind='simpleGrid: gridViewModel'></div>
	<button data-bind='click: addItem'>Add item</button>

	<button data-bind='click: sortByName'>Sort by name</button>

	<button
		data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
		Jump to first page</button>
</body>

<script type="text/javascript">
	var initialData = [
	           		{ name: "Itinerário A", code: 1, description: "Descrição A", action: "Ação A" },
	        		{ name: "Itinerário B", code: 2, description: "Descrição B", action: "Ação B" },
	        		{ name: "Itinerário C", code: 3, description: "Descrição C", action: "Ação C" },
	        		{ name: "Itinerário D", code: 4, description: "Descrição D", action: "Ação D" },
	        		{ name: "Itinerário E", code: 5, description: "Descrição E", action: "Ação E" },
	        		{ name: "Itinerário F", code: 6, description: "Descrição F", action: "Ação F" },
	        		{ name: "Itinerário G", code: 7, description: "Descrição G", action: "Ação G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Nome Novo", code: 0, description: "Descrição Nova" });
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
                { headerText: "Descrição", rowText: "description" }
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
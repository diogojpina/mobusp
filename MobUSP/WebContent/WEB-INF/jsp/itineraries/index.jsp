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


	<div data-bind='simpleGrid: gridViewModel'></div>
	<button data-bind='click: addItem'>Add item</button>

	<button data-bind='click: sortByName'>Sort by name</button>

	<button
		data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
		Jump to first page</button>
</body>

<script type="text/javascript">
	var initialData = [
	           		{ name: "Itiner�rio A", code: 1, description: "Descri��o A", action: "A��o A" },
	        		{ name: "Itiner�rio B", code: 2, description: "Descri��o B", action: "A��o B" },
	        		{ name: "Itiner�rio C", code: 3, description: "Descri��o C", action: "A��o C" },
	        		{ name: "Itiner�rio D", code: 4, description: "Descri��o D", action: "A��o D" },
	        		{ name: "Itiner�rio E", code: 5, description: "Descri��o E", action: "A��o E" },
	        		{ name: "Itiner�rio F", code: 6, description: "Descri��o F", action: "A��o F" },
	        		{ name: "Itiner�rio G", code: 7, description: "Descri��o G", action: "A��o G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Nome Novo", code: 0, description: "Descri��o Nova" });
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
                { headerText: "Descri��o", rowText: "description" }
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
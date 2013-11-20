Procurar Local:
<form method="post">
<input type="text" name="busca" />
<input type="submit" />
</form>
<br /><br />

<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Endere�o</th>
      <th>Latitude</th>
      <th>Longitude</th>
      <th>A��es</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${placeList}" var="place">
      <tr>
        <td>${place.name}</td>
        <td>${place.address}</td>
        <td>${produto.lat}</td>
        <td>${produto.lon}</td>
        <td>
        	<a href="produtos/formulario?id=${place.id}">Editar</a>
        	<a href="produtos/remove?id=${place.id}">Remover</a>        
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
		{ name: "Ponto A", address: "Endere�o A", latitude: "Latitude A", longitude: "Longitude A", action: "A��o A" },
		{ name: "Ponto B", address: "Endere�o B", latitude: "Latitude B", longitude: "Longitude B", action: "A��o B" },
		{ name: "Ponto C", address: "Endere�o C", latitude: "Latitude C", longitude: "Longitude C", action: "A��o C" },
		{ name: "Ponto D", address: "Endere�o D", latitude: "Latitude D", longitude: "Longitude D", action: "A��o D" },
		{ name: "Ponto E", address: "Endere�o E", latitude: "Latitude E", longitude: "Longitude E", action: "A��o E" },
		{ name: "Ponto F", address: "Endere�o F", latitude: "Latitude F", longitude: "Longitude F", action: "A��o F" },
		{ name: "Ponto G", address: "Endere�o G", latitude: "Latitude G", longitude: "Longitude G", action: "A��o G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endere�o Novo", latitude: "Latitude Nova", longitude: "Longitude Nova", action: "A��o Nova" });
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
                { headerText: "Endere�o", rowText: "address" },
                { headerText: "Latitude", rowText: "latitude" },
                { headerText: "Longitude", rowText: "longitude" },
                { headerText: "A��es", rowText: "action" } 
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
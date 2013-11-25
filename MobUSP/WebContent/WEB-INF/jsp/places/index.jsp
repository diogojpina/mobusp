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
        	<a href="places/ver?id=${place.id}">Detalhes</a>     
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
		{ name: "Ponto A", address: "Endere�o A", lat: "Latitude A", lon: "Longitude A", action: "A��o A" },
		{ name: "Ponto B", address: "Endere�o B", lat: "Latitude B", lon: "Longitude B", action: "A��o B" },
		{ name: "Ponto C", address: "Endere�o C", lat: "Latitude C", lon: "Longitude C", action: "A��o C" },
		{ name: "Ponto D", address: "Endere�o D", lat: "Latitude D", lon: "Longitude D", action: "A��o D" },
		{ name: "Ponto E", address: "Endere�o E", lat: "Latitude E", lon: "Longitude E", action: "A��o E" },
		{ name: "Ponto F", address: "Endere�o F", lat: "Latitude F", lon: "Longitude F", action: "A��o F" },
		{ name: "Ponto G", address: "Endere�o G", lat: "Latitude G", lon: "Longitude G", action: "A��o G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endere�o Novo", lat: "Latitude Nova", lon: "Longitude Nova", action: "A��o Nova" });
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
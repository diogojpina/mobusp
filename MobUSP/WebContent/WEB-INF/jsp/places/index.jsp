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
      <th>Endereço</th>
      <th>Latitude</th>
      <th>Longitude</th>
      <th>Ações</th>
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
		{ name: "Ponto A", address: "Endereço A", latitude: "Latitude A", longitude: "Longitude A", action: "Ação A" },
		{ name: "Ponto B", address: "Endereço B", latitude: "Latitude B", longitude: "Longitude B", action: "Ação B" },
		{ name: "Ponto C", address: "Endereço C", latitude: "Latitude C", longitude: "Longitude C", action: "Ação C" },
		{ name: "Ponto D", address: "Endereço D", latitude: "Latitude D", longitude: "Longitude D", action: "Ação D" },
		{ name: "Ponto E", address: "Endereço E", latitude: "Latitude E", longitude: "Longitude E", action: "Ação E" },
		{ name: "Ponto F", address: "Endereço F", latitude: "Latitude F", longitude: "Longitude F", action: "Ação F" },
		{ name: "Ponto G", address: "Endereço G", latitude: "Latitude G", longitude: "Longitude G", action: "Ação G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endereço Novo", latitude: "Latitude Nova", longitude: "Longitude Nova", action: "Ação Nova" });
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
                { headerText: "Endereço", rowText: "address" },
                { headerText: "Latitude", rowText: "latitude" },
                { headerText: "Longitude", rowText: "longitude" },
                { headerText: "Ações", rowText: "action" } 
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
</script>
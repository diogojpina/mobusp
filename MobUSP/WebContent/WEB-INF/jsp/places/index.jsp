Procurar Local:
<form method="post">
	<input type="text" name="busca" /> <input type="submit" />
</form>
<br />
<br />


<div data-bind='simpleGrid: gridViewModel' id='mobUSP'></div>
<!-- 
	<button data-bind='click: addItem'>Add item</button>
	 -->

<button data-bind='click: sortByName'>Sort by name</button>

<button
	data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
	Jump to first page</button>

</body>

<script type="text/javascript">
	var initialData = [
<c:forEach items="${placeList}" var="place">
	{ id: "${place.id}", name: "${place.name}", address: "${place.address}", description: " Dsc: ${place.description}", lat: "${place.lat}", lon: "${place.lon}", action: "${place.id}" },
</c:forEach>
	               

	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
        
        this.verDetalhes = function() {
        	this.items.ver(function(a) {
        		alert(a.code);
            	return a.code;
            });
        };
		
    	this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endereço Novo", lat: "Latitude Nova", lon: "Longitude Nova", action: "index.html" });
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
                { headerText: "Descrição", rowText: "description" },
                { headerText: "Latitude", rowText: "latitude" },
                { headerText: "Longitude", rowText: "longitude" },
                { headerText: "Ações", rowText: "action" }
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
	
	$(document).ready(function() {
		 // Adicionar o link para ver detalhes!
		 var contador = 0;
		 //$('#mobUSP tbody tr').each(function() {
		 $('#mobUSP tbody tr td').each(function() {
		 //$(this).get(td).each(function() {
			 contador++;
			 if (contador == 6) {
				 var id = $(this).html()
				 var elemento = "<a href='places/ver?id="+id+"'>Ver Detalhes</a>";
				 $(this).replaceWith(elemento);
			 }
		 	});
		 //});
	     //$("#div"). replaceWith("<h1>JQuery is Great</h1>");
	});
</script>
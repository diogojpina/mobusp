Procurar Esta��es:
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
      <th>Descri��o</th>
      <th>A��es</th>
    </tr>
  </thead>
  <tbody>  
<c:forEach items="${stationList}" var="station">
      <tr>
        <td>${station.name}</td>
        <td>${station.address}</td>
        <td>${station.description}</td>
        <td>
        	<a href="stations/ver?id=${station.id}">Detalhes</a>       
        </td>
      </tr>      
</c:forEach>
</tbody>
</table>


	<div data-bind='simpleGrid: gridViewModel' id='mobUSP'></div>
	<button data-bind='click: addItem'>Add item</button>

	<button data-bind='click: sortByName'>Sort by name</button>

	<button
		data-bind='click: jumpToFirstPage, enable: gridViewModel.currentPageIndex'>
		Jump to first page</button>
</body>

<script type="text/javascript">
	var initialData = [
		{ name: "Ponto A", address: "Endere�o A", description: "Descri��o A", action: "A��o A" },
		{ name: "Ponto B", address: "Endere�o B", description: "Descri��o B", action: "A��o B" },
		{ name: "Ponto C", address: "Endere�o C", description: "Descri��o C", action: "A��o C" },
		{ name: "Ponto D", address: "Endere�o D", description: "Descri��o D", action: "A��o D" },
		{ name: "Ponto E", address: "Endere�o E", description: "Descri��o E", action: "A��o E" },
		{ name: "Ponto F", address: "Endere�o F", description: "Descri��o F", action: "A��o F" },
		{ name: "Ponto G", address: "Endere�o G", description: "Descri��o G", action: "A��o G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endere�o Novo", description: "Descri��o Nova", action: "A��o Nova" });
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
                { headerText: "Descri��o", rowText: "ds" },
                { headerText: "A��es", rowText: "action" } 
                	//function(item){return"A:" + item.ds.toFixed(2)}}
            ],
            pageSize: 4
        });
    };
	ko.applyBindings(new PagedGridModel(initialData));
	
	$(document).ready(function() {
		 // Adicionar o link para ver detalhes!
		 var contador = 0;
		 $('#mobUSP tbody tr > td').each(function() {
		 	 contador++;
			 if (contador % 4 == 0) {
				 var id = $(this).html()
				 var elemento = "<a href='stations/ver?id="+id+"'>Ver Detalhes</a>";
				 $(this).replaceWith(elemento);
			 }
		 });
	});
</script>
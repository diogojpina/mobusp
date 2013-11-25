Procurar Estações:
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
      <th>Descrição</th>
      <th>Ações</th>
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
		{ name: "Ponto A", address: "Endereço A", description: "Descrição A", action: "Ação A" },
		{ name: "Ponto B", address: "Endereço B", description: "Descrição B", action: "Ação B" },
		{ name: "Ponto C", address: "Endereço C", description: "Descrição C", action: "Ação C" },
		{ name: "Ponto D", address: "Endereço D", description: "Descrição D", action: "Ação D" },
		{ name: "Ponto E", address: "Endereço E", description: "Descrição E", action: "Ação E" },
		{ name: "Ponto F", address: "Endereço F", description: "Descrição F", action: "Ação F" },
		{ name: "Ponto G", address: "Endereço G", description: "Descrição G", action: "Ação G" }
	];                
    var PagedGridModel = function(items) {
    	this.items = ko.observableArray(items);
		this.addItem = function() {
        	this.items.push({ name: "Ponto Novo", address: "Endereço Novo", description: "Descrição Nova", action: "Ação Nova" });
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
                { headerText: "Descrição", rowText: "ds" },
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
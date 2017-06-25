<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manutenção Tablet</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">





</head>
<body style="background-color: #f4f4f4">

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Manutenção de Tablet</h3>
      </div>
     </div>
     <hr>


	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading" align="center" ><b>Busca por Filtro</b></div>
				<div class="panel-body">
				<form action="${pageContext.request.contextPath}/main?action=manutencao-tablet" method="POST">

						<div class="row">
							<div class="col-md-12 col-sm-12">

								<div class="col-md-2">
									<label>Chamado</label> <input type="text" class="form-control "
										id="chamado" name="chamado" value="${chamado }">
								</div>

								<div class="col-md-4">
									<label>Nome do(a) Solicitante</label> <input type="text"
										class="form-control " id="nome_solicetante"
										name="nome_solicitante" value="${nome_solicitante}">
								</div>

								<div class="col-md-2">
									<label>Patrimônio</label> <input type="text"
										class="form-control " id="patrimonio" name="patrimonio"
										value="${patrimonio}">
								</div>

								<div class="col-md-4">
									<label>Status</label> <select class="form-control"
										id="select_status" name="select_status">
										<option value="">Selecione a opção</option>
										<option value="manutencao" <c:if test="${status == 'manutencao' }"><c:out value="selected=selected"/></c:if>>Manutenção</option>
										<option value="a devolver"<c:if test="${status == 'a devolver' }"><c:out value="selected=selected"/></c:if>>A Devolver</option>
										<option value="fechado" <c:if test="${status == 'fechado' }"><c:out value="selected=selected"/></c:if>>Fechado</option>
										<option value="em atendimento" <c:if test="${status == 'em atendimento' }"><c:out value="selected=selected"/></c:if>>Em Atendimento</option>
										
									</select>
								</div>

							</div>
						</div>
						
						<div class="row" style="margin-top: 25px;">
						  <div class="col-md-12 col-sm-12">
						  <div class="col-md-2">
									<label>Matrícula</label> <input type="text"
										class="form-control " id="matricula" name="matricula"
										value="${matricula}">
								</div>
						  </div>
						</div>
						<hr>
							<div class="row">
							<div class="col-md-12 col-sm-12">

							<div align="right">
							<button type="submit" class="btn btn-default" ><samp class="fa fa-search "></samp> Pesquisar</button>
							
							</div>

							</div>
						</div>

					</form>			
				</div>
			</div>
		</div>
	</div>
     <hr>
     
     <div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color:#0c8b5b;" align="center"><b style="color: white;">Tabela de Manutenção</b></div>
				<div class="panel-body">
				  <div class="col-sm-12 col-md-12" style="overflow-x:auto;">

						<table class="table table-hover" id="tbManutncaoTablet">
							<thead>
							  <tr>
							  <th>Chamado</th>
							  <th>Patrimônio</th>
							  <th>Responsável</th>
							  <th>Status</th>
							  <th>Data de Entrada</th>
							  <th>Técnico Responsável</th>
							  <th>Vizualizar<th>
							  </tr>
							</thead>
							<tbody class="searchable" >
							 <c:forEach var="lsTablet" items="${lsTabletManutencao}" >
							  <tr>
							    <td>${lsTablet.num_chamado_interno}</td>
							    <td>${lsTablet.patrimonio}</td>
							    <td>${lsTablet.nome_solicitante}</td>
							    <td>${lsTablet.statusTablet}</td>
							    <td>${lsTablet.dt_cadastro}</td>							    
							    <td>${lsTablet.tecnico_responsavel}</td>
							     <td><button  class='btn btn-primary' onclick="detalheTabletManutencao(${lsTablet.num_chamado_interno})"><span class='fa fa-eye'></span></button></td>							    
							  </tr>
							  </c:forEach>
							</tbody>
						
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.pt-BR.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/datatables/1.10.13/js/jquery.dataTables.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/dataTables.buttons.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/pdfmake.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/vfs_fonts.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/buttons.html5.min.js"></script>

	<script type="text/javascript">
 
 $(document).ready(function() {
		
	$('#tbManutncaoTablet').DataTable( {
		dom: 'Bfrtip',
        buttons: [
            'pdf'
        ],
	       "language": {
                "lengthMenu": " Mostrar _MENU_  Chamado por página.",
                "zeroRecords": "Nenhum tablet para manutenção...",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "sSearch":       	"Pesquisa na tabela",
                "oPaginate": {
            		"sFirst":    	"Primeiro",
            		"sPrevious": 	"Anterior",
            		"sNext":     	"Próximo"
            	}
                        },
	    } );
	   

	  
	} );
 

 </script>
</body>
</html>
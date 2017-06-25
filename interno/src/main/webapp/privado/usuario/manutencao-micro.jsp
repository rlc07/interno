<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manutenção Computador</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">






</head>
<body >

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Manutenção de Computadores</h3>
      </div>
     </div>
     <hr>
	<div class="container">

          <form action="${pageContext.request.contextPath}/main?action=manutencao-computador" method="POST" id="fmPesquisaMicro">
		<div class="row">
			<div class="col-md-12 col-sm-12">

				<div class="col-md-4">
					<label>Número do Chamado</label> <input type="text"
						id="chamado"  class="form-control" name="chamado" value="${chamado}">
				</div>
				
				<div class="col-md-4">
					<label>Status</label> <select class="form-control" name="status" id="status"  >
					<option value="">Selecione um status</option>
					<option value="finalizado" <c:if test="${status == 'finalizado' }"><c:out value="selected=selected"/></c:if>>Finalizado</option>
					<option value="manutencao" <c:if test="${status == 'manutencao' }"><c:out value="selected=selected"/></c:if>>Disponivel</option>
				   <option value="em atendimento" <c:if test="${status == 'em atendimento' }"><c:out value="selected=selected"/></c:if>>Em Atendimento</option>
					<option value="fechado" <c:if test="${status == 'fechado' }"><c:out value="selected=selected"/></c:if>>Fechado</option>
					
					</select>
				</div>

				<div class="col-md-2">
					<label>Data Inicio</label> <input type="text" id="Checkin" name="dt_ini"
						class="form-control Checkin"> 
				</div>

				<div class="col-md-2">
					<label>Data Fim</label> <input type="text" id="Checkout" name="dt_fim"
						class="form-control Checkout">
						
						
				</div>

			</div>

		</div>
		<div class="row"  style="margin-top: 10px;">
		<div class="col-md-12 col-sm-12">
				<div class="col-md-4 form-group" style="margin-top: 3px;">
					<label>Instituição</label> <select class="js-example-responsive"
						name="instituicao" id="instituicao"
						style="width: 100%; height: 100%; line-height: 100%; padding: 30px;">
						<option value="" >Selecione uma instituição</option>
						<c:forEach var="escola" items="${listaEscola}">
							<option value="${escola.id}" <c:if test="${escolaSelected == escola.nome }"><c:out value="selected=selected"/></c:if> >${escola.nome}</option>
						</c:forEach>
					</select>

					<div class="col-md-4" style="display: none;">

						<input class="form-control" name="idUsuario" id="idUsuario"
							value="${usuarioLogado.id }">

					</div>
				</div>
				
				<div class="col-md-4" style="margin-top: 25px;">
				<button type="submit" class="btn btn-primary"><samp class="fa fa-search "></samp> Pesquisar</button>
				</div>
			</div>
		</div>
		</form>
			<div class="row" align="right" style="margin-top: 10px; margin-right: 10px;">

		</div>
		<hr>

		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="panel with panel-primary class">
					<div class="panel-heading" align="center">Tabela de
						manutenção de computador</div>
					<div class="panel-body">

                     <!-- Div tabela -->
                     <div id="divTabela">
						<div class="row">
							<div class="col-sm-12 col-md-12" style="overflow-x:auto;">

								<table class="table table-hover" id="tbManutencao">
									<thead>
										<tr>
										<th>Nº Chamado</th>
										<th>Instituição</th>
										<th>Nota Fiscal</th>
										<th>Tipo</th>
										<th>Status</th>
										<th>Patrimônio</th>
										<th>Técnico Responsavel</th>
										<th>Ver</th>
										</tr>
									</thead>
									
									<tbody class="searchable" >
                                       <c:forEach var="computador" items="${listaManutencao}">      
                                       <tr >
                                        <td>${computador.micro.chamadoInterno}</td>
                                        <td>${computador.micro.instituicao}</td>
                                        <td>${computador.micro.nota_fiscal}</td>
                                        <td>${computador.micro.tipo_micro}</td>
                                        <td>${computador.micro.status}</td>
                                        <td>${computador.micro.patrimonio}</td>
                                        <td>${computador.tecnico.nome} </td>
                                        <td> <button type="button" class="btn btn-primary" onclick="verMicroManutencao(${computador.id});"><span class="fa fa-eye"></span></button>
									   </td>
                                       </tr>
                                       </c:forEach>
									</tbody>
								</table>

							</div>
						</div>
						</div>
						<!-- Fim div tabela -->



					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" charset="UTF-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.pt-BR.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>
   
   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/datatables/1.10.13/js/jquery.dataTables.js" charset="UTF-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.buttons.min.js" charset="UTF-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pdfmake.min.js" charset="UTF-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/vfs_fonts.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/buttons.html5.min.js"></script>
   
   
        
         
      
   <script type="text/javascript">

    var tb ;
    $('#DtChkIn').datepicker({
        format: 'mm/dd/yyyy',
        language: 'pt-BR'
    });
   
    $('#DtChkOut').datepicker({
        format: 'mm/dd/yyyy',
        language: 'pt-BR'
    });

    jQuery(document).ready(function ($) {
    	$(function () {
    	var checkout = $('.Checkout').datepicker({weekStart: 1, todayHighlight: false, language:'pt-BR', autoclose: true, format: 'dd/mm/yyyy'});
    	$('.Checkout').attr('disabled', 'disabled');
    	var checkin = $('.Checkin').datepicker({weekStart: 1, todayHighlight: true,
    	      language:'pt-BR',
    	autoclose: true,
    	format: 'dd/mm/yyyy',
    	startDate: "+0d",
    	      endDate: ''
    	}).on('changeDate', function(event) {
    	$('.Checkout').removeAttr('disabled');
    	var newDate = new Date(event.date)
    	newDate.setDate(newDate.getDate() + 1)
    	checkout.datepicker("setStartDate", newDate);
    	      checkout.datepicker("update", newDate)
    	       checkin.datepicker('hide');

    	$('.Checkout')[0].focus();
    	});
    	});
    	}); 
    
    
    $(document).ready(function() {
        $('#tbManutencao').DataTable( {
            dom: 'Bfrtip',
            buttons: [
                'pdf'
            ],
            
         	"language": {
                "lengthMenu": " _MENU_ Anúncio por pagina",
                "zeroRecords": "Nenhum micro para manutenção...",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "sSearch":       	"Pesquisa Rapida",
                "oPaginate": {
            		"sFirst":    	"Primeiro",
            		"sPrevious": 	"Anterior",
            		"sNext":     	"Próximo"
            	}
                        },
        } );
    } );
    
    
    $(document).ready(function() {
  	  $(".js-example-responsive").select2();
  	});
    
	
</script>





</body>
</html>
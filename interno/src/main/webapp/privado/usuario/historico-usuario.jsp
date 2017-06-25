<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Histórico Usuário</title>
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
      <h3>Histórico Usuário </h3>
      </div>
     </div>
     <hr>


	<div class="container">
		<div class="row">
		 <div class="col-md-12 col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading" align="center" ><b>Informações do usuário</b></div>
				<div class="panel-body">
						 
						 <div class="row">
						   <div class="col-md-12 col-sm-12">
						      <div class="col-md-2">
						           <img alt="usuario" src="${pageContext.request.contextPath}/resources/img/img-icon/user.png"
						           class="img-responsive">
						           
						           <div  align="center">
						           <p><b>${nome}</b></p>						           	
                                    <p><b>${email}</b></p>
						           	<p><b>${celular}</b></p>
						           	<p><b>${matricula}</b></p>
						           </div>
						      </div>
						      
						      <div class="col-md-6">
						      
								<div class="panel panel-default">
									<div class="panel-body">
									   <div align="center"><p><b><span class="fa fa-circle " style="color: green;"></span> Chamados em atendimento</b></p></div>
									   <hr>
									   <div class="col-md-12 col-sm-12">

												<div class="col-md-6">
													<div class="panel panel-default">
														<div class="panel-body">
														<div style="overflow-x:auto;">
															<table class="table table-hover" id="tbTb">
																<thead>
																	<tr>
																		<th><span class="fa fa-tablet "></span> Tablet</th>
																	</tr>
																</thead>
																<tbody >
																	<c:forEach var="atendimentoTablet"
																		items="${lsChamadoAtendimentoTablet}">
																		<tr>
																			<td><a href="${pageContext.request.contextPath}/main?action=detalhe-chamado-tablet&numero-chamado-interno=${atendimentoTablet}">${atendimentoTablet}</td>
																		<tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														</div>
														<div class="panel-footer" align="center">
															<b>Total: ${qtdChamadoTabletAtual}</b>
														</div>
													</div>
												</div>

												<div class="col-md-6">
														<div class="panel panel-default">
															<div class="panel-body">
															<div style="overflow-x:auto;">
																<table class="table table-hover" id="tbMicro">
																	<thead>
																		<tr>
																			<th><span class="fa fa-desktop "></span>Computador</th>
																		</tr>
																	</thead>
																	<tbody class="searchable">
																		<c:forEach var="atendimentoMicro" items="${lsChamadoAtendimentoMicro}">
																			<tr>
																				<td><a href="${pageContext.request.contextPath}/main?action=detalhe-chamado&numero-chamado-interno=${atendimentoMicro}">${atendimentoMicro}</a></td>
																			<tr>
																		</c:forEach>
																	</tbody>
																</table>
																</div>
															</div>
															<div class="panel-footer" align="center">
																<b>Total: ${qtdChamadoMicroAtual}</b>
															</div>
														</div>
												</div>
											</div>
									   </div>
									
									</div>
								</div>
								
								<div class="col-md-4">
								<div align="center"><p>RELATORIO</p></div>
								<hr>								
								<div align="center"><p><span class="fa fa-circle "></span> ${qtd} Chamados cadastrado</p></div>
								<div align="center"><p><span class="fa fa-circle " style="color: green;"></span> ${qtdChamadoMicro} Chamado de micro atendido</p></div>
							    <div align="center"><p><span class="fa fa-circle " style="color: green;"></span> ${qtdChamadoTablet} Chamado de tablet atendido</p></div>
								<div align="center"><p><span class="fa fa-circle " ></span> ${qtdChamadoAtendido} Chamado atendido</p></div>								
								 <hr>
								</div>
							
							 <div align="center"><p>NÍVEL</p></div>
							 <hr>
							 <c:choose>
							   <c:when test="${qtdChamadoAtendido <= 5}">
							   <div align="center"><b style="color: red;">VOLTA PARA O <a href="http://www.ciee.org.br/portal/index.asp">CIEE</a></b></div>
							   </c:when>
							   
							   <c:when test="${qtdChamadoAtendido > 5}">
							   <div align="center"><b  ><a style="color: orange;" href="http://1.bp.blogspot.com/-7_y69srjHNc/UwoXAWRDB5I/AAAAAAAAO8c/BkwikuO9N7o/s1600/estagiario.png">ESTÁGIARIO</a></b></div>
							   </c:when>
							   
							   <c:when test="${qtdChamadoAtendido >= 10}">
							   <div align="center"><b ><a href="http://1.bp.blogspot.com/-7_y69srjHNc/UwoXAWRDB5I/AAAAAAAAO8c/BkwikuO9N7o/s1600/estagiario.png">TRAINEE</a></b></div>
							   </c:when>
							   
							   <c:when test="${qtdChamadoAtendido > 10}">
							   <div align="center"><b ><a href="http://1.bp.blogspot.com/-7_y69srjHNc/UwoXAWRDB5I/AAAAAAAAO8c/BkwikuO9N7o/s1600/estagiario.png">TRAINEE</a></b></div>
							   </c:when>
							   
							 </c:choose>
						      </div>
						     </div>
						 </div>
						 
						
						 
						 
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
 
 $(document).ready(function() {
		
	$('#tbMicro').DataTable( {
		"searching": false,
		"bLengthChange" : false, //thought this line could hide the LengthMenu
	    "bInfo":false,
	       "language": {
                "zeroRecords": "Nenhum chamado em atendimento...",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "oPaginate": {
            		"sFirst":    	"Primeiro",
            		"sPrevious": 	"Anterior",
            		"sNext":     	"Próximo"
            	}
               },
            });
	
	$('#tbTb').DataTable( {
		"searching": false,
		"bLengthChange" : false, //thought this line could hide the LengthMenu
	    "bInfo":false,
	       "language": {
                "zeroRecords": "Nenhum chamado em atendimento...",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "oPaginate": {
            		"sFirst":    	"Primeiro",
            		"sPrevious": 	"Anterior",
            		"sNext":     	"Próximo"
            	}
               },
            });
	  });
 
 
 </script>
</body>
</html>
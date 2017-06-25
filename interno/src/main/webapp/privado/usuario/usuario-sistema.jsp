<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adm (Usu�rio)</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">






</head>
<body >

<jsp:include page="../../template/navbar.jsp"></jsp:include>

             <c:choose>
               <c:when test="${negado != 0 }">
               <div>
    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Usu�rios do Sistema</h3>
      </div>
     </div>
     <hr>
	<div class="container">

		

		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="panel with panel-primary class">
					<div class="panel-heading" align="center">Tabela de Usu�rios</div>
					<div class="panel-body">

                     <!-- Div tabela -->
                     <div id="divTabela">
						<div class="row">
							<div class="col-sm-12 col-md-12" style="overflow-x:auto;">

								<table class="table table-hover" id="tbUsuarioSistema">
									<thead>
										<tr>
										<th>Nome</th>
										<th>Email</th>
										<th>Celular</th>
										<th>Tel_Fixo</th>
										<th>Matr�cula</th>
										<th>Permiss�o</th>
										<th>Status</th>
										<th>Historico</th>
										</tr>
									</thead>
									
									<tbody class="searchable" >
                                       <c:forEach var="user" items="${lsUserSistema}">      
                                       <tr >
                                        <td>${user.nome}</td>
                                        <td>${user.email}</td>
                                        <td>${user.fone_cel}</td>
                                        <td>${user.fone_fixo}</td>
                                        <td>
                                          <c:choose>
                                            <c:when test="${user.matricula == 0 }">
                                            N�o Tem
                                            </c:when>
                                            <c:otherwise>
                                            ${user.matricula}
                                            </c:otherwise>
                                          </c:choose>
                                        </td>
                                        <td>
                                        <c:choose>
                                          <c:when test="${user.permissao == false }">
                                          <button type="button" class="btn btn-danger"><span class="fa fa-times"></button>                                          
                                          </c:when>
                                          <c:otherwise>
                                           <button type="button" class="btn btn-success"><span class="fa fa-check"></button>                                          
                                          </c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td>
                                         <c:choose>
                                          <c:when test="${user.status == false }">
                                          <button type="button" class="btn btn-danger" onclick="mudaStatusUsuario(${user.id})"><span class="fa fa-times"></button>                                          
                                          </c:when>
                                          <c:otherwise>
                                           <button type="button" class="btn btn-success" onclick="mudaStatusUsuario(${user.id})"><span class="fa fa-check"></button>                                          
                                          </c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td> <button type="button" class="btn btn-primary" onclick="verHistoricoUser(${user.id});"><span class="fa fa-eye"></span></button>
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



<!-- Inicio modalmuda status usuario-->
<div class="modal fade mdMudaStatusUser" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="mdMudaStatusUser">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">
        
        ATEDUC - Mudar Status do Usu�rio</h4>
        
        </div>
      </div>
      <div class="modal-body">

						<form action="" id="fmMudaStatusUsuario">
							
							
                             
							<div class="row">
							    <div class="col-md-12 col-sm-12">
								<input type="hidden" id="idUsuarioMudarStatus" name="idUsuarioMudarStatus">
								<input type="hidden" id="idUsuarioAdm" name="idUsuarioAdm" value="${usuarioLogado.id }">
								<div>Ola, ${usuarioLogado.nome}, para mudar o status do usu�rio, clique em confirmar! <div id="nomeUserStatus"></div></div>
								</div>
							</div>
							<hr>
							<div align="center" style="margin-top: 10px;">
								<button type="submit" class="btn btn-danger">Confirmar</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
							</div>
						</form>

					</div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- FIM modal muda status usuario-->
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
        $('#tbUsuarioSistema').DataTable( {
            dom: 'Bfrtip',
        
         	"language": {
                "lengthMenu": " _MENU_ An�ncio por pagina",
                "zeroRecords": "Nenhum micro para manuten��o...",
                "info": "Mostrando p�gina _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro dispon�vel",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "sSearch":       	"Pesquisa Rapida",
                "oPaginate": {
            		"sFirst":    	"Primeiro",
            		"sPrevious": 	"Anterior",
            		"sNext":     	"Pr�ximo"
            	}
                        },
        } );
    } );
    
    
    $(document).ready(function() {
  	  $(".js-example-responsive").select2();
  	});
    
	
</script>




</div>
               </c:when>
               <c:otherwise>
               <div style="margin-top: 25%;" align="center">
               <h1>Acesso Negado! Voc� n�o tem permiss�o para acessar essa p�gina...</h1>
               </div>
               </c:otherwise>
             </c:choose>
</body>
</html>
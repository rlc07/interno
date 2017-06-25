<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adm (Instituição)</title>
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
      <h3>Instituição</h3>
      </div>
     </div>
     <hr>
	<div class="container">

		

		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="panel with panel-primary class">
					<div class="panel-heading" align="center">Cadastrar Instituição</div>
					<div class="panel-body">
                     <form action="${pageContext.request.contextPath}/main?action=cadastrar-instituicao" method="POST">
						<div class="row">
							<div class="col-sm-12 col-md-12">
                                <h4>Dados da instituição</h4>
                                <div class="col-md-4">
                                  <label>Nome</label>
                                  <input type="text" name="nome" id="id" class="form-control">
                                </div>
                                
                                  <div class="col-md-4">
                                  <label>Email</label>
                                  <input type="text" name="email" id="email" class="form-control">
                                </div>
                                
							</div>
						</div>
			
						
							<div class="row" style="margin-top: 15px;">
							<div class="col-sm-12 col-md-12">
                                
                                <div class="col-md-4">
                                  <label>Centro de custo</label>
                                  <input type="text" name="cc" id="cc" class="form-control">
                                </div>
                                
                                 <div class="col-md-4">
                                  <label>Naed</label>
                                  <input type="text" name="naed" id="naed" class="form-control">
                                </div>
                                
							</div>
						</div>
						
								<div class="row" style="margin-top: 15px;">
							<div class="col-sm-12 col-md-12">
                                
                                <div class="col-md-4">
                                  <label>Telefone</label>
                                  <input type="text" name="fonei" id="fonei" class="form-control">
                                </div>
                         
                                
							</div>
						</div>

	                   <div class="row" style="margin-top: 15px;">
	                   <hr>
	                   
							<div class="col-sm-12 col-md-12">
                                <h4>Endereço</h4>
                                <div class="col-md-4">
                                  <label>Rua</label>
                                  <input type="text" name="rua" id="rua" class="form-control">
                                </div>
                                
                                  <div class="col-md-4">
                                  <label>Número</label>
                                  <input type="text" name="n" id="n" class="form-control">
                                </div>
                                
                                  <div class="col-md-4">
                                  <label>Bairro</label>
                                  <input type="text" name="bairro" id="bairro" class="form-control">
                                </div>
                                
							</div>
						</div>
						
						      <div class="row" style="margin-top: 15px;">
	                   <hr>
	                   
							<div class="col-sm-12 col-md-12">
                                <div class="col-md-4">
                                </div>
                                
                                  <div class="col-md-4">
                                </div>
                                
                                  <div class="col-md-4" align="right">
                                  <button type="submit" class="btn btn-success">Cadastrar</button>
                                </div>
                                
							</div>
						</div>
                      
                      </form>

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
        
        ATEDUC - Mudar Status do Usuário</h4>
        
        </div>
      </div>
      <div class="modal-body">

						<form action="" id="fmMudaStatusUsuario">
							
							
                             
							<div class="row">
							    <div class="col-md-12 col-sm-12">
								<input type="hidden" id="idUsuarioMudarStatus" name="idUsuarioMudarStatus">
								<input type="hidden" id="idUsuarioAdm" name="idUsuarioAdm" value="${usuarioLogado.id }">
								<div>Ola, ${usuarioLogado.nome}, para mudar o status do usuário, clique em confirmar! <div id="nomeUserStatus"></div></div>
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




</div>
               </c:when>
               <c:otherwise>
               <div style="margin-top: 25%;" align="center">
               <h1>Acesso Negado! Você não tem permissão para acessar essa página...</h1>
               </div>
               </c:otherwise>
             </c:choose>
</body>
</html>
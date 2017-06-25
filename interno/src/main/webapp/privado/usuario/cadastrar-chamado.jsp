<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Chamado</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">



</head>
<body>

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Cadastro de Chamados</h3>
      </div>
     </div>
     <hr>
	<div class="container" >

		<div class="row">
			<div class="col-md-4"></div>
			
			<div class="col-sm-12 col-md-4">
				<label>Selecione o serviço desejado</label> <select
					class="form-control" id="selectServico" onchange="alteraDiv();">
					<option value="">Selecione o tipo de serviço</option>
					<option value="1">Manutenção em Tablet</option>
					<option value="2">Manutenção em Computador</option>
					<option value="3">Visita Técnica</option>
				</select>
			</div>
		</div>
<hr>


		<!-- Inicio div tablet -->
		<div id="tablet" style="margin-top: 50px; display: none;">
		
			
			<form  id="fmTablet">

				<div class="panel panel-default">
					<div class="panel-heading" align="center"><b>Informações do Solicitante</b></div>
					<div class="panel-body">
						<div class="row" >
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-4 form-group" style="margin-top: 3px;">
							<label>Instituição*</label> <select class="js-example-responsive" 
								name="instituicao" id="instituicao" style="width: 100%; height: 100%; line-height: 100%; padding: 30px;" >
								<option value="">Selecione uma instituição</option>
								<c:forEach var="escola" items="${listaEscola}">
								<option value="${escola.id}">${escola.nome}</option>
								</c:forEach>
								</select>
								
								<div class="col-md-4" style="display: none;">
								
								<input class="form-control"
								name="idUsuario" id="idUsuario" value="${usuarioLogado.id }">
								
								</div>
						</div>

						<div class="col-md-4 form-group">
							<label>Solicitante*</label> <input class="form-control"
								name="nome" id="nome">
						</div>
					</div>
                 </div><!--  -->
                 
                 <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-2 form-group">
							<label>Matrícula*</label> <input class="form-control"
								name="matricula" id="matricula">
						</div>

						<div class="col-md-3 form-group">
							<label>Cargo*</label> <input class="form-control"
								name="cargo" id="cargo">
						</div>
						
						<div class="col-md-3 form-group">
							<label>Telefone*</label> <input class="form-control"
								name="fone" id="fone">
						</div>
					</div>
                 </div>
					
					
					</div>
				</div>
			
             
                 <hr>
                	<div class="panel with panel-default">
				<div class="panel-heading" align="center" ><b>Informações do tablet</b></div>
				<div class="panel-body">

 
                 <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-1"></div>
						<div class="col-md-2 form-group">
							<label>Patrimônio*</label> <input class="form-control"
								name="patrimonio" id="patrimonio" >
						</div>

						<div class="col-md-4 form-group">
							<label>Marca*</label> <input class="form-control"
								name="marca" id="marca" placeholder="Exemplo: Samsung">
						</div>
						
						<div class="col-md-3 form-group">
							<label>Modelo*</label> <input class="form-control"
								name="modelo" id="modelo" placeholder="Exemplo: Samsung Galaxy Tab 10">
						</div>
					</div>
                 </div>
                 
                 
                 <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-1"></div>
					
						
						<div class="col-md-3 form-group">
							<label>Backup</label> 
							<select class="form-control" id="select_backup" name="select_backup">
							  <option value="true">Sim</option>
							  <option value="false">Não</option>
							</select>
						</div>
				
					</div>
                 </div>
                  <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-1"></div>
						<div class="col-md-2 form-group">
							<label>Acessórios do tablet:*</label> 
		               </div>

						<div class="col-md-1 form-group">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="capa" id="capa"> Capa
							</label>
						</div>
						
						<div class="col-md-1 form-group">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="caixa" id="caixa"> Caixa
							</label>
						</div>
						
						
						<div class="col-md-2 form-group">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="foneOuvido" id="foneOuvido"> Fone de ouvido
							</label>
						</div>
						
						
						<div class="col-md-2 form-group">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="carregador" id="carregador"> Carregador
							</label>
						</div>
						
						<div class="col-md-2 form-group">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="modem" id="modem"> Modem
							</label>
						</div>
					</div>
                 </div>
                 
                   <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-1"></div>
						<div class="col-md-8 form-group">
							<label>Descrição do problema:*</label> 
							<textarea rows="5" cols="40" class="form-control" style="resize: none;" id="desc_problema" name="desc_problema"></textarea>
						</div>

					</div>
                 </div>
             </div>
			</div>
                 
                 <hr>

				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-12 form-group" align="right">
							<button type="submit" class="btn btn-primary">Cadastrar</button>
						</div>

					</div>
				</div>

			</form>

		</div>
		<!-- end div tablet -->
		
		
		
		
		
		
		<!-- Inicio div computador -->
		<div id="micro" style="margin-top: 50px; display: none;">
			<form action="" id="fmMicro">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-4 form-group" style="margin-top: 3px;">
							<label>Instituição*</label> <select class="js-example-responsive" 
								name="instituicao" id="instituicao" style="width: 100%; height: 100%; line-height: 100%; padding: 30px;" >
								<option value="">Selecione uma instituição</option>
								<c:forEach var="escola" items="${listaEscola}">
								<option value="${escola.id}">${escola.nome}</option>
								</c:forEach>
								</select>
								
								<div class="col-md-4" style="display: none;">
								
								<input class="form-control"
								name="idUsuario" id="idUsuario" value="${usuarioLogado.id }">
								
								</div>
						</div>

						<div class="col-md-4 form-group">
							<label>Solicitante*</label> 
							<select class="form-control" name="solicitante" id="solicitante">
							<option value=""></option>
							<option value="escola">Escola</option>
							<option value="ima">IMA</option>
							</select>
						</div>
					</div>
                 </div>
                 
                 <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-4 form-group">
							<label>Nome do Solicitante*</label> <input class="form-control"
								name="nome" id="nome">
						</div>

						<div class="col-md-4 form-group">
							<label>Nº IMA</label> <input class="form-control"
								name="numima" id="numima" placeholder="Numero do chamado IMA">
						</div>
					
					</div>
                 </div>
                 <hr>
                  <div class="row">
					<div align="center"><p ><b>Informações do Computador</b></p></div>
				</div>
                 
                 <div id="divDuplicar" >
                     <div class="toclone">
                         <div class="row">
                         <label></label>
                 <hr>
                 
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-4 form-group">
							<label>Tipo de Patrimônio</label> 
							<select  class="form-control" id="select_tipo_pat" name="select_tipo_pat[0]" onchange="alteraDivPat();">
							  <option value="0" selected="selected">Selecione o tipo de patrimonio</option>
							  <option value="1">Nota Fiscal</option>
							  <option value="2">Chapa</option>
							</select>
						</div>

						
						
						<div class="col-md-4 form-group" id="notFiscal" style="display: none;">
							<label>Nota Fiscal</label> <input class="form-control"
								name="nf[0]" id="nf" placeholder="Informe o número da nota fiscal..." >
						</div>
						
						<div class="col-md-4 form-group" id="pat" style="display: none;">
							<label>Patrimônio</label> <input class="form-control"
								name="patrimonio[0]" id="patrimonio" placeholder="Informe o número do patrimônio..." >
						</div>
					</div>
                 </div>

                    <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
					
						<div class="col-md-4 form-group">
						<label>Tipo de Micro</label>
							<select class="form-control" name="tipo_micro[0]" id="tipo_micro">
							<option value=""></option>
							<option value="notebook">Notebook</option>
							<option value="allinone">All In One</option>
							<option value="desktop">Desktop</option>
							</select>
						</div>						
					</div>
                 </div>
                 
                     <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
					
						<div class="col-md-4 form-group">
						<label>Backup</label>
							<select class="form-control" name="bk[0]" id="bk">
							<option value="Sim" selected="selected">Sim</option>
							<option value="Nao">Não</option>
							</select>
						</div>
						
							<div class="col-md-4 form-group" >
							<label>Localização</label> <input class="form-control"
								name="localizacao[0]" id="localizacao" placeholder="Exemplo: Biblioteca" >
						</div>
				
					</div>
                 </div>

                      <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-8 form-group">
							<label>Descrição do problema:*</label> 
							<textarea rows="5" cols="40" class="form-control" style="resize: none;" id="desc_problema" name="desc_problema[0]"></textarea>
						</div>

					</div>
                 </div> 
                 
                    <a href="#" class="clone"><b style="color: green;"><samp class="fa fa-plus-circle"></samp> Adicionar</b></a> |
                    <a href="#" class="delete"><b style="color: red;"><samp class="fa fa-times"></samp> Deletar</b></a>
                    
                </div>
                 
                 <hr>

          </div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-12 form-group" align="right">
							<button type="submit" class="btn btn-primary">Cadastrar</button>
						</div>

					</div>
				</div>

			</form>
		</div>
		<!-- end div computador -->
		
		
		
				<!-- Inicio div visita tecnica-->
		<div id="visita" style="margin-top: 50px; display: none;">
			<form action="" id="fmVisita">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-4 form-group" style="margin-top: 3px;">
							<label>Instituição*</label> <select class="js-example-responsive" 
								name="instituicao" id="instituicao" style="width: 100%; height: 100%; line-height: 100%; padding: 30px;" >
								<option value="">Selecione uma instituição</option>
								<c:forEach var="escola" items="${listaEscola}">
								<option value="${escola.id}">${escola.nome}</option>
								</c:forEach>
								</select>
								
								<div class="col-md-4" style="display: none;">
								
								<input class="form-control"
								name="idUsuario" id="idUsuario" value="${usuarioLogado.id }">
								
								</div>
						</div>

						<div class="col-md-4 form-group">
							<label>Solicitante*</label> <input class="form-control"
								name="nome" id="nome">
						</div>
					</div>
                 </div>
             
                 
                   <div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-2"></div>
						<div class="col-md-8 form-group">
							<label>Descrição do problema:*</label> 
							<textarea rows="5" cols="40" class="form-control" style="resize: none;" id="desc_problema"
							name="desc_problema"></textarea>
						</div>

					</div>
                 </div>
                 
                 <hr>

				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="col-md-12 form-group" align="right">
							<button type="submit" class="btn btn-primary">Cadastrar</button>
						</div>

					</div>
				</div>

			</form>
		</div>
		<!-- end div visita tecnica -->
	</div>


<!-- Inicio modal pc --><div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="mdMicro">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action="" method="post">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">ATEDUC</h4>
      </div>
      <div class="modal-body">
       <p>Chamado cadastrado com sucesso.</br>
          Número do chamado: <label id="nChamado"></label></p>
          <input type="hidden" id="numeroInterno" name="numeroInterno">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="verChamadoPc" onclick="verChamadoPC();">Vizualizar Chamado</button>
        <button type="button" class="btn btn-danger">Imprimir Termo de Retirada</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        
      </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- fim modal pc-->




   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"></script>
      
   




<script>


	
$('#micro').cloneya({
                maximum: 10,
                minimum: 1,
                serializeIndex: true
            }).on('maximum.cloneya', function (e, limit, toclone) {
            	noty({
				    text: '<strong>ATEDUC</strong><br> <br>É permitido somente 10 micro por chamado! ',
				    type: 'warning',
				    layout : 'topRight',
				    timeout: 4000,
				    progressBar : true,
				    animation: {
				        open: {height: 'toggle'},
				        close: {height: 'toggle'},
				        easing: 'swing',
				        speed: 500 // opening & closing animation speed
				    }
				}).on(
					    'after_append.cloneya',
					    function () {
					        $('#micro label').each(function () {
					            var label_for = $(this).attr('for');
					            var $input = $('#' + label_for);
					            $(this).text($input.attr('name'));
					        });
					});
                    }).on('minimum.cloneya', function (e, limit, toclone) {
                    	noty({
						    text: '<strong>ATEDUC</strong><br> <br>Pelo menos 1 micro deve ser informado! ',
						    type: 'warning',
						    layout : 'topRight',
						    timeout: 4000,
						    progressBar : true,
						    animation: {
						        open: {height: 'toggle'},
						        close: {height: 'toggle'},
						        easing: 'swing',
						        speed: 500 // opening & closing animation speed
						    }
						});
                    }).on(
                    	    'after_append.cloneya',
                    	    function () {
                    	        $('#micro label').each(function () {
                    	            var label_for = $(this).attr('for');
                    	            var $input = $('#' + label_for);
                    	            $(this).text($input.attr('name'));
                    	        });
                    	});

$(document).ready(function() {
	  $(".js-example-responsive").select2();
	});
        </script>

</body>
</html>
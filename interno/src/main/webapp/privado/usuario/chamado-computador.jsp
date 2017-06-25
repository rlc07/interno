<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vizualizar - Chamado Computador</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">



</head>
<body >

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Informações do Chamado</h3>
      <h2>${num_interno}</h2>
      </div>
     </div>
     <hr>
     
	<div class="container" >

	<div class="row" align="center">
	<div class="col-md-12 col-sm-12">

				<div class="col-md-6">
					<h4>
						<label>Instituição: </label> ${instituicao }
					</h4>
				</div>

				<div class="col-md-6">
					<h4>
						<label>Data de Cadastro: </label> ${dt_cadastro} - ${hora}
					</h4>
				</div>
			</div>
	</div>
	
	<!-- Inicio panel detalhes chamado -->
		<div class="row" align="center" style="margin-top: 20px;">
	<div class="col-md-12 col-sm-12">

				<div class="panel with panel-primary class">
					<div class="panel-heading" align="center">Detalhes do Chamado</div>
					<div class="panel-body">
                  <div><b>Aberto por</b>: ${user_nome } ${user_snome}</div>
                  <div class="row" style="margin-top: 25px;">
							<div class="col-md-12 col-sm-12">
								<div class="col-md-4">
									<h5>
										<label>Solicitante: </label> ${solicitante}
									</h5>
								</div>
								
								<div class="col-md-4">
									<h5>
										<label>Nome do(a) Solicitante: </label> ${nome_solicitante}
									</h5>
								</div>
								
								<div class="col-md-4">
								<c:if test="${num_ima != 0}">
								<h5>
										<label>Número do chamado IMA: </label> ${num_ima}
									</h5>
								</c:if>
									
								</div>
								
							</div>
				 </div>
						
                  <hr>
						<div class="row" >

							<div class="panel panel-default">
								<div class="panel-heading">Detalhes do Micro</div>
								
								<div class="row" style="margin-top: 25px;">
								<div class="col-md-12 col-sm-12">
								<div class="col-md-12" style="overflow-x:auto;" id="divMicros">
											<table class="table table-hover" id="tbMicros">
												<thead>
													<tr>
														<th>Patrimônio</th>
														<th>Nota Fiscal</th>
														<th>Status</th>
														<th>Tipo de micro</th>
														<th>Backup</th>
														<th>Ativar\Finalizar</th>
														<th>Editar</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="internoChamado" items="${listaMicro}">
												<tr>
														<td>${internoChamado.patrimonio}</td>
														<td>${internoChamado.nota_fiscal}</td>
														<td>${internoChamado.status}</td>
														<td>${internoChamado.tipo_micro}</td>
														<td>
														  <c:choose>
														    <c:when test="${internoChamado.backup == true}">
														    SIM
														    </c:when>
														    
														    <c:otherwise>
														    NÃO
														    </c:otherwise>
														  </c:choose>
														</td>
														<td>
														
															<c:choose>
																	<c:when test="${internoChamado.status == 'aguardando'}">
                                                                      <button type="button" class="btn btn-success" onclick="addMicroManutencao(${internoChamado.id})"><span class="fa fa-check"></span></button>

																	</c:when>
																	<c:otherwise>
                                                                     
                                                                    <button type="button" class="btn btn-success" disabled="disabled"><span class="fa fa-check"></span></button>
 
																	</c:otherwise>
										                    </c:choose>
										               
														<c:choose>
																	<c:when test="${internoChamado.status == 'aguardando'}">
                                                                      <button type="button" class="btn btn-danger"  data-toggle="modal" data-target=".mdMicroFinaliza"
														             onclick="finalizaMicro(${internoChamado.id})"><span class="fa fa-times "></span></button>
																	</c:when>
																	<c:otherwise>
                                                                     <button type="button" class="btn btn-danger"  disabled="disabled"><span class="fa fa-times "></span></button> 
																	</c:otherwise>
										               </c:choose>
										               </td>
														
														<td>
														
														 <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".mdMicroDetalhe"
														  onclick="verDetalheMicro(${internoChamado.id})"><span class="fa fa-pencil-square-o"></span></button>
														 
														</td>
														
														
													</tr>
												</c:forEach>
													
												</tbody>
											</table>
										</div>
								
								 </div>
								</div>
								
								<div class="row" align="center" style="margin-top: 10px; margin-bottom: 10px;">
							<div class="col-md-12 col-sm-12">
							<button type="button" class="btn btn-default">Termo - Retirada</button>
							<button type="button" class="btn btn-primary" onclick="geraTermoEntregaMicro(${num_interno});">Termo - Entrega</button>
							<c:choose>
							  <c:when test="${newMicro == 1}">
							  <button type="button" class="btn btn-success"  disabled="disabled"><b>+ ADD Micro</b></button>
							  </c:when>
							  
							  <c:otherwise>
							  <button type="button" class="btn btn-success" data-toggle="modal" 
							  data-target=".mdAddMicro" ><b>+ ADD Micro</b></button>
							  </c:otherwise>
							</c:choose>
							
							
							</div>
							</div>
                           </div>
                           
                           
                          <div class="row" align="right">
							<div class="col-md-12 col-sm-12">
							
						       <c:choose>
						         <c:when test="${microFin == 1}">
						         	<button type="button" class="btn btn-danger" style="margin-right: 10px;" data-toggle="modal" data-target=".mdFechaChamadoMicro" >Finalizar Chamado</button>
						         </c:when>
						         <c:otherwise>
						         <button type="button" class="btn btn-danger" style="margin-right: 10px;" disabled="disabled">Finalizar Chamado</button>
						         </c:otherwise>
						        </c:choose>
							</div>
							</div>
					
						</div>

					</div>
				</div>
			</div>
		<!-- Fim panel detalhes chamado -->
	
	
	</div>



		<!-- Inicio modal ver detalhes do micro -->
		<div class="modal fade mdMicroDetalhe" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel" id="mdMicroDetalhe">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="" method="post" id="fmAltMicro">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div align="center">
								<h4 class="modal-title" id="gridSystemModalLabel">ATEDUC -
									Informações do Computador</h4>
							</div>
						</div>
						<div class="modal-body">
								<div class="row">
									<div class="col-md-12 col-sm-12">
									
									
										<div class="col-md-6">
										<label>Tipo Patrimônio</label>
										<select class="form-control"
												name="tipo_patri" id="tipo_patri" onchange="verificaPatMicroEditar();">
												<option value="1">Nota Fiscal</option>
												<option value="2">Chapa</option>
											</select>
										</div>
										
										<div class="col-md-6" style="display: none;" id="pat">
										<label>Patrimônio</label>
										<input type="text" class="form-control" name="patrimonio" id="patrimonio">
										</div>
										
										<div class="col-md-6" style="display: none;" id="nota">
										<label>Nota Fiscal</label>
										<input type="text" class="form-control" name="nf" id="nf">
										</div>
										
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Tipo de Micro</label> <select class="form-control"
												name="tipo_micro" id="tipo_micro">
												<option value=""></option>
												<option value="notebook">Notebook</option>
												<option value="allinone">All In One</option>
												<option value="desktop">Desktop</option>
											</select>
										</div>
										
										<div class="col-md-6">
										<label>Localização</label>
										<input type="text" class="form-control" name="localizacao" id="localizacao">
										</div>
										
									</div>
								</div>
								
								<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Backup</label> <select class="form-control"
												name="backcup" id="backup">
												<option value="true">Sim</option>
												<option value="false">Não</option>
											</select>
										</div>
									
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-12">
											<label>Descrição do Problema</label>
											<textarea rows="5" cols="40" class="form-control" style="resize: none;" id="desc_problema" name="desc_problema">
											
											</textarea>
											
											<input type="hidden" name="idMicro" id="idMicro">
										</div>
								
									</div>
								</div>
								
						</div>
						<div class="modal-footer">
						<c:if test="${statusChamado != 'fechado'}"><button type="submit" class="btn btn-success">Alterar</button>
						</c:if>
							
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Fechar</button>

						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

<!-- Fim chamado ver detalhes do micro -->


		<!-- Inicio modal finalizar micro micro -->
		<div class="modal fade mdMicroFinaliza" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel" id="mdMicroFinaliza">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="" method="post" id="fmFinalizatMicro">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div align="center">
								<h4 class="modal-title" id="gridSystemModalLabel">ATEDUC -
									Desativar Computador</h4>
							</div>
						</div>
						<div class="modal-body">
								<div class="row">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
										<label>Patrimônio</label>
										<input type="text" class="form-control" name="patrimonio_finaliza" id="patrimonio_finaliza" readonly="readonly">
										</div>
										
										<div class="col-md-6">
										<label>Nota Fiscal</label>
										<input type="text" class="form-control" name="nf_finaliza" id="nf_finaliza" readonly="readonly">
										</div>
										
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Tipo de Micro</label> <select class="form-control"
												name="tipo_micro_finaliza" id="tipo_micro_finaliza" disabled="disabled">
												<option value=""></option>
												<option value="notebook">Notebook</option>
												<option value="allinone">All In One</option>
												<option value="desktop">Desktop</option>
											</select>
										</div>
										
										<div class="col-md-6">
										<label>Localização</label>
										<input type="text" class="form-control" name="localizacao_finaliza" id="localizacao_finaliza" readonly="readonly">
										</div>
										
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Backup</label> <select class="form-control"
												name="backup_finaliza" id="backup_finaliza" disabled="disabled">
												<option value="true">Sim</option>
												<option value="false">Não</option>
											</select>
										</div>
										
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-12">
											<label>Descrição do Problema</label>
											<textarea rows="5" cols="40" class="form-control" style="resize: none;" 
											readonly="readonly" id="desc_problema_finaliza" name="desc_problema_finaliza">
											
											</textarea>
											
											<input type="hidden" name="idMicro" id="idMicro">
										</div>
								
									</div>
								</div>

							<div class="row" style="margin-top: 20px;">
							<hr>
								<div class="col-md-12 col-sm-12">

									<div class="col-md-12">
										<label>Motivo</label>
										<textarea rows="5" cols="30" class="form-control"
											style="resize: none;" id="desc_finaliza" name="desc_finaliza"></textarea>

										<input type="hidden" name="idMicro_finaliza" id="idMicro_finaliza">
									</div>

								</div>
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Finalizar</button>
							
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Fechar</button>

						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

<!-- Fim modal finalizar micro -->


		<!-- Inicio modal add micro -->
		<div class="modal fade mdAddMicro" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel" id="mdAddMicro">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div align="center">
								<h4 class="modal-title" id="gridSystemModalLabel">ATEDUC -
									Adicionar novo computador</h4>
							</div>
						</div>
						<div class="modal-body">
							
							<form action="" method="post" id="fmNewMicro">
				
						<div class="modal-body">
								<div class="row">
									<div class="col-md-12 col-sm-12">
									
									
										<div class="col-md-6">
										<label>Tipo Patrimônio</label>
										<select class="form-control"
												name="tipo_patri_new" id="tipo_patri_new" onchange="verificaPatMicroNovo();">
												<option value="0" selected="selected">Selecione a opção</option>
												<option value="1" >Nota Fiscal</option>
												<option value="2">Chapa</option>
											</select>
										</div>
										
										<div class="col-md-6" style="display: none;" id="pat_new">
										<label>Patrimônio</label>
										<input type="text" class="form-control" name="patrimonio_new" id="patrimonio_new">
										</div>
										
										<div class="col-md-6" style="display: none;" id="nota_new">
										<label>Nota Fiscal</label>
										<input type="text" class="form-control" name="nf_new" id="nf_new">
										</div>
										
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Tipo de Micro</label> <select class="form-control"
												name="tipo_micro_new" id="tipo_micro_new">
												<option value=""></option>
												<option value="notebook">Notebook</option>
												<option value="allinone">All In One</option>
												<option value="desktop">Desktop</option>
											</select>
										</div>
										
										<div class="col-md-6">
										<label>Localização</label>
										<input type="text" class="form-control" name="localizacao_new" id="localizacao_new">
										</div>
										
									</div>
								</div>
								
								<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-6">
											<label>Backup</label> <select class="form-control"
												name="backup_new" id="backup_new">
												<option value="true">Sim</option>
												<option value="false">Não</option>
											</select>
										</div>
									
									</div>
								</div>
								
									<div class="row" style="margin-top: 20px;">
									<div class="col-md-12 col-sm-12">
									
										<div class="col-md-12">
											<label>Descrição do Problema</label>
											<textarea rows="5" cols="40" class="form-control" style="resize: none;" id="desc_problema_new" 
											name="desc_problema_new"></textarea>
											
											<input type="hidden" name="idChamado" id="idChamado" value="${num_interno}">
										</div>
								
									</div>
								</div>
								
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Adicionar</button>
							
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Fechar</button>

						</div>
					</form>
						
							
						</div>
					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

<!-- Fim modal add micro -->


<!-- Inicio modal add micro tabela manutencao-->
<div class="modal fade mdAddMicroManutencao" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="mdAddMicroManutencao">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">ATEDUC - Adicionar micro na tabela de manutenção</h4></div>
      </div>
      <div class="modal-body">
      <form id="fmAddMicroManutencao" action="">
         <input type="hidden" id="idMicroManutencao" name="idMicroManutencao">
          
          <div align="center">
          <button type="submit" class="btn btn-success">Adicionar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          </div>
      </form>
       
      </div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- fim add micro tabela de manutencao-->



<!-- Inicio modal fecha chamado micro-->
<div class="modal fade mdFechaChamadoMicro" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="mdFechaChamadoMicro">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">ATEDUC - Fechar Chamado (Computador)</h4></div>
      </div>
      <div class="modal-body">

						<form action="" id="fmFechaChamadoComp">
							<input type="hidden" id="numChamado"
								name="numChamado" value="${num_interno}">
								
							 <input type="hidden" id="idUsuario" name="idUsuario"
								value="${usuarioLogado.id }">

							<div class="row">
							    <div class="col-md-12 col-sm-12">
							    <label>Descrição de fechamento</label>
								<textarea rows="5" cols="40" style="resize: none;" id="desc_fechamento" 
								name="desc_fechamento" class="form-control"></textarea>
								</div>
							</div>
							<hr>
							<div align="center" style="margin-top: 10px;">
								<button type="submit" class="btn btn-danger">Fechar</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
							</div>
						</form>

					</div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- FIM modal fecha chamado micro-->

   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js" charset="utf-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js" charset="utf-8"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js" charset="utf-8"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js" charset="utf-8"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/datatables/1.10.13/js/jquery.dataTables.js" charset="UTF-8"></script>
         
</body>
</html>
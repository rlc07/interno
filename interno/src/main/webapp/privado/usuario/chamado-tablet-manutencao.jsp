<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vizualizar - Chamado Tablet</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">



</head>
<body style="background-color: #f4f4f4">

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
      <div align="center">
      <h3>Informações do Tablet</h3>
      <h2><a href="#">${patrimonio}</a></h2>
      </div>
     </div>
     <hr>
     <div align="center">
      <h4>Chamado: ${chamado}</h4>
      <c:if test="${usuarioTecnico != 'disponivel' }"><h5>Em Atendimento por: <a href="#">${usuarioTecnico}</a></h5></c:if>
      </div>
     <hr>
     
	<!-- Inicio container -->
	<div class="container">
	   
	   <!-- Inicio da primeira linha -->
	   <div class="row">
	    <div class="col-md-12 col-sm-12" align="center">
	         
	         <div class="col-md-6">
	           <b>Instituição:</b> ${escola} 
	         </div>
	         
	         <div class="col-md-6">
	           <b>Solicitante:</b> ${nome} 
	         </div>
	    </div>
	   </div>
	   <!-- Fim primeira linha -->
	   
	     <!-- Inicio da segunda linha -->
	   <div class="row" style="margin-top: 15px;">
	    <div class="col-md-12 col-sm-12" align="center">
	         
	         <div class="col-md-4">
	           <b>Matrícula:</b> ${matricula} 
	         </div>
	         
	         <div class="col-md-4">
	           <b>Cargo:</b> ${cargo} 
	         </div>
	         
	         <div class="col-md-4">
	           <b>Telefone:</b> ${telefoneSolicitante}
	         </div>
	    </div>
	   </div>
	   <!-- Fim segunda linha -->

		<!-- Inicio da terceira linha -->
		<div class="row" style="margin-top: 15px;">
			<div class="col-md-12 col-sm-12" align="center">
				<div class="panel panel-default" >
					<div class="panel-heading" style="background-color:#0c8b5b;"><b style="color:white;">Informações do Tablet</b></div>
					<div class="panel-body">

						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="col-md-6">
									<h5><b>Recebido por:</b> <a href="#"> ${usuario.nome}</a></h5>
								</div>

								<div class="col-md-6">
									<h5>
										<b>Data de Entrada:</b> ${dt_cadastro} - ${hora_cadastro}h
									</h5>
								</div>
							</div>
						</div>
						<hr>

						<div class="row">
							<div class="col-md-12 col-sm-12">

								<div class="col-md-4">
									<b>Marca:</b> ${marca}
								</div>
								
								<div class="col-md-4">
									<b>Modelo:</b> ${modelo}
								</div>
								
								<div class="col-md-4">
									<b>Backup:</b>
                                     <c:choose>
                                       <c:when test="${bk == true }">
                                       Sim
                                       </c:when>
                                       <c:otherwise>
                                       Não
                                       </c:otherwise>
                                     </c:choose>
                                    
								</div>

							</div>
						</div>
						<hr>
							<div class="row" style="margin-top: 25px;" align="center">
							<div class="col-md-12 col-sm-12">
                                 
								<div class="col-md-6" align="left">
									<label><b>Problema:</b></label>
									<textarea rows="6" cols="40" class="form-control" style="resize: none;"
									disabled="disabled">${problema}</textarea>
								   </div>
								   
								   	<div class="col-md-6" style="margin-top: 6%;">
									<div class="panel panel-default">
										<div class="panel-heading">Acessórios</div>
										<div class="panel-body">
										  <b><c:if test="${capa == true}">| <i class="fa fa-check-circle" aria-hidden="true" style="color:green;"></i> Capa |</c:if></b>
										  <b><c:if test="${caixa == true}"><i class="fa fa-check-circle" aria-hidden="true" style="color:green;"></i> Caixa | </c:if></b>
										  <b><c:if test="${carregador == true}"><i class="fa fa-check-circle" aria-hidden="true" style="color:green;"></i> Carregador | </c:if></b>
										  <b><c:if test="${fone == true}"><i class="fa fa-check-circle" aria-hidden="true" style="color:green;"></i> Fone de Ouvido | </c:if></b>
										  <b><c:if test="${modem == true }"><i class="fa fa-check-circle" aria-hidden="true" style="color:green;"></i> Modem | </c:if></b>
										</div>
									</div>
									
								</div>
			
                              </div>
						</div>
						<hr>

						<div class="row" align="center"
							style="margin-top: 10px; margin-bottom: 10px;">
							<div class="col-md-12 col-sm-12">
								<button type="button" class="btn btn-default">Termo -
									Recebimento</button>
								<button type="button" class="btn btn-primary">Termo -
									Entrega</button>
									
									<c:choose>
									  <c:when test="${usuarioTecnico == 'disponivel'}">
									  <button type="button" class="btn btn-success"
									  data-toggle="modal" data-target="#mdAddTecnicoAtendimentoTablet">Realiza Atendimento</button>
									  </c:when>
									  
									  <c:otherwise>
									  <button type="button" class="btn btn-success" disabled="disabled">Realiza Atendimento</button>
									  </c:otherwise>
									</c:choose>
								
									
                            </div>
						</div>
						<hr>
						<div class="row" align="right"
							style="margin-top: 10px; margin-bottom: 10px;">
							<div class="col-md-12 col-sm-12">
							 <c:choose>
							   <c:when test="${statusTablet == 'a devolver'}">
							   <button type="button" class="btn btn-danger">Fechar Chamado</button>
							   </c:when>
							   <c:when test="${statusTablet != 'finalizado'}">
							   	<button type="button" class="btn btn-danger" disabled="disabled">Fechar Chamado</button>
							   </c:when>
							 </c:choose>
								
                            </div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- Fim terceira linha -->

      <c:choose>
        <c:when test="${usuarioTecnico != 'disponivel' && usuarioLogado.nome == usuarioTecnico}">
        		<!-- Inicio da quarta linha -->
		<form id="fmFinalizaTablet">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading" align="center"><b>Informações do Atendimento</b></div>
						<div class="panel-body">

									<div class="row">
										<div class="col-md-12 col-sm-12">

											<div class="col-md-6" align="left">
												<label><b>Data de Inicio:</b> ${dt_inicio }</label> 
											</div>

											<div class="col-md-6" align="left">
												<label><b>Data de Termino: </b></label>
												<c:choose>
												  <c:when test="${dt_fim != ''}">
												  ${dt_fim }
												  </c:when>
												  <c:otherwise>
												  Em Andamento
												  </c:otherwise>
												</c:choose>
												
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
								<div class="col-md-12 col-sm-12">
										
										<c:choose>
										   <c:when test="${statusTablet == 'em atendimento' }">
													<div class="col-md-6" align="left">
														<label><b>Problema:</b></label> <select
															class="form-control" id="select_problema_tablet"
															name="select_problema_tablet"
															onchange="selectSolucaoTablet();">
															<option value=""
																<c:if test="${resolvido== ''}"><c:out value="selected='selected'"></c:out></c:if>>Selecione
																a opção</option>
															<option value="ima"
																<c:if test="${resolvido== 'ima'}"><c:out value="selected='selected'"></c:out></c:if>>Encaminhado
																para IMA</option>
															<option value="departamento"
																<c:if test="${resolvido == 'departamento'}"><c:out value="selected='selected'"></c:out>	</c:if>>Resolvido
																no departamento</option>
														</select>
													</div>
												</c:when>
										   <c:otherwise>
													<div class="col-md-6" align="left">
														<label><b>Problema:</b></label> <select
															class="form-control" id="select_problema_tablet"
															name="select_problema_tablet" disabled="disabled">
															<option value=""
																<c:if test="${resolvido== ''}"><c:out value="selected='selected'"></c:out></c:if>>Selecione
																a opção</option>
															<option value="ima"
																<c:if test="${resolvido== 'ima'}"><c:out value="selected='selected'"></c:out></c:if>>Encaminhado
																para IMA</option>
															<option value="departamento"
																<c:if test="${resolvido == 'departamento'}"><c:out value="selected='selected'"></c:out>	</c:if>>Resolvido
																no departamento</option>
														</select>
													</div>
												</c:otherwise>
										</c:choose>				   
								 							   
								  
								</div>
							</div>

							<c:choose>
							  <c:when test="${resolvido == 'departamento'}">
							  <div class="row" style="margin-top: 20px;" id="sol">
								<div class="col-md-12 col-sm-12">

									<div class="col-md-6" align="left">
										<label><b>Solução do Problema:</b></label>
										<textarea rows="6" cols="40" class="form-control"
											style="resize: none;" id="solucao" name="solucao" disabled="disabled">${solucao}</textarea>
									</div>
                                </div>
							</div>
							  </c:when>
							  <c:otherwise>
							  <div class="row" style="margin-top: 20px; display: none;" id="sol">
								<div class="col-md-12 col-sm-12">

									<div class="col-md-6" align="left">
										<label><b>Solução do Problema:</b></label>
										<textarea rows="6" cols="40" class="form-control"
											style="resize: none;" id="solucao" name="solucao"></textarea>
									</div>

								</div>
							</div>
							  </c:otherwise>
							</c:choose>
							<input type="hidden" name="chamado" id="chamado" value="${chamado}">
							
							<hr>
							<div class="row" style="margin-top: 25px;" align="right">
							  <div class="col-sm-12 com-md-12">
							 
							  <c:choose>
							     <c:when test="${resolvido == '' || resolvido == null}">
							     	<button type="submit" class="btn btn-primary">Finalizar Tablet</button>							     
							     </c:when>
							  </c:choose>
							  </div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- Fim da quarta linha -->
       </c:when>        
        <c:when test="${usuarioTecnico != 'disponivel' && usuarioLogado.nome != usuarioTecnico}">
        
        		<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading" align="center"><b>Informações do Atendimento</b></div>
						<div class="panel-body">
		                      <div class="row">
										<div class="col-md-12 col-sm-12">

											<div class="col-md-6" align="left">
												<label><b>Data de Inicio:</b> ${dt_inicio }</label> 
											</div>

											<div class="col-md-6" align="left">
												<label><b>Data de Termino: </b></label>
												<c:choose>
												  <c:when test="${dt_fim != ''}">
												  ${dt_fim}
												  </c:when>
												  <c:otherwise>
												  Em Andamento
												  </c:otherwise>
												</c:choose>
												
											</div>
										</div>
									</div>
									<hr>
							<div class="row">
								<div class="col-md-12 col-sm-12">
															   
								    <div class="col-md-6" align="left">
									<label><b>Problema:</b></label>
									<select class="form-control" id="select_problema_tablet" name="select_problema_tablet"
									onchange="selectSolucaoTablet();" disabled="disabled">
									  <option value="" <c:if test="${resolvido== ''}"><c:out value="selected='selected'"></c:out></c:if>>Selecione a opção</option>
									  <option value="ima" <c:if test="${resolvido== 'ima'}"><c:out value="selected='selected'"></c:out></c:if>>Encaminhado para IMA</option>
									  <option value="departamento" <c:if test="${resolvido == 'departamento'}"><c:out value="selected='selected'"></c:out>	</c:if>>Resolvido no departamento</option>
									</select>
								   </div>							   
								  
								</div>
							</div>

								<c:choose>
							  <c:when test="${resolvido == 'departamento'}">
							  <div class="row" style="margin-top: 20px;" id="sol">
								<div class="col-md-12 col-sm-12">

									<div class="col-md-6" align="left">
										<label><b>Solução do Problema:</b></label>
										<textarea rows="6" cols="40" class="form-control"
											style="resize: none;" disabled="disabled" id="solucao" name="solucao">${solucao}</textarea>
									</div>
                                </div>
							</div>
							  </c:when>
							  <c:otherwise>
							  <div class="row" style="margin-top: 20px; display: none;" id="sol">
								<div class="col-md-12 col-sm-12">

									<div class="col-md-6" align="left">
										<label><b>Solução do Problema:</b></label>
										<textarea rows="6" cols="40" class="form-control"
											style="resize: none;" id="solucao" name="solucao"></textarea>
									</div>

								</div>
							</div>
							  </c:otherwise>
							</c:choose>
						
						</div>
					</div>
				</div>
			</div>
        </c:when>
      </c:choose>
      
      <c:if test="${tecnico != 0 && resolvido == 'ima' }">
      <div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="panel panel-danger">
						<div class="panel-heading" align="center"><b>Informações (Encaminhado para IMA)</b></div>
						<div class="panel-body">
						      <form action="" id="fmEnviaTabletIma">
						
		                      <div class="row">
										<div class="col-md-12 col-sm-12">

											<div class="col-md-4" align="left">
												<label><b>Data da Solicitação:</b> ${dt_solicitacao}</label> 
											</div>

											<div class="col-md-4" align="left">
												<label><b>Data de Envio: </b></label>
												<c:choose>
												  <c:when test="${dt_envio_ima != ''}">
												  ${dt_envio_ima}
												  </c:when>
												  <c:otherwise>
												  Á Enviar
												  </c:otherwise>
												</c:choose>
												
											</div>
											
											<div class="col-md-4" align="left">
												<c:choose>
												  <c:when test="${dt_chega_ima != '' && dt_chega_ima != 'Aguardando...'}">
												  <label><b>Data de Chegada: </b></label>
												  ${dt_chega_ima}
												  </c:when>
												  
												  <c:when test="${dt_envio_ima != 'Á enviar' && dt_chega_ima == 'Aguardando...'}">
												  <label><b>Data de Chegada: </b></label>
												  ${dt_chega_ima}
												  </c:when>
												   
												</c:choose>
												
											</div>
										</div>
									</div>
									<hr>
							<div class="row">
								<div class="col-md-12 col-sm-12">
															   
								   <div class="col-md-4" align="left">
									<label><b>Responsável da IMA:</b></label>
									
									<c:choose>
									  <c:when test="${tecnico_ima != null}">
									  <input type="text" name="resp_ima" id="resp_ima" class="form-control"
									placeholder="Informe o nome do técnico da ima" value="${tecnico_ima}" disabled="disabled">
									  </c:when>
									  <c:otherwise>
									  <input type="text" name="resp_ima" id="resp_ima" class="form-control"
									placeholder="Informe o nome do técnico da ima"  >
									  </c:otherwise>
									</c:choose>
									
								  
								   <input type="hidden" name="idUsuarioEnviaIma" id="idUsuarioEnviaIma" value="${usuarioLogado.id }">
								   </div>	
								 </div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
							     <input type="hidden" name="chamado" id="chamado" value="${chamado }">
								   <div class="col-md-4" align="right">
								   
								   <c:choose>
								     <c:when test="${dt_envio_ima == 'Á enviar' || dt_envio_ima == ''}">
								     <button type="submit" class="btn btn-success">Enviar</button>								     
								     </c:when>
								     
								     <c:when test="${usuario_recebe_ima == 0 }">
								     <button type="button" class="btn btn-danger" data-toggle="modal" 
								     	data-target="#mdTabletChegaIma">Fechar</button>
								     </c:when>
								     
								   </c:choose>
									</div>
							</div>
                         </form>
						</div>
					</div>
				</div>
			</div>
      
      </form>
      
      </c:if>
	</div>
	<!-- Fim container -->
	
<!-- Inicio modal realiza atendimento tablet-->
<div class="modal fade mdAddTecnicoAtendimentoTablet" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"
 id="mdAddTecnicoAtendimentoTablet">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">ATEDUC - Realizar Atendimento (Manutenção Tablet)</h4></div>
      </div>
      <div class="modal-body">

						<form action="" id="fmTecnicoRespTablet">
							<input type="hidden" id="idManutencao"
								name="numero-chamado-interno" value="${chamado}">
								
							 <input type="hidden" id="idUsuario" name="idUsuario"
								value="${usuarioLogado.id }">

							<div>
								<p>Ola ${usuarioLogado.nome}, para ser o técnico responsável
									desse tablet, clique em confirmar!</p>
							</div>
							<div align="center">
								<button type="submit" class="btn btn-danger">Confirmar</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
							</div>
						</form>

					</div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- FIM modal realiza atendimento tablet-->

<!-- Inicio modal tablet chega ima-->
<div class="modal fade mdTabletChegaIma" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"
 id="mdTabletChegaIma">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">ATEDUC - Finaliza Atendimento (Manutenção Tablet - IMA)</h4></div>
      </div>
      <div class="modal-body">

						<form action="" id="fmChegaTabletIma">
							<input type="hidden" id="chamado"
								name="chamado" value="${chamado}">
								
							 <input type="hidden" id="idUsuarioRecIma" name="idUsuarioRecIma"
								value="${usuarioLogado.id }">

							<div>
								<p>Ola ${usuarioLogado.nome}, clique em confirmar se o Tablet ${patrimonio}, ja chegou da IMA!</p>
							</div>
							<div align="center">
								<button type="submit" class="btn btn-danger">Confirmar</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
							</div>
						</form>

					</div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- FIM modal tablet chega ima-->

   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js" charset="utf-8"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js" charset="utf-8"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js" charset="utf-8"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js" charset="utf-8"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/datatables/1.10.13/js/jquery.dataTables.js" charset="UTF-8"></script>
         
</body>
</html>
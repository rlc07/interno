<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vizualizar - Computador Manutenção</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">



</head>
<body >

<jsp:include page="../../template/navbar.jsp"></jsp:include>

    <div class="container" style="margin-top: 120px;">
    
    
      <div align="center">
      <h3>Informações do Computador</h3>
      <h2>${patrimonio}</h2>
      <c:if test="${tecnico != null }">
            <h4>Em atendimento por: <a href="#">${tecnico.nome}</a></h4>
      
      </c:if>
      </div>
     </div>
     <hr>
     
	<div class="container" >

		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div>
					<h4>
						Chamado: <a href="${pageContext.request.contextPath}/main?action=detalhe-chamado&numero-chamado-interno=${num_chamado}">${num_chamado}</a>
					</h4>

				</div>


				<hr>

				<div class="panel panel-danger">
					<div class="panel-heading" id="panelAtedimento">Informaçoes
						do Chamado</div>
						
					<div class="panel-body">
						<div class="col-md-6" >
								<label>Instituição: </label> ${escola}
						</div>

						<div class="col-md-6" >
								<label>Data da Retirada: </label> ${dt_retirada}
						</div>

						<div class="row">
							<div class="col-md-12 col-sm-12" >

								<div class="col-md-6" >
										<label>Tipo de Micro: </label> ${tipo_micro}
								</div>

								<div class="col-md-6" >
										<label>Backup: </label>
										<c:choose>
											<c:when test="${backup == false}">Não</c:when>
											<c:otherwise>Sim</c:otherwise>
										</c:choose>
								</div>
							</div>
						</div>

						<div class="row" >
							<div class="col-md-12 col-sm-12">

								<div class="col-md-8" align="left">
										<label>Descrição do Problema: </label> </br>
										<textarea rows="5" cols="" class="form-control"
											style="resize: none;" disabled="disabled">${desc_problema}</textarea>
								</div>

							</div>
						</div>

						<div class="row" style="margin-top: 25px;">
						<hr>
							<div class="col-md-12 col-sm-12">

								<div class="col-md-8" align="right">
									<c:choose>
										<c:when test="${tecnico != null}">
											<button type="button" class="btn btn-success"
												disabled="disabled">Realizar Atendimento</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-success"
												data-toggle="modal" data-target="#mdAddTecnicoAtendimento">Realizar
												Atendimento</button>
										</c:otherwise>
									</c:choose>

								</div>

							</div>
						</div>
					</div>
					</div>
				</div>

			</div>
		</div>


	

	
<hr>
		


            <c:if test="${tecnico != null }">
            		<!-- Inicio panel detalhes chamado -->
		<div class="row" align="center" style="margin-top: 20px; ">
	<div class="col-md-12 col-sm-12">

				<div class="panel with panel-primary class">
					<div class="panel-heading" align="center">Informações do Computador</div>
					<div class="panel-body">
	                  
	                  <c:choose>
	                     <c:when test="${usuarioLogado.id == tecnico.id}">
	                     
	                     <form action="" class="form-group" id="fmFinalizaManutencaoChamado">
							<div class="row">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-4" align="left">
								<label>HD*</label>
								<input class="form-control" placeholder="Exemplo: 500GB" name="hd" id="hd" value="${hd}">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Memoria RAM*</label>
								<input class="form-control" placeholder="Exemplo: 2GB" name="ram" id="ram" value="${ram}">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Processador*</label>
								<input class="form-control" placeholder="Exemplo: Intel Core i7" name="processador" id="processador" value="${processador}">
								</div>
								
								</div>
							</div>
							
								<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-4" align="left">
								<label>Sistema Operacional*</label>
								<input class="form-control" placeholder="Exemplo: Linux Mint 18.2" name="so" id="so" value="${so}">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Marca*</label>
								<input class="form-control" placeholder="Exemplo: Positivo" name="marca" id="marca" value="${marca}">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Modelo</label>
								<input class="form-control" placeholder="Exemplo: POS-234-SE" name="modelo" id="modelo" value="${modelo}">
								</div>
								
								</div>
							</div>
							
							<hr>

							<div class="panel with panel-info class">
								<div class="panel-body" align="center"><b>Informações do atendimento</b></div>
							</div>
							
								<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-6" align="center">
								<h4>Data de Inicio: ${dt_inicio}</h4>
								</div>
								
								<div class="col-md-6" align="">
								<h4>Data de Termino: <c:choose>
															<c:when test="${dt_termino != null }">${dt_termino}</c:when>
                                                            <c:otherwise>Em Andamento</c:otherwise>
														</c:choose></h4>
								</div>
								
								</div>
							</div>
							<hr>
							
							<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-6" align="left">
								<label>Solução do problema*</label>
								<textarea rows="5" cols="40" style="resize: none;" class="form-control" name="solucao" id="solucao" >${solucao }</textarea>
								</div>
								
								<div class="col-md-3" align="left" style="">
								<label>Usúario 1</label>
								<input type="text" class="form-control" name="conta1" id="conta1">
								</div>
								
								<div class="col-md-3" align="left">
								<label>Senha 1</label>
								<input type="text" class="form-control" name="senha1" id="senha1">
								</div>
								
								<div class="col-md-3" align="left" style="margin-top: 20px;">
								<label>Usúario 2</label>
								<input type="text" class="form-control" name="conta2" id="conta2">
								</div>
								
								<div class="col-md-3" align="left" style="margin-top: 20px;">
								<label>Senha 2</label>
								<input type="text" class="form-control" name="senha2" id="senha2">
								</div>
							
								</div>
							</div>
							<hr>

							<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-6" align="left">
										<div align="left">
											<b><p>Programas Instalado:</p></b>
										</div>
									</div>
								</div>
							</div>
							
							

							<div class="row" style="margin-top: 25px;" align="center">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="7zip" name="7zip" id="7zip"> 7Zip</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Ccleaner" name="Ccleaner" id="Ccleaner"> Ccleaner</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Mozilla Firefox" name="firefox" id="firefox"> Mozilla Firefox</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Google Chrome" name="google" id="google"> Google Chrome</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Adobe Flash Playe" name="afp" id="afp"> Adobe Flash Player</label>
									</div>
									
										<div class="col-md-2">
									</div>
									
								</div>
							</div>
							
									<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="Adobe Reader" name="reader" id="reader"> Adobe Reader</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Adobe Reader Air" name="air" id="air"> Adobe Reader Air</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Adobe Shockwave" name="shockwave" id="shockwave"> Adobe Shockwave</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="VLC Media Player" name="vlc" id="vlc"> VLC Media Player</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Classic Shell" name="shell" id="shell"> Classic Shell</label>
									</div>
									
								</div>
							</div>

		                     <div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="CD Burner XP" name="cdxp" id="cdxp"> CD Burner XP</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Kit Java" name="java" id="java"> Kit Java</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="USB Vacine Panda" name="usb" id="usb"> USB Vacine Panda</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="LibreOffice" name="libre" id="libre"> LibreOffice</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="Skype" name="skype" id="skype"> Skype</label>
									</div>
									
								</div>
							</div>
						  <hr>
						                  <div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12" align="right">
                                  
                                  <input id="idManutencao" name="idManutencao" value="${id}" type="hidden">
                                  <c:if test="${usuarioLogado.id == tecnico.id && status_fechado ==0}">
                                 <button type="submit" class="btn btn-danger">Finalizar Micro</button>
                                  </c:if>
                                  
									
								</div>
							</div>

						</form>
	                     
	                     </c:when>
	                     
	                     <c:otherwise>
	                    					<form action="" class="form-group" >
							<div class="row">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-4" align="left">
								<label>HD*</label>
								<input class="form-control" placeholder="Exemplo: 500GB" name="hd" id="hd" readonly="readonly" value="${hd }">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Memoria RAM*</label>
								<input class="form-control" placeholder="Exemplo: 2GB" name="ram" id="ram" readonly="readonly" value="${ram }">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Processador*</label>
								<input class="form-control" placeholder="Exemplo: Intel Core i7" name="processador" id="processador" readonly="readonly" value="${processador }">
								</div>
								
								</div>
							</div>
							
								<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-4" align="left">
								<label>Sistema Operacional*</label>
								<input class="form-control" placeholder="Exemplo: Linux Mint 18.2" name="so" id="so" readonly="readonly" value="${so }">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Marca*</label>
								<input class="form-control" placeholder="Exemplo: Positivo" name="marca" id="marca" readonly="readonly" value="${marca }">
								</div>
								
								<div class="col-md-4" align="left">
								<label>Modelo</label>
								<input class="form-control" placeholder="Exemplo: POS-234-SE" name="modelo" id="modelo" readonly="readonly" value="${modelo }">
								</div>
								
								</div>
							</div>
							
							<hr>

							<div class="panel with panel-info class">
								<div class="panel-body" align="center"><b>Informações do atendimento</b></div>
							</div>
							
								<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-6" align="center">
								<h4>Data de Inicio: ${dt_inicio}</h4>
								</div>
								
								<div class="col-md-6" align="">
								<h4>Data de Termino:
														<c:choose>
															<c:when test="${dt_termino != null }">${dt_termino}</c:when>
                                                            <c:otherwise>Em Andamento</c:otherwise>
														</c:choose>
													</h4>
								</div>
								
								</div>
							</div>
							<hr>
							
							<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">
								
								<div class="col-md-6" align="left">
								<label>Solução do problema*</label>
								<textarea rows="5" cols="40" style="resize: none;" class="form-control" readonly="readonly">${solucao }</textarea>
								</div>
								
								<div class="col-md-3" align="left" style="">
								<label>Usúario 1</label>
								<input type="text" class="form-control" name="conta1" id="conta1" readonly="readonly">
								</div>
								
								<div class="col-md-3" align="left">
								<label>Senha 1</label>
								<input type="text" class="form-control" name="conta1" id="conta1" readonly="readonly">
								</div>
								
								<div class="col-md-3" align="left" style="margin-top: 20px;">
								<label>Usúario 2</label>
								<input type="text" class="form-control" name="conta1" id="conta1" readonly="readonly">
								</div>
								
								<div class="col-md-3" align="left" style="margin-top: 20px;">
								<label>Senha 2</label>
								<input type="text" class="form-control" name="conta1" id="conta1" readonly="readonly">
								</div>
							
								</div>
							</div>
							<hr>

							<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-6" align="left">
										<div align="left">
											<b><p>Programas Instalado:</p></b>
										</div>
									</div>
								</div>
							</div>
							
							

							<div class="row" style="margin-top: 25px;" align="center">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="" name="7zip" id="7zip" disabled="disabled"> 7Zip</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="Ccleaner" id="Ccleaner" disabled="disabled"> Ccleaner</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="firefox" id="firefox" disabled="disabled"> Mozilla Firefox</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="google" id="google" disabled="disabled"> Google Chrome</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="afp" id="afp" disabled="disabled""> Adobe Flash Player</label>
									</div>
									
										<div class="col-md-2">
									</div>
									
								</div>
							</div>
							
									<div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="" name="reader" id="reader" disabled="disabled"> Adobe Reader</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="air" id="air" disabled="disabled"> Adobe Reader Air</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="shockwave" id="shockwave" disabled="disabled"> Adobe Shockwave</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="vlc" id="vlc" disabled="disabled"> VLC Media Player</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="shell" id="shell" disabled="disabled"> Classic Shell</label>
									</div>
									
								</div>
							</div>

		                     <div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12">

									<div class="col-md-2">
										<label><input type="checkbox" value="" name="cdxp" id="cdxp" disabled="disabled"> CD Burner XP</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="java" id="java" disabled="disabled"> Kit Java</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="usb" id="usb" disabled="disabled"> USB Vacine Panda</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="libre" id="libre" disabled="disabled"> LibreOffice</label>
									</div>
									
									<div class="col-md-2">
										<label><input type="checkbox" value="" name="skype" id="skype" disabled="disabled"> Skype</label>
									</div>
									
								</div>
							</div>
						  <hr>
						  
						                  <div class="row" style="margin-top: 25px;">
								<div class="col-sm-12 col-md-12" align="right">
                                  
                                  
                                   <c:if test="${usuarioLogado.id == tecnico.id && stFechado == 0 }">
                                 <button type="button" class="btn btn-danger">Finalizar Micro</button>
                                  </c:if>
                                  
									
								</div>
							</div>

						</form>
	                     </c:otherwise>
	                  </c:choose>

					</div>
				</div>
			</div>
		<!-- Fim panel detalhes chamado -->
	
	
	</div>
            </c:if>




<!-- Inicio modal realiza atendimento manutencao micro-->
<div class="modal fade mdAddTecnicoAtendimento" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="mdAddTecnicoAtendimento">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div align="center"><h4 class="modal-title" id="gridSystemModalLabel">ATEDUC - Realizar Atendimento (Manutenção Micro)</h4></div>
      </div>
      <div class="modal-body">

						<form action="" id="fmTecnicoResp">
							<input type="hidden" id="idManutencao"
								name="idManutencao" value="${id }">
								
							 <input type="hidden" id="idUsuario" name="idUsuario"
								value="${usuarioLogado.id }">

							<div>
								<p>Ola ${usuarioLogado.nome}, para ser o técnico responsável
									desse micro, clique em confirmar!</p>
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
<!-- FIM modal realiza atendimento manutencao micro-->


   <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"></script>
</body>
</html>
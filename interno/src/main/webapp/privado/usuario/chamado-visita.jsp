<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vizualizar - Chamado Visita</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/meucss.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pickList.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/css/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/dataTables.bootstrap.css">



</head>
<body style="background-color: #f4f4f4">

	<jsp:include page="../../template/navbar.jsp"></jsp:include>

	<div class="container" style="margin-top: 120px;">
		<div align="center">
			<h3>Informações do Chamado</h3>
			<h2>
				<a href="#">${chamado}</a>
			</h2>
		</div>
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
				<div class="panel panel-default">
					<div class="panel-heading" style="background-color: #0c8b5b;">
						<b style="color: white;">Informações da Visita</b>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="col-md-6">
									<h5>
										<b>Aberto por:</b> <a href="#"> ${usuario.nome}</a>
									</h5>
								</div>

								<div class="col-md-6">
									<h5>
										<b>Data de Cadastro:</b> ${dt_cadastro} - ${hora_cadastro}h
									</h5>
								</div>
							</div>
						</div>
						<hr>

						<div class="row" style="margin-top: 25px;" align="center">
							<div class="col-md-12 col-sm-12">

								<div class="col-md-6" align="left">
									<label><b>Problema:</b></label>
									<textarea rows="6" cols="40" class="form-control"
										style="resize: none;" disabled="disabled">${problema}</textarea>
								</div>

								<div class="col-md-6" align="left">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">Usuario</h3>
										</div>
										<div class="panel-body">

											<div id="pickList"></div>

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
									Visita Técnica</button>

								<c:choose>
									<c:when test="${userVisita ==  null}">
										<button type="button" class="btn btn-success"
											data-toggle="modal"
											data-target="#mdAddTecnicoAtendimentoVisita">Realiza
											Atendimento</button>
									</c:when>

									<c:otherwise>
										<button type="button" class="btn btn-success"
											disabled="disabled">Realiza Atendimento</button>
									</c:otherwise>
								</c:choose>


							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
		<!-- Fim terceira linha -->

		<c:choose>
			<c:when test="${userVisita != null }">
				<!-- Inicio da quarta linha -->
				<form id="fmFinalizaTablet">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="panel panel-default">
								<div class="panel-heading" align="center">
									<b>Informações do Atendimento</b>
								</div>
								<div class="panel-body">

									<div class="row">
										<div class="col-md-12 col-sm-12">

											<div class="col-md-6" align="left">
												<label><b>Data da Visita:</b> ${dt_visita}</label>
											</div>


										</div>
									</div>

									<div class="row" align="right"
										style="margin-top: 10px; margin-bottom: 10px;">
										<div class="col-md-12 col-sm-12">
											<c:choose>
												<c:when test="${statusTablet == 'a devolver'}">
													<button type="button" class="btn btn-danger">Fechar
														Chamado</button>
												</c:when>
												<c:when test="${statusTablet != 'finalizado'}">
													<button type="button" class="btn btn-danger">Fechar
														Chamado</button>
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

		</c:choose>


	</div>
	<!-- Fim container -->

	<!-- Inicio modal realiza atendimento tablet-->
	<div class="modal fade mdAddTecnicoAtendimentoVisita" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel"
		id="mdAddTecnicoAtendimentoVisita">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div align="center">
						<h4 class="modal-title" id="gridSystemModalLabel">ATEDUC -
							Realizar Atendimento (Visita Técnica)</h4>
					</div>
				</div>
				<div class="modal-body">

					<form action="" id="fmTecnicoVisita">
						<input type="hidden" id="idManutencao"
							name="numero-chamado-interno" value="${chamado}"> <input
							type="hidden" id="idUsuario" name="idUsuario"
							value="${usuarioLogado.id }">

						<div>
							<p>Ola ${usuarioLogado.nome}, clique em confirmar para
								realizar o atendimento!</p>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-danger">Confirmar</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancelar</button>
						</div>
					</form>

				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- FIM modal realiza atendimento tablet-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-cloneya.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/select2/4.0.3/dist/js/select2.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/webjars/datatables/1.10.13/js/jquery.dataTables.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/pickList.js"
		charset="utf-8"></script>

	<script type="text/javascript">
		var userAtivo = [];
		var val;
		var i = 0;
		$.ajax({
			url : '/interno/privado/usuario/userAtivoJSON.jsp',
			dataType : 'json',
			async : false,
			success : function(response) {

				for (i; i < response.length; i++) {
					userAtivo.push(response[i].nome);

				}

			}
		});

		var tam = userAtivo.length;
		var y = 0;

		for (y; y < tam; y++) {

			val = {
				1 : {
					text : userAtivo[0]
				},
				2 : {
					text : userAtivo[1]
				},
				3 : {
					text : userAtivo[2]
				},

			};

		}

		var pick = $("#pickList").pickList({
			data : val
		});

		$("#getSelected").click(function() {
			console.log(pick.getValues());
		});
	</script>
</body>
</html>
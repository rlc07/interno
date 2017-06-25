<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Imprimir - Termo de Tablet</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easy-autocomplete.themes.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/datatables/1.10.13/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css">


<style type="text/css">
body {
    margin: 0;
    padding: 0;
    background-color: #FAFAFA;
    font: 12pt "Tahoma";
}
* {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.page {
    width: 21cm;
    min-height: 29.7cm;
    padding: 2cm;
    margin: 1cm auto;
    border: 1px #D3D3D3 solid;
    border-radius: 5px;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}
.subpage {
    padding: 1cm;
    border: 5px red solid;
    height: 256mm;
    outline: 2cm #FFEAEA solid;
}

@page {
    size: A4;
    margin: 0;
}
@media print {
    .page {
        margin: 0;
        border: initial;
        border-radius: initial;
        width: initial;
        min-height: initial;
        box-shadow: initial;
        background: initial;
        page-break-after: always;
    }
}

</style>


</head>
<body >

 <jsp:include page="../../template/navbar.jsp"></jsp:include>

            <div class="page">
					<table class="table-bordered " id="tbTermo" width="100%" height="100%">
						<thead>
							<tr>
							
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<td><div align="center">
									<img
										src="${pageContext.request.contextPath}/resources/img/img-pagina/brasao-campinas.jpg"
										class="img-responsive">

									<div style="margin-top: 10px;">
										<b>Tecnologia da Educação</b></br> <b><span
											class="fa fa-phone "></span> 21160695 | 21160487</b></br> <b><samp
												class="fa fa-envelope-o "></samp>
											sme.chamados@campinas.sp.gov.br</b>
									</div>
								</div></td>
							<td><b>Número do chamado:</b></br>
								<div align="center">${chamado }</div></td>

						</tr>

						<tr>
							<td><div align="center"
									style="margin-bottom: 10px; margin-top: 10px;">
									<b>Informações da Instituição</b>
								</div></td>
							<td></td>
						</tr>

						<tr>
							<td><b>Instituição:</b>${escola}</td>
							<td><b>Naed:</b>${naed}</td>
						</tr>

						<tr>
							<td><b>Endereço:</b>${rua}</td>
							<td><b>Bairro:</b>${bairro}</td>
						</tr>

						<tr>
							<td><b>E-mail:</b> ${email}</td>
							<td><b>Telefone:</b> ${telefone}</td>
						</tr>

						<tr>
							<td><div align="center"
									style="margin-bottom: 10px; margin-top: 10px;">
									<b>Informações do Solicitante</b>
								</div></td>
							<td></td>
						</tr>

						<tr>
							<td><b>Nome:</b> ${nome}</td>
							<td><b>Telefone:</b> ${tel-solic}</td>
						</tr>

						<tr>
							<td><b>Matrícula:</b> ${matricula}</td>
							<td><b>Cargo:</b> ${cargo}</td>
						</tr>

						<tr>
							<td><div align="center"
									style="margin-bottom: 10px; margin-top: 10px;">
									<b>Informações do Tablet</b>
								</div></td>
							<td></td>
						</tr>

						<tr>
							<td><div align="center">
									<b>Patrimônio:</b> ${patrimonio }
								</div></td>
							<td></td>
						</tr>

						<tr>
							<td><div style="margin-bottom: 10px; margin-top: 10px;">
									<b>Acessorios do tablet:</b>
								</div>

								<div>
								<c:if test="${capa == true }"> <c:out value="(x) - Capa"/> </c:if></br>
								<c:if test="${caixa == true }"> <c:out value="(x) - Caixa"/> </c:if></br>
								<c:if test="${fone == true }"> <c:out value="(x) - Fone de Ouvido"/> </c:if></br>
								<c:if test="${carregador == true }"> <c:out value="(x) - Carregador"/> </c:if></br>
								<c:if test="${modem == true }"> <c:out value="(x) - Modem"/> </c:if></br>
																</div></td>
								<td></td>
						</tr>

						<tr>
							<td><div align="center"
									style="margin-bottom: 10px; margin-top: 10px;">
									<b>Descrição do problema</b>
								</div></td>
								<td></td>
						</tr>

						<tr>
							<td><div>${problema}</div></td>
							<td></td>
						</tr>

						<tr>
							<td><div align="center"
									style="margin-bottom: 10px; margin-top: 10px;">
									<b>Assinatura e carimbo</b>
								</div></td>
							<td></td>
						</tr>


						<tr>
							<td><div style="margin-bottom: 40px; margin-top: 40px;">
									<b>Solicitante:</b>____________________________________ </br>
									                     <div align="center">${nome }</div> </br><b>
										Recebido por:</b>__________________________________</br>
										 <div align="center">${usuarioLogado.nome} ${usuarioLogado.snome}</div> </br>

									<div style="margin-top: 10px;" align="center">

										${data }, Campinas-SP</div>
								</div></td>
								<td></td>
						</tr>
					</tbody>
					</table>
			</div>





	

</body>
</html>
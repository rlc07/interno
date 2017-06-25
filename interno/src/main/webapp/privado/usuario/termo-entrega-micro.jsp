<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
</head>

<style>

html{
	margin: 10px; 
	height: 297mm; 
	width: 210mm; 
	border: 3px solid black;
}

body{
	-webkit-print-color-adjust: exact;
}

#div_logo{
	border: 2px solid black;
}

#img_brasao{
	margin: 10px;
	width: 85px;
	height: 92px;
}

#h1_termo{
	display: inline-block;
    float: right;
    padding-right: 70px;
    padding-top: 20px;
}

#div_espaco_branco{
	height: 10px;
}

#div_espaco_cinza{
	border: 1px solid black;
	background-color: #cecece;
}

table{
	width: 100%;
}

td{
	border: 1px solid grey;
}

th{
	border: 1px solid grey;
	font-size: 20px;
}

#div_linhas{
	border: 1px solid black;
}
</style>

<body>


<div id="div_logo">
   
	   <img id="img_brasao" src="${pageContext.request.contextPath}/resources/img/img-icon/logo-prefeitura.png"/>
    
	   <h1 id="h1_termo">Termo de Entrega de Equipamentos</h1>
  
</div>



<div id="div_espaco_branco"></div>

<div id="div_espaco_cinza">
	<center><h2>Dados da Unidade:</h2></center>
</div>
	<table>
		<tr>
			<td><b>Unidade:</b></td><td>${escola}</td> <td><b>Chamado:</b></td><td>${chamado}</td>
		</tr>
		<tr>
			<td><b>Email:</b></td><td colspan="3">${email}</td>
		</tr>
		<tr>
			<td><b>Endereço:</b></td><td>${rua}, ${numero}</td> <td><b>Bairro:</b></td><td>${bairro}</td>
		</tr>
		<tr>
			<td><b>Telefone:</b></td><td colspan="3">${telefone}</td>
		</tr>
				
	</table>

<div id="div_espaco_cinza">
	<center><h2>Dados dos Equipamentos:</h2></center>
</div>
	<table>
		<tr>
			<th width="50%">Equipamento</th>
			<th width="50%">Patrimônio</th>
		</tr>
		<c:forEach var="pc" items="${computador}">
		
		
		<tr>
			<td>
			<c:choose>
			  <c:when test="${pc.tipo_micro == 'notebook' }">
			   Notebook
			  </c:when>
			  <c:when test="${pc.tipo_micro == 'allinone' }">
			  All In One
			  </c:when>
			  <c:when test="${pc.tipo_micro == 'desktop'}">
			  Desktop
			  </c:when>
			</c:choose>

            </td><td>
             <c:choose>
               <c:when test="${pc.patrimonio != ''}">
               ${pc.patrimonio}
               </c:when>
               <c:when test="${pc.nota_fiscal != ''}">
               ${pc.nota_fiscal}
               </c:when>
             </c:choose>
            </td>
		<tr>
		</c:forEach>
	
	
		
	</table>
	
<div id="div_espaco_cinza">
	<center><h2>Serviço Realizado:</h2></center>
</div>

<div>
	<span>É necessário fazer backup, formatar e homologar os micros.</span>
	
		
		<br><br><br><br>
	

</div>

<div id="div_espaco_cinza">
	<br>
</div>

	<table>
		<tr>
			<td width="50%"><b>Estagiário: </b>${usuarioLogado.nome}</td><td width="50%"><b>Matrícula: </b>${usuarioLogado.matricula}</td>
		</tr>
	</table>
	
<div id="div_espaco_cinza">
	<br>
</div>

	<table>
		<tr>
			<td width="50%"><b>Data da Solicitação: </b>${dt_cadastro}</td><td width="50%"><b>Data da Retirada: </b>07/04/2017</td>
		</tr>
	</table>

<div id="div_espaco_cinza">
	<center><h2>Observações:</h2></center>
</div>

	<table>
		<tr><td height="30px"></td></tr>
		<tr><td height="30px"></td></tr>
		<tr><td height="30px"></td></tr>
	</table>

<div id="div_espaco_cinza">
	<center><h2>Data, Assinatura e Carimbo do Responsável:</h2></center>
</div>

<h1>&nbsp&nbsp&nbsp&nbsp ___/___/___ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp _______________________</h1>
	
</body>
</html>
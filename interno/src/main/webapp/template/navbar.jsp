<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/webjars/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css"/>




    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
     
          <a class="navbar-brand img-responsive" href="${pageContext.request.contextPath}/main?action=index"> ATEDUC</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">

            
            <c:if test="${usuarioLogado.permissao == true }">
                 <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administração<span class="caret"></span></a>
              <ul class="dropdown-menu">
              <li class="dropdown-header">Usuário</li>
                <li><a href="${pageContext.request.contextPath}/main?action=administra-usuario&idUsuarioAdm=${usuarioLogado.id}">Usuários do Sistema</a></li>
       
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Instituição</li>
                <li><a href="${pageContext.request.contextPath}/privado/usuario/cadastrar-instituicao.jsp">Cadastrar Instituicão</a></li>
                <li><a href="${pageContext.request.contextPath}/main?action=instituicoes">Vizualizar Instituicão</a></li>
                <li class="dropdown-header">Chamado</li>
                <li><a href="#">Editar Chamado</a></li>
                <li><a href="#">Deletar Chamado</a></li>
              </ul>
            </li>
            </c:if>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          
          <c:if test="${usuarioLogado != null }"><li><a href="${pageContext.request.contextPath}/main?action=cadastrar-chamado">Cadastrar Chamado</a></li></c:if>
           <c:if test="${usuarioLogado != null }">
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manutenção <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/main?action=manutencao-tablet"><span class="fa fa-tablet "></span> Tablet</a></li>
                <li><a href="${pageContext.request.contextPath}/main?action=manutencao-computador"><span class="fa fa-desktop "></span> Computador</a></li>
                <li role="separator" class="divider"></li>
               
              </ul>
            </li>
           </c:if>
           
           <c:if test="${usuarioLogado != null }">
                    <li class="dropdown">
              
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <span class="fa fa-user-circle"></span> ${usuarioLogado.nome } <span class="caret"></span></a>
              
              <ul class="dropdown-menu">
              <div align="center">${usuarioLogado.nome}</div>
                <li role="separator" class="divider"></li>
                <li><a href="#"><samp class="fa fa-pencil-square-o "></samp>Minha Conta</a></li>
                <li><a href="#"><span class="fa fa-sign-out"></span>Sair</a></li>
              </ul>
            </li>
           </c:if>
            
     
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

      
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js" charset="utf-8"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.js" charset="utf-8"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/meuscript.js" charset="utf-8"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery-maskedinput/1.4.0/jquery.maskedinput.js" charset="utf-8"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/noty/2.2.4/jquery.noty.packaged.js" charset="utf-8"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easy-autocomplete.js" charset="utf-8"> </script> 
      <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery-validation/1.15.1/jquery.validate.js" charset="utf-8"></script>
          
       
       
      
      
  
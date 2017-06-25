<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<link href="${pageContext.request.contextPath}/resources/css/meucss.css" rel="stylesheet" type="text/css" charset="utf-8"/>
</head>
<body style="background-image: url('http://www.edestinos.com.br/blog/wp-content/uploads/2016/07/campinas.jpg'); 
 ">
<div id="fundologin">
    <div class="col-sm-12" >
    <jsp:include page="template/navbar.jsp"></jsp:include>
    </div>
    <!-- Inicio da div container -->
    <div class="container">
    
   <!-- Inicio da div linha 1 -->
		<div class="row">
		<!-- Inicio da div col 1 -->
		<div class="col-sm-12 col-md-12 " style="margin-top: 15%;">

               <div class="col-md-6" id="smsg">
                
                <div class="bemvindo">Seja bem-vindo!</div>
                <div class="mensagem"><p>ATEDUC - Sistema Interno de Tecnologia da Educação</p></div>
                
               
               </div>
				<div id="plogin">
					<!--Panel-->
					<div class="col-md-6" >
					<div class="panel panel-default"  >
						<div class="panel-heading" id="divCabecalhoLogin" align="center"><b style="color: black;"><samp class=" fa fa-desktop "></samp> Tecnologia da Educação</b></div>
						<div class="panel-body">
                        
                        <div align="center"><h4>Acesso ao sistema</h4></div>
                        <div id="divLogin" style="display: block;">
                        <!-- Inicio formulario -->
								<form action="" id="fmLogin">
								
									<div class="row">
									<div class="col-md-1"></div>
										<div class="col-sm-12 col-md-12" >
											<div class="col-md-1"></div>
										
										     <div class="col-md-10 col-sm-12 form-group" style="margin-top: 10px;">
												<input type="text" name="login" id="login"
													placeholder="Informe seu email ou matrícula"
													class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div class="col-md-1"></div>
										<div class="col-md-10 col-sm-12 form-group">
												<input type="password" name="senha" id="senha"
													placeholder="Informe sua senha"
													class="form-control">
											</div>
										
											<div align="center">
											<a href="#">Esqueceu a senha?</a>
											
											</div>
											
										</div>
									</div>
									
									<hr>
									<div align="right">
									<button type="submit" class="btn btn-success" id="btnEnter"><span class="fa fa-sign-in "></span> Entrar</button>	
									<button type="button" class="btn btn-primary" id="btnhabil" onclick="habilitaDivCadastro();"><span class="fa fa-user-o "></span> Novo Usuário</button>									
																	
									</div>
								</form>
								<!-- fim do foemulario -->
								</div>
								
								<div id="loginLoader" style="display: none;" align="center">
						<img src="${pageContext.request.contextPath}/resources/img/img-gif/loader.gif">
						</div>
                        
                        </div>
					</div>
					</div>
					<!--/.Panel-->
					
				</div>

			</div>
		<!-- Inicio da div col 1 -->
		</div>


			<div class="row" id="pNewUser" >
				<div class="col-md-12 col-sm-12">

					<div class="col-md-6"></div>

					<div class="col-md-6">
						<div class="panel panel-default">
							
							<div class="panel-body">

								<div align="center">
									<h4>Cadastrar-se</h4>
								</div>
								<hr>
                        <!-- Inicio form -->
				<form accept-charset=utf-8 method="post" id="fmNovoUser">
					<div class="modal-body">
					<div id="dfmCadusuario" style="display: block;">
						<div class="row">
							<div class="col-sm-12 com-md-12">
							
							  <div class="form-group col-md-12">
							  <label>Nome Completo*</label>
							  <input type="text" name="nome" id="nome" class="form-control" >
							  </div>
							</div>
						</div>
						
							<div class="row">
							<div class="col-sm-12 com-md-12">
							  <div class="form-group col-md-6">
							  <label>Telefone</label>
							  <input type="text" name="fone" id="fone" class="form-control" >
							  </div>
							  
							  <div class="form-group col-md-6">
							  <label>Email*</label>
							  <input type="text" name="email" id="email" class="form-control" >
							  </div>
							  
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-12 com-md-12">
							  <div class="form-group col-md-6">
							  <label>Matrícula</label>
							  <input type="text" name="matricula" id="matricula" class="form-control">
							  </div>
							  
							  <div class="form-group col-md-6">
							  <label>Senha*</label>
							  <input type="password" name="senha" id="senha" class="form-control" >
							  </div>
							  
							</div>
						</div>
						</div>
						
						<div id="cadusuarioLoader" style="display: none;" align="center">
						<img src="${pageContext.request.contextPath}/resources/img/img-gif/loader.gif">
						</div>
					</div>
				<div class="modal-footer">
				
					<button type="button" class="btn btn-default" onclick="desabilitaDiv();">Cancelar</button>
					<button type="submit" class="btn btn-primary">Cadastrar</button>
				</div>
				</form>
				<!-- fim foem -->
								
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
    <!-- Fim da div container -->
    


     </div>
              <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootbox/4.4.0/bootbox.js"></script>
     
     <script type="text/javascript">
     $('#smsg').delay(1000).fadeIn(500);
     $('#plogin').delay(2000).fadeIn(500);
     </script>
</body>
</html>
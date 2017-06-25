<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ATEDUC - Inicio</title>
  

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meucss.css">
  
    
    
  
 
</head>
<body>
 <jsp:include page="../../template/navbar.jsp"></jsp:include>
 
 <div class="container" style="margin-top: 120px;">

		<!-- INICIO PANEL QTD CHAMADO -->
		<div class="row">
			<div class="col-sm-12 col-md-12">

				<!-- Panel chamados aberto -->
				<div class="col-md-6 col-lg-3">
					<div class="panel" style="background-color: #cc0000">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-folder-open  fa-5x" style="color:white;"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class=""><h1 style="color:white;">${cAberto }</h1></div>
									<div><p style="color:white;">Chamados Aberto</p></div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left"><p style="color:red">ver chamados</p></span> <span
									class="pull-right" style="color:red"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<!-- fim Panel chamados aberto -->
								<div class="col-md-1"></div>
				
				<!-- Panel chamados em atendimento -->
				<div class="col-md-6 col-lg-3">
					<div class=" panel" style="background-color: #ff8040">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-phone  fa-5x" style="color:white;"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class=""><h1 style="color:white;">${cAtendimento }</h1></div>
									<div><p style="color:white;">Em Atendimento</p></div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left"><p style="color:red">ver chamados</p></span> <span
									class="pull-right" style="color:red"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<!-- fim Panel chamados em atendimento -->
				<div class="col-md-1"></div>
					<!-- Panel chamados fechados -->
				<div class="col-md-6 col-lg-3">
					<div class=" panel" style="background-color: #008040">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-lock  fa-5x" style="color:white;"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class=""><h1 style="color:white;">${cFechado}</h1></div>
									<div><p style="color: white;">Chamados Fechado</p></div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left"><p style="color:#008040">ver chamados</p></span> <span
									class="pull-right" style="color:#008040"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<!-- fim Panel chamados fechados -->
			</div>
		</div>
		<!-- FIM PANEL QTD CHAMADO -->
</div>
<hr>

	<div class="">


		<!-- Inicio panel e carols.. chamados aberto -->
		<div class="row">
			<div>
			

				<div class="container">
				<div class="">
					<h3>Chamados Aberto</h3>
				</div>
					<div class="col-sm-12 col-md-12">
					<hr>
					        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">

									
										<c:forEach items="${abertoList }" var="cham">
										
                              <div class="col-sm-4">
                              	<div class="panel panel-default">
											<div class="panel-body">${cham.instituicao.nome }</div>
											<div class="panel-footer">
											      <div class="col-item">
                                <div class="photo">
                                </div>               
                            
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                <a href="#">${cham.num_chamado_interno }</a></h5>
                                            <h5 class="price-text-color">
                                                ${cham.dt_cadastro}</h5>
                                        </div>                                   
                                    </div>   
                                    
                                       <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Problema</h5>
                                            <h5 class="price-text-color">
                                                ${cham.desc_problema}</h5>
                                        </div>                                   
                                    </div>                           
                                </div>  
                             </div>
											</div>
										</div>
                               </div>
                        </c:forEach>
                
                 
                    </div>
                </div>
             
                
                
                
            </div>
        </div>
        
					</div>

				</div>

			</div>
		</div>
		<!-- Fim panel e carols.. chamados aberto -->

	</div>

	</div>

</body>
</html>
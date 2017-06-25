<!DOCTYPE html>
<head>
<title>Ops - Erro na aplica��o</title>
<meta charset="UTF-8">
<style>
body{
    margin: 0;
    padding: 0;
    background: #e7ecf0;
    font-family: Arial, Helvetica, sans-serif;
}
*{
    margin: 0;
    padding: 0;
}
p{
    font-size: 14px;
    color: #373737;
    font-family: Arial, Helvetica, sans-serif;
    line-height: 18px;
}
p a{
    color: #D71920;
    font-size: 14px;
    text-decoration: none;
}
a{
    outline: none;
}
.f-left{
    float:left;
}
.f-right{
    float:right;
}
.clear{
    clear: both;
    overflow: hidden;
}
#block_error{
    width: 844px;
    height: 366px;
    border: 1px solid #cccccc;
    margin: 89px auto 0;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    background: #fff ;
}
#block_error div{
    padding: 102px 43px 0 244px;
}
#block_error div h2{
    color: #D71920;
    font-size: 24px;
    display: block;
    padding: 0 0 14px 0;
    border-bottom: 1px solid #cccccc;
    margin-bottom: 12px;
    font-weight: normal;
}
</style>
<title>Ops - Erro na aplic�o</title>
</head>
<body marginwidth="0" marginheight="0">
    <div id="block_error">
        <div>
         <h2>Erro 404 - &nbspOps Aconteceu um erro!</h2>
        
        <p>
      - Parece que alguma coisa deu errado ou a p�gina n�o existe mais.<br /><br />
	  - Este site est� temporariamente impossibilitado de atender seu pedido, uma vez que excedeu o limite de recursos. Por favor, volte em breve.
        </p>
        
        <br />
        <p>Ir para <a href="${pageContext.request.contextPath}/login.jsp">p�gina incial.</a> </p>
        </div>
    </div>
</body>

</html>
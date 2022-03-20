<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body align="center">
        <h2>Bem-Vindo!</h2>
        <form action="login.jsp">
            <br/>Usuário:
            <input type="text" name="usuario" value="" />
            <br/><br/>Senha:
            <input type="password" name="senha" value="" />
            <br/><br/><input type="submit" value="Entrar" />
        </form>        
    </body>
</html>

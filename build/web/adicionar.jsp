<%@page import= "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            
            try{
                Class.forName("org.postgresql.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?" +
                                   "user=postgres&password=postgres");
                
                Statement st = conn.createStatement();
                
                st.execute("delete from usuario where id="+id+);
                
                response.sendRedirect("usuario.jsp");
                
            }catch(Exception e){
                out.write("<br>Erro ao excluir!");
                e.printStackTrace();
            }
        %>
        
        <form action="" onclick=<%=adicionar() %>>
            <br/>Usuário:
            <input type="text" name="usuario" value="" />
            <br/><br/>Senha:
            <input type="password" name="senha" value="" />
            <br/><br/><input type="submit" value="Cadastrar" />
            <br/><br/><a href="usuario.jsp">Voltar</a>
        </form>
    </body>
</html>

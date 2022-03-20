<%@page import= "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            
            try{
                Class.forName("org.postgresql.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?" +
                                   "user=postgres&password=postgres");
                
                Statement st = conn.createStatement();
                
                ResultSet rs = st.executeQuery("Select nome, senha "
                         + "from usuario "
                         + "where nome = '" + usuario + "' and "
                         + "senha = '" + senha+"';");
                
                if (rs.next()) {
                    response.sendRedirect("usuario.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
                
            } catch(Exception e){
                out.write("<br>Erro!");
                e.printStackTrace();
            }
            
        %>
        
    </body>
</html>

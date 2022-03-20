<%@page import= "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuários</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body align="center">
        <table align="center">    
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th>Nome</th>
            </tr>
        
        <%
            try{
                Class.forName("org.postgresql.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?" +
                                   "user=postgres&password=postgres");
                
                Statement st = conn.createStatement();
                
                ResultSet rs = st.executeQuery("Select id, nome, senha from usuario ");
                
                while (rs.next()) {
                    String id = rs.getString("id");
                    String nome = rs.getString("nome");
                    %>
                        <tr>
                            <td><a href="adicionar.jsp"><img src="src/add.png" alt=""/></a></td>
                            <td><a href="editar.jsp"><img src="src/edit.png" alt=""/></a></td>                            
                            <td><a href="excluir.jsp" ><img src="src/delete.png" alt=""/></a></td>
                            <td value=<%=id %>><%=nome %></td>
                        </tr>
                    <%
                }
                
            } catch(Exception e){
                out.write("<br>Erro!");
                e.printStackTrace();
            }
            
        %>
        </table>
    </body>
</html>

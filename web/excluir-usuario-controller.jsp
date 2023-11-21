<%@page import="java.sql.*"%>
<%@page import="config.SistemasUsuariosDb"%>
<%
    String idUsuario = request.getParameter("idUsuario");
    
    try{
        Connection connection = SistemasUsuariosDb.getConnection();
        Statement statement = connection.createStatement();
        
        statement.execute("DELETE FROM usuario WHERE id = '" + idUsuario + "'" );
        response.sendRedirect("listar-usuarios.jsp");
    }catch(Exception ex){
        ex.printStackTrace();
    }
%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page import="service.UsuarioService"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">        <title>Usuários</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/png" sizes="16x16"  href="assets/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="theme-color" content="#ffffff">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="listar-usuarios.jsp">Lista de Usuários</a>

                <div>
                    <span>
                        <%
                            String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                            if (nomeUsuario == null) {
                                response.sendRedirect("index.jsp");
                            } else {
                                out.println("Bem-vindo " + nomeUsuario);
                            }
                        %>
                    </span>
                    <a href="logout.jsp"><i class="bi bi-box-arrow-left"></i></a>
                </div>
            </div>
        </nav>
        <div class="container">
            <div style="width: 100%" class="d-flex justify-content-between mt-2">
                <a href="inserir-usuario.jsp" class="btn btn-outline-success">Novo Usuário</a>

                <form action="listar-usuarios-controller.jsp" class="d-flex" method="post">
                    <input name="filtro-usuario" class="form-control me-2" placeholder="Nome ou Email">
                    <button class="btn btn-success" type="submit">Buscar</button>
                </form>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NOME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">NÍVEL</th>
                        <th scope="col">AÇÕES</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Usuario> usuarios = null;
                        boolean primeiraBusca;

                        primeiraBusca = request.getAttribute("usuarios") == null;

                        UsuarioService usuarioService = new UsuarioService();

                        if (primeiraBusca) {
                            usuarios = usuarioService.listarUsuarios("");
                        } else {
                            usuarios = (List<Usuario>) request.getAttribute("usuarios");
                        }

                        for (Usuario usuario : usuarios) {
                    %>
                    <tr>
                        <td><% out.println(usuario.getId()); %></td>
                        <td><% out.println(usuario.getNome()); %></td>
                        <td><% out.println(usuario.getEmail()); %></td>
                        <td><% out.println(usuario.getNivel()); %></td>
                        <td class="d-flex">
                            <a href="editar-usuario.jsp?id=<% out.println(usuario.getId()); %>"><i class="bi bi-pencil-square text-primary"></i></a>
                            <form action="excluir-usuario-controller.jsp" class="ms-2 d-inline-flex" method="post">
                                <input name="idUsuario" hidden value="<%out.println(usuario.getId());%>"/>
                                <button class="btn p-0" type="submit"><i class="bi bi-trash text-danger"></i></button>
                            </form>
                        </td>
                    </tr>
                    <%}
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>
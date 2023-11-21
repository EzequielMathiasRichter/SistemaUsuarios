<%-- 
    Document   : index
    Created on : 24 de out. de 2023, 20:05:49
    Author     : EzequielRichter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.SistemasUsuariosDb"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="assets/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/png" sizes="16x16"  href="assets/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="theme-color" content="#ffffff">
    </head>
    <body>

        <div class="container px-5 my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-0 rounded-3 shadow-lg">
                        <div class="card-body p-4">
                            <div class="text-center">
                                <div class="h1 fw-light">Entrar</div>
                            </div>

                            <form method="post">

                                <!-- Name Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="email" name="email" type="text" placeholder="Email"/>
                                    <label for="email">Email</label>
                                </div>

                                <!-- Email Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="senha"name="senha" type="password" placeholder="Senha"/>
                                    <label for="senha">Senha</label>
                                </div>

                                <!-- Submit button -->
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Entrar</button>
                                </div>
                                <h1 align="center">
                                    <%
                                        String email = request.getParameter("email");
                                        String senha = request.getParameter("senha");

                                        if (email != null && senha != null) {

                                            

                                            Connection connection = SistemasUsuariosDb.getConnection();
                                            Statement statement = connection.createStatement();
                                            ResultSet resultSet = statement.executeQuery("SELECT * FROM usuario WHERE email = '" + email + "' AND senha = '" + senha + "'");

                                            String nomeUsuario = "";
                                            boolean possuiConta = false;
                                            while (resultSet.next()) {
                                                nomeUsuario = resultSet.getString("nome");
                                                possuiConta = true;
                                            }

                                            if (possuiConta) {
                                                session.setAttribute("nomeUsuario", nomeUsuario);
                                                response.sendRedirect("listar-usuarios.jsp");
                                            } else {
                                                out.println("Credenciais incorretas");
                                            }
                                        }
                                    %>
                                </h1>
                            </form>
                            <!-- End of contact form -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
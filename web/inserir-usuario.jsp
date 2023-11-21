<%-- 
    Document   : inserir-usuario
    Created on : 09/11/2023, 20:42:28
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Usuário</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">        <title>Usuários</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/png" sizes="16x16"  href="assets/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="assets/style.css"/>
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

        <div class="container px-5 my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-0 rounded-3 shadow-lg">
                        <div class="card-body p-4">
                            <div class="text-center">
                                <div class="h1 fw-light">Cadastrar</div>
                            </div>

                            <form action="inserir-usuario-controller.jsp" method="post">

                                <!-- name Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="nome"name="nome" type="text" placeholder="Nome"/>
                                    <label for="nome">Nome</label>
                                </div>

                                <!-- nível Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="nivel"name="nivel" type="text" placeholder="Nível"/>
                                    <label for="nivel">Nível</label>
                                </div>

                                <!-- email Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="email" name="email" type="text" placeholder="Email"/>
                                    <label for="email">Email</label>
                                </div>

                                <!-- Senha Input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="senha"name="senha" type="password" placeholder="Senha"/>
                                    <label for="senha">Senha</label>
                                </div>

                                <!-- Submit button -->
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Cadastrar</button>
                                </div>
                            </form>
                            <!-- End of contact form -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

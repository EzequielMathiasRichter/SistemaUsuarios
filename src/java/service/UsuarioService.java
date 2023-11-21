/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import java.sql.*;
import config.SistemasUsuariosDb;

/**
 *
 * @author Aluno
 */
public class UsuarioService {

    public List<Usuario> listarUsuarios(String filtro) {
        List<Usuario> usuarios = new ArrayList();

        try {
            Connection connection = SistemasUsuariosDb.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = null;

            if (filtro == null || filtro == "") {
                resultSet = statement.executeQuery("SELECT * from usuario");
            } else {
                resultSet = statement.executeQuery("SELECT * FROM usuario WHERE nome LIKE '%" + filtro + "%' OR email LIKE '%" + filtro + "%'");
            }
            while (resultSet.next()) {
                System.out.println("OI");
                Usuario usuario = new Usuario();
                usuario.setId(Integer.parseInt(resultSet.getString("id")));
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setNivel(resultSet.getString("nivel"));

                usuarios.add(usuario);
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscar os usuários");
            ex.printStackTrace();
        }
        return usuarios;
    }

    public Usuario detalharUsuario(Integer idUsuario) {
        Usuario usuario = null;
        try {
            Connection connection = SistemasUsuariosDb.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM usuario WHERE id = '" + idUsuario + "'");
            while (resultSet.next()){
                usuario = new Usuario(); 
                usuario.setId(Integer.parseInt(resultSet.getString("id")));
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setNivel(resultSet.getString("nivel"));
                usuario.setSenha(resultSet.getString("senha"));
            }
        } catch (Exception ex) {
            System.out.println("Erro ao detalhar usuario");
            ex.printStackTrace();
        }
        return usuario;
    }
}

package controlador;

import dao.UsuarioDAO;
import modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Usuario user = (Usuario) sesion.getAttribute("usuario");

        if (user == null) {
            response.sendRedirect("admin/login.jsp?error=Debes iniciar sesión");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<Usuario> clientes = dao.listarPorRol("CLIENTE");
                request.setAttribute("lista", clientes);
                request.getRequestDispatcher("admin/listarClientes.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("admin/agregarCliente.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Usuario c = dao.obtenerPorId(idEdit);
                request.setAttribute("cliente", c);
                request.getRequestDispatcher("admin/editarCliente.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                response.sendRedirect("ClienteServlet?action=listar");
                break;

            default:
                response.sendRedirect("ClienteServlet?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("action"); 

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("insertar".equals(op)) {
            Usuario u = new Usuario(0, nombre, email, password, "CLIENTE");
            dao.insertar(u);

        } else if ("actualizar".equals(op)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario u = new Usuario(id, nombre, email, password, "CLIENTE");
            dao.actualizar(u);
        }

        response.sendRedirect("ClienteServlet?action=listar");
    }
}
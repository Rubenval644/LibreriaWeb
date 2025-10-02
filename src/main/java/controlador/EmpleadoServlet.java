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

@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Usuario user = (Usuario) sesion.getAttribute("usuario");

        
        if (user == null || !"ADMIN".equals(user.getRol())) {
            response.sendRedirect("admin/panel.jsp?error=No tienes permisos");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<Usuario> empleados = dao.listarPorRol("EMPLEADO");
                request.setAttribute("lista", empleados);
                request.getRequestDispatcher("admin/listarEmpleados.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("admin/registroEmpleado.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Usuario e = dao.obtenerPorId(idEdit);
                request.setAttribute("empleado", e);
                request.getRequestDispatcher("admin/editarEmpleado.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                response.sendRedirect("EmpleadoServlet?action=listar");
                break;

            default:
                response.sendRedirect("EmpleadoServlet?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String op = request.getParameter("accion"); 

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("insertar".equals(op)) {
            Usuario u = new Usuario(0, nombre, email, password, "EMPLEADO");
            dao.insertar(u);

        } else if ("actualizar".equals(op)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario u = new Usuario(id, nombre, email, password, "EMPLEADO");
            dao.actualizar(u);
        }

        response.sendRedirect("EmpleadoServlet?action=listar");
    }
}
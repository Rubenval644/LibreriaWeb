package controlador;

import dao.ClienteDAO;
import modelo.Cliente;
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

    private ClienteDAO dao = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                List<Cliente> clientes = dao.listar();
                request.setAttribute("lista", clientes);
                request.getRequestDispatcher("admin/listarClientes.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("admin/registroCliente.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Cliente c = dao.obtenerPorId(idEdit);
                request.setAttribute("cliente", c);
                request.getRequestDispatcher("admin/editarCliente.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                response.sendRedirect("ClienteServlet?action=listar");
                break;

            case "logout": // 🔹 cerrar sesión del cliente
                HttpSession sesion = request.getSession(false);
                if (sesion != null) {
                    sesion.invalidate();
                }
                response.sendRedirect("tienda.jsp");
                break;

            default:
                response.sendRedirect("ClienteServlet?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("insertar".equals(accion)) {
            // Registrar cliente
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String sexo = request.getParameter("sexo");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Cliente c = new Cliente(0, nombre, apellido, sexo, email, password);
            dao.insertar(c);

            String origen = request.getParameter("origen");
            if ("web".equals(origen)) {
                response.sendRedirect("tienda.jsp?registro=ok");
            } else {
                response.sendRedirect("ClienteServlet?action=listar");
            }

        } else if ("actualizar".equals(accion)) {
            // Actualizar cliente
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String sexo = request.getParameter("sexo");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Cliente c = new Cliente(id, nombre, apellido, sexo, email, password);
            dao.actualizar(c);
            response.sendRedirect("ClienteServlet?action=listar");

        } else if ("login".equals(accion)) {
            //Login de cliente
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Cliente cliente = dao.validarLogin(email, password);
            if (cliente != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("cliente", cliente);
                response.sendRedirect("tienda.jsp");
            } else {
                request.setAttribute("error", "Email o contraseña incorrectos");
                request.getRequestDispatcher("loginCliente.jsp").forward(request, response);
            }
        }
    }
}
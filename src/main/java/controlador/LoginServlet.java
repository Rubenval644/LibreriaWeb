package controlador;
import dao.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import modelo.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario u = dao.login(email, password);

        if (u != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", u);

            switch (u.getRol()) {
                case "ADMIN":
                case "EMPLEADO":
                    response.sendRedirect("admin/ProductoServlet?action=listar");
                    break;
                case "CLIENTE":
                    response.sendRedirect("tienda/index.jsp");
                    break;
            }
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

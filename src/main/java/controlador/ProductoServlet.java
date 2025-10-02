package controlador;

import dao.ProductoDAO;
import modelo.Producto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    private ProductoDAO dao = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<Producto> lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("admin/listar.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("admin/agregar.jsp").forward(request, response);
                break;

            case "editar":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Producto p = dao.obtenerPorId(idEdit);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("admin/editar.jsp").forward(request, response);
                break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idDel);
                response.sendRedirect("ProductoServlet?action=listar");
                break;

            default:
                response.sendRedirect("ProductoServlet?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("action"); 

        if ("insertar".equals(op)) {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String imagen = request.getParameter("imagen");

            Producto p = new Producto(0, nombre, descripcion, precio, stock, imagen);
            dao.insertar(p);

        } else if ("actualizar".equals(op)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String imagen = request.getParameter("imagen");

            Producto p = new Producto(id, nombre, descripcion, precio, stock, imagen);
            dao.actualizar(p);
        }

        response.sendRedirect("ProductoServlet?action=listar");
    }
}
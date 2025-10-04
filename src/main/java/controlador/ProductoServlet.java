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
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                // Listar todos los productos en el panel admin
                List<Producto> lista = dao.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("admin/listar.jsp").forward(request, response);
                break;

            case "filtrar":
                // Filtrar productos por categoría
                String categoria = request.getParameter("categoria");
                List<Producto> listaFiltrada;

                if (categoria == null || categoria.isEmpty()) {
                    listaFiltrada = dao.listar(); // Si no hay categoría, mostrar todos
                } else {
                    listaFiltrada = dao.listarPorCategoria(categoria);
                }

                request.setAttribute("lista", listaFiltrada);
                request.getRequestDispatcher("admin/listar.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("admin/agregar.jsp").forward(request, response);
                break;

            case "editar":
                try {
                    int idEdit = Integer.parseInt(request.getParameter("id"));
                    Producto p = dao.obtenerPorId(idEdit);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("admin/editar.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendRedirect("ProductoServlet?action=listar");
                }
                break;

            case "eliminar":
                try {
                    int idDel = Integer.parseInt(request.getParameter("id"));
                    dao.eliminar(idDel);
                } catch (NumberFormatException e) {
                }
                response.sendRedirect("ProductoServlet?action=listar");
                break;

            case "inicio":
                // Mostrar solo 5 productos destacados en tienda.jsp
                List<Producto> listaInicio = dao.listarLimit(8);
                request.setAttribute("lista", listaInicio);
                request.getRequestDispatcher("tienda.jsp").forward(request, response);
                break;

            case "todos":
                // Mostrar todos los productos en productos.jsp
                List<Producto> todos = dao.listar();
                request.setAttribute("lista", todos);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
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
            // Insertar nuevo producto
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String imagen = request.getParameter("imagen");
            String categoria = request.getParameter("categoria");

            Producto p = new Producto(0, nombre, descripcion, precio, stock, imagen, categoria);
            dao.insertar(p);

        } else if ("actualizar".equals(op)) {
            // Actualizar producto existente
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String imagen = request.getParameter("imagen");
                String categoria = request.getParameter("categoria");

                Producto p = new Producto(id, nombre, descripcion, precio, stock, imagen, categoria);
                dao.actualizar(p);
            } catch (NumberFormatException e) {
            }
        }

        response.sendRedirect("ProductoServlet?action=listar");
    }
}

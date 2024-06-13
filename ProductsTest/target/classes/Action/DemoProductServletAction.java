package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.IProductService;
import model.ProductService;
import unit.HibernateUtil;

@WebServlet("/DemoProductServletAction")
public class DemoProductServletAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService productService;

    @Override
    public void init() {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        productService = new ProductService(session);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processAction(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processAction(request, response);
    }

    private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            switch (action) {
                case "insert":
                    insertProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "search":
                    searchProduct(request, response);
                    break;
                case "like":
                    likeProduct(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            throw new ServletException(e);
        } finally {
            out.close();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProduct = productService.findAll();
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("/jsp/ProductHome.jsp").forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String stockQuantity = request.getParameter("stockQuantity");

        Product newProduct = new Product(productName, price, description, stockQuantity);
        productService.insert(newProduct);
        response.sendRedirect("DemoProductServletAction?action=list");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String productidParam = request.getParameter("productid");
        int productid = Integer.parseInt(productidParam);
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String stockQuantity = request.getParameter("stockQuantity");

        Product product = productService.findById(productid);
        if (product != null) {
            product.setProductName(productName);
            product.setPrice(price);
            product.setDescription(description);
            product.setStockQuantity(stockQuantity);
            productService.update(product);
        }

        response.sendRedirect("DemoProductServletAction?action=list");
    }

    
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productid = Integer.parseInt(request.getParameter("productid"));
        productService.deleteById(productid);
            response.sendRedirect("DemoProductServletAction?action=list");       
    }


    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productid = Integer.parseInt(request.getParameter("productid"));
        Product product = productService.findById(productid);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/jsp/ProductSearch.jsp").forward(request, response);
    }

    private void likeProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productName = request.getParameter("productName");
            List<Product> listProduct = productService.getLikeProducts(productName);
            request.setAttribute("listProduct", listProduct);

            request.getRequestDispatcher("/jsp/ProductHome.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/jsp/ProductError.jsp").forward(request, response);
        }
    }
}

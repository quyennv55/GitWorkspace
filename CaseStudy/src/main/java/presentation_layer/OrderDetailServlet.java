package presentation_layer;

import business_layer.models.ProductModel;
import business_layer.services.ProductServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderDetailServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductServices productServices = new ProductServices();
        String orderNumber = request.getParameter("orderNumber");
        String createDate = request.getParameter("date");
        String status = request.getParameter("status");
        List<ProductModel> productModelList = productServices.findProductsOrder(Integer.parseInt(orderNumber));
        request.setAttribute("productList", productModelList);
        request.setAttribute("numbers", orderNumber);
        request.setAttribute("date",createDate);
        request.setAttribute("status", status);
        RequestDispatcher rd = request.getRequestDispatcher("orderdetail.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

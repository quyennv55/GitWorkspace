package presentation_layer;

import business_layer.models.ContactModel;
import business_layer.models.CustomerModel;
import business_layer.models.OrderLineModel;
import business_layer.models.ProductModel;
import business_layer.services.ContactServices;
import business_layer.services.CustomerServices;
import business_layer.services.OrderServices;
import business_layer.services.ProductServices;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CustomerDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerServices customerServices = new CustomerServices();
        ContactServices contactServices = new ContactServices();
        ProductServices productServices = new ProductServices();
        OrderServices orderServices = new OrderServices();
        // Get customer id when user click customer
        String customerId = request.getParameter("imageId");
        Integer cusId = Integer.parseInt(customerId); // Convert customer id from string type to integer
        // Find customer by id
        CustomerModel customerModel = customerServices.findCustomerById(cusId);
        // Find main contact of each customer
        ContactModel contactModel = contactServices.findMainContact(cusId);
        // Find all equipment of each customer
        List<ProductModel> productModels = productServices.findAllEquipment(cusId);
        List<OrderLineModel> orderLineModels = orderServices.OrderLinesByCustomer(cusId);
        session.setAttribute("customerModel", customerModel);
        session.setAttribute("contactModel", contactModel);
        session.setAttribute("listEquipment", productModels);
        session.setAttribute("orderLines", orderLineModels);
        response.sendRedirect("customerdetail.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);    //To change body of overridden methods use File | Settings | File Templates.
    }
}

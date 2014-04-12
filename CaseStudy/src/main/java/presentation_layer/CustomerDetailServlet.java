package presentation_layer;

import business_layer.models.ContactModel;
import business_layer.models.CustomerModel;
import business_layer.services.ContactServices;
import business_layer.services.CustomerServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomerDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerServices customerServices = new CustomerServices();
        ContactServices contactServices = new ContactServices();
        String customerId = request.getParameter("imageId");
        Integer cusId = Integer.parseInt(customerId); // Convert customer id from string type to integer
        CustomerModel customerModel = customerServices.findCustomerById(cusId);
        ContactModel contactModel = contactServices.findMainContact(cusId);
        request.setAttribute("customerModel", customerModel);
        request.setAttribute("contactModel", contactModel);
        RequestDispatcher rd = request.getRequestDispatcher("customerdetail.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);    //To change body of overridden methods use File | Settings | File Templates.
    }
}

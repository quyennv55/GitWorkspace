package presentation_layer;

import business_layer.models.CustomerLineModel;
import business_layer.services.CustomerServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class CustomerLineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerServices customerServices = new CustomerServices();
        List<CustomerLineModel> customerLineModels = customerServices.finfAllCustomerLine();
        if(customerLineModels != null){
            session.setAttribute("customerlist", customerLineModels);
        }
        RequestDispatcher rd = request.getRequestDispatcher("customerlist.jsp");
        rd.forward(request, response);
    }
}

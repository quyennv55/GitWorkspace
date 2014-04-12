package presentation_layer;

import business_layer.models.ContactModel;
import business_layer.models.CustomerModel;
import business_layer.services.ContactServices;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddContactServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerModel customerModel = (CustomerModel) session.getAttribute("customerModel");
        ContactServices contactServices = new ContactServices();
        String contactName = request.getParameter("contact");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String jobTitle = request.getParameter("jobtitle");
        String mainContact = request.getParameter("maincontact");
        System.out.println("Test:"+ mainContact);
        ContactModel contactModel = new ContactModel();
        contactModel.setCustomerId(customerModel.getCustomerId());
        contactModel.setContactName(contactName);
        contactModel.setJobTitle(jobTitle);
        contactModel.setEmail(email);
        contactModel.setTel(tel);
        // If main contact check box is not checked
        if(mainContact == null){
            contactModel.setMainContact(false);
        }else
            if (mainContact.equals("1") && mainContact != null){
                contactModel.setMainContact(true);
                contactServices.changeMainContact(customerModel.getCustomerId());
                session.setAttribute("contactModel", contactModel);
            }
        contactServices.addContact(contactModel);
        response.sendRedirect("addcontact.jsp");
    }
}

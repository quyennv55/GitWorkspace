package presentation_layer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddContactServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactName = request.getParameter("contact");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String jobTitle = request.getParameter("jobtitle");
        String mainContact = request.getParameter("maincontact");
    }
}

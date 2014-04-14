<%@ page import="business_layer.models.CustomerLineModel" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: cfdcom3g
  Date: 4/11/14
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
    <div>
        <h1>Customers</h1>
        <hr>
    </div>
    <div>
        <form action="CustomerLineServlet" method="get">
            <input type="input" name="searchInput">
            <input type="submit" name="search" value="search">
        </form>
    </div>
    <div>
        <form name="customer-list-form" method="post" action="CustomerDetailServlet">
        <%
            List<CustomerLineModel> searchResults = (List<CustomerLineModel>) request.getAttribute("searchResult");
            if(searchResults != null){
            %>
        <table name="listsearch" width="100%">
             <tr>
                <td></td>
                <td weigh="20%">
                    Customer Name
                </td>
                <td weigh="20%">
                    Contact Name
                </td>
                <td weigh="20%">
                    Email
                </td>
                <td weigh="20%">
                    Total Equipment
                </td>
                <td weigh="20%">
                   Last Order
                </td>
                </tr>
            <%
                for(CustomerLineModel customerLineModel :searchResults){
            %>
                <tr>
                    <td><input type="image" name="imageId" value="<%= customerLineModel.getCustomerId()%>" src="image/default.jpg" alt="Submit"></td>
                    <td><%=customerLineModel.getCustomerName()%></td><td><%=customerLineModel.getContactName()%></td><td><%=customerLineModel.getEmail()%></td>
                    <td><%=customerLineModel.getTotalAmount()%></td><td><%=customerLineModel.getLastOrder()%></td>
                </tr>
            <%
                }

            %>
        </table><br>
        <hr>
            <%
            }
            List<CustomerLineModel> customerLineModelList = (List<CustomerLineModel>) session.getAttribute("customerlist");
            int numberOfRow = 5;
            String current_page = request.getParameter("pages");
        %>
        <table name="listcustomer" width="100%">
            <tr>
                <td></td>
                <td weigh="20%">
                    Customer Name
                </td>
                <td weigh="20%">
                    Contact Name
                </td>
                <td weigh="20%">
                    Email
                </td>
                <td weigh="20%">
                    Total Equipment
                </td>
                <td weigh="20%">
                    Last Order
                </td>
            </tr>
            <%
                int start;
                int finish;
                if(current_page != null){
                    Integer current = Integer.parseInt(current_page);
                    start = current -1;
                }else {
                    start = 0;
                }
                if((start+1)* numberOfRow > customerLineModelList.size())
                    finish = customerLineModelList.size();
                else
                     finish = (start +1)*numberOfRow;
                for(int i= start * numberOfRow; i< finish ; i++){
                %>
                <tr>
                    <td><input type="image" name="imageId" value="<%= customerLineModelList.get(i).getCustomerId()%>" src="image/default.jpg" alt="Submit"></td>
                    <td><%=customerLineModelList.get(i).getCustomerName()%></td>
                    <td><%=customerLineModelList.get(i).getContactName()%></td>
                    <td><%=customerLineModelList.get(i).getEmail()%></td>
                    <td><%=customerLineModelList.get(i).getTotalAmount()%></td>
                    <td><%=customerLineModelList.get(i).getLastOrder()%></td>
                </tr>
                <%
                }
            %>
        </form>
        </table>
    </div>
    <div>
        <%
            int pageNumbers;
            if(customerLineModelList.size()%numberOfRow ==0)
                pageNumbers = customerLineModelList.size()/numberOfRow;
            else
                pageNumbers = customerLineModelList.size()/numberOfRow +1;
            if(current_page != null){
                Integer current = Integer.parseInt(current_page);
                if(current >1){
                    %>
                    <a href="/CustomerLineServlet?pages=<%=current-1%>">Previous</a>
                    <%
                }
            }
            for(int p = 1; p <= pageNumbers; p ++){
                %>
                    <a href="/CustomerLineServlet?pages=<%=p%>"><%=p%></a>
                <%
            }
            if(current_page != null){
                Integer current = Integer.parseInt(current_page);
                if(current != pageNumbers){
                %>
                    <a href="/CustomerLineServlet?pages=<%=current+1%>">Next</a>
                <%
                }
            }
        %>
    </div>
</body>
</html>
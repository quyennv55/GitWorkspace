<%@ page import="business_layer.models.CustomerModel" %>
<%@ page import="business_layer.models.ContactModel" %>
<%@ page import="business_layer.models.ProductModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    List<ProductModel> productModels = (List<ProductModel>) request.getAttribute("productList");
    CustomerModel customerModel = (CustomerModel) session.getAttribute("customerModel");
    ContactModel contactModel = (ContactModel) session.getAttribute("contactModel");
%>
<div>
    <h1>ORDER #<%=request.getAttribute("numbers")%></h1>
    <%=request.getAttribute("date")%>
    <hr>
</div>
<div>
    <table>
        <tr>
            <td>
                <img src="image/customer.jpg">
            </td>
            <td>
                    <%= customerModel.getCustomerName()%><br>
                    <%= customerModel.getAddress()%><br>
                    Tel: <%= customerModel.getTel()%>&nbsp &nbsp
                    Fax: <%= customerModel.getFax()%><br>
                    <%= contactModel.getContactName()%>&nbsp &nbsp
                    <br>
                    Tel: <%= customerModel.getTel()%>&nbsp &nbsp
                    Email: <%= contactModel.getEmail()%><br>
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>
<div>
    <table width="100%">
    <tr>
        <td>Product</td>
        <td>Description</td>
        <td></td>
        <td>Price</td>
    </tr>
    <%
        int total = 0;
        for(ProductModel productModel:productModels){
            total += productModel.getPrice();
        %>
        <tr>
            <td><%=productModel.getProductId()%></td>
            <td><%=productModel.getProductId()%>,<%=productModel.getManufacturer()%>,<%=productModel.getModel()%>, year-<%=productModel.getYear()%></td>
            <td></td>
            <td><%=productModel.getPrice()%></td>
        </tr>
        <%
        }
    %>
    <tr>
        <td></td><td></td><td>Total</td><td><%=total%></td>
    </tr>
    </table>
</div>
</body>
</html>
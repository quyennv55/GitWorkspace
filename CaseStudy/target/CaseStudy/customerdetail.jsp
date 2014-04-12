<%@ page import="business_layer.models.CustomerModel" %>
<%@ page import="business_layer.models.ContactModel" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Detail</title>
    <script>
        function openerWindow(){
            var le = (screen.width/2)-300;
            var to = (screen.height/2)-130;
            controlWindow=window.open("addcontact.jsp","addcomtact","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=150,left="+le+",top="+to+",screenX=0,screenY=0'");
        }
    </script>
</head>
<body>
    <%
        CustomerModel customerModel = (CustomerModel) request.getAttribute("customerModel");
        ContactModel contactModel = (ContactModel) request.getAttribute("contactModel");
    %>
    <div>
        <h1>Customers</h1>
        <hr>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <img src="image/customer.jpg">
                </td>
                <td>
                    <form>
                        <%= customerModel.getCustomerName()%><br>
                        <%= customerModel.getAddress()%><br>
                        Tel:<%= customerModel.getTel()%>&nbsp &nbsp
                        Fax:<%= customerModel.getFax()%><br>
                        <%= contactModel.getContactName()%>&nbsp &nbsp
                        <input type="button" name="add" value="+" onclick="openerWindow()">
                        <br>
                        Tel:<%= customerModel.getTel()%>&nbsp &nbsp
                        Email:<%= contactModel.getEmail()%><br>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
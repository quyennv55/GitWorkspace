<%@ page import="business_layer.models.ContactModel" %>
<%@ page import="business_layer.models.CustomerModel" %>
<%@ page import="business_layer.models.ProductModel" %>
<%@ page import="java.util.List" %>
<%@ page import="business_layer.models.OrderLineModel" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
    <title>Customer Detail</title>
    <script>
        function openerWindow(){
            var le = (screen.width/2)-300;
            var to = (screen.height/2)-130;
            controlWindow=window.open("addcontact.jsp","addcomtact","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200,left="+le+",top="+to+",screenX=0,screenY=0'");
        }
    </script>
    <script type="text/javascript">

        $(document).ready(function() {

            //Default Action
            $(".tab_content").hide(); //Hide all content
            $("ul.tabs li:first").addClass("active").show(); //Activate first tab
            $(".tab_content:first").show(); //Show first tab content

            //On Click Event
            $("ul.tabs li").click(function() {
                $("ul.tabs li").removeClass("active"); //Remove any "active" class
                $(this).addClass("active"); //Add "active" class to selected tab
                $(".tab_content").hide(); //Hide all tab content
                var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
                $(activeTab).fadeIn(); //Fade in the active content
                return false;
            });

        });
    </script>
</head>
<body>
    <%
        CustomerModel customerModel = (CustomerModel) session.getAttribute("customerModel");
        ContactModel contactModel = (ContactModel) session.getAttribute("contactModel");
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
                        Tel: <%= customerModel.getTel()%>&nbsp &nbsp
                        Fax: <%= customerModel.getFax()%><br>
                        <%= contactModel.getContactName()%>&nbsp &nbsp
                        <input type="button" name="add" value="+" onclick="openerWindow()">
                        <br>
                        Tel: <%= customerModel.getTel()%>&nbsp &nbsp
                        Email: <%= contactModel.getEmail()%><br>
                    </form>
                </td>
            </tr>
        </table>
    </div>
    <div class="container">
        <ul class="tabs">
            <li><a href="#tab1">Equipment</a></li>
            <li><a href="#tab2">Order</a></li>
        </ul>
        <div class="tab_container">
            <div id="tab1" class="tab_content">
                <table width="100%">
                    <tr><td width="20%"><b>Serial</b></td><td width="30%"><b>Manufacturer</b></td><td width="30%"><b>Model</b></td><td width="20%"><b>Year</b></td></tr>
                    <%
                        List<ProductModel> productModels = (List<ProductModel>) session.getAttribute("listEquipment");
                        for(int i=0; i< productModels.size(); i++){
                        %>
                        <tr>
                            <td><%=productModels.get(i).getProductId()%></td>
                            <td><%=productModels.get(i).getManufacturer()%></td>
                            <td><%=productModels.get(i).getModel()%></td>
                            <td><%=productModels.get(i).getYear()%></td>
                        </tr>
                        <%
                        }
                    %>
                </table>
            </div>
            <div id="tab2" class="tab_content">
                <table width="100%">
                    <tr><td width="20%"><b>Order Number</b></td><td width="20%"><b>Contact</b></td><td width="10%"><b>Total Amount</b></td><td width="20%"><b>Creation Date</b></td><td width="20%"><b>Updated Date</b></td><td width="10%"><b>Year</b></td></tr>
                    <%
                        List<OrderLineModel> orderLineModels = (List<OrderLineModel>) session.getAttribute("orderLines");
                        for(OrderLineModel orderLineModel:orderLineModels){
                    %>
                    <tr>
                        <td><%=orderLineModel.getOrderNumber()%></td>
                        <td><%=orderLineModel.getContact()%></td>
                        <td><%=orderLineModel.getTotalAmount()%></td>
                        <td><%=orderLineModel.getCreateDate()%></td>
                        <td><%=orderLineModel.getUpdateDate()%></td>
                        <td><%=orderLineModel.getYear()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
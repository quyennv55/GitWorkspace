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
                        int numberOfRow = 5;
                        String current_page = request.getParameter("pages");
                        int start;
                        int finish;
                        if(current_page != null){
                            Integer current = Integer.parseInt(current_page);
                            start = current -1;
                        }else {
                            start = 0;
                        }
                        if((start+1)* numberOfRow > productModels.size())
                            finish = productModels.size();
                        else
                            finish = (start +1)*numberOfRow;
                        for(int i= start * numberOfRow; i< finish; i++){
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
                <div>
                    <%
                        int pageNumbers;
                        if(productModels.size()%numberOfRow ==0)
                            pageNumbers = productModels.size()/numberOfRow;
                        else
                            pageNumbers = productModels.size()/numberOfRow +1;
                        if(current_page != null){
                            Integer current = Integer.parseInt(current_page);
                            if(current >1){
                    %>
                    <a href="/customerdetail.jsp?pages=<%=current-1%>">Previous</a>
                    <%
                            }
                        }
                        for(int p = 1; p <= pageNumbers; p ++){
                    %>
                    <a href="/customerdetail.jsp?pages=<%=p%>"><%=p%></a>
                    <%
                        }
                        if(current_page != null){
                            Integer current = Integer.parseInt(current_page);
                            if(current != pageNumbers){
                    %>
                    <a href="/customerdetail.jsp?pages=<%=current+1%>">Next</a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div id="tab2" class="tab_content">
                <table width="100%">
                    <tr><td width="20%"><b>Order Number</b></td><td width="20%"><b>Contact</b></td><td width="10%"><b>Total Amount</b></td><td width="20%"><b>Creation Date</b></td><td width="20%"><b>Updated Date</b></td><td width="10%"><b>Year</b></td></tr>
                    <%
                        List<OrderLineModel> orderLineModels = (List<OrderLineModel>) session.getAttribute("orderLines");
                        int numberOfRow2 = 1;
                        String current_page2 = request.getParameter("pages2");
                        int start2;
                        int finish2;
                        if(current_page2 != null){
                            Integer current2 = Integer.parseInt(current_page2);
                            start2 = current2 -1;
                        }else {
                            start2 = 0;
                        }
                        if((start2+1)* numberOfRow2 > productModels.size())
                            finish2 = orderLineModels.size();
                        else
                            finish2 = (start2 +1)*numberOfRow2;
                        for(int j= start2 * numberOfRow2; j< finish2; j++){
                        /*for(OrderLineModel orderLineModel:orderLineModels){*/
                    %>
                    <tr>
                        <td><a href="/OrderDetailServlet?orderNumber=<%=orderLineModels.get(j).getOrderNumber()%>&date=<%=orderLineModels.get(j).getCreateDate()%>&status=<%=orderLineModels.get(j).getStatus()%>"><%=orderLineModels.get(j).getOrderNumber()%></a></td>
                        <td><%=orderLineModels.get(j).getContact()%></td>
                        <td><%=orderLineModels.get(j).getTotalAmount()%></td>
                        <td><%=orderLineModels.get(j).getCreateDate()%></td>
                        <td><%=orderLineModels.get(j).getUpdateDate()%></td>
                        <td><%=orderLineModels.get(j).getYear()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <div>
                    <%
                        int pageNumbers2;
                        if(orderLineModels.size()%numberOfRow2 ==0)
                            pageNumbers2 = orderLineModels.size()/numberOfRow2;
                        else
                            pageNumbers2 = orderLineModels.size()/numberOfRow2 +1;
                        if(current_page2 != null){
                            Integer current2 = Integer.parseInt(current_page2);
                            if(current2 >1){
                    %>
                    <a href="/customerdetail.jsp?pages2=<%=current2-1%>">Previous</a>
                    <%
                            }
                        }
                        for(int p2 = 1; p2 <= pageNumbers2; p2 ++){
                    %>
                    <a href="/customerdetail.jsp?pages2=<%=p2%>"><%=p2%></a>
                    <%
                        }
                        if(current_page2 != null){
                            Integer current2 = Integer.parseInt(current_page2);
                            if(current2 != pageNumbers2){
                    %>
                    <a href="/customerdetail.jsp?pages2=<%=current2+1%>">Next</a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
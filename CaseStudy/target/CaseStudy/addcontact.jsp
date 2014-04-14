<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new Contact</title>
    <script>
        function cancel(){
            window.close();
        }

        function mainContact(){
            var myCheck = document.getElementById("maincontact");
            if(myCheck.checked)
                myCheck.value = 1;
            else
                myCheck.value = 0;
        }
    </script>
</head>
<body>
    <table>
    <form name="addContact" method="post" action="AddContactServlet">
        <tr> <td>Name</td><td><input type="text" name="contact"></td></tr>
        <tr><td>Tel</td><td><input type="text" name="tel"></td></tr>
        <tr><td>Email</td><td><input type="text" name="email"></td></tr>
        <tr><td>Job title</td><td><input type="text" name="jobtitle"></td></tr>
        <tr><td></td><td><input type="checkbox" id="maincontact" name="maincontact" value="0" onclick="mainContact()">Main Contact</td></tr>
        <tr><td></td><td><input type="submit" name="save" value="save"><input type="button" name="submit" value="Cancel" onclick="cancel()"></td></tr>
    </form>
    </table>
</body>
</html>
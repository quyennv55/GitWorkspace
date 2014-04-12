<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new Contact</title>
    <script>
        function cancel(){
            window.close();
        }
    </script>
</head>
<body>
    <table>
    <form name="add" method="get" action="AddContactServlet">
        <tr>
            <td>Name</td><td><input type="text" name="contact"></td>
            <td>Tel</td><td><input type="text" name="tel"></td>
            <td>Email</td><td><input type="text" name="email"></td>
            <td>Job title</td><td><input type="text" name="jobtitle"></td>
            <td></td><td><input type="checkbox" name="maincontact" value="1">Main Contact</td>
            <td></td><td><input type="submit" name="submit" value="save"><input type="button" name="submit" value="Cancel" onclick="cancel()"></td>
        </tr>
    </form>
    </table>
</body>
</html>
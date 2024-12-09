<%@page import="com.klef.jfsd.springboot.model.Admin"%>
    
<%
Admin admin=(Admin)  session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}

%>    
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Recipients</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Heading Styling */
        .heading-container {
            text-align: center;
            margin-top: 30px; /* Adjust for space */
        }

        .heading-container h3 {
            color: #000;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 2px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
           background-color: #81C784; 
      
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
           
/*             background-color:#E6F7F1; */
               background-color:#fff;
        }

        tr:hover {
            background-color: #ddd;
        }

        td a {
            color: #007bff;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<jsp:include page="admin home.jsp"></jsp:include>

<!-- Ensure content is placed inside the .home section -->
<section class="home">
    <div class="heading-container">
        <h3><u>View All Recipients</u></h3>
    </div>

    <table>
        <tr>
            <th>RegistrationNo</th>
            <th>OrganizationName</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Password</th>
            <th>Status</th>
        </tr>

<c:forEach items="${reciplist}"  var="recipient">
  
 <tr>
   <td><c:out value="${recipient.regno}"></c:out></td>
   <td><c:out value="${recipient.name}"></c:out></td>
   <td><c:out value="${recipient.email}"></c:out></td>
   <td><c:out value="${recipient.contact}"></c:out></td>
   <td><c:out value="${recipient.address}"></c:out></td>
   <td><c:out value="${recipient.password}"></c:out></td>
      <td><c:out value="${recipient.status}"></c:out></td>
  
  </tr>
</c:forEach>

</table>
</section>
</body>
</html>

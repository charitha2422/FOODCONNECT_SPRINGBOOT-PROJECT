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
    <title>Update Donor Status</title>
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
                 /* Styling for the emoji links */
  a.action-link {
    text-decoration: none;
    font-size: 20px; /* Adjust size of emojis */
    width: 60px; /* Fixed width for consistent box size */
    height: 50px; /* Fixed height for consistent box size */
    margin: 0 10px;
    padding: 10px 0; /* Adjust padding to fit within fixed height */
    border-radius: 5px; /* Rounded corners */
    display: inline-block; /* Ensures it behaves like a box */
    line-height: 30px; /* Center text or emoji vertically */
    text-align: center; /* Center text or emoji horizontally */
    vertical-align: middle; /* Align with other elements if needed */
}

a.accept {
    background-color: #d4edda; /* Light green background */
    color: green; /* Green checkmark */
    border: 2px solid green; /* Green border */
}

a.reject {
    background-color: #f8d7da; /* Light red background */
    color: red; /* Red cross */
    border: 2px solid red; /* Red border */
}

    
    </style>
</head>
<body>
<jsp:include page="admin home.jsp"></jsp:include>

<!-- Ensure content is placed inside the .home section -->
<section class="home">
    <div class="heading-container">
        <h3><u>Update Donor Status</u></h3>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
          
            <th>Status</th>
            <th>Action</th>
        </tr>

<c:forEach items="${dlist}"  var="donor">
  
 <tr>
   <td><c:out value="${donor.donorId}"></c:out></td>
   <td><c:out value="${donor.donorName}"></c:out></td>
   <td><c:out value="${donor.email}"></c:out></td>
   <td><c:out value="${donor.contact}"></c:out></td>
  
   <td><c:out value="${donor.status}"></c:out></td>
   <td>
   <a href='<c:url value="updatedstatus?id=${donor.donorId}&status=Accepted"></c:url>' class="action-link accept">&#10004;</a>
    <a href='<c:url value="updatedstatus?id=${donor.donorId}&status=Rejected"></c:url>' class="action-link reject">&#10060;</a>
    </td>
  
  
  </tr>
</c:forEach>

</table>
</section>
</body>
</html>

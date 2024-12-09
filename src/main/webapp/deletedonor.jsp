<%@page import="com.klef.jfsd.springboot.model.Admin"%>
 <%@taglib uri="jakarta.tags.core" prefix="c"%>   
<%
Admin admin=(Admin)  session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("sessionexpiry");
	return;
}

%>    
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Donors</title>
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
              /* Styling for the delete button */
        td .delete-btn {
            background-color: #DCE775; /* Red for delete button */
            color: black;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        td .delete-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<jsp:include page="admin home.jsp"></jsp:include>

<!-- Ensure content is placed inside the .home section -->
<section class="home">
    <div class="heading-container">
        <h3><u>Delete Donors</u></h3>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

<c:forEach items="${donorlist}"  var="donor">
  
 <tr>
   <td><c:out value="${donor.donorId}"></c:out></td>
   <td><c:out value="${donor.donorName}"></c:out></td>
   <td><c:out value="${donor.email}"></c:out></td>
   <td><c:out value="${donor.contact}"></c:out></td>
   <td><c:out value="${donor.address}"></c:out></td>
   <td><c:out value="${donor.status}"></c:out></td>
  <td>
      <a class="delete-btn" href='<c:url value="deletedon?id=${donor.donorId}"></c:url> '>Delete</a>
      </td>
  </tr>
</c:forEach>

</table>
</section>
</body>
</html>

<%@page import="com.klef.jfsd.springboot.model.FoodDonor"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>

       
<%
    FoodDonor d=(FoodDonor) session.getAttribute("donor");

    if(d==null)
    {
    	response.sendRedirect("donorsessionexpiry");
    	return;
    }

%>

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Food Requests</title>
    <style type="text/css">
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
            margin-top: 30px;
        }

        .heading-container h3 {
            color: #000;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Centering the content and adjusting table width */
        .table-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 0 15px;
        }

        table {
            width: 100%;
            max-width: 1200px; /* Set a max width to fit beside sidebar */
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        table, th, td {
            border: 2px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #81C784;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #fff;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 90%;
            }
            
            th, td {
                font-size: 12px;
            }
        }
          /* Styling for the emoji links */
 /* Styling for the action column links */
a.action-link {
    text-decoration: none;
    font-size: 20px; /* Adjust size of emojis */
    width: 40px; /* Fixed width for consistent box size */
    height: 40px; /* Fixed height for consistent box size */
    margin: 0; /* Remove extra margin */
    padding: 5px; /* Ensure proper padding */
    border-radius: 5px; /* Rounded corners */
    display: flex; /* Flexbox for alignment */
    align-items: center; /* Vertically center content */
    justify-content: center; /* Horizontally center content */
}

a.accept {
    background-color: #d4edda; /* Light green background */
    color: green; /* Green text */
    border: 2px solid green; /* Green border */
}

a.reject {
    background-color: #f8d7da; /* Light red background */
    color: red; /* Red text */
    border: 2px solid red; /* Red border */
}

    </style>
</head>
<body>
<jsp:include page="donorhome.jsp"></jsp:include>

<!-- Ensure content is placed inside the .home section -->
<section class="home">
    <div class="heading-container">
        <h3><u>Update FoodRequest status</u></h3>
    </div>

    <table>
        <tr>
<!--             <th>Email</th> -->
            <th>OrganizationName</th>
            <th>Contact</th>
<!--             <th>TypeofOrg</th> -->
             <th>FoodCategory</th>
            <th>Quantity</th>
            <th>FoodCondition</th>
            <th>PickUpLocation</th>
            <th>FoodNeededbyDate</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

<c:forEach items="${rlist}"  var="request">
  
 <tr>
<%--    <td><c:out value="${request.email}"></c:out></td> --%>
   <td><c:out value="${request.name}"></c:out></td>
   <td><c:out value="${request.contact}"></c:out></td>
<%--    <td><c:out value="${request.orgType}"></c:out></td> --%>
 <td><c:out value="${request.fcategory}"></c:out></td>
 <td><c:out value="${request.quantity}"></c:out></td>
  <td><c:out value="${request.condition}"></c:out></td>
   <td><c:out value="${request.location}"></c:out></td>
    <td><c:out value="${request.needdate}"></c:out></td>
     <td><c:out value="${request.status}"></c:out></td>
 
   <td style="display: flex; justify-content: center; gap: 10px;">
    <a href='<c:url value="updatefoodrequeststatus?email=${request.email}&status=Accepted"></c:url>' 
       class="action-link accept">&#10004;</a>
    <a href='<c:url value="updatefoodrequeststatus?email=${request.email}&status=Rejected"></c:url>' 
       class="action-link reject">&#10060;</a>
</td>

  
  </tr>
</c:forEach>

</table>
</section>
</body>
</html>

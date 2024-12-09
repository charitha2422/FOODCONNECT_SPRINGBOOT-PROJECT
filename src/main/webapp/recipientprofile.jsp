<%@page import="com.klef.jfsd.springboot.model.Recipient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    Recipient r=  (Recipient) session.getAttribute("recipient");

    if(r==null)
    {
    	response.sendRedirect("recipientsessionexpiry");
    	return;
    }

%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Card</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
   <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
          :root {
            --primary-color: #81C784;
            --secondary-color: #f4f4f9;
            --text-color: #333;
            --label-color: #4CAF50;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

 body {
            background-color: var(--secondary-color);
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }


        .profile-card {
            width: 450px;
            min-height: 550px;
            background: linear-gradient(90deg, #85c1e9 0%, #a3e4d7 100%);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .profile-card:hover {
            transform: translateY(-10px);
        }

        .profile-card h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
        }

        .profile-card .position {
            font-size: 16px;
            color: #666;
            margin-bottom: 25px;
            font-style: italic;
            text-align: center;
        }

        .profile-card .info {
            width: 100%;
            color: #444;
            padding: 20px;
            background-color: #f7f9fc;
            border-radius: 8px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.05);
        }

        .profile-card .info p {
            margin: 15px 0;
            display: flex;
            flex-direction: column;
            align-items: start;
        }

        .profile-card .info p strong {
            margin-bottom: 5px;
            font-weight: 600;
            color: #2575fc;
        }

        .profile-card .social-links {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .profile-card .social-links a {
            font-size: 20px;
            color: #333;
            transition: color 0.3s;
        }

        .profile-card .social-links a:hover {
            color: #2575fc;
        }

        /* Responsive Design */
        @media (max-width: 400px) {
            .profile-card {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
    </head>
<body>
<jsp:include page="recipienthome.jsp"></jsp:include>
    <div class="profile-card">
        <h3>Recipient Profile</h3>

        <div class="info">
            <p><strong>Reg No:</strong> <%=r.getRegno() %></p>
            <p><strong>Organization Name:</strong> <%=r.getname() %></p>
            <p><strong>Email:</strong> <%=r.getEmail() %></p>
            <p><strong>Phone:</strong> <%=r.getContact() %></p>
            <p><strong>Address:</strong> <%=r.getAddress() %></p>
        </div>
        <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>

</body>
</html>

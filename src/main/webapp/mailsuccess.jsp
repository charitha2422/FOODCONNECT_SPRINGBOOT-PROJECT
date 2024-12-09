<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
		html, body {
		     height: 100%;
		     background: url('https://img.freepik.com/free-photo/top-view-paper-dove-with-envelope-copy-space_23-2148630343.jpg?t=st=1733729624~exp=1733733224~hmac=8bb7b099ba8ab72f9e9424a401004133fe6118bbb09261a382d889576b3eb56f&w=1380') no-repeat center center fixed; /* Replace 'your-image-url.jpg' with the path to your image */
		     background-size: cover;
		     display: flex;
		     justify-content: center;
		     align-items: center;
		     transition: var(--tran-05);
		 }
        body {
            font-family: 'Open Sans', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #E6F7F1;
        }
		.thank-you-container {
		    text-align: center;
		    padding: 40px;
		    border-radius: 8px;
		    background: linear-gradient(180deg, #FFFFFF 0%, #F0F0F0 100%);
		    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
		}

        h1 {
            color: #333;
            font-size: 28px;
        }
        p {
            color: #555;
            font-size: 16px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #DCE775;
            color: #333;
            border-radius: 5px;
            font-weight: 500;
        }
        a:hover {
            background-color: #C5E1A5;
        }
    </style>
</head>
<body>

<br>

  <div class="thank-you-container">
        <h1><c:out value="${message}"></c:out></h1>
       
         <a href="homepage.jsp">Back</a>
    </div>
</body>
</html>
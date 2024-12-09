<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
		html, body {
		     height: 100%;
		     background: url('donations.jpg') no-repeat center center fixed; /* Replace 'your-image-url.jpg' with the path to your image */
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
    <div class="thank-you-container">
        <h1>Thank You for Your Submission!</h1>
        <p>Your request has been successfully submitted. We will contact you soon.</p>
        <a href="recipienthome.jsp">Go Back to Home</a>
    </div>
</body>
</html>
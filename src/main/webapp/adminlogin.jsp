<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Login and Registration Form in HTML | CodingNepal</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        html, body {
            display: grid;
            height: 100%;
            width: 100%;
            place-items: center;
            background: linear-gradient(90deg, #3498db 0%, #2ecc71 100%);
        }
        ::selection {
            background: #fa4299;
            color: #fff;
        }
        .wrapper {
            overflow: hidden;
            max-width: 600px;
            background: #fff;
            padding: 50px;
            border-radius: 5px;
            box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
        }
        .wrapper .title-text {
            display: flex;
            width: 200%;
        }
        .wrapper .title {
            width: 50%;
            font-size: 35px;
            font-weight: 600;
            text-align: center;
            transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }
        .wrapper .slide-controls {
            position: relative;
            display: flex;
            height: 50px;
            width: 100%;
            overflow: hidden;
            margin: 30px 0 10px 0;
            justify-content: space-between;
            border: 1px solid lightgrey;
            border-radius: 5px;
        }
        
        
        input[type="radio"] {
            display: none;
        }
  
        #login:checked ~ label.signup {
            color: #000;
        }
        #login:checked ~ label.login {
            cursor: default;
            user-select: none;
        }
        .wrapper .form-container {
            width: 100%;
            overflow: hidden;
        }
        .form-container .form-inner {
            display: flex;
            width: 200%;
            align-items: flex-start; /* Align items at the start */
        }
        .form-container .form-inner form {
            width: 50%;
            transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            padding: 20px 0; /* Add padding to top and bottom */
        }
        .form-inner form .field {
            height: 50px;
            width: 100%;
            margin-top: 15px; /* Reduce top margin for tighter spacing */
        }
        .form-inner form .field input {
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 80px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            border-bottom-width: 2px;
            font-size: 18px;
            transition: all 0.3s ease;
        }
        .form-inner form .field input:focus {
            border-color: #fc83bb;
        }
        .form-inner form .field input::placeholder {
            color: #999;
            transition: all 0.3s ease;
        }
        form .field input:focus::placeholder {
            color: #b3b3b3;
        }
        form .btn {
            height: 50px;
            width: 100%;
            border-radius: 5px;
            position: relative;
            overflow: hidden;
        }
        form .btn .btn-layer {
            height: 100%;
            width: 300%;
            position: absolute;
            left: -100%;
            background: linear-gradient(90deg, #3498db 0%, #2ecc71 100%);
            border-radius: 5px;
            transition: all 0.4s ease;
        }
        form .btn:hover .btn-layer {
            left: 0;
        }
        form .btn input[type="submit"] {
            height: 100%;
            width: 100%;
            z-index: 1;
            position: relative;
            background: none;
            border: none;
            color: #fff;
            padding-left: 0;
            border-radius: 5px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
        }
        .pass-link, .signup-link {
            text-align: center; /* Center align the links */
            margin-top: 10px; /* Reduce top margin */
        
            
        }
             .pass-link a, .signup-link a {
            color: transparent; /* Initially set color to transparent */
            background: linear-gradient(90deg, #3498db 0%, #2ecc71 100%); /* Gradient color */
            -webkit-background-clip: text; /* Clip the background to text */
            -webkit-text-fill-color: transparent; /* Make text fill transparent */
            transition: color 0.3s ease; /* Transition effect */
        }
            /* Animation for blinking message */
        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0; }
            100% { opacity: 1; }
        }

        h4 {
            color: red;
            text-align: center;
            padding-top: 10px;
            animation: blink 1s infinite; /* Apply blink animation */
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <div class="wrapper">
        <div class="title-text">
            <div class="title login">
               Admin Login   <br>
            </div>
            
            
        </div>
        <div class="form-container">
            <h4 align="center">

            <c:out value="${message}"></c:out> 
            </h4>
            <div class="form-inner">
                <!-- Login Form -->
                  <form action="checkadminlogin" method="post"  class="login"><br>
                    <div class="field">
                    
                    <input type="text" id="ausername"  name="auname" placeholder="Enter Username" required >
                    </div><br>
                    
                    <div class="field">
                      <input type="password" id="apassword" placeholder="Enter Password" name="apswd" required >
                    </div>
                    <br>
                    <div class="pass-link">
                        <a href="#">Forgot password?</a>
                    </div>
                    <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Login">
                    </div>
                    
                </form>

               
            </div>
        </div>
    </div>
   
 
</body>
</html>

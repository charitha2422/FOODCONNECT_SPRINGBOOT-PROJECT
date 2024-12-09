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
            max-width: 390px;
            background: #fff;
            padding: 30px;
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
        .slide-controls .slide {
            height: 100%;
            width: 100%;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            text-align: center;
            line-height: 48px;
            cursor: pointer;
            z-index: 1;
            transition: all 0.6s ease;
        }
        .slide-controls label.signup {
            color: #000;
        }
        .slide-controls .slider-tab {
            position: absolute;
            height: 100%;
            width: 50%;
            left: 0;
            z-index: 0;
            border-radius: 5px;
            background: linear-gradient(90deg, #3498db 0%, #2ecc71 100%);
            transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }
        input[type="radio"] {
            display: none;
        }
        #signup:checked ~ .slider-tab {
            left: 50%;
        }
        #signup:checked ~ label.signup {
            color: #fff;
            cursor: default;
            user-select: none;
        }
        #signup:checked ~ label.login {
            color: #000;
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
            padding: 10px 0; /* Add padding to top and bottom */
        }
        .form-inner form .field {
            height: 50px;
            width: 100%;
            margin-top: 10px; /* Reduce top margin for tighter spacing */
        }
        .form-inner form .field input {
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 15px;
            border-radius: 5px;
            border: 1px solid lightgrey;
            border-bottom-width: 2px;
            font-size: 17px;
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
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="wrapper">
        <div class="title-text">
            <div class="title login">
                Login Form
            </div>
            <div class="title signup">
                Signup Form
            </div>
        </div>
        <div class="form-container">
            <div class="slide-controls">
                <input type="radio" name="slide" id="login" checked>
                <input type="radio" name="slide" id="signup">
                <label for="login" class="slide login">Login</label>
                <label for="signup" class="slide signup">Signup</label>
                <div class="slider-tab"></div>
            </div>
            <div class="form-inner">
                <!-- Login Form -->
                <form action="checkdonorlogin" method="post" class="login"><br>
                    <div class="field">
                        <input type="email" id="demail" name="demail" placeholder="Email" required>
                    </div><br>
                    
                    <div class="field">
                        <input type="password" id="dpassword" name="dpswd" placeholder="Password" required>
                    </div>
                    <br>
                    <div class="pass-link">
                        <a href="#">Forgot password?</a>
                    </div>
                    <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Login">
                    </div>
                    <div class="signup-link">
                        Not a member? <a href="">Signup now</a>
                    </div>
                </form>

                <!-- Signup Form -->
                <form action="donorreg" method="post" class="signup">
                    <div class="field">
                        <input type="text" id="donor-name" name="dname" placeholder="Donor Name" required>
                    </div>
                    <div class="field">
                        <input type="email" id="email" name="demail" placeholder="Email Address" required>
                    </div>
                    <div class="field">
                        <input type="tel" id="phone-number" name="dcontact" placeholder="Contact" required>
                    </div>
                    <div class="field">
                        <input type="text" id="pickup-location" name="daddress" placeholder="Address" required>
                    </div>
                    <div class="field">
                        <input type="password" id="password" name="dpswd" placeholder="Password" required>
                    </div>
                    <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Sign up">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        const loginText = document.querySelector(".title-text .login");
        const loginForm = document.querySelector("form.login");
        const loginBtn = document.querySelector("label.login");
        const signupBtn = document.querySelector("label.signup");
        const signupLink = document.querySelector("form .signup-link a");

        signupBtn.onclick = (() => {
            loginForm.style.marginLeft = "-50%";
            loginText.style.marginLeft = "-50%";
        });

        loginBtn.onclick = (() => {
            loginForm.style.marginLeft = "0%";
            loginText.style.marginLeft = "0%";
        });

        signupLink.onclick = (() => {
            signupBtn.click();
            return false; // Prevent the default anchor action
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="jakarta.tags.core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Donation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }

        :root {
            --body-color: #E4E9F7;
            --sidebar-color: #FFF;
            --primary-color: #695CFE;
            --primary-color-light: #F6F5FF;
            --toggle-color: #DDD;
            --text-color: #707070;
            --tran-05: all 0.3s ease;
        }

        html, body {
            height: 100%; /* Ensure full height for both html and body */
            
            background-size: cover; /* Cover entire body */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        body {
            transition: var(--tran-05);
        }

        .home {
            width: 100%;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            padding: 20px;
            max-width: 600px;
            width: 100%;
             background-color: #81C784; /* Fallback solid color */
             background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); /* Slightly transparent background for form */
            border-radius: 7px; /* Rounded corners for form */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2); /* Enhanced shadow */
            margin: 20px;
        }

        form {
            padding: 15px;
            width: 100%;
        }

        form h2 {
            font-size: 24px;
            text-align: center;
            margin: 0 0 20px;
        }

        form .form-group {
            margin-bottom: 10px;
            position: relative;
        }

        form label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        form input, form textarea, form select {
            height: 35px;
            padding: 8px;
            width: 100%;
            font-size: 14px;
            outline: none;
            border-radius: 3px;
            border: 1px solid #bfbfbf;
        }

        form textarea {
            resize: none;
            height: 80px;
        }

        .submit-btn {
            margin-top: 20px;
            text-align: center;
        }

        .submit-btn input {
            color: black;
            border: none;
            height: auto;
            font-size: 14px;
            padding: 10px 0;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            text-align: center;
            background: #DCE775;
            transition: 0.2s ease;
        }

        .submit-btn input:hover {
            background: darkred;
        }

        @media only screen and (max-width: 600px) {
            .form-container {
                max-width: 100%;
                padding: 10px;
            }

            form h2 {
                font-size: 18px;
                margin: 0 0 10px;
            }

            form input, form textarea, form select {
                height: 30px;
                font-size: 12px;
            }

            .submit-btn input {
                font-size: 12px;
                padding: 7px 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="recipienthome.jsp"></jsp:include>
      
    <section class="home">

        <div class="form-container">
            <form method="post"  action="addfoodreq">
                <h2>Food Request Form</h2>
               
                <div class="form-group">
                    <label for="name">RecipientOrganization Name</label>
                    <input type="text" id="name" name="name"  required>
                    <label for="phone-number">Phone Number</label>
                    <input type="number" id="phone-number" placeholder="798128398383" name="contact" required>
                    <label for="email">Email</label>
                    <input type="email" id="email" placeholder="example@gmail.com" name="email" required>
                </div>
                
                
                <div class="form-group">
                         <div class="form-group">
                    <label for="orgType">Organization Type</label>
                    <select id="orgType" name="orgType" required>
                        <option value="">Select type</option>
                        <option value="ngo">NGO</option>
                        <option value="non-profit">Non-Profit</option>
                        <option value="religious">Religious Organization</option>
                        <option value="shelter">Shelter</option>
                        <option value="charity">Charity</option>
                    </select>
                </div>
                    <label for="food-category">Food Category</label>
                    <select id="food-category" name="fcategory" required>
                        <option value="" disabled selected>Select Food Category</option>
                       <option value="grains">Grains</option>
                       <option value="vegetables">Vegetables</option>
                      <option value="fruits">Fruits</option>
                      <option value="canned_goods">Canned Goods</option>
                       <option value="prepared_meals">Prepared Meals</option>
                        <option value="bakery">Bakery Items</option>
                        <option value="meat">Meat</option>
                        <option value="dairy">Dairy</option>
                       
                    </select>
                </div>
                <label for="quantity">Quantity (kg):</label>
                   <input type="number" id="quantity" name="quantity" min="1" required><br><br>
                
                 <label for="foodCondition">Food Condition:</label>
                 <select id="foodCondition" name="foodCondition" required>
                 <option value="">Select Condition</option>
                 <option value="fresh">Fresh</option>
                 <option value="packaged">Packaged</option>
                <option value="frozen">Frozen</option>
                </select><br><br>
               
                 <div class="form-group">
                    <label for="pickup-location">Pickup Location</label>
                    <input type="text" id="pickup-location" placeholder="Address where food can be picked up" name="plocation">
                </div>
                <div class="form-group">
                    <label for="neededByDate">Food Needed By (Date):</label>
                    <input type="date" id="neededByDate" name="neededByDate" required >
                </div>
                
                 
           
                   
                <div class="submit-btn">
                    <input type="submit" value="Submit Food Request">
                </div>
            </form>
        </div>
    </section>
</body>
</html>

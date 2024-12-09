<%@page import="com.klef.jfsd.springboot.model.FoodDonor"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  
   FoodDonor d=(FoodDonor) session.getAttribute("donor");

    if(d==null)
    {
    	response.sendRedirect("donorsessionexpiry");
    	return;
    }

%>
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
            --body-color: #E6F7F1;
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
            padding: 10px;
            max-width: 600px;
            width: 100%;
             background-color: #81C784; /* Fallback solid color */
             background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); /*Slightly transparent background for form */
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
            height: 60px;
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
                height: 20px;
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
    <jsp:include page="donorhome.jsp"></jsp:include>

    <section class="home">
        <div class="form-container">
            <form action="adddonation" method="post" enctype="multipart/form-data" >
                <h2>Add Donation</h2>
<!--                  <div class="form-group" > -->
                  
<%--                     <input type="hidden" id="donor-id" name="did" value=<%=d.getDonorId() %> readonly required> --%>
<!--                 </div> -->
                <div class="form-group">
                    <label for="donor-name">Organization/Individual Name</label>
                    <input type="text" id="donor-name" name="dname" value=<%=d.getDonorName() %> required>
                </div>
                <div class="form-group">
                   
                    <label for="phone-number">Contact</label>
                    <input type="number" id="contact" placeholder="798128398383"  name="dcontact" required>
                    <label for="email">Email</label>
                    <input type="email" id="email" name="demail"     placeholder="example@gmail.com"   required>
                </div>
                
                   <div class="form-group">
                    <label for="donation-frequency">Donation Frequency</label>
                    <select id="donation-frequency" name="dfrequency"      required>
                        <option value="" disabled selected>Select Frequency</option>
                        <option value="one-time">One-time</option>
                        <option value="daily">Daily</option>
                        <option value="weekly">Weekly</option>
                        <option value="monthly">Monthly</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="food-category">Food Category</label>
                    <select id="food-category"   name="dcategory"      required>
                        <option value="" disabled selected>Select Food Category</option>
                        <option value="produce">Fresh Produce</option>
                        <option value="meals">Meals</option>
                        <option value="bakery">Bakery Items</option>
                        <option value="meat">Meat</option>
                        <option value="dairy">Dairy</option>
                        <option value="canned">Canned Goods</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="pickup-location">Pickup Location</label>
                    <input type="text" id="pickup-location"  name="dpickuplocation"  placeholder="Address where food can be picked up" required>
                </div>
                <div class="form-group">
                    <label for="description">Description of Donated Food</label>
                    <textarea id="description" name="ddesc" placeholder="E.g., 5 lbs of carrots, 10 loaves of bread" required></textarea>

                </div>
                
                     <div class="form-group">
                    <label for="fimage">Upload Image of Food</label>
                    <input type="file" id="fimage" name="foodimage"required/>

                </div>
                <div class="form-group">
                    <label for="pickup-date">Preferred Pickup Date/Time</label>
                    <input type="datetime-local" id="pickup-date"  name="dpickupdate"  required>
                </div>
                
             
                <div class="form-group">
                    <label for="expiry-date">Food Expiry Date</label>
                    <input type="date" id="expiry-date"  name="dexpirydate"  required>
                </div>

                <div class="submit-btn">
                    <input type="submit" value="Submit Donation">
                </div>
            </form>
        </div>
    </section>
</body>
</html>

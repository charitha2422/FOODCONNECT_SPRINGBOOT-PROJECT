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
    <title>Update Donation</title>
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
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: cover;
    background-color: #E4E9F7;
}

.home {
    width: 100%;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-container {
    max-width: 500px; /* Adjusted width to make form smaller */
    width: 90%; /* Makes the form responsive */
    background-color: #81C784; /* Fallback solid color */
    background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%);
    border-radius: 10px;
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
    padding: 30px;
    margin: 20px auto;
}

form h2 {
    font-size: 22px;
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px; /* Add spacing between form groups */
    position: relative;
}

form input, form textarea, form select {
    height: 40px;
    padding: 10px;
    width: 100%;
    font-size: 14px;
    outline: none;
    border-radius: 5px;
    border: 1px solid #bfbfbf;
    margin-top: 5px;
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
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 500;
    background: #DCE775;
    transition: 0.2s ease;
}

.submit-btn input:hover {
    background: darkred;
}

@media only screen and (max-width: 600px) {
    .form-container {
        max-width: 90%;
        padding: 20px;
    }

    form h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }

    form input, form textarea, form select {
        height: 30px;
        font-size: 12px;
        padding: 8px;
    }

    .submit-btn input {
        font-size: 12px;
        padding: 8px 15px;
    }
}
</style>
</head>
<body>
    <jsp:include page="donorhome.jsp"></jsp:include>

    <section class="home">
        <div class="form-container">
            <form action="updatedonation" method="post">
                <h2>Update Donation</h2>
                
                 <div class="form-group">
                    <label for="donor-name">Donation Id</label>
                    <input type="number" id="donor-id" name="did" required>
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

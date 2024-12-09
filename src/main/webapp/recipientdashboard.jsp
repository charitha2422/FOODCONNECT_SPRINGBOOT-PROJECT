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
  <!-- Coding by CodingLab | www.codinglabweb.com -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
   
    
    <!----===== Boxicons CSS ===== -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    
    <!--<title>Dashboard Sidebar Menu</title>--> 

    <style>
      /* Google Font Import - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

:root{
    /* ===== Colors ===== */
    --body-color: #E4E9F7;
    --sidebar-color: #FFF;
    --primary-color: #695CFE;
    --primary-color-light: #F6F5FF;
    --toggle-color: #DDD;
    --text-color: #707070;

    /* ====== Transition ====== */
    --tran-03: all 0.2s ease;
    --tran-03: all 0.3s ease;
    --tran-04: all 0.3s ease;
    --tran-05: all 0.3s ease;
}

body{
    min-height: 100vh;
    background-color: var(--body-color);
    transition: var(--tran-05);
}

::selection{
    background-color: var(--primary-color);
    color: #fff;
}

body.dark{
    --body-color: #18191a;
    --sidebar-color: #242526;
    --primary-color: #3a3b3c;
    --primary-color-light: #3a3b3c;
    --toggle-color: #fff;
    --text-color: #ccc;
}

.main-content {
    padding: 20px;
}

.food-section {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
}
.food-card {
    background-color: #81C784; /* Fallback solid color */
    background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); /* Background color for cards */
    border-radius: 8px; /* Rounded corners */
    padding: 10px; /* Reduced inner spacing */
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
    width: calc(25% - 20px); /* Smaller width for more compact display */
    text-align: center; /* Center align text */
}

.food-card:hover {
    transform: translateY(-10px);
}

.food-img {
    width: 100%; /* Responsive image */
    height: 150px; /* Smaller height for images */
    border-radius: 8px; /* Rounded corners for images */
}

.food-card h3 {
    margin: 8px 0; /* Reduced margin for title */
    font-size: 18px; /* Smaller font size */
}


.food-card p {
    font-size: 13px; /* Smaller font size for description */
    margin-bottom: 10px; /* Reduced spacing */
}

.food-btn {
    padding: 8px 12px; /* Reduced padding for buttons */
    font-size: 14px; /* Smaller font size for button */
}
.food-btn:hover {
    background-color: #574BFE;
}
.food-section {
    display: flex;
    flex-wrap: wrap;
    gap: 20px; /* Space between cards */
}

.food-card {
    background-color: #81C784; /* Fallback solid color */
    background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); /*bckground color for cards */
    border-radius: 8px; /* Rounded corners */
    padding: 15px; /* Inner spacing */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
    width: calc(30.33% - 20px); /* Width of cards, responsive */
    text-align: center; /* Center align text */
}

.food-img {
    width: 100%; /* Make image responsive */
    height: auto; /* Maintain aspect ratio */
    border-radius: 8px; /* Rounded corners for images */
}

.food-btn {
    background-color: #DCE775; /* Button color */
    color: black; /* Text color */
    border: none; /* No border */
    padding: 10px 15px; /* Inner spacing */
    cursor: pointer; /* Pointer on hover */
    border-radius: 5px; /* Rounded corners */
}

.food-btn:hover {
    background-color: red; /* Darker green on hover */
}


    </style>
</head>
<body>
    <jsp:include page="recipienthome.jsp"></jsp:include>

    <section class="home">
    <h2 align="center"> Welcome <%=r.getname() %>!!</h2>
<!--     <div class="text">Dashboard Sidebar</div> -->
    
    <div class="main-content">
        <div class="food-section">
            <div class="food-card">
                <img src="https://images.pexels.com/photos/1132047/pexels-photo-1132047.jpeg?auto=compress&cs=tinysrgb&h=350" alt="Fruits and Vegetables" class="food-img">
                <h3>Fruits and Vegetables</h3>
                <p>Fruits are sweet, edible parts of plants containing seeds, while vegetables are typically savory or less sweet.</p>
                <a href="foodrequest.jsp"><button class="food-btn">Food Request</button></a>
            </div>
            <div class="food-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHfcbgeqBNsc9PkjFBg2UtESB1nAz287hOx0XNxlaDZHkTKP_7YSPkAsQqXhZ6_5uX7I8&usqp=CAU" alt="Non-Perishable Items" class="food-img">
                <h3>Non-Perishable Food Items</h3>
                <p>Non-perishable food items are long-lasting foods that don’t require refrigeration or special handling, making them ideal for donation and storage.</p>
                 <a href="foodrequest.jsp"><button class="food-btn">Food Request</button></a>
            </div>
            <!-- New View Donations Card -->
            <div class="food-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAJhJbmiEcgXqEfSMzuBEfsKqQGntntZTVvQ&s" alt="View Donations" class="food-img">
                <h3>View Donations</h3>
                <p>Check the status of your donations, view details of past donations, and keep track of what you have given to help those in need.</p>
                 <a href="viewdonations"><button class="food-btn">View Donations</button></a>
            </div>
        </div>
    </div>
</section>
    

  
</body>
</html>
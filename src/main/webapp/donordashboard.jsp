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

.home {
    position: absolute;
    top: 0; /* Keep this if you want to stay at the top */
    left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    background-color: var(--body-color);
    transition: var(--tran-05);
    padding-top: 50px; /* Add padding at the top to move the cards down */
}

.food-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Space between cards */
    margin-top: 30px; /* Additional margin if you want to move it further down */
}

.home .text{
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 12px 60px;
}




.food-card {
    background-color: #81C784; /* Fallback solid color */
    background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); 
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 300px; /* Fixed width for uniformity */
    overflow: hidden;
    transition: transform 0.3s;
}
.food-card {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.food-card:hover {
    transform: scale(1.05); /* Scale effect on hover */
}

.food-img {
    width: 100%;
    height: 200px; /* Fixed height for images */
    object-fit: cover; /* Ensures images cover the area */
}

.food-card h3 {
    font-size: 1.5rem;
    margin: 15px 0;
    text-align: center;
}

.food-card p {
    padding: 0 15px 15px;
    text-align: center;
    color: #555;
}

.food-btn {
    background-color:#DCE775; /* Green background */
    color: black;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 1rem;
    cursor: pointer;
    margin: 15px 0;
    transition: background-color 0.3s;
}

.food-btn:hover {
    background-color: #45a049; /* Darker green on hover */
}

    </style>
</head>
<body>
    <jsp:include page="donorhome.jsp"></jsp:include>
    <section class="home">
    <h2 align="center">Welcome <%=d.getDonorName() %>!!</h2>
<div class="main-content">
  <div class="food-section">
    <div class="food-card">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_XqqxjYNBfU7HdWmnLk9Cvq1FD-ck1uEhVQ&s" alt="Add Donation" class="food-img">
      <h3>Add Donation</h3>
      <p>Donate food items that are essential for those in need. Every contribution counts!</p>
      <a href="adddonation.jsp"><button class="food-btn">Donate Now</button></a>
    </div>
    <div class="food-card">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgBCL0YFpjo31OHg7PggNvZmRbjd65n25xSg&s" alt="Update Donations" class="food-img">
      <h3>Update Donations</h3>
      <p>Keep track of your donations and help us ensure the right items reach those in need.</p>
      <a href="updatedonationsbydonor"><button class="food-btn">Update Donation</button></a>
            
    </div>
    <div class="food-card">
      <img src="https://www.lystloc.com/blog/wp-content/uploads/2023/05/What-Is-Sales-Data-Importance-And-Types-Of-Sales-Data-Reports-.webp" alt="Impact Reports" class="food-img">
      <h3>Delete Donations</h3>
      <p>View and Delete Donations that are out of stock or donated food expired</p>
      <a href="deletedonations"><button class="food-btn">Delete Donations</button></a>
    </div>
  </div>
</div>

    </div>
</section>

</body>
</html>
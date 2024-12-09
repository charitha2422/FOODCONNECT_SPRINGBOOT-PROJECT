<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;800;900&display=swap');

*, *:after, *:before {
    box-sizing: border-box;
}

body {
    font-family: "Lexend", sans-serif;
    line-height: 1.5;
    min-height: 100vh; /* Makes sure the body covers the full viewport height */
    display: flex;
    justify-content: center; /* Centers the cards horizontally */
    align-items: flex-start; /* Aligns cards to the top */
    color: #393232;
    padding: 0;
    margin: 0;
}

img {
    max-width: 50%;
    display: block;
}

/* Container for the card list */
.container {
   width: 100%;
    display: flex;
    justify-content: flex-start; /* Aligns the cards to the left */
    padding-top: 80px; /* Adds a gap at the top */
    padding-left: 10px; /* Adjusted padding to move cards to the left */
}


/* Flexbox layout for cards */
.card-list {
    display: flex;
    gap: 60px; /* Space between the cards */
    width: 100%;
    max-width: 1050px;
    margin-left: 300px; /* Moves all cards slightly to the left */
}
.card {
     background-color: #81C784; /* Fallback solid color */
    background-image: linear-gradient(180deg, #F1F8E9 0%, #81C784 100%); 
    box-shadow: 0 0 0 1px rgba(0, 0, 0, .05), 0 20px 50px 0 rgba(0, 0, 0, .1);
    border-radius: 15px;
    overflow: hidden;
    padding: 1.25rem;
    position: relative;
    transition: .15s ease-in;
    width: calc(33.333% - 20px); /* Each card takes up one-third of the row, with spacing */
}

.card:hover, .card:focus-within {
    box-shadow: 0 0 0 2px #16C79A, 0 10px 60px 0 rgba(0, 0, 0, .1);
    transform: translateY(-5px);
}

.card-header {
    margin-top: 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center; /* Center-aligns the heading */
    text-align: center; /* Ensures the text is centered */
}

.card-header a {
    font-weight: 600;
    font-size: 1.375rem;
    line-height: 1.25;
    text-decoration: none;
    color: inherit;
}

.card-image {
    border-radius: 10px;
    overflow: hidden;
    width: 180%; /* Ensures the card image takes the full width of the card */
    height: auto; /* Keeps the height proportional to the width */
}

.card-image img {
    width: 100%; /* Makes the image take the full width of the card */
    height: auto; /* Adjusts height based on width to maintain aspect ratio */
}



.icon-button {
    border: 0;
    background-color: #fff;
    border-radius: 50%;
    width: 2.5rem;
    height: 2.5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-shrink: 0;
    font-size: 1.25rem;
    transition: .25s ease;
    box-shadow: 0 0 0 1px rgba(0, 0, 0, .05), 0 3px 8px 0 rgba(0, 0, 0, .15);
    cursor: pointer;
    color: #565656;
}

.icon-button:hover, .icon-button:focus {
    background-color: #EC4646;
    color: #FFF;
}

.card-footer {
    margin-top: 1.25rem;
    border-top: 1px solid black;
    padding-top: 1.25rem;
    display: flex;
    align-items: center;
    flex-direction: column; /* Change to column for centering */
}

.card-meta {
    display: flex;
    align-items: center;
    color: #787878;
}

/* Remove the dot by removing the specific styles */
.card-meta:first-child:after {
    display: none; /* Remove the dot by hiding it */
}

.card-meta svg {
    width: 1.5em; /* Keeps the size of the SVG */
    height: 1.5em; /* Keeps the size of the SVG */
    margin-right: 8px; /* Adds space between the icon and the count */
    color: #000; /* Sets the color to dark black */
}
.card-meta .count {
    color: #000; /* Set the count color to black */
    font-weight: bold; /* Make the count bold if needed */
}


</style>
</head>
<body>
<jsp:include page="admin home.jsp"></jsp:include>
<div class="container"> <!-- Wrap card-list in a container -->
    <div class="card-list">
        <article class="card">
            <figure class="card-image">
                <img src="https://media.istockphoto.com/id/1218623873/photo/donation-box-with-food-on-old-wooden-background.jpg?s=612x612&w=0&k=20&c=h0Q3HODN-EI_27CPM2w8XE8FCuJ48UbLZNKowDJtisE=" alt="An orange painted blue, cut in half laying on a blue background" />
            </figure>
            <div class="card-header">
                <a href="#">Total Recipients</a>
            
            </div>
            <div class="card-footer">
                <div class="card-meta card-meta--views">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="EyeOpen">
                        <path d="M21.257 10.962c.474.62.474 1.457 0 2.076C19.764 14.987 16.182 19 12 19c-4.182 0-7.764-4.013-9.257-5.962a1.692 1.692 0 0 1 0-2.076C4.236 9.013 7.818 5 12 5c4.182 0 7.764 4.013 9.257 5.962z" />
                        <circle cx="12" cy="12" r="3" />
                    </svg>
                   <span class="count"><c:out value="${recipientcount}" /></span>

                </div>
            </div>
        </article>

        <article class="card">
            <figure class="card-image">
                <img src="https://media.istockphoto.com/id/1311922829/photo/donations-food-with-canned-food-on-the-table-background-donate-concept-close-up.jpg?s=612x612&w=0&k=20&c=5ZOlab3qnkZRt2KD10_fMB-uST7aFPhg9u96FVQKkWI=" alt="Açaí dessert" />
            </figure>
            <div class="card-header">
                <a href="#">Total Donors</a>
              
            </div>
            <div class="card-footer">
                <div class="card-meta card-meta--views">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="EyeOpen">
                        <path d="M21.257 10.962c.474.62.474 1.457 0 2.076C19.764 14.987 16.182 19 12 19c-4.182 0-7.764-4.013-9.257-5.962a1.692 1.692 0 0 1 0-2.076C4.236 9.013 7.818 5 12 5c4.182 0 7.764 4.013 9.257 5.962z" />
                        <circle cx="12" cy="12" r="3" />
                    </svg>
                     <span class="count"><c:out value="${donorcount}" /></span>
                </div>
            </div>
        </article>
        
        <article class="card">
            <figure class="card-image">
                <img src="https://img.freepik.com/free-vector/characters-people-their-social-network-illustration_53876-32594.jpg?uid=R114531053&ga=GA1.1.GA1.1.GA1.1.1640381365.1726591062&semt=ais_hybrid" alt="Açaí dessert" />
            </figure>
            <div class="card-header">
                <a href="#">Total Users</a>
                
            </div>
            <div class="card-footer">
                <div class="card-meta card-meta--views">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="EyeOpen">
                        <path d="M21.257 10.962c.474.62.474 1.457 0 2.076C19.764 14.987 16.182 19 12 19c-4.182 0-7.764-4.013-9.257-5.962a1.692 1.692 0 0 1 0-2.076C4.236 9.013 7.818 5 12 5c4.182 0 7.764 4.013 9.257 5.962z" />
                        <circle cx="12" cy="12" r="3" />
                    </svg>
                   <span class="count"><c:out value="${totalcount}" /></span>
                </div>
            </div>
        </article>
    </div>
</div>
</body>
</html>

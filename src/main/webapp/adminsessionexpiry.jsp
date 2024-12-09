<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Session Expired</title>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'> <!-- Adding Boxicons -->

<style>
    @import url('https://fonts.googleapis.com/css2?family=Lexend:wght@400;700&display=swap');

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: "Lexend", sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: linear-gradient(90deg, #3498db 0%, #2ecc71 100%);
        background-size: cover;
        background-position: center;
        color: #333;
    }

    .card {
        background-color: #fdecea; /* Light red for a soft alert background */
        width: 90%;
        max-width: 400px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        text-align: center;
    }

    .card-header {
        background-color: #e53935; /* Red color for alert */
        color: #fff;
        padding: 1rem;
        font-size: 1.5rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-header .icon {
        margin-right: 10px;
        font-size: 1.5rem;
    }

    .card-body {
        padding: 1.5rem;
        font-size: 1rem;
        color: #555;
    }

       .card a {
        display: inline-block;
        text-decoration: none;
        color: #fff;
        font-weight: 600;
        background-color: #e53935; /* Soft green for a calming button color */
        padding: 0.75rem 1.5rem;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        margin-top: 1rem;
    }

    .card a:hover {
        background-color: #388e3c; /* Darker green on hover */
    }
</style>
</head>
<body>

<div class="card">
    <div class="card-header">
        <i class='bx bxs-error-circle icon'></i> <!-- Boxicons triangle warning icon -->
        Session Expired
    </div>
    <div class="card-body">
        <p><b>Your session has expired!!.</b></p>
        <p><b>You will now be redirected to login...</b></p>
        <a href="homepage.jsp">Login Here</a>
    </div>
</div>

</body>
</html>

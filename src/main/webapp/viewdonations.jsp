<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Donations</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Heading Styling */
        .heading-container {
            text-align: center;
            margin-top: 30px;
        }

        .heading-container h3 {
            color: #000;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Centering the content and adjusting table width */
        .table-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 0 15px;
        }

        table {
            width: 100%;
            max-width: 1200px; /* Set a max width to fit beside sidebar */
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        table, th, td {
            border: 2px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #81C784;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #fff;
        }

        tr:hover {
            background-color: #ddd;
        }

        td a {
            color: #007bff;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 90%;
            }
            
            th, td {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="recipienthome.jsp"></jsp:include>

<section class="home">
    <div class="heading-container">
        <h3><u>View All Donations Available</u></h3>
    </div>

    <div class="table-container">
        <table>
            <tr>
                <th>Organization Name</th>
                <th>Food Category</th>
                <th>Pick-Up Location</th>
                <th>Food Description</th>
                <th>Expiry Date</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Food Image</th>
            </tr>

            <c:forEach items="${donationlist}" var="donation">
                <tr>
                    <td><c:out value="${donation.name}"></c:out></td>
                    <td><c:out value="${donation.foodCategory}"></c:out></td>
                    <td><c:out value="${donation.pickupLocation}"></c:out></td>
                    <td><c:out value="${donation.description}"></c:out></td>

                    <td><c:out value="${donation.expiryDate}"></c:out></td>
                    <td><c:out value="${donation.email}"></c:out></td>
                    <td><c:out value="${donation.contact}"></c:out></td>
                    <td>
                    <img src='displayfoodimage?id=${donation.id}' width="50%" height="50%"> 
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</section>
</body>
</html>

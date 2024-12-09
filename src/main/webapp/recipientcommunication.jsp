<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Communication Form</title>
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
    height: 45px;
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
    <jsp:include page="recipienthome.jsp"></jsp:include>

    <section class="home">
        <div class="form-container">
            <form action="sendremail" method="post">
                <h2>Recieve Donation Updates</h2>

                <div class="form-group">
                    <label for="recipient-org">Recipient Organization Name</label>
                    <input type="text" id="recipient-org" name="recipientorg" value="" placeholder="Your Organization Name" required>
                </div>

                <div class="form-group">
                    <label for="contact-person">Contact Person</label>
                    <input type="text" id="contact-person" name="contactperson" placeholder="Your Full Name" required>
                </div>

                <div class="form-group">
                    <label for="email">Contact Email</label>
                    <input type="email" id="email" name="email" placeholder="example@domain.com" required>
                </div>

                <div class="form-group">
                    <label for="donation-id">Donation ID (if known)</label>
                    <input type="text" id="donation-id" name="donation-id" placeholder="Enter Donation ID">
                </div>

                <div class="form-group"> 
                    <label for="update-type">Type of Update Requested</label>
                    <select id="update-type" name="update-type" required>
                        <option value="" disabled selected>Select Update Type</option>
                        <option value="confirm">Confirm donation availability</option>
                        <option value="quantity">Update donation quantity</option>
                        <option value="pickup-time">Change pickup/delivery time</option>
                        <option value="pickup-location">Update pickup/delivery location</option>
                        <option value="other">Other (please specify)</option>
                    </select>
                </div>

                

                <div class="form-group">
                    <label for="response-method">Preferred Response Method</label>
                    <select id="response-method" name="response-method" required>
                        <option value="" disabled selected>Select Response Method</option>
                        <option value="email">Email</option>
                        <option value="phone">Phone Call</option>
                        <option value="sms">SMS/Text Message</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="response-time">Preferred Response Time</label>
                    <input type="datetime-local" id="response-time" name="response-time" required>
                </div>

                <div class="submit-btn">
                    <input type="submit" value="Submit Request">
                </div>
            </form>
        </div>
    </section>
</body>
</html>

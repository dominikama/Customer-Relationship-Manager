
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Relationship Manager Home Page</title>

        <link rel="stylesheet"
        		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

        	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        	 <link type="text/css"
                    rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home-style.css">

</head>
<body>
    <h1>Customer Relationship Manager</h1>

    <div class="container">
        <div class="buttons">
            <a class="btn btn-primary"" href="${pageContext.request.contextPath}/loginPage"
             role="button" aria-pressed="true">Log in</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/register/registrationForm"
             role="button" aria-pressed="true">Register</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/list"
            role="button" aria-pressed="true">Customer List</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/list"
                        role="button" aria-pressed="true">Employee List</a>
        </div>
        <div class="instruction">
            <div class="title">
                How to use me
            </div>
            Welcome to the customer relationship manager. Here you can find instruction of usgae.
            This project was designed to help with maintaining customers. As an employee you can <a
             href="${pageContext.request.contextPath}/loginPage"> login</a> and
            add a new customer or view our current customer list. If you do not have an account you can register
            <a href="${pageContext.request.contextPath}/register/registrationForm">here</a>.
            Updating customers and viewing current list of employees is only possible when you're the manager or admin.
            Additionally admin can delete customers and employees. For test purposes you can use:
            <ul>
                <li> username: "susan", password: "fun123" to login as an admin </li>
                <li> username: "mary", password: "fun123" to login as an manager</li>
                <li> username: "john", password: "fun123" to login as an employee without registration</li>
            </ul>
        </div>


        <div class="instruction">
            <div class="title">
                Security and Validation
            </div>
            Users safety is ensured and provided with Spring Security. All passwords are encrypted with bcrypt algorithm.
            <br><br>
            Password:
            <br>
            <ol>
                <li>Should be at least 8 characters long</li>
                <li>Should contain at least one lowercase and capital letter</li>
                <li>Should contain at least one digit</li>
                <li> Should contain at least one special characters</li>
                <li>Should not have any spaces.</li>
            </ol>
            <br>
             Additionally username should be unique and email should be valid.

        </div>

    </div>

</body>
</html>
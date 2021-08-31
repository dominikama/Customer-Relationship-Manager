<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Save Customer</title>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
              integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
    <div class ="container">
        <h2>CRM - Customer Relationship Manager</h2>
        <hr>
        <h3 class="h3 mb-3 fw-normal"> Save Customer </h3>
        <form:form class="form-floating" action="saveCustomer" modelAttribute="customer" method="POST">
        <form:hidden path="id"/>

              <i>Fill out the form. (*) means required </i>
              <br>
              <label for="firstName">First name:</label>
              <form:input class="form-control mb-4 col-4" id="firstName" path="firstName" />

              <label for="lastName">Last name(*):</label>
              <form:input class="form-control mb-4 col-4" id="lastName" path="lastName" />
              <form:errors path="lastName" cssClass="error" />


              <label for="email">Email(*):</label>
              <form:input class="form-control mb-4 col-4" id="email" path="email" />
              <form:errors path="email" cssClass="error" />

            <input type="submit" value="Save" class="btn btn-info col-2"/>
        </form:form>


        <div style="clear; bot;"></div>
        <p><a href="${pageContext.request.contextPath}/customer/list">Back to list</a></p>

    </div>
</body>
</html>
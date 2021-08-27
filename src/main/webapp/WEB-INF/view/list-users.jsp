<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link type="text/css"
    rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div id="wrapper">
        <div id = "header">
            <h2>Employee List</h2>
        </div>
    </div>


    <div id = "container">
        <div id = "content">

             <!-- Add logout button -->
            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input class="add-button" type="submit" value="Logout"/>
            </form:form>

            <a href="${pageContext.request.contextPath}/" class="add-button">Back Home</a>

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <security:authorize access="hasRole('ADMIN')">
                    <th>Action</th>
                    </security:authorize>
                </tr>


                <c:forEach var="user" items="${userList}">
                <c:url var="deleteLink" value="/user/deleteUser">
                    <c:param name="userId" value="${user.id}"/>
                </c:url>

                <tr>
                   <td> ${user.firstName}</td>
                   <td> ${user.lastName}</td>
                   <td> ${user.email}</td>

                <security:authorize access="hasRole('ADMIN')">
                    <td>
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </td>
                </security:authorize>
                </tr>
                </c:forEach>
            </table>

        </div>
    </div>
</body>
</html>
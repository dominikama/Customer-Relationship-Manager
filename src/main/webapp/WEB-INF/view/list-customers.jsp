<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link type="text/css"
    rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div id="wrapper">
        <div id = "header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>
    </div>


    <div id = "container">
        <div id = "content">

             <!-- Add logout button -->
            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input class="add-button" type="submit" value="Logout"/>
            </form:form>

             <a href="${pageContext.request.contextPath}/" class="add-button">Back Home</a>

            <input type="button" value="Add Customer"
                onclick="window.location.href='showFormForAdd'; return false;"
                class="add-button"
                />

                <!--  add a search box -->
            <form:form action="search" method="GET">
                Search customer: <input type="text" name="name" />

                <input type="submit" value="Search" class="add-button" />
            </form:form>

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <security:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
                    <th>Action</th>
                    </security:authorize>
                </tr>


                <c:forEach var="customer" items="${customerList}">
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>

                <c:url var="deleteLink" value="/customer/deleteCustomer">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>

                <tr>
                   <td> ${customer.firstName}</td>
                   <td> ${customer.lastName}</td>
                   <td> ${customer.email}</td>

                <security:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}">Update</a>
                        <security:authorize access="hasRole('ADMIN')">
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                        </security:authorize>
                    </td>
                </security:authorize>
                </tr>
                </c:forEach>
            </table>

        </div>
    </div>
</body>
</html>
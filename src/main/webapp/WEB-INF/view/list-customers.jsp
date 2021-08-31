<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
                  integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
                  crossorigin="anonymous">

          <style>
          .card-title {
          text-align:center;

          }


          </style>
</head>
<body>

    <div class = "container">
        <h2 class="card-title">CRM - Customer Relationship Manager</h2>
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

                   <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">

                        <li><a href="${pageContext.request.contextPath}/"  class="btn btn-outline-light me-2">Back Home</a></li>

                        <li><input type="button" value="Add Customer"
                            onclick="window.location.href='showFormForAdd'; return false;"
                             class="btn btn-outline-light me-2"/>
                         </li>
                    </ul>

                    <!--  add a search box -->
                    <form:form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="search" method="GET">
                        <input type="text" class="form-control form-control-dark" placeholder="Search..." aria-label="Search"
                            name="name" />
                        <input type="submit" value="Search" class="form-control form-control-dark" />
                    </form:form>

                    <div class="text-end">
                        <form:form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="${pageContext.request.contextPath}/logout" method="POST">
                                        <input class="btn btn-warning" type="submit" value="Logout"/>
                        </form:form>
                    </div>

                </div>
            </div>
        </header>

            <br>
            <br>

            <table border="1" class="table table-bordered table-striped">

                <thead class="table-dark">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <security:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
                    <th>Action</th>
                    </security:authorize>
                </tr>
                </thead>


                <c:forEach var="customer" items="${customerList}">
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>

                <c:url var="deleteLink" value="/customer/deleteCustomer">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>

                <tbody>
                <tr>
                   <td> ${customer.firstName}</td>
                   <td> ${customer.lastName}</td>
                   <td> ${customer.email}</td>

                <security:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}" class="btn btn-outline-secondary btn-sm mb-3">Update</a>

                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false"
                           class="btn btn-outline-secondary btn-sm mb-3">Delete</a>

                    </td>
                </security:authorize>
                </tr>
                </tbody>
                </c:forEach>
            </table>
    </div>
</body>
</html>
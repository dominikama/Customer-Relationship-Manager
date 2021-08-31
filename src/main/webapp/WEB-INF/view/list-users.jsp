<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
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

                       <li><a href="${pageContext.request.contextPath}/" class="btn btn-outline-light me-2">Back Home</a><li>
                       <li><a href="${pageContext.request.contextPath}/customer/list" class="btn btn-outline-light me-2">
                       Customer List</a><li>

                        </ul>
                        <!-- Add logout button -->
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
                        <security:authorize access="hasRole('ADMIN')">
                        <th>Action</th>
                        </security:authorize>
                    </tr>
                </thead>


                    <c:forEach var="user" items="${userList}">

                    <c:url var="deleteLink" value="/user/deleteUser">
                        <c:param name="userId" value="${user.id}"/>
                    </c:url>
                    <tbody>
                        <tr>
                           <td> ${user.firstName}</td>
                           <td> ${user.lastName}</td>
                           <td> ${user.email}</td>

                        <security:authorize access="hasRole('ADMIN')">
                            <td>
                                <a href="${deleteLink}" class="btn btn-outline-secondary btn-sm mb-3"
                                   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                            </td>
                        </security:authorize>
                        </tr>
                    </tbody>
                    </c:forEach>

                </table>
    </div>
</body>
</html>
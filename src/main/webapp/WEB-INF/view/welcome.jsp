
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Relationship Manager Home Page</title>

          <meta charset="utf-8">
                   <meta name="viewport" content="width=device-width, initial-scale=1">


                   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
                   integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
                   <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">


                       <style>
                        header {
                            margin-bottom:150px;
                        }
                        .dropdown{
                        margin-right:10px;
                        }

                       </style>

</head>
<body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
        <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="drop" data-toggle="dropdown"
                 aria-haspopup="true" aria-expanded="false">
                   <span class="navbar-toggler-icon"></span>
                </button>
                <div class="dropdown-menu" aria-labelledby="drop">
                  <a class="dropdown-item" aria-current="page"
                                            href="${pageContext.request.contextPath}/customer/list">Customer List</a>
                  <a class="dropdown-item" aria-current="page"
                                           href="${pageContext.request.contextPath}/user/list">Employee List</a>
                  <a class="dropdown-item" aria-current="page"
                                             href="${pageContext.request.contextPath}/loginPage">Log in</a>
                 <a class="dropdown-item" aria-current="page"
                                         href="${pageContext.request.contextPath}/register/registrationForm">Register</a>
                </div>
          </div>
          <a class="navbar-brand" href="#">CRM</a>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">

                        <li class="nav-item"><a class="nav-link active" aria-current="page"
                          href="${pageContext.request.contextPath}/">Home</a>

                         <li class="nav-item"><a class="nav-link active" aria-current="page"
                          href="${pageContext.request.contextPath}/customer/list">Customer List</a> </li>

                         <li class="nav-item"><a class="nav-link active" aria-current="page"
                         href="${pageContext.request.contextPath}/user/list">Employee List</a> </li>
                    </ul>

                    <div class="text-end">
                        <a class="btn btn-warning" aria-current="page"
                           href="${pageContext.request.contextPath}/loginPage">Log in</a>

                       <a class="btn btn-outline-light me-2" aria-current="page"
                        href="${pageContext.request.contextPath}/register/registrationForm">Register</a>

                    </div>
                </div>
        </div>
      </nav>
    </header>

    <main>

    <div class="container">
        <div class="container marketing">

            <!-- Three columns of text below the carousel -->
            <div class="row">
              <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140"
                src="${pageContext.request.contextPath}/resources/images/employee.png"
                 role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice"
                  focusable="false"><rect width="100%" height="100%" fill="#777"/>

                <h2>Employee</h2>
                <p>As an employee, you have limited access to our clients and none access to other employees.
                If you want to test this role register or use:<br>
                username:"john", password:"fun123" to log in </p>
              </div><!-- /.col-lg-4 -->
              <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140"
                src="${pageContext.request.contextPath}/resources/images/businesswoman.png" role="img"
                 preserveAspectRatio="xMidYMid slice" focusable="false">
                 <rect width="100%" height="100%" fill="#777"/></svg>

                <h2>Manager</h2>
                <p>As a manager, you have unlimited access to our clients.
                 However, you can only view employees, modifying their data is not allowed.
                 If you want to test this role use:<br>
                                 username:"mary", password:"fun123" to log in
                 </p>

              </div><!-- /.col-lg-4 -->
              <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140"
                                src="${pageContext.request.contextPath}/resources/images/business.png"
                                 role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice"
                                  focusable="false"><rect width="100%" height="100%" fill="#777"/>

                <h2>Admin</h2>
                <p>As an admin you have unlimited access to our customers and employees. Use it wisely!
                To test this role use:
                <br>
                 username:"mary", password:"fun123" to log in
                </p>
              </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->




            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider">

            <div class="row featurette">
              <div class="col-md-7">
                <h2 class="featurette-heading"> Managing the customers</h2>
                <p class="lead">Good management of the customers is crucial in business. That's why having a clear and
                simple CRM is so important. In this company access to customers is limited. Employees can only add
                a new customer or view those already existing. Managers and admins can update customers data and delete
                them if needed</p>
              </div>
              <div class="col-md-5">
                <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                width="500" height="500" src="${pageContext.request.contextPath}/resources/images/partnership.png"
                role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice"
                 focusable="false"></svg>

              </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
              <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Managing the employees</h2>
                <p class="lead">As said above in our company every employee has his important role. Admins and Managers
                can take a closer look at their colleagues by going to the: "Employee List" section.</p>
              </div>
              <div class="col-md-5 order-md-1">
                <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                                width="500" height="500" src="${pageContext.request.contextPath}/resources/images/cooperation.png"
                                role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice"
                                 focusable="false"></svg>
              </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
              <div class="col-md-7">
                <h2 class="featurette-heading"> Security and validation</h2>
                <p class="lead"> Users safety is ensured and provided with Spring Security. All passwords are encrypted with bcrypt algorithm.
                                    <br><br>
                                    Password:
                                    <br>
                                    <ol class="lead">
                                        <li>Should be at least 8 characters long</li>
                                        <li>Should contain at least one lowercase and capital letter</li>
                                        <li>Should contain at least one digit</li>
                                        <li> Should contain at least one special character</li>
                                        <li>Should not have any spaces.</li>
                                    </ol>
                                    <br>
                                     <p class="lead">Additionally username should be unique and email should be valid.</p>
                                     </p>
          </div>
              <div class="col-md-5">
                <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                                                width="500" height="500" src="${pageContext.request.contextPath}/resources/images/security.jpg"
                                                role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice"
                                                 focusable="false"></svg>

              </div>
            </div>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->

          </div><!-- /.container -->

          <div>
        </main>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopping</title>
    <!-- Roboto Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="css/mdb-pro.min.css">
    <!-- Material Design Bootstrap Ecommerce -->
    <link rel="stylesheet" href="css/mdb.ecommerce.min.css">
    <!-- Your custom styles (optional) -->
</head>

<body class="skin-light">

<!--Main Navigation-->
<header>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-light fixed-top scrolling-navbar navbar-transparent">

        <div class="container-fluid">

            <!-- Brand -->
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-book-open fa-3x" alt="mdb logo"></i>
            </a>

            <!-- Collapse button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Links -->
            <div class="collapse navbar-collapse" id="basicExampleNav">

                <!-- Right -->
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle waves-effect" id="navbarDropdownMenuLink3" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="true">
                            <i class="vietnam flag m-0"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#!">Action</a>
                            <a class="dropdown-item" href="#!">Another action</a>
                            <a class="dropdown-item" href="#!">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="MyCartController.html?id=1&action=a" class="nav-link navbar-link-2 waves-effect">
                            <i class="fas fa-shopping-cart pl-0"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#!" class="nav-link waves-effect"></a>
                    </li>
                    <li class="nav-item pl-2 mb-2 mb-md-0">
                        <a href="login.jsp" type="button"
                           class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light">Đăng nhập</a>
                    </li>
                </ul>
                <!-- Right -->

            </div>
        </div>
    </nav>
    <!-- Navbar -->

    <div class="jumbotron jumbotron-image color-grey-light"
         style="background-image: url('https://images.unsplash.com/photo-1553503995-b6aefccad354?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'); height: 400px;">
        <div class="mask rgba-black-strong d-flex align-items-center h-100">
            <div class="container text-center white-text py-5">
                <h1 class="mb-0">Duy's Bookstore</h1>
            </div>
        </div>
    </div>

</header>

<!-- SCRIPTS -->
<!-- JQuery -->
<script src="js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- MDB Ecommerce JavaScript -->
<script type="text/javascript" src="js/mdb.ecommerce.min.js"></script>
<script>
    $('#multi').mdbRange({
        single: {
            active: true,
            multi: {
                active: true,
                rangeLength: 1
            },
        }
    });

    $(document).ready(function () {
        $('.mdb-select').materialSelect();
        $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
            $(this).closest('.select-outline').find('label').toggleClass('active');
            $(this).closest('.select-outline').find('.caret').toggleClass('active');
        });
    });
</script>
</body>

</html>
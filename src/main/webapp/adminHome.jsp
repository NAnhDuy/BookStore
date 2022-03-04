<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>bookstore</title>
</head>

<body class="skin-light">
<!-- Header -->
<c:import url="adminHeader.jsp"/>
<h4 style="color:#0f6674;">${mess}</h4>
<!-- Body -->
<c:import url="sale.jsp"/>
<c:import url="adminBody.jsp"/>
<!-- Footer -->
<c:import url="footer.jsp"/>
</body>

</html>
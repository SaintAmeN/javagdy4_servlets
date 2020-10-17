<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 10/17/20
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index page</title>
    <jsp:include page="headers.jsp"/>
</head>
<body>
<jsp:include page="navigator.jsp"/>
<h1>
    <%
        // Java code
        String nameParam = request.getParameter("name");
        if (nameParam == null) {
            out.print("Hello user!");
        } else {
            out.print("Hello " + nameParam + "!");
        }
    %>
</h1>

<jsp:include page="footers.jsp"/>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 10/17/20
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Tabliczka mnożenia</title>
    <jsp:include page="headers.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="navigator.jsp"/>

    <form action="${pageContext.request.contextPath}/multiplication.jsp" method="get">
        Rows: <input type="number" name="rows" min="1" step="1"/><br/>
        Cols: <input type="number" name="cols" min="1" step="1"/><br/>
        <input type="submit">
    </form>

    <hr/>
    <table>
        <%
            // rows
            String rowsString = request.getParameter("rows");
            int rowsCount = 10;
            if (rowsString != null) {
                try {
                    rowsCount = Integer.parseInt(rowsString);
                    if (rowsCount <= 0) {
                        rowsCount = 10;
                    }
                } catch (NumberFormatException nfe) {
                    rowsCount = 10;
                }
            }
            // cols
            String colsString = request.getParameter("cols");
            int colsCount = 10;
            if (colsString != null) {
                try {
                    colsCount = Integer.parseInt(colsString);
                    if (colsCount <= 0) {
                        colsCount = 10;
                    }
                } catch (NumberFormatException nfe) {
                    colsCount = 10;
                }
            }

            // wartości muszą być: większe od 0, nie są tekstem (są parsowalne do liczby), nie są nullem (czyli zostały podane)

            // wypisanie w dwóch pętlach do tabeli tabliczki mnożenia
            for (int i = 0; i < rowsCount; i++) { // rows
                out.print("<tr>");
                for (int j = 0; j < colsCount; j++) { // cols
                    out.print("<td>");
                    out.print((i + 1) * (j + 1));
                    out.print("</td>");
                }
                out.print("</tr>");
            }
        %>
    </table>
</div>
<jsp:include page="footers.jsp"/>
</body>
</html>

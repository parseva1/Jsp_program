<%@ page import="shit.jdbc_delete" %>
<%@ page import="shit.jdbc_add" %>
<%@ page import="shit.jdbc_alter" %><%--
  Created by IntelliJ IDEA.
  User: yanru
  Date: 2019/10/2
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>curd_page</title>
</head>
<body>
    <%
        String[] curd_name = new String[5];
        curd_name[0] = request.getParameter("add");
        curd_name[1] = request.getParameter("delete");
        curd_name[2] = request.getParameter("change");
        curd_name[3] = request.getParameter("title");
        curd_name[4] = request.getParameter("alter_content");

        for (int i = 0; i < curd_name.length-1; i++) {
            if (curd_name[i] == "") {
                continue;
            }
            if (curd_name[i] != null) {
                switch (i) {
                    case 0:
                        jdbc_add add = new jdbc_add();
                        add.add_data(curd_name[0], curd_name[3]);
                        response.sendRedirect("index.jsp");
                        break;
                    case 1:
                        jdbc_delete delete = new jdbc_delete();
                        delete.de(curd_name[1]);
                        response.sendRedirect("index.jsp");
                        break;
                    case 2:
                        jdbc_alter change = new jdbc_alter();
                        change.ch(curd_name[2],curd_name[4]);
                        response.sendRedirect("index.jsp");
                        break;
                }
            }else{
                out.println("操作失败");
            }
        }
    %>
</body>
</html>

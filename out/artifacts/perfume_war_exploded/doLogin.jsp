<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = "";
    String password = "";
    if(request.getParameter("username")!=null){
        username = request.getParameter("username");
    }
    if(request.getParameter("password")!=null){
        password = request.getParameter("password");
    }
    if ("Marry".equals(username) && "123".equals(password)){
        session.setAttribute("username",username);
        response.sendRedirect("index.jsp");
    }else{
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
%>

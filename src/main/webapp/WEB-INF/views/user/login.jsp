<%@ page import="com.study.common.util.CookieUtils" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>

    </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<%
    CookieUtils cookieUtils = new CookieUtils(request);
    Cookie cookie = cookieUtils.getCookie("rememberMe");
    String chk = "";
    String userId = "";
    if (cookie!=null){
        userId = cookie.getValue();
        chk = "checked";
    }
%>
<div class="container">

    <form method="post" action="/user/login.wow">
        <div>
            <div class="my-3">
                <label class="user-select-none" for="userId">ID</label>
                <input type="text" class="form-control" id="userId" name="userId" value="<%=userId%>">
            </div>
            <div class="my-3">
                <label class="user-select-none" for="userPass">PASSWQRD</label>
                <input type="password" class="form-control" id="userPass" name="userPass">
            </div>
            <div>
                <label class="user-select-none" for="rememberId">아이디 저장</label>
                <input type="checkbox" class="form-check-input" id="rememberId" name="rememberId" value="true" <%=chk%>>
            </div>
            <c:if test='<%=request.getParameter("msg")!=null%>'>
                <p class="form-text"><%=request.getParameter("msg")%>
                </p>
            </c:if>
        </div>
        <button type="submit" class="btn btn-success">로그인</button>

    </form>
</div>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>

<%@ page import="com.study.user.vo.UserVO" %>
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
<div id="askContainer">
    <c:forEach items="">

    </c:forEach>
</div>
</body>
</html>
<script>
    const blankChk = ()=>{
        if($("#askContainer").children().length==0){
            let div = "<div>문의가 없습니다</div>"
            $("#askContainer").append(div)
        }
    }
    blankChk()
</script>
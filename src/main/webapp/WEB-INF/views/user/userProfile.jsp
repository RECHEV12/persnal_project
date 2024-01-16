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

${user}
<div>
    <div>
        <img class=""
             src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${user.userIcon}"/>
        <p>이름 : ${user.userName}</p>
    </div>


    <div>
        생년월일 : ${user.userBirth}
    </div>
    <div>
        성별 : ${user.userGender}
    </div>
    <div>
        전화번호 : ${user.userHp}
    </div>
    <div>
        이메일 : ${user.userEmail}
    </div>
    <div>
        자기소개 : ${user.userIntroduce}
    </div>
</div>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>

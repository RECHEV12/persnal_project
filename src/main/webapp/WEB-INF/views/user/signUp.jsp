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
<div>
    <form action="/user/signUp.wow" method="post" enctype="multipart/form-data">
        <div>
            <div>
                <label for="userId">
                    아이디
                </label>
                <input id="userId" name="userId" type="text" value="">
            </div>
            <div>
                <label for="userPass">
                    비밀번호
                </label>
                <input id="userPass" name="userPass" type="password" value="">
            </div>
            <div>
                <label for="userName">
                    이름
                </label>
                <input id="userName" name="userName" type="text" value="">
            </div>
            <div>
                <label for="userBirth">
                    생일
                </label>
                <input id="userBirth" name="userBirth" type="date" value="">
            </div>
            <div>
                성별
                <label for="male">
                    남성
                </label>
                    <input id="male" name="userGender" type="radio" value="M" checked>
                <label for="female">
                    여성
                </label>
                <input id="female" name="userGender" type="radio" value="F">
            </div>
            <div>
                <label for="userHp">
                    전화번호
                </label>
                <input id="userHp" name="userHp" type="number" value="">
            </div>
            <div>
                <label for="userEmail">
                    이메일
                </label>
                <input id="userEmail" name="userEmail" type="text" value="">
            </div>
            <div>
                <label for="userZip">
                    우편번호
                </label>
                <input id="userZip" name="userZip" type="number" value="">
            </div>
            <div>
                <label for="userAdd1">
                    주소1
                </label>
                <input id="userAdd1" name="userAdd1" type="text" value="">
            </div>
            <div>
                <label for="userAdd2">
                    주소2
                </label>
                <input id="userAdd2" name="userAdd2" type="text" value="">
            </div>
            <div>
                <label for="boFiles">
                    프로필사진
                </label>
                <input id="boFiles" name="boFiles" type="file" value="">

            </div>
        </div>
        <button class="btn btn-success" type="submit">가입하기</button>
    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>

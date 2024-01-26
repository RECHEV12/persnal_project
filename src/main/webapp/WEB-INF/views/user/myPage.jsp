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
    <form action="/user/userModify.wow" method="post" enctype="multipart/form-data">
        <div>
            <div>
                아이디 : ${user.userId}
            </div>
            <div>
                <label for="userPass">
                    비밀번호 확인 :
                </label>
                <input id="userPass" name="userPass" required type="password" value="">
                <a href="/">비밀번호를 변경하고 싶나요?</a>
            </div>
            <div>
                이름 : ${user.userName}
            </div>
            <div>
                생일 : ${user.userBirth}
            </div>
            <div>
                성별 :
                <span>${user.userGender=='M' ? "남성":"여" }</span>
            </div>
            <div>
                <label for="userHp">
                    전화번호
                </label>
                <input id="userHp" name="userHp" type="number" value="${user.userHp}">
            </div>
            <div>
                <label for="userEmail">
                    이메일
                </label>
                <input id="userEmail" name="userEmail" type="text" value="${user.userEmail}">
            </div>
            <div>
                <label for="userZip">
                    우편번호
                </label>
                <input id="userZip" name="userZip" type="number" value="${user.userZip}">
            </div>
            <div>
                <label for="userAdd1">
                    주소1
                </label>
                <input id="userAdd1" name="userAdd1" type="text" value="${user.userAdd1}">
            </div>
            <div>
                <label for="userAdd2">
                    주소2
                </label>
                <input id="userAdd2" name="userAdd2" type="text" value="${user.userAdd2}">
            </div>
            <div>

                <img class="" id="nowImg"
                     src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${user.userAttach.atchFileName}&filePath=${user.userAttach.atchPath}"/>


                <label for="boFiles">
                    프로필사진
                </label>
                <input id="boFiles" name="boFiles" type="file" value="">

            </div>
        </div>
        <button class="btn btn-success" type="submit">수정하기</button>
    </form>
</div>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    $("#boFiles").on("change", () => {
        let input = document.getElementById("boFiles");
        let fReader = new FileReader();
        fReader.readAsDataURL(input.files[0]);
        fReader.onloadend = function(event) {
            let img = document.getElementById("nowImg");
            img.src = event.target.result;
            console.log("path: ", event.target.result);
        }


    })
</script>
</html>

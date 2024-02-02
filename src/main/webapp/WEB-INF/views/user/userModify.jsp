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
<div class="container" style="margin: auto">
    <form action="/user/userModify.wow" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>회원정보 수정</legend>
            <div class="form-group">
                <label class="col-md-4 control-label">아이디</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" value="${user.userId}" type="text" readonly>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="userPass">비밀번호 확인</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="userPass" name="userPass" placeholder="현재 비밀번호 입력" required class="form-control"
                               type="password">
                    </div>
                </div>
                <a href="/user/userPassChange.wow">비밀번호를 변경하고 싶나요?</a>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="userHp">전화번호</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                        <input id="userHp" name="userHp" placeholder="01012345678" value="${user.userHp}"
                               class="form-control" type="text">
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="userEmail">E-Mail</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="userEmail" name="userEmail" placeholder="이메일 주소" value="${user.userEmail}"
                               class="form-control" type="email">
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="userZip">우편번호</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input id="userZip" name="userZip" placeholder="우편번호" class="form-control" type="number"
                               value="${user.userZip}">
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="userAdd1">주소 1</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input id="userAdd1" name="userAdd1" placeholder="주소" class="form-control" type="text"
                               value="${user.userAdd1}">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="userAdd2">주소 2</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input id="userAdd2" name="userAdd2" placeholder="Address" class="form-control" type="text"
                               value="${user.userAdd2}">
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label" for="boFiles">프로필 사진</label>
                <div class="col-md-4 inputGroupContainer">
                    <img class="" id="nowImg"
                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${user.userAttach.atchFileName}&filePath=${user.userAttach.atchPath}"/>
                    <div class="input-group">

                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="boFiles" name="boFiles" class="form-control" type="file">
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-outline-success">수정<span
                            class="glyphicon glyphicon-send"></span>
                    </button>
                </div>
            </div>

        </fieldset>
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
        fReader.onloadend = function (event) {
            let img = document.getElementById("nowImg");
            img.src = event.target.result;
            console.log("path: ", event.target.result);
        }


    })
</script>
</html>

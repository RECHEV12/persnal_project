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
<section class="vh-100" style="background-color:#0c4128;">
    <form action="/user/signUp.wow" method="post" enctype="multipart/form-data">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-9">

                    <h1 class="text-white mb-4">회원가입</h1>

                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body">

                            <div class="row align-items-center pt-4 pb-3">
                                <div class="col-md-3 ps-5">
                                    <label for="userId">
                                        <h6 class="mb-0">아이디</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="text" id="userId" name="userId" class="form-control form-control-sm"/>
                                </div>

                                <div class="col-md-3 ps-5">
                                    <label for="userPass">
                                        <h6 class="mb-0">비밀번호</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="password" id="userPass" name="userPass"
                                           class="form-control form-control-sm"/>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <div class="col-md-3 ps-5">
                                    <label for="userName">
                                        <h6 class="mb-0">이름</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="text" id="userName" name="userName"
                                           class="form-control form-control-sm"/>
                                </div>
                                <div class="col-md-3 ps-5">
                                    <label for="userBirth">
                                        <h6 class="mb-0">생일</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="date" id="userBirth" name="userBirth"
                                           class="form-control form-control-sm"/>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <div class="col-md-3 ps-5">
                                    <label for="userBirth">
                                        <h6 class="mb-0">성별</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <label for="male">
                                        남성
                                    </label>
                                    <input type="radio" id="male" name="userGender" value="M"/>
                                    <label for="female">
                                        여성
                                    </label>
                                    <input type="radio" id="female" name="userGender" value="F"/>

                                </div>
                                <div class="col-md-3 ps-5">
                                    <label for="userHp">
                                        <h6 class="mb-0">전화번호</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="text" id="userHp" name="userHp"
                                           class="form-control form-control-sm"/>
                                </div>
                            </div>
                            <hr class="mx-n3">
                            <div class="row align-items-center py-3">

                                <div class="col-md-3 ps-5">
                                    <label for="userZip">
                                        <h6 class="mb-0">우편번호</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="number" id="userZip" name="userZip"
                                           class="form-control form-control-sm"/>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center py-3">
                            <div class="col-md-3 ps-5">
                                <label for="userAdd1">
                                    <h6 class="mb-0">주소1</h6>
                                </label>
                            </div>
                            <div class="col-md-3 pe-5">
                                <input type="text" id="userAdd1" name="userAdd1"
                                       class="form-control form-control-sm"/>
                            </div>
                            <div class="col-md-3 ps-5">
                                <label for="userAdd2">
                                    <h6 class="mb-0">주소2</h6>
                                </label>
                            </div>
                            <div class="col-md-3 pe-5">
                                <input type="text" id="userAdd2" name="userAdd2"
                                       class="form-control form-control-sm"/>
                            </div>
                        </div>
                        <hr class="mx-n3">
                        <div class="row align-items-center py-3">
                            <div class="col-md-3 ps-5">
                                <label for="userEmail">
                                    <h6 class="mb-0">이메일</h6>
                                </label>
                            </div>
                            <div class="col-md-3 pe-5">
                                <input type="email" id="userEmail" name="userEmail"
                                       class="form-control form-control-sm"/>
                            </div>
                        </div>
                        <div class="row align-items-center py-3">
                            <div class="col-md-3 ps-5">
                                <label for="boFiles">
                                    <h6 class="mb-0">프로필사진</h6>
                                </label>
                            </div>
                            <div class="col-md-9 pe-5">
                                <input class="form-control form-control-lg" id="boFiles" name="boFiles" type="file"/>

                            </div>
                        </div>

                        <hr class="mx-n3">

                        <div class="px-5 py-4">
                            <button type="submit" class="btn btn-success btn-lg">가입하기</button>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        </div>
    </form>
</section>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>

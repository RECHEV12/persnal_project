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
<section class="vh-100" style="background-color: #146c43;">
    <form method="post" action="/product/modifyOpt.wow">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-9">
                    <h1 class="text-white mb-4">옵션 수정</h1>
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body">

                            <div class="row align-items-center py-3">
                                <div id="optDiv">
                                    <button class="btn btn-success" id="addOpt">옵션 추가하기</button>
                                    <c:forEach items="${optList}" var="option">
                                        <div class="opts d-flex" name="opt">
                                            <label>옵션1</label>
                                            <input class="form-control w-25" type="text" name="optFirst"
                                                   value="${option.optFirst}">
                                            <label>옵션2</label>
                                            <input class="form-control w-25" type="text" name="optSecond"
                                                   value="${option.optSecond}">
                                            <label>재고</label>
                                            <input class="form-control w-25" type="number" name="optStock"
                                                   value="${option.optStock}">
                                            <input type="number" name="optNo" hidden="hidden"
                                                   value="${option.optNo}">
                                            <button class="btn btn-danger" name="delOptBtn"
                                                    data-opt-no="${option.optNo}">삭제하기
                                            </button>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="px-5 py-4">
                                <input class="form-control w-25" type="text" hidden="hidden" name="prodNo" value="${product.prodNo}">
                                <button type="submit" class="btn btn-primary btn-lg">수정하기</button>
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
<script>
    $("#addOpt").on("click", (e) => {
        e.preventDefault();
        $("#optDiv").append('<div  class="opts d-flex" name="opt"><label>옵션1</label>' +
            '<input class="form-control w-25" type="text" name="newOptFirst" >' +
            '<label >옵션2</label>' +
            '<input class="form-control w-25" type="text" name="newOptSecond" >' +
            '<label >재고</label>' +
            '<input class="form-control w-25" type="number" name="newOptStock" >' +
            ' <button class="btn btn-danger" name="delOptBtn">삭제하기</button></div>')
    })

    $('#optDiv').on('click', 'button[name=delOptBtn]', function (e) {
        e.preventDefault();
        $btn = $(this);
        if ($btn.data("optNo") != undefined) {
            $btn.closest('div').html(
                '<input type="hidden" name="delOpt" value="' + $btn.data("optNo") + '" />'
            )

        }
        $(this).parents('div[name=opt]').remove()

    });
</script>
</html>

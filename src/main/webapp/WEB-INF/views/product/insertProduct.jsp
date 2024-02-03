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
    <form method="post" action="/product/insertProduct.wow" enctype="multipart/form-data">


        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-9">

                    <h1 class="text-white mb-4">Apply for a job</h1>

                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body">

                            <div class="row align-items-center pt-4 pb-3">

                                <div class="col-md-3 ps-5">
                                    <label for="prodTitle">
                                        <h6 class="mb-0">상품명</h6>
                                    </label>

                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="text" id="prodTitle" name="prodTitle"
                                           class="form-control form-control-lg"/>
                                </div>

                                <div class="col-md-3 ps-5">
                                    <label for="prodPrice">
                                        <h6 class="mb-0">상품가격</h6>
                                    </label>

                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="number" id="prodPrice" name="prodPrice"
                                           class="form-control form-control-lg"/>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <div class="col-md-3 ps-5">
                                    <label for="prodCateCode">
                                        <h6 class="mb-0">상품구분</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <select class="form-control" name="prodCateCode" id="prodCateCode">
                                        <c:forEach items="${codeList}" var="code" begin="2">
                                            <option value="${code.cateCode}">${code.cateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-md-3 ps-5">
                                    <label for="prodContent">
                                        <h6 class="mb-0">상품설명</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="text" name="prodContent" id="prodContent"
                                           class="form-control form-control-lg"/>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                    <label for="boFiles">
                                        썸네일
                                    </label>
                                <div class="d-flex">
                                    <input id="boFiles" class="form-control w-50" required name="boFiles" type="file" value="">
                                    <img class="h-25 w-25"  id="nowImg"/>
                                </div>
                            </div>

                            <hr class="mx-n3">
                            <div class="row align-items-center py-3">
                                <div id="detailImgDiv">
                                    <p>상품 상세 사진</p>
                                    <button class="btn btn-success" type="button" id="addDetail">사진 추가</button>
                                    <div name="details" class="d-flex">
                                        <input required name="detailImg" class="form-control w-50" type="file" value="">

                                        <img class="h-25 w-25" name="detailImg"/>
                                    </div>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <div id="optDiv">
                                    <button class="btn btn-success" id="addOpt">옵션 추가하기</button>
                                    <div class="opts d-flex" name="opt">
                                        <label>옵션1</label>
                                        <input class="form-control w-25" type="text" name="optFirst">
                                        <label>옵션2</label>
                                        <input  class="form-control w-25" type="text" name="optSecond">
                                        <label>재고</label>
                                        <input  class="form-control w-25" type="number" name="optStock">

                                    </div>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="px-5 py-4">
                                <button type="submit" class="btn btn-primary btn-lg">등록하기</button>
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

    $("#addOpt").on("click", (e) => {
        e.preventDefault();
        $("#optDiv").append('<div  class="opts d-flex" name="opt"><label>옵션1</label>' +
            '<input class="form-control w-25" type="text" name="optFirst" >' +
            '<label >옵션2</label>' +
            '<input class="form-control w-25" type="text" name="optSecond" >' +
            '<label >재고</label>' +
            '<input class="form-control w-25" type="number" name="optStock" >' +
            ' <button class="btn btn-danger" name="delOptBtn">삭제하기</button></div>')
    })
    $("#addDetail").on("click", (e) => {
        e.preventDefault();
        $("#detailImgDiv").append('<div name="details" class="d-flex">' +
            '<input required name="detailImg" class="form-control w-50" type="file" value="">' +
            '<button class="btn btn-danger" name="delDetail">삭제하기</button>' +
            '    <img class="h-25 w-25" name="detailImg"/>' +
            '</div>')
    })

    $('#optDiv').on('click', 'button[name=delOptBtn]', function (e) {
        e.preventDefault();
        $(this).parents('div[name=opt]').remove()
    });
    $('#detailImgDiv').on('click', 'button[name=delDetail]', function (e) {
        e.preventDefault();
        $(this).parents('div[name=details]').remove()
    });

    $('#detailImgDiv').on('change', 'input[name=detailImg]', function (e) {
        console.log($($(e.target).parent()).find("img"))
        let input = e.target
        let fReader = new FileReader();
        fReader.readAsDataURL(input.files[0]);
        fReader.onloadend = function (event) {
            $($($(e.target).parent()).find("img[name=detailImg]")).attr("src", event.target.result);
            console.log("path: ", event.target.result);
        }
    });
</script>
</html>

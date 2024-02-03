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


<div class="container my-3">
    <form method="post" action="/product/productEdit.wow" enctype="multipart/form-data">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-9">

                    <h1 class="text-black mb-4">물품 정보 수정</h1>
                    <input type="text" hidden="hidden" value="${product.prodNo}" name="prodNo">
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
                                           class="form-control form-control-lg" value="${product.prodTitle}"/>
                                </div>

                                <div class="col-md-3 ps-5">
                                    <label for="prodPrice">
                                        <h6 class="mb-0">상품가격</h6>
                                    </label>

                                </div>
                                <div class="col-md-3 pe-5">
                                    <input type="number" id="prodPrice" name="prodPrice"
                                           class="form-control form-control-lg" value="${product.prodPrice}"/>
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
                                            <option value="${code.cateCode}" ${code.cateCode == product.prodCateCode?"selected":""}>${code.cateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-md-3 ps-5">
                                    <label for="prodContent">
                                        <h6 class="mb-0">상품설명</h6>
                                    </label>
                                </div>
                                <div class="col-md-3 pe-5">
                                    <textarea type="text" name="prodContent" id="prodContent"
                                              class="form-control form-control-lg">${product.prodContent}</textarea>
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <label for="boFiles">
                                    썸네일
                                </label>
                                <div class="d-flex">
                                    <input id="boFiles" class="form-control w-50" name="boFiles" type="file"
                                           value="">
                                    <img class="h-25 w-25"
                                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImgFileName}&filePath=${product.prodImgFilePath}"
                                         id="nowImg"/>
                                </div>
                            </div>

                            <hr class="mx-n3">
                            <div class="row align-items-center py-3">
                                <div id="detailImgDiv">
                                    <p>상품 상세 사진</p>
                                    <button class="btn btn-success" type="button" id="addDetail">사진 추가</button>
                                    <c:forEach items="${imgList}" var="img">
                                        <div name="details">
                                            <img class="" name="detailImg"
                                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${img.atchFileName}&filePath=${img.atchPath}"/>
                                            <input name="detailImg" type="file" value="" hidden="hidden">
                                            <button class="btn btn-danger" name="delDetail"
                                                    data-atch-no="${img.atchNo}">삭제하기
                                            </button>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <hr class="mx-n3">
                            <div class="py-4">
                                <button type="submit" class="btn btn-primary btn-lg">수정하기</button>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <div class="d-flex justify-content-evenly">

        <div>
            <a href="/product/modifyOpt.wow?prodNo=${product.prodNo}">
                <button class="btn btn-danger">옵션 수정하기</button>
            </a>
        </div>
        <div>
            <a href="/product/productDelete.wow?prodNo=${product.prodNo}">
                <button name="delProdBtm" class="btn btn-outline-danger">물품 삭제하기</button>
            </a>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/inc/script.jsp" %>
<%@include file="/WEB-INF/inc/footer.jsp" %>
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
    $("#addDetail").on("click", (e) => {
        e.preventDefault();
        $("#detailImgDiv").append('<div name="details">' +
            '   <img class="" name="detailImg"  />' +
            '<input  name="detailImg" type="file" value="">' +
            '<button className="btn btn-danger" name="delDetail">삭제하기</button>' +
            '</div>')
    })

    $('#detailImgDiv').on('click', 'button[name=delDetail]', function (e) {
        e.preventDefault();
        $btn = $(this);
        $btn.closest('div').html(
            '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no") + '" />'
        );
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

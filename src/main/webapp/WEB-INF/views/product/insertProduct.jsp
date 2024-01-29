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
<form method="post" action="/product/insertProduct.wow" enctype="multipart/form-data">

    <label for="prodTitle">상품명</label>
    <input type="text" name="prodTitle" id="prodTitle">

    <label for="prodContent">상품설명</label>
    <input type="text" name="prodContent" id="prodContent">

    <label for="prodPrice">상품가격</label>
    <input type="text" name="prodPrice" id="prodPrice">

    <label for="prodCateCode">상품구분</label>
    <select name="prodCateCode" id="prodCateCode">
        <c:forEach items="${codeList}" var="code" begin="2">
            <option value="${code.cateCode}">${code.cateName}</option>

        </c:forEach>
    </select>
    <div>

        <img class="" id="nowImg"  />
        <label for="boFiles">
            썸네일
        </label>
        <input id="boFiles" required name="boFiles" type="file" value="">
        <div id="detailImgDiv">
            <p>상품 상세 사진</p>
            <button class="btn btn-success" type="button" id="addDetail">사진 추가</button>
            <div name="details">
                <img class="" name="detailImg"  />
                <input required name="detailImg" type="file" value="">
                <button class="btn btn-danger" name="delDetail">삭제하기</button>
            </div>

        </div>

    </div>
    <div id="optDiv">
        <button id="addOpt">옵션 추가하기</button>
        <div class="opts" name="opt">
            <label>옵션1</label>
            <input type="text" name="optFirst">
            <label>옵션2</label>
            <input type="text" name="optSecond">
            <label>재고</label>
            <input type="number" name="optStock">
            <button class="btn btn-danger" name="delOptBtn">삭제하기</button>
        </div>
    </div>
    <button type="submit">ㄱㄱ</button>
</form>

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
        $("#optDiv").append('<div class="opts" name="opt"><label>옵션1</label>' +
            '<input type="text" name="optFirst" >' +
            '<label >옵션2</label>' +
            '<input type="text" name="optSecond" >' +
            '<label >재고</label>' +
            '<input type="number" name="optStock" >' +
            ' <button class="btn btn-danger" name="delOptBtn">삭제하기</button></div>')
    })
    $("#addDetail").on("click", (e) => {
        e.preventDefault();
        $("#detailImgDiv").append('<div name="details">' +
            '   <img class="" name="detailImg"  />'+
            '<input required name="detailImg" type="file" value="">' +
            '<button className="btn btn-danger" name="delDetail">삭제하기</button>' +
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
        let input =e.target
        let fReader = new FileReader();
        fReader.readAsDataURL(input.files[0]);
        fReader.onloadend = function (event) {
            $($($(e.target).parent()).find("img[name=detailImg]")).attr("src",event.target.result);
            console.log("path: ", event.target.result);
        }
    });
</script>
</html>

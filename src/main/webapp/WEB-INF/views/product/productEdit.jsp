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
${optList}
${product}
<form method="post" action="" enctype="multipart/form-data">
    <label for="prodTitle">제품명</label>
<input id="prodTitle" type="text" name="prodTitle" value="${product.prodTitle}">
    <label for="prodContent">간단소개</label>
<input id="prodContent" type="text" name="prodContent" value="${product.prodContent}">
    <label for="prodPrice">가격</label>
<input id="prodPrice" type="number" name="prodPrice" value="${product.prodPrice}">

    <label for="prodCateCode">분류</label>
    <select name="prodCateCode" id="prodCateCode">
        <c:forEach items="${codeList}" var="code" begin="2">
            <option value="${code.cateCode}" ${product.prodCateCode == code.cateCode?'selected':''}>${code.cateName}</option>
        </c:forEach>
    </select>

<div>
    <img class="" id="nowImg" src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImgFileName}&filePath=${product.prodImgFilePath}"/>
    <label for="boFiles">
        썸네일
    </label>
    <input id="boFiles"  name="boFiles" type="file" value="">
</div>
    <div id="detailImgDiv">
        <p>상품 상세 사진</p>
        <button class="btn btn-success" type="button" id="addDetail">사진 추가</button>
    <c:forEach items="${imgList}" var="img">
        <div name="details">
            <img class="" name="detailImg"   src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${img.atchFileName}&filePath=${img.atchPath}" />
            <input  name="detailImg" type="file" value="" hidden="hidden">
            <button class="btn btn-danger" name="delDetail" data-atch-no="${img.atchNo}">삭제하기</button>
        </div>
    </c:forEach>
    </div>

<button type="submit">수정하기</button>
</form>
<button name="delProdBtm" onclick="delProd()">삭제하기</button>
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
    $("#addDetail").on("click", (e) => {
        e.preventDefault();
        $("#detailImgDiv").append('<div name="details">' +
            '   <img class="" name="detailImg"  />'+
            '<input  name="detailImg" type="file" value="">' +
            '<button className="btn btn-danger" name="delDetail">삭제하기</button>' +
            '</div>')
    })

    $('#detailImgDiv').on('click', 'button[name=delDetail]', function (e) {
        e.preventDefault();
        $btn = $(this);
        $btn.closest('div').html(
            '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
        );
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

    delProd = ()=>{
        if (confirm("정말 제품을 삭제하시겠습니까?")){
            location.href = "/product/productDelete.wow?prodNo=${product.prodNo}"
        }
    }
</script>
</html>

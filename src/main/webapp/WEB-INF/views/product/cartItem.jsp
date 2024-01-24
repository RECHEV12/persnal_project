<%--
  Created by IntelliJ IDEA.
  User: pc12
  Date: 24. 1. 23.
  Time: 오후 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div name="cartItem" data-opt="${option.optNo}" class="m-auto border border-dark-subtle"
     style="display: flex; justify-content:center ;align-items: center; width: 80%; height: 15%">

    <div style="width: 3%;">
        <input type="checkbox" name="itemCheck">
    </div>
    <div class="mx-3" style="width: 15%;  text-align: center">
        <img class="img-thumbnail"
             src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImage}"
             style="height: 100%;"/>
    </div>
    <div class="mx-3" style="width: 50%">
        <div>
            ${product.prodTitle}
        </div>
        <div>
            <span>옵션1 : ${option.optFirst} / </span>
            <span>옵션2 : ${option.optSecond}</span>
        </div>
        <div>
            <span>
             재고 :
            </span>
            <span name="stock">${option.optStock}</span>
        </div>
    </div>
    <div class="d-flex" style="align-items: center; width: 20%" name="btnParent">
        <div class="text-center col-6">
            <div class=" ">
                수량
            </div>
            <div class="d-flex border-bottom">
                <button type="button" name="downBtn" class="btn btn-success"> <</button>
                <span><input name="prodCnt" type="number" style="width: 70%; " value="${itemCnt}"></span>
                <button type="button" name="upBtn" class="btn btn-success"> ></button>
            </div>
            <div class="">
                가격
            </div>
            <div name="prodPrice" data-price="${product.prodPrice}">${itemCnt * product.prodPrice}</div>
        </div>
        <div class=" text-center col-6">

            <button type="button" class="btn btn-danger" name="deleteItem">삭제</button>
        </div>
    </div>
</div>
<div>

</div>
</body>

</html>

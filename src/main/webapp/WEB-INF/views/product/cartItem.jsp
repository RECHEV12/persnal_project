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
<div name="cartItem" data-index="${index}" class="m-auto"
     style="display: flex; justify-content:center ;align-items: center; width: 80%; height: 10%">

    <div style="width: 3%;">
        <input type="checkbox">
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
    </div>
    <div class="d-flex" style="align-items: center" id="btnParent">
        <div>
            수량 : ${itemCnt}
        </div>
        <button type="button" class="btn btn-danger" name="deleteItem">삭제</button>
    </div>
</div>
<div>

</div>
</body>

</html>

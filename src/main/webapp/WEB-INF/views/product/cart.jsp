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
<%
    UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
    request.setAttribute("loginUserId", userInfo.getUserId());
%>
<div>
    <div id="cartBox">
        <div name="noCartItem">현재 아이템이 없습니다</div>
    </div>
    <form action="/user/signUp.wow" method="post">


    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    $(document).ready(
        () => {

            let list = JSON.parse(localStorage.getItem("cart"));
            list.map((v, i) => {
                if (v.userId === "${loginUserId}") {
                    $("div [name=noCartItem]").remove();
                    let data = {index: i, prodNo: v.prodNo, optNo: v.optNo, itemCnt: v.nowCnt}
                    let div = document.createElement("div")
                    $(div).load("/product/getCartItem", data)
                    $("#cartBox").append(div)
                    console.log($(div).find("#btnParent"))
                } else {

                }

            })
        }
    )
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name="deleteItem"]', function (e) {
            console.log("Delete button clicked");
            const parent  = $($(e.target).parent()).parent();
            $(parent).remove();
            console.log($(parent).data("index"))
            // localStorage.key(

        });
    });



</script>
</html>

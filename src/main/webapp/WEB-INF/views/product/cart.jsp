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

    </div>
    <form action="/user/signUp.wow" method="post">


    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    let cartEmpty = 0;
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
                    cartEmpty++;
                } else {

                }

            })
        }
    )
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name="deleteItem"]', function (e) {
            console.log("Delete button clicked");
            const parent = $($(e.target).parent()).parent();

            let list = JSON.parse(localStorage.getItem("cart"))
            let deleteList = list.filter((values) => {
                return values.userId === "${loginUserId}" && values.optNo !== $(parent).data("opt")
            })
            console.log(deleteList)
            $(parent).remove();
            localStorage.setItem("cart", JSON.stringify(deleteList))

            cartNum();
            cartEmpty--;
            addEmptyDiv();
        });
    });
    const addEmptyDiv = () => {
        console.log(cartEmpty)
        if (cartEmpty === 0) {
            let div = "<div name='noCartItem'>현재 아이템이 없습니다</div>"
            $("#cartBox").append(div);
        }
    }
    addEmptyDiv()

</script>
</html>

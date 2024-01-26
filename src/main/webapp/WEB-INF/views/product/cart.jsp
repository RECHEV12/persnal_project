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
        <c:forEach items="${cartList}" var="cart">
            <div
                    name="cartItem"
                    data-opt="${cart.optNo}"
                    class="m-auto border border-dark-subtle"
                    style="display: flex; justify-content:center ;align-items: center; width: 80%; height: 15%"
            >

                <div style="width: 3%;">
                    <input type="checkbox" name="itemCheck" ${cart.cartCheck=='Y'?'checked':''}>
                </div>
                <div class="mx-3" style="width: 15%;  text-align: center">
                    <img class="img-thumbnail"
                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImgFileName}&filePath=${cart.prodImgFilePath}"
                         style="height: 100%;"/>
                </div>
                <div class="mx-3" style="width: 50%">
                    <div>
                            ${cart.prodTitle}
                    </div>
                    <div>
                        <span>옵션1 : ${cart.optFirst} / </span>
                        <span>옵션2 : ${cart.optSecond}</span>
                    </div>
                    <div>
            <span>
             재고 :
            </span>
                        <span name="stock">${cart.optStock}</span>
                    </div>
                </div>
                <div class="d-flex" style="align-items: center; width: 20%" name="btnParent">
                    <div class="text-center col-6">
                        <div class=" ">
                            수량
                        </div>
                        <div class="d-flex border-bottom">
                            <button type="button" name="downBtn" class="btn btn-success"> <</button>
                            <span><input name="prodCnt" type="number" style="width: 70%; "
                                         value="${cart.nowCnt}"></span>
                            <button type="button" name="upBtn" class="btn btn-success"> ></button>
                        </div>
                        <div class="">
                            가격
                        </div>
                        <div name="prodPrice" data-price="${cart.prodPrice}">${cart.nowCnt * cart.prodPrice}</div>
                    </div>
                    <div class=" text-center col-6">
                        <button type="button" class="btn btn-danger" name="deleteItem">삭제</button>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
    <div>
        <span> 가격 : </span><span id="totalPrice"></span>
    </div>

    <a href="/product/buyItem.wow?userId=${loginUserId}">
        <button type="submit" class="btn btn-success">구매하기</button>
    </a>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    let cartEmpty = ${cartList.size()};
    // 삭제버튼에 기능 추가
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name="deleteItem"]', function (e) {
            console.log("Delete button clicked");
            const parent = $($($(e.target).parent()).parent()).parent();

            $.ajax({
                url: "/cart/deleteCartItem",
                data: {userId: "${loginUserId}", optNo: $(parent).data("opt")},
                success: function (resultRow) {
                    console.log("삭제", resultRow)
                    alert("장바구니에서 삭제되었습니다.")
                }
            })
            cartNum();
            $(parent).remove();

            cartEmpty--;
            addEmptyDiv();
        });
    });

    // 비어있을 경우 빈 화면 보여주기
    const addEmptyDiv = () => {
        if (cartEmpty === 0) {
            let div = "<div name='noCartItem'>현재 아이템이 없습니다</div>"
            $("#cartBox").append(div);
        }
    }
    addEmptyDiv();


    $(document).ready(() => {
        $("#cartBox").on("click", 'input[name="itemCheck"]', function (e) {
            let checked;
            const optNo = $($(e.target).parents("div[name=cartItem]")).data("opt");
            if ($(e.target).prop('checked')) {
                console.log("체크")
                checked = "Y"

            } else {
                checked = "N"
            }
            $.ajax({
                url: "/cart/cartItemSetChecked",
                data: {userId: "${loginUserId}", optNo: Number(optNo), check: checked},
                success: function (resultRow) {

                }
            })

        });
    });


    // 체크박스별로 가격 합산 함수
    $(document).ready(() => {
        $("#cartBox").on("click", 'input[name=itemCheck]', function (e) {
            sumPrice();
        });
    });

    //가격 합산 함수
    const sumPrice = () => {
        let sum = 0;
        $("input[name=itemCheck]").map((i, v) => {
            if ($(v).prop('checked')) {
                let parent = $($(v).parent()).parent()
                let checkPrice = $($(parent).find("div[name=prodPrice]")).text()
                sum += Number(checkPrice);
            }
        })
        $("#totalPrice").text(sum)
    }
    sumPrice();

    //다운버튼
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name=downBtn]', function (e) {
            e.preventDefault();
            const numberInput = $($($(e.target).parent()).find("input"))
            const optNo = $($(e.target).parents("div[name=cartItem]")).data("opt");
            const nowCnt = Number(numberInput.val());
            if (nowCnt !== 1) {

                numberInput.val(nowCnt - 1)
                changePrice(e, numberInput.val());
                sumPrice();
                changeStorageCnt(optNo, numberInput.val())
            }


        });
    });

    //가격 변동 함수
    const changePrice = (e, cnt) => {
        const priceDiv = $($($($(e.target).parent()).parent()).find("div[name=prodPrice]"))
        const btnParent = priceDiv.data("price")
        priceDiv.text(btnParent * cnt)
    }
    // 갯수 변경 스토리지 적용 함수
    const changeStorageCnt = (optNo, changeCnt) => {
        $.ajax({
            url: "/cart/changeCnt",
            data: {userId: "${loginUserId}", optNo: Number(optNo), cnt: Number(changeCnt)},
            success: function (resultRow) {
                console.log("갯수변경", resultRow)
            },
            error: (err) => {
                console.log(err)
            }
        })
    }
    //업버튼
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name=upBtn]', function (e) {
            e.preventDefault();
            const numberInput = $($($(e.target).parent()).find("input"))
            const stockSpan = $($($(e.target).parents("div[name=cartItem]")).find("span[name=stock]"))
            const optNo = $($(e.target).parents("div[name=cartItem]")).data("opt");
            const thisOptCnt = Number(stockSpan.text())
            const nowCnt = Number(numberInput.val());
            if (!(thisOptCnt <= nowCnt)) {
                numberInput.val(nowCnt + 1)
                changePrice(e, numberInput.val());
                sumPrice();
                changeStorageCnt(optNo, numberInput.val())

            }

        });
    });
    //
</script>
</html>

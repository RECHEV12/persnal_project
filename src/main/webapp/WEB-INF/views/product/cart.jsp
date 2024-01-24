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
    <div>
        <span> 가격 : </span><span id="totalPrice"></span>
    </div>
    <a href="/product/buyItem.wow">
        <button class="btn btn-success">구매하기</button>
    </a>
    <form action="/user/signUp.wow" method="post">


    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    let cartEmpty = 0;
    //장바구니 로드
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
                }

            })
        }
    )

    // 삭제버튼에 기능 추가
    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name="deleteItem"]', function (e) {
            console.log("Delete button clicked");
            const parent = $($($(e.target).parent()).parent()).parent();

            let list = JSON.parse(localStorage.getItem("cart"))
            let deleteList = list.filter((values) => {
                return !(values.userId === "${loginUserId}" && values.optNo === $(parent).data("opt"))
            })

            $(parent).remove();
            localStorage.setItem("cart", JSON.stringify(deleteList))

            cartNum();
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
            if (nowCnt === 1) {
                alert("1이하로 내려갈 수 없습니다.")
            } else {
                numberInput.val(nowCnt - 1)
                changePrice(e, numberInput.val());
                sumPrice();
                changeStorageCnt(optNo,numberInput.val())
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
    const changeStorageCnt = (optNo,changeCnt) => {
        let list = JSON.parse(localStorage.getItem("cart"))
         list.map((v,i) => {

            if (v.userId === "${loginUserId}" && v.optNo === optNo) {
                v.nowCnt = changeCnt;
                list[i] = v;
            }
        })
        localStorage.setItem("cart", JSON.stringify(list))
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
            if (thisOptCnt <= nowCnt) {
                alert("현재 재고 이상으로 구매할 수 없습니다.")
            } else {
                numberInput.val(nowCnt + 1)
                changePrice(e, numberInput.val());
                sumPrice();
                changeStorageCnt(optNo,numberInput.val())

            }

        });
    });
    //
</script>
</html>

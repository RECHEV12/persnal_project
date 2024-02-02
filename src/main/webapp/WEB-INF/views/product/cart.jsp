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

<div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12">
            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                <div class="card-body p-0">
                    <div class="row g-0">
                        <div class="">
                            <div class="p-5" id="cartBox">
                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h1 class="fw-bold mb-0 text-black">장바구니</h1>
                                    <h6 class="mb-0 text-muted" id="cartTotalCnt"></h6>
                                </div>
                                <hr class="my-4">
                                <c:forEach items="${cartList}" var="cart">
                                    <div name="cartItem"
                                         data-opt="${cart.optNo}"
                                         class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div style="width: 3%;">
                                            <input type="checkbox"
                                                   name="itemCheck" ${cart.cartCheck=='Y'?'checked':''}>
                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                    src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImgFileName}&filePath=${cart.prodImgFilePath}"
                                                    class="img-fluid rounded-3">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted"> ${cart.prodTitle}</h6>
                                            <h6 class="text-black mb-0"><span>옵션1 : ${cart.optFirst} / </span>
                                                <span>옵션2 : ${cart.optSecond}</span></h6>
                                            <h6 class="text-black mb-0">재고 : ${cart.optStock}</h6>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button type="button" name="downBtn" class="btn btn-success"> <
                                            </button>

                                            <input name="prodCnt" value="${cart.nowCnt}" type="number"
                                                   class="form-control form-control-sm"/>

                                            <button type="button" name="upBtn" class="btn btn-success" data-stock="${cart.optStock}"> >
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1" name="prodPrice"
                                             data-price="${cart.prodPrice}">${cart.nowCnt * cart.prodPrice}
                                        </div>
                                        <div class="text-end">
                                            <button type="button" class="btn btn-danger" name="deleteItem">삭제
                                            </button>
                                        </div>
                                        <hr class="my-4">
                                    </div>
                                </c:forEach>
                                <div class="pt-5">
                                    <h6 class="mb-0"><a href="/product/productSearch.wow" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                </div>
                                <div class="p-5">


                                    <hr class="my-4">
                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5><span id="totalPrice"></span></h5>
                                    </div>
                                    <a href="/product/buyItem.wow?userId=${loginUserId}">
                                        <button type="button" class="btn btn-success btn-success btn-lg"
                                                data-mdb-ripple-color="green">구매하기
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>

    // 삭제버튼에 기능 추가

    $(document).ready(() => {
        $("#cartBox").on("click", 'button[name="deleteItem"]', function (e) {
            const parent = $($(e.target).closest("div[name=cartItem]"));
            console.log(parent.data("opt"))
            $.ajax({
                url: "/cart/deleteCartItem",
                data: {userId: "${loginUserId}", optNo: parent.data("opt")},
                success: function (resultRow) {
                    console.log("삭제", resultRow)
                    alert("장바구니에서 삭제되었습니다.")
                }
            })
            cartNum();
            setTotalItemCnt();
            parent.remove();
            sumPrice()

        });
    });
     const setTotalItemCnt = ()=>{
         let userId = $("#getUserTag").data("userId") || ""
         $.ajax({
             url:"/cart/cartCount",
             data:{userId : userId},
             success:function (result){
                 console.log(result)
                 $("#cartTotalCnt").text(result + " items");

             }
         })

    }
setTotalItemCnt();

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
            console.log("parent", )
            if ($(v).prop('checked')) {
                let checkPrice = $($($(v).parents("div[name=cartItem]")).find("div[name=prodPrice]")).text()
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
            const optNo = $($(e.target).parents("div[name=cartItem]")).data("opt");
            const nowCnt = Number(numberInput.val());
            const stock = $(e.target).data("stock")

            if (!(stock <= nowCnt)) {
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

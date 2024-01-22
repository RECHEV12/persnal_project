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
<body>
<!-- Product section-->
<section>
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="img-thumbnail"
                                       src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImage}"
                                       style="height: 600px;width: 600px"/></div>
            <div class="col-md-6">
                <a href="/user/userProfile.wow?userId=${product.prodUserId}">
                    <div class="small mb-1">${product.prodUserName}</div>
                </a>
                <h1 class="display-5 fw-bolder">${product.prodTitle}</h1>
                <div class="fs-5 mb-5" style="display: flex">

                    <div class="col-6" style="text-align: left">
                        <%--                    <span class="text-decoration-line-through">$45.00</span>--%>
                        <span>${product.prodPrice}원</span>
                    </div>

                    <div class="col-6" style="text-align: right">
                        <span>ㅁㄴㅇㄹ</span>
                    </div>
                </div>
                <div>
                    <select id="firstOpt" class="form-select" aria-label="Default select example">
                        <option value="blank">옵션 1</option>
                        <c:forEach items="${optFirst}" var="optOne">
                            <option value="${optOne}">${optOne}</option>
                        </c:forEach>

                    </select>
                    <select id="secondOpt" class="form-select" aria-label="Default select example">
                        <option value="blank">옵션 2</option>
                        <c:forEach items="${optSecond}" var="optTwo">
                            <option value="${optTwo}">${optTwo}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="p-3 text-success-emphasis bg-success-subtle border border-success-subtle rounded-3"
                     id="optDiv">
                    <div>옵션1 : <span id="showFirstOpt">옵션을 선택해주세요</span></div>
                    <div>옵션2 : <span id="showSecondOpt">옵션을 선택해주세요</span></div>
                    <div data-prod-no="${product.prodNo}" id="priceDiv" hidden="hidden">
                        <div>
                            <span>가격 :
                                <span id="price">${product.prodPrice}</span>
                            </span>
                            <span>재고 :
                                <span id="stock"></span>
                            </span>
                        </div>
                        <div>
                            <button type="button" id="downBtn" class="btn btn-success"> <</button>
                            <span><input id="prodCnt" type="number" style="width: 10%;"></span>
                            <button type="button" id="upBtn" class="btn btn-success"> ></button>
                        </div>
                    </div>


                </div>
                <div class="my-4">
                    <div class="d-flex">

                        <button id="cart" class="btn btn-outline-dark flex-shrink-0 col-6" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                        </button>

                        <button id="buyNow" class="btn btn-outline-dark flex-shrink-0 col-6" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            바로구매
                        </button>
                    </div>


                </div>
                <div class="my-2">
                    배송비 : 무료배송
                </div>
                <div class="my-2">
                    배송일 3일 이내
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5">
            <ul class="nav nav-tabs px-4 px-lg-5 my-5">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" name="prodView">상품정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" name="prodView">리뷰</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" name="prodView">문의</a>
                </li>
            </ul>
        </div>
    </div>
</section>
${product}

</body>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
<script>
    let thisOptCnt = 0;
    let nowProdNo = $("#priceDiv").data("prodNo");
    let nowOptNo = 0;
    let nowPrice = Number($("#price").text());
    //첫번째 옵션 선택
    $("#firstOpt").on("change", (e) => {
        let text = $(e.target).val()
        if (text === "blank") {
            $("#showFirstOpt").text("옵션을 선택해주세요")
            $("#showSecondOpt").text("옵션을 선택해주세요")
            $("#priceDiv").attr("hidden", "hidden")
            $("#secondOpt").val("blank")
        } else {
            $("#showFirstOpt").text(text);
            $("#secondOpt").val("blank")
            $("#priceDiv").attr("hidden", "hidden")
            $("#showSecondOpt").text("옵션을 선택해주세요")
        }
    })

    //두번째 옵션 선택
    $("#secondOpt").on("change", (e) => {
        let text = $(e.target).val();
        if ($("#showFirstOpt").text() === "옵션을 선택해주세요") {
            alert("1번 옵션을 선택해주세요");
            $("#secondOpt").val("blank")
        } else {
            if (text === "blank") {
                $("#showSecondOpt").text("옵션을 선택해주세요");
                $("#priceDiv").attr("hidden", "hidden")

            } else {
                $("#showSecondOpt").text(text);
                $("#priceDiv").removeAttr("hidden")
                $("#prodCnt").val(1);
                changePrice();
                //전부설정 확인시 아작스 통신
                $.ajax({
                    url: "/prod/getProdPrice.wow",
                    // contentType : "application/json; charset:UTF-8",
                    data: {
                        prodNo: $("#priceDiv").data("prodNo"),
                        opt_first: $("#firstOpt").val(),
                        opt_second: $("#secondOpt").val()
                    },
                    success: function (product) {
                        thisOptCnt = product.optStock;
                        nowOptNo = product.optNo;
                        $("#stock").text(product.optStock);
                    }
                })


            }

        }
    })

    // 갯수 올리기 버튼
    $("#downBtn").on("click", (e) => {
        e.preventDefault();
        const nowCnt = Number(($("#prodCnt").val()));
        if (nowCnt === 1) {
            alert("1이하로 내려갈 수 없습니다.")
        } else {
            $("#prodCnt").val(nowCnt - 1)
            changePrice();
        }

    })
    // 갯수 내리기 버튼
    $("#upBtn").on("click", (e) => {
        e.preventDefault();
        const nowCnt = Number($("#prodCnt").val());
        console.log(nowCnt)
        if (thisOptCnt <= nowCnt) {
            alert("현재 재고 이상으로 구매할 수 없습니다.")
        } else {
            $("#prodCnt").val(nowCnt + 1)
            changePrice();
        }
    })
    //가격 변동 함수
    const changePrice = () => {
        $("#price").text(nowPrice * Number($("#prodCnt").val()))
    }
    $("#cart").on("click", (e) => {
        e.preventDefault();
        let chk = $("#priceDiv").attr("hidden") == undefined;

        if (chk) {
            const cartItem = {
                userId: "<%=((UserVO)session.getAttribute("USER_INFO")).getUserId()%>",
                prodNo: nowProdNo,
                optNo: nowOptNo,
                nowCnt: $("#prodCnt").val()
            };
            let list = JSON.parse(localStorage.getItem("cart")) || [];
            let dupleChk = 0;
            if (list !== []) {
                //동일상품 체크
                list.map((v, i) => {
                    console.log(v)
                    if (cartItem.userId === v.userId && cartItem.optNo === v.optNo) {
                        dupleChk++;
                    }
                })
            }
            console.log(dupleChk)
            if (dupleChk == 0) {
                //동일한 상품 없음
                list.push(cartItem)
                // 상품번호
                // 옵션번호
                // 갯수
                $("#showFirstOpt").text("옵션을 선택해주세요")
                $("#showSecondOpt").text("옵션을 선택해주세요")
                $("#secondOpt").val("blank")
                $("#firstOpt").val("blank")
                $("#priceDiv").attr("hidden", "hidden")
                localStorage.setItem("cart", JSON.stringify(list))
                alert("장바구니에 상품이 추가되었습니다.")
            } else {
                alert("동일 상품이 장바구니에 있습니다.")
            }
        } else {
            alert("옵션과 수량을 선택해주세요")
        }
    })

    $("#buyNow").on("click", (e) => {
        e.preventDefault();
console.log(JSON.parse(localStorage.getItem("cart")).length)
        // window.location.href = "/product/cart.wow"
    })
</script>
</html>

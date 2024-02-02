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
<%
    UserVO nowUser = (UserVO) session.getAttribute("USER_INFO");
    request.setAttribute("nowUserId", nowUser.getUserId());
%>
<!-- Product section-->
<section>
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="img-thumbnail"
                                       src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImgFileName}&filePath=${product.prodImgFilePath}"
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
                        <button type="button" class="btn btn-link" onclick="copyToClipboard()" data-page="${page}">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-1.785 -1.785 50 50" height="50" width="50"><g id="share-link--share-transmit"><path id="Vector" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M9.120178571428573 30.676964285714288C13.241305371428574 30.676964285714288 16.58214285714286 27.336126800000002 16.58214285714286 23.215000000000003S13.241305371428574 15.753035714285716 9.120178571428573 15.753035714285716 1.6582142857142859 19.0938732 1.6582142857142859 23.215000000000003s3.340837485714286 7.461964285714286 7.461964285714286 7.461964285714286Z" stroke-width="3.57"></path><path id="Vector_2" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M37.30982142857143 44.77178571428572c4.120994142857143 0 7.461964285714286 -3.3409701428571434 7.461964285714286 -7.461964285714286S41.430815571428575 29.847857142857144 37.30982142857143 29.847857142857144 29.847857142857144 33.18882728571429 29.847857142857144 37.30982142857143s3.3409701428571434 7.461964285714286 7.461964285714286 7.461964285714286Z" stroke-width="3.57"></path><path id="Vector_3" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M37.30982142857143 16.58214285714286c4.120994142857143 0 7.461964285714286 -3.340837485714286 7.461964285714286 -7.461964285714286S41.430815571428575 1.6582142857142859 37.30982142857143 1.6582142857142859 29.847857142857144 4.999051771428572 29.847857142857144 9.120178571428573 33.18882728571429 16.58214285714286 37.30982142857143 16.58214285714286Z" stroke-width="3.57"></path><path id="Vector_4" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="m15.786233164285717 19.89857142857143 14.857600000000003 -7.461964285714286" stroke-width="3.57"></path><path id="Vector_5" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="m15.786233164285717 26.531428571428574 14.857600000000003 7.461964285714286" stroke-width="3.57"></path></g></svg>
                        </button>
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
                    <a href="/ask/insertAsk.wow?prodNo=${product.prodNo}">문의하기</a>
                </div>
                <div class="my-2">
                    배송일 3일 이내
                </div>
                <div>
                    <c:if test="${product.prodUserId==nowUserId}">
                        <a href="/product/productEdit.wow?prodNo=${product.prodNo}">

                        <button class="btn btn-dark">제품 정보 수정</button>
                        </a>
                    </c:if>
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
        <div id="showTab">

        </div>
    </div>
</section>
</body>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
<script>


    let thisOptCnt = 0;
    let nowProdNo = $("#priceDiv").data("prodNo");
    let nowOptNo = 0;
    let nowPrice = Number($("#price").text());

    //탭 변경 = 클래스 이름 변경
    const changeTab = (e) => {
        $("a[name=prodView] ").map((i, v) => {
            $(v).attr("class", "nav-link");
        })
        $($(e.target)).attr("class", "nav-link active")
        showTab();
    }

    // 아작스 로딩
    const showTab = () => {
        $("a[name=prodView] ").map((i, v) => {
            if ($(v).attr("class") === "nav-link active") {
                let nowTabTitle = $(v).text();
                console.log(nowTabTitle)
                $("#showTab").load("/product/tabShow.wow", {
                    title: nowTabTitle,
                    prodNo: String(nowProdNo),
                    curPage: 1,
                    prodUserId: '${product.prodUserId}'
                })
            }

        })

    }
    showTab();

    // 각 탭에 클릭이벤트
    $("a[name=prodView] ").map((i, v) => {
        $(v).on("click", (e) => changeTab(e))
    })


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
                        console.log(product == "")
                        if (product != "") {
                            thisOptCnt = product.optStock;
                            nowOptNo = product.optNo;
                            $("#stock").text(product.optStock);
                            $("#prodCnt").val(Number($("#stock").text()) === 0 ? 0 : 1);
                            changePrice();
                        } else {
                            $("#showFirstOpt").text("옵션을 선택해주세요")
                            $("#showSecondOpt").text("옵션을 선택해주세요")
                            $("#secondOpt").val("blank")
                            $("#firstOpt").val("blank")
                            $("#priceDiv").attr("hidden", "hidden")
                            alert("없는 상품입니다")
                        }
                    }
                })


            }

        }
    })

    // 갯수 내리기 버튼
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
    // 갯수 올리기 버튼
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
                userId: "${nowUserId}",
                prodNo: Number(nowProdNo),
                optNo: Number(nowOptNo),
                nowCnt: Number($("#prodCnt").val())
            };
            //동일상품 체크

            $.ajax({
                url: "/cart/cartItemDupleCheck",
                data: {userId: cartItem.userId, optNo: cartItem.optNo},
                success: function (resultRow) {
                    if (resultRow === 0) {
                        $.ajax({
                            url: "/cart/addCart",
                            data: cartItem,
                            success: function (resultRow) {
                                console.log("카트에 추가", resultRow)
                                $("#showFirstOpt").text("옵션을 선택해주세요")
                                $("#showSecondOpt").text("옵션을 선택해주세요")
                                $("#secondOpt").val("blank")
                                $("#firstOpt").val("blank")
                                $("#priceDiv").attr("hidden", "hidden")
                                cartNum();
                                alert("장바구니에 상품이 추가되었습니다.")
                            },
                            error: (err) => {
                                console.log(err)
                            }
                        })
                    } else {
                        console.log("추가실패")
                        alert("동일 상품이 장바구니에 있습니다.")
                    }


                }
            })
        } else {
            alert("옵션과 수량을 선택해주세요")
        }
    })

    $("#buyNow").on("click", (e) => {
        e.preventDefault();

        const cartItem = {
            userId: "${nowUserId}",
            prodNo: Number(nowProdNo),
            optNo: Number(nowOptNo),
            nowCnt: Number($("#prodCnt").val())
        };
        //동일상품 체크

        $.ajax({
            url: "/cart/cartItemDupleCheck",
            data: {userId: cartItem.userId, optNo: cartItem.optNo},
            success: function (resultRow) {
                if (resultRow === 0) {
                    $.ajax({
                        url: "/cart/addCart",
                        data: cartItem,
                        success: function (resultRow) {
                            console.log("카트에 추가", resultRow)
                        },
                        error: (err) => {
                            console.log(err)
                        }
                    })
                    $("#showFirstOpt").text("옵션을 선택해주세요")
                    $("#showSecondOpt").text("옵션을 선택해주세요")
                    $("#secondOpt").val("blank")
                    $("#firstOpt").val("blank")
                    $("#priceDiv").attr("hidden", "hidden")
                    cartNum();
                    window.location.href = "/cart/cart.wow?userId=${nowUserId}"

                } else {
                    console.log("추가실패")
                    alert("동일 상품이 장바구니에 있습니다.")
                }


            }
        })


    })

    function copyToClipboard() {
        let tempInput = document.createElement("input");
        tempInput.setAttribute("value", window.location.href);
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand("copy");
        document.body.removeChild(tempInput);
        alert("URL을 복사했습니다.");
    }

</script>

</html>

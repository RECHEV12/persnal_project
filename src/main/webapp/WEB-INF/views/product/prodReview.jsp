<%@ page import="com.study.user.vo.UserVO" %>
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
<%
    UserVO nowUser = (UserVO) session.getAttribute("USER_INFO");
    request.setAttribute("nowUserId", nowUser.getUserId());
%>
<div id="reviMainBox">


    <c:forEach items="${reviewsList}" var="review">
        <div class="border border-success-subtle " name="reviewBox" data-revi-no="${review.reviNo}"
             data-parent="${review.reviParentNo}" data-buy-no="${review.buyNo}" data-opt-no="${review.optNo}">
            <div class="" name="top">
                <div class="d-flex" name="userInfo">
                    <p>
                            ${review.userName}
                    </p>
                    <p>
                        || 별점 : <span name="stars">${review.reviStar}</span>
                    </p>

                    <c:forEach items="${optList}" var="opt">
                        <c:if test="${review.optNo == opt.optNo}">

                            <p>
                                옵션1${opt.optFirst}
                            </p>
                            <p>
                                옵션2${opt.optSecond}
                            </p>
                        </c:if>
                    </c:forEach>
                </div>
                <div name="imgDiv">
                    <c:forEach items="${reviImgList}" var="reviImg">
                        <c:if test="${reviImg.atchParentNo == review.reviNo}">
                            <img class=""
                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${reviImg.atchFileName}&filePath=${reviImg.atchPath}"
                                 style="height: 30%;width: 30%"/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="d-flex" name="bottom">
                <div name="reviContent">${review.reviContent}</div>
                <div>
                    <c:if test="${nowUserId == review.reviUserId}">
                        <div class="modal fade" id="id_review_edit_modal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <form name="frm_reply_edit"
                                          method="post"
                                          onclick="return false;">
                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-dismiss="modal"
                                                    onclick="closModal()"></button>
                                            <h4 class="modal-title">리뷰수정</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <label for="star1">1</label>
                                                <input type="radio" name="reviStar" id="star1" value="1">
                                                <label for="star2">2</label>
                                                <input type="radio" name="reviStar" id="star2" value="2">
                                                <label for="star3">3</label>
                                                <input type="radio" name="reviStar" id="star3" value="3">
                                                <label for="star4">4</label>
                                                <input type="radio" name="reviStar" id="star4" value="4">
                                                <label for="star5">5</label>
                                                <input type="radio" name="reviStar" id="star5" value="5" checked>
                                            </div>
                                            <textarea rows="3" name="reviContent"
                                                      class="form-control">${review.reviContent}</textarea>
                                            <input type="hidden" name="reviNo" value="${review.reviNo}">
                                        </div>
                                        <div class="modal-footer">
                                            <button id="btn_reply_modify" type="button"
                                                    class="btn btn-sm btn-info">저장
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm"
                                                    data-dismiss="modal" onclick="closModal()">닫기
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-secondary" name="modifyReview">수정</button>
                        <button type="button" class="btn btn-danger" name="deleteReview">삭제</button>
                    </c:if>
                </div>
            </div>

        </div>
    </c:forEach>
    <nav class="text-center">
        <ul class="pagination">

            <!-- 첫 페이지  -->
            <li>
                <button type="button" onclick="goFirst()" data-page="1">
                    <span aria-hidden="true">&laquo;</span>
                </button>
            </li>

            <!-- 이전 페이지 -->
            <c:if test="${paging.firstPage != 1}">
                <li>
                    <button type="button" onclick="goBefore()"
                            data-page="${paging.firstPage - 1}">
                        <span aria-hidden="true">&lt;</span>
                    </button>
                </li>
            </c:if>

            <!-- 페이지 넘버링  -->
            <c:forEach var="page" begin="${paging.firstPage}" end="${paging.lastPage}">
                <li ${paging.curPage==page ?"class='active'":""}>
                    <button type="button" onclick="goPage(${page})"
                            data-page="${page}">
                            ${page}
                    </button>
                </li>
            </c:forEach>
            <!-- 다음  페이지  -->
            <c:if test="${paging.lastPage != paging.totalPageCount}">
                <li>
                    <button type="button" onclick="goAfter()"
                            data-page="${paging.lastPage + 1}">
                        <span aria-hidden="true">&gt;</span>
                    </button>

                </li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li>
                <button onclick="goLast()" data-page="${paging.totalPageCount}">
                    <span aria-hidden="true">&raquo;</span>
                </button>
            </li>
        </ul>
    </nav>
</div>
</body>
<script>
    goFirst = () => {
        $("#showTab").load("/product/tabShow.wow", {title: "리뷰", prodNo: String(nowProdNo), curPage: 1 })
    }
    goLast = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "리뷰",
            prodNo: String(nowProdNo),
            curPage:${paging.totalPageCount}
        })

    }
    goBefore = () => {

        $("#showTab").load("/product/tabShow.wow", {title: "리뷰", prodNo: String(nowProdNo), curPage: ${paging.firstPage - 1}})

    }
    goAfter = () => {
        $("#showTab").load("/product/tabShow.wow", {title: "리뷰", prodNo: String(nowProdNo), curPage: ${paging.lastPage + 1}})

    }
    goPage = (number) => {
        $("#showTab").load("/product/tabShow.wow", {title: "리뷰", prodNo: String(nowProdNo), curPage: number})

    }
    $("#reviMainBox").on("click", 'button[name="deleteReview"]', function (e) {
        if (confirm("정말 삭제하시겠습니까?")) {
            const dataPack = $($(e.target).parents("div[name=reviewBox]"))
            $.ajax({
                url: "/reviews/deleteReview.wow",
                data: {
                    reviNo: Number(dataPack.data("reviNo"))
                },
                method: 'POST',
                success: function (resultRow) {
                    if (resultRow == 1) {
                        $.ajax({
                            url: "/reviews/deleteReviNo.wow",
                            method: 'POST',
                            data: {
                                parentNo: Number(dataPack.data("parent")),
                                buyNo: Number(dataPack.data("buyNo")),
                                optNo: Number(dataPack.data("optNo")),
                                userId: '${nowUserId}'
                            },
                            success: function (rows) {
                                console.log("리뷰 지우기", rows)

                            },
                            error: (err) => {
                                console.log(err)
                            }
                        })
                        $.ajax({
                            url: "/reviews/deleteReviewAttach.wow",
                            method: 'POST',
                            data: {
                                parentNo: Number(dataPack.data("parent")),
                                reviNo: Number(dataPack.data("reviNo"))
                            },
                            success: function (rows) {
                                console.log("리뷰 지우기", rows)

                            },
                            error: (err) => {
                                console.log(err)
                            }
                        })
                    }
                }
            })
            $($(e.target).parents("div[name=reviewBox]")).remove()
        }

    })
    $("#reviMainBox").on("click", 'button[name="modifyReview"]', function (e) {
        $("#id_review_edit_modal").modal('show');
    })
    $("#btn_reply_modify").on("click", function (e) {
        const $form = $("form[name='frm_reply_edit']")
        $.ajax({
            url: "/reviews/modifyReview.wow",
            data: $form.serialize(),
            method: 'POST',
            success: function (resultRow) {
                console.log(resultRow)
                showTab()
                closModal();
            },
            error: function (ddd) {
                console.log(ddd)
            }
        })
    });

    closModal = () => {
        $("#id_review_edit_modal").modal('hide');
    }

</script>
</html>

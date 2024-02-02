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

<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-12 col-lg-10">
            <div class=" text-dark" id="reviMainBox">
                <h4 class="mb-0">리뷰</h4>
                <p class="fw-light mb-4 pb-2">총별점 : ${totalStar=='NaN'?'리뷰없음':totalStar}</p>
<%--                <p class="fw-light mb-4 pb-2">리뷰 개수 : ${reviewsList.size()}</p>--%>
                <c:forEach items="${reviewsList}" var="review">
                    <div class="card-body p-4" name="reviewBox" data-revi-no="${review.reviNo}"
                         data-parent="${review.reviParentNo}" data-buy-no="${review.buyNo}"
                         data-opt-no="${review.optNo}" data-content="${review.reviContent}"
                         data-star="${review.reviStar}">
                        <div class="d-flex flex-start" name="top">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${reviImg.atchFileName}&filePath=${reviImg.atchPath}"
                                 alt="avatar"
                                 width="60"
                                 height="60"/>
                            <div>
                                <h6 class="fw-bold mb-1"> ${review.userName}</h6>
                                <div class="d-flex align-items-center mb-3">
                                    <p class="mb-0">
                                            ${review.reviRegDate}
                                        <span class="badge bg-warning">별점 : <span name="stars">${review.reviStar}</span></span>
                                        <c:forEach items="${optList}" var="opt">
                                            <c:if test="${review.optNo == opt.optNo}">
                                            <span class="badge bg-success">
                                                ${opt.optFirst} / ${opt.optSecond}</span>
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                </div>
                                <p class="mb-0">
                                        ${review.reviContent}
                                </p>
                                <div>
                                    <c:if test="${nowUserId == review.reviUserId}">
                                        <button class="btn btn-secondary" name="modifyReview">수정</button>
                                        <button type="button" class="btn btn-danger" name="deleteReview">삭제</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-0" style="height: 1px;"/>
                </c:forEach>
                <div class="modal fade" id="id_review_edit_modal" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <form name="frm_reply_edit"
                                  method="post"
                            >
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-dismiss="modal"
                                            onclick="closModal()"></button>
                                    <h4 class="modal-title">리뷰수정</h4>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <label for="star1">1</label>
                                        <input type="radio" name="reviStar" id="star1"
                                               value="1">
                                        <label for="star2">2</label>
                                        <input type="radio" name="reviStar" id="star2"
                                               value="2">
                                        <label for="star3">3</label>
                                        <input type="radio" name="reviStar" id="star3"
                                               value="3">
                                        <label for="star4">4</label>
                                        <input type="radio" name="reviStar" id="star4"
                                               value="4">
                                        <label for="star5">5</label>
                                        <input type="radio" name="reviStar" id="star5"
                                               value="5">
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
            </div>
        </div>
    </div>

        <nav class="text-center">
            <ul class="pagination">
                <!-- 첫 페이지  -->
                <li>
                    <button class="btn btn-outline-success" type="button" onclick="goFirst()" data-page="1">
                        <span aria-hidden="true">&laquo;</span>
                    </button>
                </li>

                <!-- 이전 페이지 -->
                <c:if test="${paging.firstPage != 1}">
                    <li>
                        <button class="btn btn-outline-success" type="button" onclick="goBefore()"
                                data-page="${paging.firstPage - 1}">
                            <span aria-hidden="true">&lt;</span>
                        </button>
                    </li>
                </c:if>

                <!-- 페이지 넘버링  -->
                <c:forEach var="page" begin="${paging.firstPage}" end="${paging.lastPage}">
                    <li ${paging.curPage==page ?"class='active'":""}>
                        <button class="btn btn-outline-success" type="button" onclick="goPage(${page})"
                                data-page="${page}">
                                ${page}
                        </button>
                    </li>
                </c:forEach>
                <!-- 다음  페이지  -->
                <c:if test="${paging.lastPage != paging.totalPageCount}">
                    <li>
                        <button class="btn btn-outline-success" type="button" onclick="goAfter()"
                                data-page="${paging.lastPage + 1}">
                            <span aria-hidden="true">&gt;</span>
                        </button>

                    </li>
                </c:if>

                <!-- 마지막 페이지 -->
                <li>
                    <button class="btn btn-outline-success" onclick="goLast()" data-page="${paging.totalPageCount}">
                        <span aria-hidden="true">&raquo;</span>
                    </button>
                </li>
            </ul>
        </nav>

</div>

</body>
<script>
    goFirst = () => {
        $("#showTab").load("/product/tabShow.wow", {title: "리뷰", prodNo: String(nowProdNo), curPage: 1})
    }
    goLast = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "리뷰",
            prodNo: String(nowProdNo),
            curPage:${paging.totalPageCount}
        })

    }
    goBefore = () => {

        $("#showTab").load("/product/tabShow.wow", {
            title: "리뷰",
            prodNo: String(nowProdNo),
            curPage: ${paging.firstPage - 1}
        })

    }
    goAfter = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "리뷰",
            prodNo: String(nowProdNo),
            curPage: ${paging.lastPage + 1}
        })

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
        let $dataBox = $($(e.target).closest("div[name=reviewBox]"));
        $($("#id_review_edit_modal").find("textarea[name=reviContent]")).text($dataBox.data("content"))
        $($("#id_review_edit_modal").find("input[name=reviNo]")).val($dataBox.data("reviNo"))
        $($("#id_review_edit_modal").find("input[name=reviStar]")).map((i, v) => {
            if ($(v).val() == $dataBox.data("star")) {
                $(v).attr("checked", "checked")
            }

        })
        $("#id_review_edit_modal").modal('show');
    })
    $("#btn_reply_modify").on("click", function (e) {
        const $form = $("form[name='frm_reply_edit']")
        console.log($form.serialize())
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

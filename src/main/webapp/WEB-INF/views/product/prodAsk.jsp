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
<%
    UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
    request.setAttribute("userId", userInfo.getUserId());
%>
<body>
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-12 col-lg-10">
            <div class=" text-dark" id="askContainer">
                <h4 class="mb-0">문의</h4>
<%--                <p class="fw-light mb-4 pb-2">문의글 수 : ${askVOList.size()}</p>--%>
                <c:forEach items="${askVOList}" var="ask">
                <div class="card-body p-4" name="askDiv" data-ask-no="${ask.askNo}">
                        <div class="d-flex flex-start" name="top">
                            <div>
                                <h6 class="fw-bold mb-1">문의자 : ${ask.userName}</h6>
                                <div class="d-flex align-items-center mb-3">
                                    <p class="mb-0">
                                            ${ask.askRegDate}
                                    </p>
                                </div>
                                <p class="mb-0">
                                        ${ask.askContent}
                                </p>
                            </div>
                        </div>
                        <c:forEach items="${askReplyList}" var="askReply">
                            <c:if test="${askReply.replyParentNo == ask.askNo}">
                                <div class="" name="askReplyDiv"
                                     data-ask-reply-no="${askReply.replyNo}">
                                    ㄴ 답글 내용 : ${askReply.replyContent}
                                    <c:if test="${userId==prodUserId}">
                                        <button class="btn btn-danger " type="button" name="replyDelBtn">답글 지우기</button>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${userId==prodUserId}">
                            <button class="btn btn-outline-primary" name="replyBtn">답글달기</button>
                        </c:if>
                        <c:if test="${userId==ask.askUserId}">
                            <button class="btn btn-danger" name="delAskBtn">삭제하기</button>
                        </c:if>

                    <hr class="my-0" style="height: 1px;"/>
                </div>
                    </c:forEach>
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
                                    <h4 class="modal-title">답글달기</h4>
                                </div>
                                <div class="modal-body">
                                <textarea rows="3" name="replyContent"
                                          class="form-control">${ask}</textarea>
                                    <input type="hidden" name="replyParentNo" value="">
                                </div>
                                <div class="modal-footer">
                                    <button name="btn_reply_modify" type="button"
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
</div>
</body>
</html>
<script>
    goFirst = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의", prodNo: String(nowProdNo), curPage: 1,
            prodUserId: '${prodUserId}'
        })
    }
    goLast = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage:${paging.totalPageCount},
            prodUserId: '${prodUserId}'
        })

    }
    goBefore = () => {

        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage: ${paging.firstPage - 1},
            prodUserId: '${prodUserId}'
        })

    }
    goAfter = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage: ${paging.lastPage + 1},
            prodUserId: '${prodUserId}'
        })

    }
    goPage = (number) => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의", prodNo: String(nowProdNo), curPage: number,
            prodUserId: '${prodUserId}'
        })

    }

    $("#askContainer").on("click", 'button[name="replyBtn"]', function (e) {
        $("input[name=replyParentNo]").val($($(e.target).closest("div[name=askDiv]")).data("askNo"))
        $("#id_review_edit_modal").modal('show');
    })
    closModal = () => {
        $("#id_review_edit_modal").modal('hide');
    }

    $("#askContainer").on("click", 'button[name="btn_reply_modify"]', function (e) {
        const $form = $($(e.target).parents("form[name='frm_reply_edit']"))
        console.log($form.serialize())
        $.ajax({
            url: "/ask/insertAskReply.wow",
            data: $form.serialize(),
            method: 'POST',
            success: function (resultRow) {
                if (resultRow == 1) {

                    showTab()
                    closModal();
                }
            },
            error: function (ddd) {
                console.log(ddd)
            }
        })
    });

    $("#askContainer").on("click", 'button[name="replyDelBtn"]', function (e) {
        const dataPack = $($(e.target).parents("div[name=askReplyDiv]"))
        console.log(dataPack.data("askReplyNo"))
        if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: "/ask/deleteAskReplyByReplyNo.wow",
                data: {askReplyNo: dataPack.data("askReplyNo")},
                method: 'POST',
                success: function (resultRows) {
                    if (resultRows == 1) {
                        dataPack.remove();
                    }
                }
            })
        }
    });

    $("#askContainer").on("click", 'button[name="delAskBtn"]', function (e) {
        const dataPack = $($(e.target).parents("div[name=askDiv]"))
        console.log(dataPack.data("askNo"))
        if (confirm("정말 삭제하시겠습니까?")) {

            $.ajax({
                url: "/ask/deleteAsk.wow",
                data: {askNo: dataPack.data("askNo")},
                method: 'POST',
                success: function (row) {
                    if (row == 1) {
                        $.ajax({
                            url: "/ask/deleteAskReplyByAskNo.wow",
                            data: {askNo: dataPack.data("askNo")},
                            method: 'POST',
                            success: function (resultRows) {
                            }
                        })
                    }
                }

            })

            $(dataPack).remove();

        }
    });



</script>
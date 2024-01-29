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
<div id="askContainer">
    <c:forEach items="${askVOList}" var="ask">
        <div class="border border-success-subtle ">
            <div>
                문의자 : <span>${ask.userName}</span>
            </div>
            <div>
                내용 : <span>${ask.askContent}</span>
            </div>
            <div>
                문의 등록일 : <span>${ask.askRegDate}</span>
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
</html>
<script>
    goFirst = () => {
        $("#showTab").load("/product/tabShow.wow", {title: "문의", prodNo: String(nowProdNo), curPage: 1})
    }
    goLast = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage:${paging.totalPageCount}
        })

    }
    goBefore = () => {

        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage: ${paging.firstPage - 1}
        })

    }
    goAfter = () => {
        $("#showTab").load("/product/tabShow.wow", {
            title: "문의",
            prodNo: String(nowProdNo),
            curPage: ${paging.lastPage + 1}
        })

    }
    goPage = (number) => {
        $("#showTab").load("/product/tabShow.wow", {title: "문의", prodNo: String(nowProdNo), curPage: number})

    }
    const blankChk = () => {
        if ($("#askContainer").children().length == 0) {
            let div = "<div>문의가 없습니다</div>"
            $("#askContainer").append(div)
        }
    }
    blankChk()
</script>
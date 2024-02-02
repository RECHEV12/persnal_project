<%@ page import="com.study.user.vo.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: pc12
  Date: 24. 1. 15.
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="http://localhost:8080">Persnal Spring Project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto ">
                <c:if test='<%=session.getAttribute("USER_INFO")==null%>'>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/login.wow">
                            로그인
                        </a>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/signUp.wow">
                            회원가입
                        </a>
                    </li>
                </c:if>

                <c:if test='<%=session.getAttribute("USER_INFO")!=null%>'>
                    <% UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
                        request.setAttribute("nowUserId", userInfo.getUserId());
                    %>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="getUserTag" data-user-id="${nowUserId}"
                           role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <%=userInfo.getUserName()%>님, 환영합니다.
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/user/userProfile.wow?userId=${nowUserId}">마이페이지</a>
                            </li>
                            <li><a class="dropdown-item" href="/user/logout.wow">로그아웃</a></li>
                        </ul>
                    </li>
                </c:if>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!"></a></li>

                        <li><a class="dropdown-item" href="/product/productSearch.do?category=fassion">패션</a></li>
                        <li><a class="dropdown-item" href="/product/productSearch.do?category=food">식품</a></li>
                    </ul>
                </li>
                <form method="get" class="d-flex" role="search" action="/product/productSearch.wow"
                      style="margin-bottom: auto;">
                    <div class="input-group">
                        <select class="form-select" aria-label="Size 3 select example" name="searchType">
                            <option selected value="name">제품명</option>
                            <option value="user">제작자</option>
                        </select>
                        <input type="text" class="form-control " placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요"
                               aria-describedby="button-addon2" name="searchWord">
                        <button class="btn btn-outline-light" type="submit" id="button-addon2">🔎</button>
                    </div>
                </form>

            </ul>

            <div>
                <a href="/cart/cart.wow?userId=${nowUserId}">
                    <button class="btn btn-outline-light" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14" height="14" width="14">
                            <g id="shopping-cart-2--shopping-cart-checkout">
                                <path id="Vector" stroke="#000" stroke-linecap="round" stroke-linejoin="round"
                                      d="M12.1818 7.5H4.00183l-1 -5h9.99997c0.0732 0.00027 0.1453 0.01657 0.2115 0.04777 0.0661 0.03119 0.1246 0.07652 0.1713 0.13278 0.0468 0.05625 0.0806 0.12208 0.0991 0.19282 0.0185 0.07075 0.0213 0.14469 0.0081 0.21663l-0.82 4c-0.0191 0.11565 -0.0791 0.22062 -0.169 0.29584 -0.0899 0.07523 -0.2038 0.11573 -0.321 0.11416v0Z"
                                      stroke-width="1"></path>
                                <path id="Vector_2" stroke="#000" stroke-linecap="round" stroke-linejoin="round"
                                      d="m3.00183 2.5 -0.42 -1.6C2.55878 0.787064 2.49741 0.68556 2.40812 0.612669 2.31883 0.539778 2.2071 0.499976 2.09183 0.5H0.501831"
                                      stroke-width="1"></path>
                                <path id="Vector_3" stroke="#000" stroke-linecap="round" stroke-linejoin="round"
                                      d="m4.00183 7.5 0.42 2.1c0.02305 0.11294 0.08442 0.21444 0.17371 0.28733 0.08929 0.07289 0.20103 0.11267 0.31629 0.11267h6.08997"
                                      stroke-width="1"></path>
                                <path id="Vector_4" stroke="#000" stroke-linecap="round" stroke-linejoin="round"
                                      d="M10.5018 13.5c-0.2761 0 -0.5 -0.2239 -0.5 -0.5s0.2239 -0.5 0.5 -0.5c0.2762 0 0.5 0.2239 0.5 0.5s-0.2238 0.5 -0.5 0.5Z"
                                      stroke-width="1"></path>
                                <path id="Vector_5" stroke="#000" stroke-linecap="round" stroke-linejoin="round"
                                      d="M5.50183 13.5c-0.27614 0 -0.5 -0.2239 -0.5 -0.5s0.22386 -0.5 0.5 -0.5 0.5 0.2239 0.5 0.5 -0.22386 0.5 -0.5 0.5Z"
                                      stroke-width="1"></path>
                            </g>
                        </svg>
                        <i class="bi-cart-fill me-1">cart</i>
                        <span id="cartIcon" class="badge bg-success text-white ms-1 rounded-pill">0</span>
                    </button>
                </a>
            </div>
        </div>


    </div>
</nav>
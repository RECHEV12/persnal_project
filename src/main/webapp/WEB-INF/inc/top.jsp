<%--
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
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="http://localhost:8080">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!"></a></li>

                        <li><a class="dropdown-item" href="/product/productSearch.do?category=fassion">패션</a></li>
                        <li><a class="dropdown-item" href="/product/productSearch.do?category=food">식품</a></li>
                    </ul>
                </li>
                <form method="get"  class="d-flex" role="search" action="/product/productSearch.wow" style="margin-bottom: auto;">
                    <div class="input-group">
                        <select class="form-select" aria-label="Size 3 select example" name="searchType">
                            <option selected value="name">제품명</option>
                            <option value="user">제작자</option>
                        </select>
                        <input type="text" class="form-control " placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요"
                               aria-describedby="button-addon2" name="searchWord" >
                        <button class="btn btn-outline-light" type="submit" id="button-addon2">🔎</button>
                    </div>
                </form>
            </ul>

            <div>
                <button class="btn btn-outline-light" type="button">
                    <i class="bi-cart-fill me-1">cart</i>
                    <span class="badge bg-success text-white ms-1 rounded-pill">0</span>
                </button>
            </div>
        </div>


    </div>
</nav>
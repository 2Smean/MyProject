<%@ page import="user.db.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="user.db.ProductDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        .modal-dialog{
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            position: absolute;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    ProductDao productDao = new ProductDao();
    List<ProductDto> list = productDao.showProduct();
    System.out.println("list = " + list);
%>
<div class="container">
    <header class="border-bottom lh-1 py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="link-secondary" href="#">Subscribe</a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-body-emphasis text-decoration-none" href="#">Large</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <a class="link-secondary" href="#" aria-label="Search">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
                </a>
                <a class="btn btn-sm btn-outline-secondary" href="index.jsp">Sign up</a>
            </div>
        </div>
    </header>
    <div class="nav-scroller py-1 mb-3 border-bottom">
        <nav class="nav nav-underline justify-content-between">
            <% for (ProductDto dto : list) { %>
            <a class="nav-item nav-link link-body-emphasis active" href="#"><%= dto.getsProductName() %></a>
            <% } %>
        </nav>
    </div>
    <main class="container">
        <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary">
            <div class="col-lg-6 px-0">
                <h1 class="display-4 fst-italic">Book of a longer featured blog post</h1>
                <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what’s most interesting in this post’s contents.</p>
                <p class="lead mb-0"><a href="#" class="text-body-emphasis fw-bold">Continue reading...</a></p>
            </div>
        </div>
        <div class="row mb-2">
            <% for(ProductDto dto : list) { %>
            <div class="col-md-6">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-primary-emphasis"><%= dto.getsProductAuthor()%></strong>
                        <h3 class="mb-0"><%= dto.getsProductName()%></h3>
                        <div class="mb-1 text-body-secondary"><%= dto.getsProductPublisher()%></div>
                        <p class="card-text mb-auto"><%= dto.getsProductDescription()%></p>
                        <button class="modalDataBtn btn btn-primary" data-idx="<%= dto.getnProductSeq() %>" type="button" style="width: 80px; height: 30px">
                            VIEW
                            <svg class="bi"><use xlink:href="#chevron-right"/></svg>
                        </button>
                    </div>
                    <div class="col-auto d-none d-lg-block">
                        <img src="<%= dto.getsProductImage()%>" width="180px" height="200px">
                    </div>
                </div>
            </div>
            <% }%>
<%--            모달
--%>
            <div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
                <div class="modal-dialog" role="document" style="display: none">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header p-5 pb-4 border-bottom-0">
                            <h1 class="fw-bold mb-0 fs-2">Sign up for free</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </main>
</div>

</body>
<script>
    const btnIdx = $(".modalDataBtn");

    const modal = $(".modal-dialog");
    // 모달을 처음에 숨겨두기
    btnIdx.on("click", function () {
        const idx = $(this).data("idx");
        console.log(idx);

        // 모달을 화면 가운데로 이동하고 보이도록 설정
        modal.css({
            display: "block",
        });
        $.ajax({
            url: "/2sMeanProject/modal.jsp",
            method: "get",
            dataType: "json",
            data: {
                nProductSeq: idx,
            },
            success: function (response) {
                // 모달 내용을 업데이트
                const modalContent = $(".modal-content");
                modalContent.empty(); // 모달 내용 초기화

                const modalHeader = $("<div class='modal-header p-5 pb-4 border-bottom-0'></div>");
                modalHeader.append("<h1 class='fw-bold mb-0 fs-2'>" + response.sProductName + "</h1>");
                modalHeader.append("<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>");

                const modalBody = $("<div class='modal-body p-5 pt-0'></div>");

                // 테이블 생성
                const table = $("<table class='table table-bordered'></table>");

                // 테이블 내용 추가
                table.append("<tr><th>Author</th><td>" + response.sProductAuthor + "</td></tr>");
                table.append("<tr><th>Publisher</th><td>" + response.sProductPublisher + "</td></tr>");

                // Description을 텍스트로 표시
                const descriptionText = $("<p>" + response.sProductDescription + "</p>");

                // 이미지 뿌리기
                const modalImage = $("<img src='" + response.sProductImage + "' width='180px' height='200px' alt='Product Image' />");

                modalBody.append(table);
                modalBody.append(descriptionText); // Description을 텍스트로 추가
                modalBody.append(modalImage);

                modalContent.append(modalHeader);
                modalContent.append(modalBody);

                modal.css("display", "block");
            },
            error: function (error) {
                console.error(error);
                console.log("모달 부분 잘못되었음");
            }
        });
        btnIdx.on("click", function () {
            // ... (이전 코드)

            // 모달 닫기 버튼 이벤트 처리
            $(".modal .btn-close").on("click", function () {
                modal.modal("hide");
            });

            // ...
        });

// 모달 닫기 버튼 이벤트 처리
        $(".modal .btn-close").on("click", function () {
            modal.css("display", "none");
        });
    })

    // 모달 닫기 버튼 이벤트 핸들러

</script>
</html>
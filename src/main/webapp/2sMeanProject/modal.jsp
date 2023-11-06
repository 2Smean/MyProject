<%@ page import="user.db.ProductDao" %>
<%@ page import="user.db.ProductDto" %>
<%@ page contentType="application/json; charset=UTF-8" language="java" %>

<%
    int nProductSeq = Integer.parseInt(request.getParameter("nProductSeq"));
    ProductDao productDao = new ProductDao();
    ProductDto productDto = productDao.showModal(nProductSeq);
    // productDto 객체를 JSON 형식으로 변환하여 반환
out.print("{ \"sProductName\": \"" + productDto.getsProductName() + "\", \"sProductAuthor\": \"" + productDto.getsProductAuthor() + "\", \"sProductPublisher\": \"" + productDto.getsProductPublisher() + "\", \"sProductDescription\": \"" + productDto.getsProductDescription() + "\", \"sProductImage\": \"" + productDto.getsProductImage() + "\" }");
%>
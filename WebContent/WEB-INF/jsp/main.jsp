<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 他クラスのインポート --%>
<%--<%@ page import="model.User, model.Mutter, java.util.List" %> --%>

<%-- EL式 & JSTL版 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--

// セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");

// アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");

// リクエストスコープに保存されたエラーメッセージを取得
String errorMsg = (String) request.getAttribute("errorMsg");

--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どこつぶ</title>
</head>
<body>
<h1>どこつぶメイン</h1>

<p>
<%--<%= loginUser.getName() %>さん、ログイン中 --%>

<c:out value="${loginUser.name}" />さん、ログイン中

<a href="/docoTsubuEL-JSTL/Logout_EL">ログアウト</a>
</p>
<p><a href="/docoTsubuEL-JSTL/Main_EL">更新</a></p>
<form action="/docoTsubuEL-JSTL/Main_EL" method="post">
<input type="text" name="text">
<input type="submit" value="つぶやく">
</form>

<%--
<% if(errorMsg != null) { %>
<p><%= errorMsg %></p>
<% } %>
<% for(Mutter mutter : mutterList) { %>
<p><%= mutter.getUserName() %> : <%= mutter.getText() %></p>
<% } %>
--%>

<c:if test="${not empty errorMsg}">
	<p>${ errorMsg }</p>
</c:if>
<c:forEach var="mutter" items="${ mutterList }">
	<p><c:out value="${ mutter.userName }" />:
		<c:out value="${ mutter.text }"  /></p>
</c:forEach>


</body>
</html>

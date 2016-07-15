<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cart</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div>
	<h3>Your Cart</h3>
	</div>
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>Product name</th>
					<th>Product price</th>
					<th>Quantity</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${cart}">
					<tr>
						<td><c:out value="${order.spproduct.productname}" /></td>
						<td><c:out value="${order.spproduct.productprice}" /></td>
						<td><c:out value="${order.quantity}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${user != null}">
		<form action="ViewOrder" method="get">
			<input type="submit" name="submit" id="submit" value="purchase"></input>
		</form>
		</c:if>
		<c:if test="${user == null}">
		<a href ="./login.jsp">Login to purchase</a>
		</c:if>
	</div>
</body>
</html>
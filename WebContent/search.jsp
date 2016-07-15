<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>search</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th>Product name</th>
					<th>Product description</th>
					<th>Product price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${products}">
					<tr>
						<td><img src="${result.productpicture}" width="100"
							height="100" /></td>
						<td><c:out value="${result.productname}" /></td>
						<td><c:out value="${result.productdescription}" /></td>
						<td><c:out value="${result.productprice}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
	<h1>orders</h1>
		<table class="table table-bordered table-striped table-hover">
		<thead>
				<tr><th>            </th>
					<th>Product name</th>
					<th>Product price</th>
					<th>Quantity</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${orders}">
					<tr>
						<td><img src="${result.spproduct.productpicture}"
							height="100" width="100" /></td>
						<td><c:out value="${result.spproduct.productname}" /></td>
						<td><c:out value="${result.spproduct.productprice}" /></td>
						<td><c:out value="${result.quantity }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
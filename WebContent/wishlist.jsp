<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Wishlist</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>	
					<th>            </th>				
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Product Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${wishlist}">
					<tr>
						<td><img src="${order.spproduct.productpicture}"></img></td>
						<td><c:out value="${order.spproduct.productname}" /></td>
						<td><c:out value="${order.spproduct.productdescription}" /></td>
						<td><c:out value="${order.spproduct.productprice}" /></td>
						<td><form action="Details" method="get">
						<input type="hidden" name="productid" id="productid" value="${order.spproduct.productid}"/>
						<input type="submit" name="submit" id="submit" value="View Details">
						</form>
						</td>
						<td><form action="MoveWishlistToCart" method="get">
						<input type="hidden" name="orderid" id="orderid" value="${orderid}"/>
						<input type="submit" name="submit" id="submit" value="Add to cart">
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
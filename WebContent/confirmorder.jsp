<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirm Order</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div>
	<h4>Confirm Order</h4>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>	
				<th>            </th>				
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Price</th>
				<th>Quantity</th>	
				<th>Tax</th>		
				<th>Item total</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orders}">
				<tr>
					<td><img src="${order.spproduct.productpicture}" height="50" width="50"></img></td>
					<td><c:out value="${order.spproduct.productname}" /></td>
					<td><c:out value="${order.spproduct.productdescription}" /></td>
					<td>$<c:out value="${order.spproduct.productprice}" /></td>
					<td><c:out value="${order.quantity}" /></td>	
					<td><c:out value="${order.spproduct.tax}"/></td>
					<td><c:out value="${order.spproduct.productprice * (1+order.spproduct.tax)*order.quantity}"	/></td>							
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<form action="ConfirmOrder" method="get">
			<h4>
			Shipping: $ ${shipping} 
			</h4>
			<h4>Total: $ ${total}		
			<input type="submit" name="submit" id="submit" value="Purchase"></input>
			</h4>
		</form>
		
	
	</div>
	
</body>
</html>
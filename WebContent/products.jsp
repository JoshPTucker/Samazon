<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>products</title>
</head>
<body>
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>            </th>
					<th>Product name</th>
					<th>Product description</th>
					<th>Product price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="products" items="${products}">
					<tr>
						<td><img src="${products.productpicture}"></img></td>
						<td><c:out value="${products.procuctname}" /></td>
						<td><c:out value="${products.productprice}" /></td>
						<td><form action="Details" method="get">
						<input type="hidden" name="productid" id="productid" value="${products.productid}"/>
						<input type="submit" name="submit" id="submit" value="Veiw Details">
						</form>
						</td>
						<td><form action="AddToCart" method="get">
						<input type="hidden" name="productid" id="productid" value="${products.productid}"/>
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
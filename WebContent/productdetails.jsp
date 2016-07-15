<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product details</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div>
<h1><c:out value="${currproduct.productname}"/></h1>
</div>
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>product picture</th>
					<th>Product price</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td><img src="${currproduct.productpicture}" height="200" width="200"></img></td>
						<td><c:out value="${currproduct.productprice}" /></td>
						<td><form action="AddToCart" method="get">
						<input type="hidden" name="productid" id="productid" value="${currproduct.productid}"/>
						<input type ="text" name="quantity" id="quantity" value="1" width="100"/>
						<input type="submit" name="submit" id="submit" value="Add to cart"/>
						</form>
						</td>
					</tr>
			</tbody>
		</table>
	</div>	
	<div>
	<h2>Description</h2>
	<h3><c:out value="${currproduct.productdescription}" /></h3>
	</div>
</body>
</html>
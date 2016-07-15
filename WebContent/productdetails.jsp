<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product details</title>
</head>
<body>
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
						<td><img src="${currproduct.productpicture}"></img></td>
						<td><c:out value="${currproduct.poductprice}" /></td>
						<td>order button</td>
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
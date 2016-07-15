<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cart</title>
</head>
<body>
<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>Product name</th>
					<th>Product price</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}">
					<tr>
						<td><c:out value="${orders.spproduct.procuctname}" /></td>
						<td><c:out value="${orders.spproduct.poductprice}" /></td>
						<td><c:out value="${orders.quantity}" /></td>
						<td><form action="" method="">
								<input type="hidden" name="productid" id="productid" value="${orders.spproduct.productid}"></input>
								<input type="submit" name="submit" id="submit" value=""></input>
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
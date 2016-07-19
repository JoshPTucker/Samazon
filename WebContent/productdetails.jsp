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
		<h1>
			<c:out value="${currproduct.productname}" />
		</h1>
	</div>
	<div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th>Product price</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="${currproduct.productpicture}" height="200"
						width="200"></img></td>
					<td>$<c:out value="${currproduct.productprice}" /></td>
					<td><form action="AddToCart" method="get">
							<input type="hidden" name="productid" id="productid"
								value="${currproduct.productid}" /> <input type="text"
								name="quantity" id="quantity" value="1" width="100" /> <input
								type="submit" name="submit" id="submit" value="Add to cart" />
						</form> <c:if test="${user != null}">
							<form action="AddToWishList" method="get">
								<input type="hidden" name="productid" id="productid"
									value="${currproduct.productid}" /> <input type="hidden"
									name="quantity" id="quantity" value="1" /> <input
									type="submit" name="submit" id="submit" value="Add to wishlist" />
							</form>
						</c:if></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<h2>Description</h2>
		<h3>
			<c:out value="${currproduct.productdescription}" />
		</h3>
	</div>
	<div>
		<form action="ReviewServlet" method="post">
			<fieldset>
				<input type="hidden" name="productid" id="productid"
					value="${currproduct.productid}" />
				<textarea rows="6" cols="50" name="reviewtext" id="reviewtext"
					value=""></textarea>
			</fieldset>
			<fieldset>
				<input type="submit" name="submit" value="submit">
			</fieldset>
		</form>
	</div>
	<div>
		<h3>Please write a review</h3>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>User</th>
					<th>Review</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviews}">
					<tr>
						<td><c:out value="${review.spuser.username }" /></td>
						<td><c:out value="${review.productreview }" /></td>
						<td><c:if test="${review.sentiment >0}">
								<img src="http://omgface.com/veryhappy/Pikachu21.jpg"
									height="50" width="50"></img>
							</c:if> <c:if test="${review.sentiment <0 }">
								<img
									src="https://tse1.mm.bing.net/th?id=OIP.M309624a62837143494829c02e065181do0&pid=15.1&P=0&w=324&h=183"
									height="50" width="50"></img>
							</c:if>
							<c:if test="${review.sentiment==0}">
							<img src="https://tse1.mm.bing.net/th?id=OIP.M4ad652260ec71f1a54d9734f9a6f28f8o0&pid=15.1&P=0&w=183&h=183" height="50" width="50"></img>
							</c:if>
						</td>
						<td><c:out value="${review.helpful}"></c:out></td>
						<td><form action="Helpful" method="post">
								
								<fieldset>
									<input type="hidden" id="reviewid" name="reviewid" value="${review.reviewid}"/>
									<input type="submit" name="submit" value="helpful">
								</fieldset>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
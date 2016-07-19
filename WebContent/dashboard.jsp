<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Product</title>
</head>
<body>
<h1>Admin Dashboard</h1>
<h2>Hello, ${user.username}</h2>
<h3>Add a new product</h3>
	<form action="AddProduct" method="get">	
		
		<p>Name:
		<input type="text" name="productname" id="productname" size=50 value=""></input></p>
		<p>Description:
		<input type="text" name="description" id="description" size=90 value=""></p>
		</input>
		<p>Product Image URL:
		<input type="text" name="imageurl" id="imageurl" size=90 value=""></input></p>	
		<p>Price:
		<input type="text" name="price" id="price" size=10 value=""></input> </p>		
		<p>Tax Rate:
		<input type="text" name="taxrate" id="taxrate" size=3 value=""></input> </p>		
		<input type="submit" name="submit" id="submit" value="Submit"></input>
	</form>

</body>
</html>
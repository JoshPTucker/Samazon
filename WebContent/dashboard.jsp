<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Enter a new product</h2>
	<form action="AddProduct" method="get">	
		<p>URL of the Product Image:</p>
		<input type="text" name="imageurl" id="imageurl" size=100 value=""></input>	
		<p>Name:</p>
		<input type="text" name="name" id="name" size=50 value=""></input>
		<p>Description:</p>
		<input type="text" name="description" id="description" size=200 value=""></input>
		<p>Price:</p>
		<input type="text" name="price" id="price" size=140 value=""></input> 
		<p>Tax:</p>
		<input type="text" name="tax" id="tax" size=140 value=""></input> 		
		<input type="submit" name="submit" id="submit" value="Submit"></input>
	</form>

</body>
</html>
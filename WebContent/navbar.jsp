<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<p class="navbar-brand">Gulp</p>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="./Home">Home</a></li>
			<li><a href="./Products">Products</a></li>
			<li><a href="./Cart">Cart</a></li>
			<c:if test="${user}!=null">
			<li><a href="./Profile">Profile</a></li>
			<li><a href="./Wishlist">Wishlist</a></li>
			<li><a href="./Logout">Logout</a></li>
			</c:if>
			<c:if test="${user}==null">
			<li><a href="./login.jsp">Logout</a></li>
			</c:if>
		</ul>
		<div class="col-sm-3 col-md-3 pull-right">
		<form class="navbar-form" role="search" action="Search">
			<div class="input-group">
				<input type="text" name="search" id="search" class="form-control" placeholder="Search"
					name="q">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	</div>
</nav>
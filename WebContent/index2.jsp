<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
<meta charset="utf-8" />
<title>Foundation Template | Store</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/foundation.css" />
</head>
<body>
	<div class="menu">
		<jsp:include page="menu/menu.jsp" flush="false"></jsp:include>
	</div>

	<div class="row">
		<div class="large-12 columns">
			<div class="large-4 small-12 columns">
				<img src="http://placehold.it/500x500&amp;text=Logo">
				<div class="hide-for-small panel">
					<h3>Header</h3>
					<h5 class="subheader">Risus ligula, aliquam nec fermentum
						vitae, sollicitudin eget urna. Donec dignissim nibh fermentum odio
						ornare sagittis.</h5>
				</div>
				<a href="#">
					<div class="panel callout radius">
						<h6>99&nbsp; items in your cart</h6>
					</div>
				</a>
			</div>

			<div class="large-8 columns">
				<div class="row">
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/1000x1000&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/500x500&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/500x500&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/500x500&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/500x500&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
					<div class="large-4 small-6 columns">
						<img src="http://placehold.it/500x500&amp;text=Thumbnail">
						<div class="panel">
							<h5>Item Name</h5>
							<h6 class="subheader">$000.00</h6>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="large-12 columns">
						<div class="panel">
							<div class="row">
								<div class="large-2 small-6 columns">
									<img src="http://placehold.it/300x300&amp;text=Site%20Owner">
								</div>
								<div class="large-10 small-6 columns">
									<strong>This Site Is Managed By</strong>
									<hr>
									Risus ligula, aliquam nec fermentum vitae, sollicitudin eget
									urna. Donec dignissim nibh fermentum odio ornare sagittis
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="row">
			<div class="large-12 columns">
				<hr>
				<div class="row">
					<div class="large-6 columns">
						<p>© Copyright no one at all. Go to town.</p>
					</div>
					<div class="large-6 columns">
						<ul class="inline-list right">
							<li><a href="#">Link 1</a></li>
							<li><a href="#">Link 2</a></li>
							<li><a href="#">Link 3</a></li>
							<li><a href="#">Link 4</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>
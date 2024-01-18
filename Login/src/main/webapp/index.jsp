


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bootstrap/directive.jsp"%>

</head>
<body>




	<nav class="navbar navbar-expand-lg bg-body-tertiary ">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img alt="login brand images "
				src="images/box-seam.svg" height="30"> ICICI </a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about_us.jsp">About</a></li>


				</ul>

			</div>
		</div>
	</nav>








	<div class="px-4 pt-5 my-5 text-center border-bottom">
		<h1 class="display-4 fw-bold text-body-emphasis">We connect to
			different world</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">If you don't have an account create first so
				we can make a value to your parcel(packet) .If you are our customer
				SIGN-IN and start using our latest feature.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
				<a href="login.jsp">
					<button type="button" class="btn btn-primary btn-lg px-4 me-sm-3">
						Log IN</button>
				</a> <a href="registration.jsp"><button type="button"
						class="btn btn-outline-secondary btn-lg px-4">SIGN UP</button></a>
			</div>
		</div>
		<div class="overflow-hidden" style="max-height: 30vh;">
			<div class="container px-5">
				<img src="images/parcel.jpg"
					class="img-fluid border rounded-3 shadow-lg mb-4"
					alt="Example image" loading="lazy">
			</div>
		</div>
	</div>









</body>
</html>
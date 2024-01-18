<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<%@ include file="bootstrap/directive.jsp"%>
</head>
<body>
	<div class="container p-5">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Registration</p>



					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>

						<c:remove var="succMsg" scope="session" />

					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-success fs-3">${errorMsg }</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="text-center">
						<a href="login.jsp"><button type="submit " name="login"
								class="btn  text-white bg-primary text-secondary">Login</button></a>
					</div>


				</div>
			</div>
		</div>
	</div>

</body>
</html>
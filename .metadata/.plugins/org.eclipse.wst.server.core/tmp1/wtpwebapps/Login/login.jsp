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

	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Login</p>

						<form action="login" method="post">
							<div class="mb-2">
								<label class="form-label">Email</label> <input type="email"
									name="email" class="form-control">

							</div>

							<div class="mb-2">
								<label class="form-label">Password </label> <input
									type="password" name="password" class="form-control">

							</div>
							<div class="mb-2 text-center ">
								<button type="submit" name="login"
									class="btn btn-primary text-white ">Submit</button>
							</div>
						</form>
						<div class="p-4 md-3">
							<p class="text-center ">
								<a href="registration.jsp"><button type="redirect"
										class="btn text-white btn-secondary">Registration</button></a> <br><br>If
								you have an account
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
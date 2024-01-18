<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="bootstrap/directive.jsp"%>

</head>
<body>
	<%@ include file="navbarFolder/adminNavbar.jsp"%>
	<div class="container p-5">
		<div class="row">

			<div class="col-md-5 offset-md-3">
				<div class="card card-body ">
					<div class="paint-card">
						<p class=" fs-4 text-center ">Register</p>



						<form method="Post" action="register"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label class="form-label"> Name </label> <input required
									type="text" name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label"> Email </label> <input required
									type="email" name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label"> Password </label> <input required
									type="password" name="password" class="form-control">
							</div>
							<!-- <div class="mb-3">
								<label class="form-label placeholder="Repeat-password"">
									Repeat-Password </label> <input required type="password"
									name="password" class="form-control">
							</div> -->
							<div class="mb-3">
								<label class="form-label"> Mobile</label> <input required
									type="number" name="mobile" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label"> DOB</label> <input required
									type="date" name="dob" id="dob" class="form-control" />
							</div>


							<div class="mb-3">
								<div class="col-6">
									<label class="form-label"> Gender</label> Male <input required
										type="radio" name="gender" value="Male" /> Female <input
										type="radio" name="gender" value="Female">


								</div>
							</div>


							<!-- image part   -->
							<div class="mb-3">
								<div class="col-12">
									<label class="form-label"> Select the Image </label> <input
										type="file" name="image" class="form-control ">

								</div>
							</div>

							<!-- Image part is ended -->

							<div class="mb-3">

								<label class="form-label">Choose Designation:</label> <select
									required class="form-select"
									aria-label="Default select example" name="designation">
									<option value="User">User</option>
									<option value="Admin">Admin</option>


								</select>
							</div>


							<div class="text-center ">
								<button type="submit" name="signup"
									class="btn btn-primary text-white col-mb-12">Submit</button>
							</div>
						</form>
					</div>

					<div class="p-4 md-3">
						<p class="text-center ">
							<a href="login.jsp"><button type="redirect"
									class="btn text-white btn-secondary">Login</button></a> <br>If
							you have an account
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
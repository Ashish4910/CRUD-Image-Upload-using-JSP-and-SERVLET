
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.registrationServlet.user"%>
<%@ page import="javax.servlet.ServletException"%>
<%-- <%@ page import="java.io.IOExceptio"%> --%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="bootstrap/directive.jsp"%>

</head>
<body>

	<div class="container p-5">
		<div class="row">

			<div class="col-md-5 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class=" fs-4 text-center ">Register</p>


						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="fs-3 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

						user u = null;
						try {

							String sql = "select * from info where id =?";
							PreparedStatement pst = conn.prepareStatement(sql);
							pst.setInt(1, id);

							ResultSet rs = pst.executeQuery();

							while (rs.next()) {
								u = new user();
								u.setId(rs.getInt("id"));
								u.setUname(rs.getString("uname"));
								u.setUemail(rs.getString("uemail"));
								u.setUpwd(rs.getString("upwd"));
								u.setDob(rs.getString("dob"));
								u.setMobile(rs.getString("umobile"));
								u.setGender(rs.getString("gender"));
								u.setImage(rs.getString("imageName"));
								u.setDesignation(rs.getString("designation"));

							}

						} catch (Exception e) {
							e.printStackTrace();
						}
						%>


						<form action="admin" method="Post" enctype="multipart/form-data">
							<div class="mb-3">
								<label class="form-label"> Name </label> <input required
									type="text" name="name" value="<%=u.getUname()%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label"> Email </label> <input required
									type="email" name="email" value="<%=u.getUemail()%>"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label"> Password </label> <input required
									type="text" name="password" value="<%=u.getUpwd()%>"
									class="form-control">
							</div>
							<!-- <div class="mb-3">
								<label class="form-label placeholder="Repeat-password"">
									Repeat-Password </label> <input required type="password"
									name="password" class="form-control">
							</div> -->
							<div class="mb-3">
								<label class="form-label"> Mobile</label> <input required
									type="text" name="mobile" value="<%=u.getMobile()%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label"> DOB</label> <input required
									type="date" name="dob" id="dob" value="<%=u.getDob()%>"
									class="form-control" />
							</div>


							<%-- 	<div class="mb-3">
								<div class="col-6">
									<label class="form-label"> Gender</label> Male <input required
										type="radio" name="gender" value="<%=u.getGender()%>" />
									Female <input type="radio" name="gender"
										value="<%=u.getGender()%>">

								</div>
							</div> --%>

							<div class="mb-3">
								<div class="col-6">
									<label class="form-label"> Gender</label> Male <input required
										type="radio" name="gender" value="Male"
										<%if (u != null && u.getGender().equals("Male"))
	out.print("checked");%> />
									Female <input required type="radio" name="gender"
										value="Female"
										<%if (u != null && u.getGender().equals("Female"))
	out.print("checked");%>>
								</div>
							</div>




							<div class="mb-3">


								<!-- image part  -->

								<div class="mb-3 row ">
									<label class="form-label"> Image </label>

									<div>

										<input type="file" name="image" class="form-control">
									</div>

									<div align="center " class="p-2">

										<img src="uploadImage/<%=u.getImage()%>"
											style="width: 200px; height: 100px;">


									</div>

								</div>




								<%-- 
								<label class="form-label">Choose Designation:</label> <select
									required class="form-select"
									aria-label="Default select example" name="designation"
									placeholder="<%=u.getDesignation()%>"> --%>
								<%-- 				<option>
										<%
										if (u.getDesignation().equals("User"))
										%>

									</option>
									<option value="Admin">
										<%
										if (u != null && u.getDesignation().equals("Admin"))
										%>
									</option> --%>

								<%-- 			<% 
									
									if(u.getDesignation().equals("User")){
									
										
										<option value="User"> User</option>
										<option value="Admin">Admin</option>
										
									} 
								
									else{
										<option value="Admin">Admin</option>
										<option value="User">User</option>
									}
									%> --%>



								<label class="form-label">Choose Designation:</label> <select
									required class="form-select"
									aria-label="Default select example" name="designation">
									<%
									if (u != null && u.getDesignation().equals("User")) {
									%>
									<option value="User" selected>User</option>
									<option value="Admin">Admin</option>
									<%
									} else {
									%>
									<option value="User">User</option>
									<option value="Admin" selected>Admin</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="text-center ">
								<button type="submit" name="signup"
									class="btn btn-primary text-white col-mb-12">Update</button>
							</div>
					</div>
					<input type="hidden" name="id" value="<%=u.getId()%>">
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
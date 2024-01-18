<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Edits</title>
<%@ include file="bootstrap/directive.jsp"%>
</head>
<body>

	<div class="container p-5 ">
		<div class="row ">

			<div class="col-md-5 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Details Edits</p>


						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />

						</c:if>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "archit4910@");
						String query = "select * from info where id=?";
						PreparedStatement psmt = conn.prepareStatement(query);
						psmt.setInt(1, id);

						ResultSet rs = psmt.executeQuery();

						while (rs.next()) {
						%>
						
						<form action="userEdit" method="post"
							enctype="multipart/form-data">

							<div class="mb-3">
								<label class="form-label"> Full Name </label> <input type="text"
									name="name" value="<%=rs.getString("uname")%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email </label> <input type="text"
									name="email" value="<%=rs.getString("uemail")%>"
									class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-label"> Password</label> <input type="number"
									name="password" value="<%=rs.getString("upwd")%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label"> Mobile </label> <input type="number"
									name="mobile" value="<%=rs.getString("umobile")%>"
									class="form-control">
							</div>



							<div class="mb-3 mr-2">
								<label class="form-label"> Date of Birth</label> <input
									type="date" name="dob" value="<%=rs.getString("dob")%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Gender </label> Male <input
									type="radio" name="gender" value="Male"
									<%if (rs.getString("gender").equals("Male"))
	out.print("checked");%>>

								Female <input type="radio" name="gender" value="Female"
									<%if (rs.getString("gender").equals("Female"))
	out.print("checked");%>>

							</div>



							<%-- 	<div class="mb-3 mr-2 col-12 row">
								<label class="form-label"> Image</label>
								<div>
									<input type="file" name="image"
										value="<%=rs.getString("imageName")%>" title="hsahshf" class="form-control">
								</div>


								<div align="center" class="p-2">
									<img src="uploadImage/<%=rs.getString("imageName")%>"
										class="from-control" style="width: 200px;">


								</div>


							</div> --%>







							<div class="mb-3 mr-2 col-12 row">
								<label class="form-label">Image</label>
								<div>

									<input type="file" name="image" class="form-control">
								</div>

								<div align="center" class="p-2">
									<img src="./uploadImage/<%=rs.getString("imageName")%>"
										style="width: 200px;" class="from-control">
								</div>
							</div>






							<div class="mb-3">
								<label class="form-label"> Designation</label> <select required
									class="form-select" aria-label="Default select example"
									name="designation">

									<%
									if (rs.getString("designation").equals("Admin")) {
									%>
									<option value="Admin" selected>Admin</option>
									<optin value="User">User</optin>

									<%
									} else {
									%>
									<option value="Admin">Admin</option>
									<option value="User" selected>User</option>
									<%
									}
									%>



								</select>
							</div>
							<div class="mb-3">
								<button class="col-md-12 btn btn-primary">Update</button>

							</div>
							<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
						</form>
						<%
						}
						%>
					</div>

				</div>

			</div>
		</div>

	</div>


</body>
</html>
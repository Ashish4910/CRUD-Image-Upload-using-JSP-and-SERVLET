
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.registrationServlet.user"%>
<%@ page import="javax.servlet.ServletException"%>

<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<%@ include file="bootstrap/directive.jsp"%>
</head>
<body>


	<c:if test="${empty name}">

		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<!-- Navbar start  -->
	<c:if test="${not empty name}">




		<nav class="navbar navbar-expand-lg  bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="#"><img
					alt="login brand images " src="images/box-seam.svg" height="30"">
					ICICI </a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon text-white"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item text-white"><a
							class="nav-link active text-white" aria-current="page"
							href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="about_us.jsp">About</a></li>


					</ul>
					<div class="d-flex">



						<!-- Example single danger button -->
						<div class="btn-group">
							<button type="button" class="btn btn-success dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false">${name}
							</button>
							<c:if test="${ not empty id }">
								<ul class="dropdown-menu">



									<li style="margin-left: 10px;"><a class="dropdown-item"
										href="user_edits.jsp?id=${id}"><button
												class="btn btn-success">Edit</button></a></li>


									<li><hr class="dropdown-divider"></li>

									<li class="col-12" style="margin-left: 20px;">
										<form action="deleteUser?id=${id}" method="post">
											<button class="btn btn-danger">
												<!-- <a class="dropdown-item">log Out</a> -->
												Delete
											</button>
										</form>
									</li>

								</ul>
							</c:if>
						</div>

					</div>
				</div>
			</div>
		</nav>
	</c:if>
	<!-- navbar end -->





	<div class="container p-5">
		<div class="row">
			<div class="card paint-card">

				<div class="card-body">
					<p class="fs-3 text-center">User List's</p>

					<c:if test="${not empty errorMsg }">
						<p class="fs-3 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />

					</c:if>

					<c:if test="${not empty succMsg }">
						<p class="fs-3 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />

					</c:if>
					<c:if test="${not empty deleteMsg }">
						<p class="fs-3 text-center text-danger">${deleteMsg}</p>
						<c:remove var="deleteMsg" scope="session" />

					</c:if>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Password</th>
								<th scope="col">Mobile</th>
								<th scope="col">DOB</th>
								<th scope="col">Gender</th>
								<th scope="col">Designation</th>
								<th scope="col">Image</th>

							</tr>
						</thead>
						<tbody>
							<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

							Connection conn = DriverManager
									.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@&useSSL=false");

							List<user> userList = new ArrayList<>();
							try {
								String sql = "select * from info where designation =?";
								PreparedStatement pst = conn.prepareStatement(sql);
								pst.setString(1, "user");
								ResultSet rs = pst.executeQuery();

								while (rs.next()) {
									user user = new user();
									user.setId(rs.getInt("id"));
									user.setUname(rs.getString("uname"));
									user.setUemail(rs.getString("uemail"));
									user.setUpwd(rs.getString("upwd"));
									user.setMobile(rs.getString("umobile"));
									user.setDob(rs.getString("dob"));
									user.setGender(rs.getString("gender"));
									user.setImage(rs.getString("imageName"));
									user.setDesignation(rs.getString("designation"));

									/* System.out.print(rs.getString("image")); */

									userList.add(user);

								}
								rs.close();
								pst.close();

							} catch (SQLException e) {
								e.printStackTrace();
							} finally {
								try {
									conn.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
							for (user user : userList) {
							%>

							<tr>
								<td><%=user.getId()%></td>
								<td><%=user.getUname()%></td>
								<td><%=user.getUemail()%></td>
								<td><%=user.getUpwd()%></td>
								<td><%=user.getMobile()%></td>
								<td><%=user.getDob()%></td>
								<td><%=user.getGender()%></td>
								<td><%=user.getDesignation()%></td>
								<%-- <td><img
									src="C:/Ashish  CURD/Login/src/main/webapp/uploadImage/<%=user.getImage()%>"
									style="width: 40px; height: 30px;"></td> --%>

								<td><img src="uploadImage/<%=user.getImage()%>"
									style="width: 40px; height: 30px;"></td>



								<%-- 	<td><a href="user_edits.jsp?id=<%=user.getId()%>"
									class=" btn btn-primary">Edit</a></td> --%>




								<%-- 
								<form action="deleteUser?id=<%=user.getId()%>" method="post">
									<td>

										<button class="btn btn-danger">Delete</button>
									</td>
								</form> --%>


								<%
								}
								%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
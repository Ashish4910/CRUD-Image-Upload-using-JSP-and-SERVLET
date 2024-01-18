<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
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
<%-- <%@ page import="java.io.IOExceptio"%> --%>
<%@ page import="java.sql.SQLException"%>
<%-- <%@ page import="com.registrationServlet.User" %> --%>
<%-- <%@ page import=""%>
<%@ page import=""%>
<%@ page import=""%> --%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="bootstrap/directive.jsp"%>
</head>
<body>
	<%-- 
<%@ include file="navbarFolder/adminNavbar.jsp" %> --%>

	<%-- <c:if test="${empty name}">

		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>
 --%>

<%-- 
	<c:if test="${empty name }"> --%>



		<nav class="navbar navbar-expand-lg  bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="#"><img
					alt="login brand images " src="images/box-seam.svg" height="30">
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

				</div>
			</div>
		</nav>
	<%-- 	</c:if> --%>

	<%-- 	<c:if test="${not empty name }">



		<nav class="navbar navbar-expand-lg  bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="#"><img
					alt="login brand images " src="images/box-seam.svg" height="30">
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
						<li class="nav-item"><a class="nav-link text-white" href="#">About</a></li>


					</ul>
					<div class="d-flex">



						<div class="dropdown">
							<button class="btn btn-success dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								${name}</button>
							<ul class="dropdown-menu">




								<c:if test="${ not empty id}">


									<li><a class="dropdown-item text-primary "
										href="admin_edit.jsp?id=${id}">Edit</a></li>




												<li>

										<form action="delete?id=${id}" method="post">
											<input type="submit" name="delete" value="Delete"
												class=" btn btn-danger">



										</form> <!-- <a class="dropdown-item text-danger" href="">Log
											Out</a> -->



									</li>



								</c:if>
							</ul>
						</div>



					</div>
				</div>
			</div>
		</nav>



	</c:if>
 --%>
















	<div class=" container-fluid p-5">
		<div class="card paint-card">
			<p class="fs-3 text-center ">Admin Detail</p>
			<c:if test="${not empty errorMsg }">
				<p class="fs-3 text-center text-danger">${errorMsg}</p>
				<c:remove var="errorMsg" scope="session" />

			</c:if>
			<c:if test="${not empty succMsg }">
				<p class="fs-3 text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<!-- Delete the data jstl -->


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
						<th scope="col">password</th>
						<th scope="col">Mobile</th>
						<th scope="col">Dob</th>
						<th scope="col">Gender</th>
						<th scope="col">Designation</th>
						<th scope="col">Image</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>
					<%-- 				<%
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");
					
					list<user> list = conn.getAllUser();
					for(user d: list){
						%>
						
						<tr> 
						<td><%d.getUname()%></td>
						<td><%d.getUemail() %></td>
						<td><%d.getUpwd() %></td>
						<td><%d.getMobile() %></td>
						<td><%d.getDob() %></td>
						<td><%d.getGender() %></td>
						<td><%d.getDesignation() %></td>
						<td><a href="#" class="btn btn-primary">Edit</a></td>
						<td><a href="#" class="btn btn-danger">Delete</a></td>
						
						</tr>
						
						<% } %> --%>



					<%
					// ...
					// Establishing the database connection
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

					// Querying the database and retrieving user details
					List<user> userList = new ArrayList<>();

					try {
						String query = "SELECT * FROM info "; // Modify the query based on your database schema
						PreparedStatement statement = conn.prepareStatement(query);
						ResultSet resultSet = statement.executeQuery();

						/* String query = "SELECT * FROM info WHERE designation=?";
						PreparedStatement statement = conn.prepareStatement(query);
						statement.setString(1, "user"); // Set the value of the placeholder
						ResultSet resultSet = statement.executeQuery(); */

						while (resultSet.next()) {
							user user = new user();
							user.setId(resultSet.getInt("id"));
							user.setUname(resultSet.getString("uname"));
							user.setUemail(resultSet.getString("uemail"));
							user.setUpwd(resultSet.getString("upwd"));
							user.setMobile(resultSet.getString("umobile"));
							user.setDob(resultSet.getString("dob"));
							user.setGender(resultSet.getString("gender"));

							user.setDesignation(resultSet.getString("designation"));

							user.setImage(resultSet.getString("imageName"));

							userList.add(user);
						}

						resultSet.close();
						statement.close();
					} catch (SQLException e) {
						// Handle any potential SQL errors
						e.printStackTrace();
					} finally {
						// Close the database connection
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}

					// Rendering the user details in the JSP
					for (user user : userList) {
						// ...
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
						<td><img src="uploadImage/<%=user.getImage()%>"
							style="width: 200px; height: 100px;"></td>




						<td><a href="admin_edit.jsp?id=<%=user.getId()%>"
							class="btn btn-primary">Edit</a></td>
						<form action="delete?id=<%=user.getId()%>" method="post"%>
						<td><input type="submit" name="delete" value="Delete"
							class="btn btn-danger "></td>



						</form>
					</tr>
					<%
					// ...
					}
					%>




				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
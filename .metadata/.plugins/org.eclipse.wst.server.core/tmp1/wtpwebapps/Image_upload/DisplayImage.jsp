<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Image</title>
</head>
<body>

	<div style="margin-top: 100px;"></div>

	<div align="center">

		<form action="displayServlet" method="post">

			Enter Image ID <input type="number" name="imageId"> <input
				type="submit" value="Dispaly Image">
		</form>
	</div>
	<hr>
	<%
	String imgId = (String) request.getAttribute("id");
	String imgFileName = (String) request.getAttribute("img");
	%>
	<table align="center" style="width: 1000px;">
		<tr>

			<th>Image_id</th>
			<th>Image</th>
		</tr>

		<%
		if (imgFileName != "" && imgId != "") {
		%>
		<tr>
			<td><%=imgId %></td>
			<td><img src ="image/<%=imgFileName %>"></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
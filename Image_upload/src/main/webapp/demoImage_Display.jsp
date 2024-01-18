<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>demoImage_Display.jsp</title>
</head>
<body>
	<%
	int id = 13;
	%>

	<img src="/Image_upload/displayImageById?imageId=<%=id%>
	
	" alt="Image"
		style="width: 200px;">


</body>
</html>
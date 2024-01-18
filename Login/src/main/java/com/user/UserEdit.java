package com.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/userEdit")
public class UserEdit extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part image = request.getPart("image");
		String imageName = image.getSubmittedFileName();
		HttpSession session = request.getSession();
		if (imageName != "") {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String designation = request.getParameter("designation");

			String id = request.getParameter("id");

			System.out.println(imageName);
			String uploadPath = "C:/Ashish  CURD/Login/src/main/webapp/uploadImage/" + imageName;

			try {

				// load the Driver
				Class.forName("com.mysql.cj.jdbc.Driver");

				// get Connection
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root",
						"archit4910@");

				// create the query
				String query = "update info set uname=? , uemail =? , upwd=? , umobile=? , dob =?, gender=?, "
						+ "imageName=? , designation=?  where id=?";
				// calling prepared Statement
				PreparedStatement psmt = conn.prepareStatement(query);
				psmt.setString(1, name);
				psmt.setString(2, email);
				psmt.setString(3, password);
				psmt.setString(4, mobile);
				psmt.setString(5, dob);
				psmt.setString(6, gender);
				psmt.setString(7, imageName);
				psmt.setString(8, designation);
				psmt.setString(9, id);

				int row = psmt.executeUpdate();

				if (row > 0) {

					try {
						FileOutputStream fos = new FileOutputStream(uploadPath);

						InputStream is = image.getInputStream();

						byte data[] = new byte[is.available()];

						is.read(data);
						fos.write(data);

					} catch (Exception e) {

					}
					session.setAttribute("succMsg", "Updated Successfully");
					response.sendRedirect("user_list.jsp");
				} else {
					session.setAttribute("errorMsg", "Error occur in processing");
					response.sendRedirect("user_edits.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String designation = request.getParameter("designation");

			String id = request.getParameter("id");

			System.out.println(imageName);
			String uploadPath = "C:/Ashish  CURD/Login/src/main/webapp/uploadImage/" + imageName;

			try {

				// load the Driver
				Class.forName("com.mysql.cj.jdbc.Driver");

				// get Connection
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root",
						"archit4910@");

				// create the query
				String query = "update info set uname=? , uemail =? , upwd=? , umobile=? , dob =?, gender=?, "
						+ " designation=?  where id=?";
				// calling prepared Statement
				PreparedStatement psmt = conn.prepareStatement(query);
				psmt.setString(1, name);
				psmt.setString(2, email);
				psmt.setString(3, password);
				psmt.setString(4, mobile);
				psmt.setString(5, dob);
				psmt.setString(6, gender);

				psmt.setString(7, designation);
				psmt.setString(8, id);

				int row = psmt.executeUpdate();

				if (row > 0) {
					session.setAttribute("succMsg", "Updated Successfully");

					response.sendRedirect("user_list.jsp");
				} else {
					session.setAttribute("errorMsg", "Error occur in processing");
					response.sendRedirect("user_edits.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}

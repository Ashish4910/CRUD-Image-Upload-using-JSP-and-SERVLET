package com.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/admin")
public class edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part image = request.getPart("image");
		String imageName = image.getSubmittedFileName();

		String uploadPath = "C:/Ashish  CURD/Login/src/main/webapp/uploadImage/" + imageName;
		HttpSession session = request.getSession();

		if (imageName != "") {

			String uname = request.getParameter("name");
			String uemail = request.getParameter("email");
			String upwd = request.getParameter("password");
			String umobile = request.getParameter("mobile");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String designation = request.getParameter("designation");
			int id = Integer.parseInt(request.getParameter("id"));

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

				String sql = "update info set uname=?, uemail=?, upwd=?, umobile=?, dob=?, gender=?, designation=? , imageName=?  where id=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, uname);
				pst.setString(2, uemail);
				pst.setString(3, upwd);
				pst.setString(4, umobile);
				pst.setString(5, dob);
				pst.setString(6, gender);
				pst.setString(7, designation);
				pst.setString(8, imageName);

				pst.setInt(9, id);

				int i = pst.executeUpdate();
				if (i > 0) {

					try {

						FileOutputStream fos = new FileOutputStream(uploadPath);
						InputStream is = image.getInputStream();

						byte data[] = new byte[is.available()];

						is.read(data);
						fos.write(data);
						fos.close();

					} catch (Exception e) {
						e.printStackTrace();
					}

					session.setAttribute("succMsg", "Updated Successfully");
					response.sendRedirect("admin.jsp");
				} else {
					session.setAttribute("errorMsg", "Some Error Occur");
					response.sendRedirect("login.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {
			String uname = request.getParameter("name");
			String uemail = request.getParameter("email");
			String upwd = request.getParameter("password");
			String umobile = request.getParameter("mobile");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String designation = request.getParameter("designation");
			int id = Integer.parseInt(request.getParameter("id"));

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

				String sql = "update info set uname=?, uemail=?, upwd=?, umobile=?, dob=?, gender=?, designation=? where id=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, uname);
				pst.setString(2, uemail);
				pst.setString(3, upwd);
				pst.setString(4, umobile);
				pst.setString(5, dob);
				pst.setString(6, gender);
				pst.setString(7, designation);
				pst.setInt(8, id);

				int i = pst.executeUpdate();
				if (i > 0) {
					session.setAttribute("succMsg", "Updated Successfully");
					response.sendRedirect("admin.jsp");
				} else {
					session.setAttribute("errorMsg", "Some Error Occur");
					response.sendRedirect("login.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}
}

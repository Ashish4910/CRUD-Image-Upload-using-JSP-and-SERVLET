package com.registrationServlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;
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
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");
		String umobile = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String designation = request.getParameter("designation");

		/* image part is imported */

		Part image = request.getPart("image");
		String imageName = image.getSubmittedFileName();

//		String uploadPath = "C:/Ashish  CURD/Login/src/main/webapp/WEB-INF/uploadImage/" + imageName;
		String uploadPath = "C:/Ashish  CURD/Login/src/main/webapp/uploadImage/" + imageName;

		System.out.println(uploadPath);

		/*
		 * PrintWriter out = response.getWriter(); out.print(uname); out.print(uemail);
		 * out.print(upassword); out.print(umobile); out.print(dob); out.print(gender);
		 * out.print(designation);
		 */

		String url = "jdbc:mysql://localhost:3306/login?user=root&password=archit4910@";
		String qry = "INSERT INTO info(uname, uemail, upwd, umobile,dob,gender,designation,imageName) VALUES (?, ?, ?, ?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(url);
			PreparedStatement pst = con.prepareStatement(qry);
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upassword);
			pst.setString(4, umobile);
			pst.setString(5, dob);
			pst.setString(6, gender);
			pst.setString(7, designation);
			pst.setString(8, imageName);

			int rowCount = pst.executeUpdate();
			/* dispatcher = request.getRequestDispatcher("registration.jsp"); */

			try {
				System.out.println("fos1 ");
				FileOutputStream fos = new FileOutputStream(uploadPath);
				System.out.println("fos1 ");
				InputStream is = image.getInputStream();
				System.out.println("fos1 ");

				byte[] data = new byte[is.available()];
				System.out.println("fos1 ");
				is.read(data);
				System.out.println("fos1 ");
				fos.write(data);
				System.out.println("fos1 ");
				fos.close();
				System.out.println("fos1 ");
			} catch (Exception e) {
				e.printStackTrace();
			}

			HttpSession session = request.getSession();
			if (rowCount > 0) {
//				session.setAttribute("succMsg", "Registration Successfull");

				response.sendRedirect("login.jsp");

			} else {
				request.setAttribute("errorMsg ", "Registration failed");
				response.sendRedirect("registration.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

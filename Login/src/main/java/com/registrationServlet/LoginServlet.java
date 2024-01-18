package com.registrationServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.management.StringValueExp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();

		String name = "";
		int id;
		HttpSession session = request.getSession();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");
			PreparedStatement pst = con.prepareStatement("select * from info where uemail=? and upwd=?");

			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				if (rs.getString("designation").equalsIgnoreCase("Admin")) {
					name = rs.getString("uname");
					id = rs.getInt("id");
					session.setAttribute("name", name);
					session.setAttribute("id", id);

					response.sendRedirect("admin.jsp");

				} else {
					name = rs.getString("uname");
					session.setAttribute("name", name);
					id = rs.getInt("id");
					session.setAttribute("id", id);
					response.sendRedirect("user_list.jsp");

				}

			} else {
				response.sendRedirect("invalidEmail_password.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

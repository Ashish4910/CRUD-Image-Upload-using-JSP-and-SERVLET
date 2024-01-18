package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();

		try {

			// load the Driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Get Connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "archit4910@");

			// create the query
			String query = "delete from info where id=?";

			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, id);

			int row = psmt.executeUpdate();

			if (row > 0) {
				session.setAttribute("deleteMsg", "Deleted Successfully");
				response.sendRedirect("login.jsp");

			} else {
				session.setAttribute("errorMsg", "Error while Deleting ");
				response.sendRedirect("user_list.jsp");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}

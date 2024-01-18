package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");

			String sql = "delete from info where id =?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			int i = pst.executeUpdate();
			if (i > 0) {

				/* session.removeAttribute("name"); */
				session.setAttribute("deleteMsg", "Deleted Successfully");
				response.sendRedirect("admin.jsp");

			} else {
				session.setAttribute("errorMsg", "Error occur while deleting");
				response.sendRedirect("login.jsp");

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

package com.AddImage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/displayServlet")
public class DisplayServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Came to dispaly page ");
		String imgId = request.getParameter("imageId");
		int id = Integer.parseInt(imgId);
		System.out.println(imgId);
		int imageId =0;
		String imageName=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_connection", "root",
					"archit4910@");

			String query = " select * from imagename";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				if (rs.getInt("imageId") == id) {
					
					imageId= rs.getInt("imageId");
					imageName=rs.getString("imageFileName");
					

				}
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		RequestDispatcher rs;
		request.setAttribute("id", String.valueOf(imageId));
		request.setAttribute("img",imageName);
		rs=request.getRequestDispatcher("DisplayImage.jsp");
		rs.forward(request , response);
		
		

	}

}

package com.AddImage;

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
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/imageUploadToBD")
public class imageUploadToBD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part file = request.getPart("image");
		String name = request.getParameter("fullName");

		System.out.println("file name " + file);
		System.out.println(" name " + name);

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/test_connection?user=root&password=archit4910@");

			PreparedStatement pstmt = conn
					.prepareStatement("insert into imagename( imageFileName, imageBlob) value(?,?)");

			pstmt.setString(1, name);

			InputStream imageStream = file.getInputStream();
			byte[] imageData = new byte[imageStream.available()];
			imageStream.read(imageData);

			pstmt.setBytes(2, imageData);

			int row = pstmt.executeUpdate();
			if (row > 0) {
				System.out.println("Inserted Successfully");
			} else {

				System.out.println("failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.AddImage;



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
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/addImage")
public class AddImage extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* String img = request.getParameter("image"); */
		Part file = request.getPart("image");
		String imageFileName = file.getSubmittedFileName();
		System.out.println("Selected file is :" + imageFileName);

		String uploadPath = "C:/Ashish  CURD/Image_upload/src/main/webapp/image/" + imageFileName;
		System.out.println(" path is :" + uploadPath);
		
		
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// uploading the image to database
		try {
			// load the driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// get connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_connection", "root",
					"archit4910@");

			// create the query
			String query = "insert into imageName(imageFileName) values(?)";

			PreparedStatement psmt = conn.prepareStatement(query);

			psmt.setString(1, imageFileName);
			int row = psmt.executeUpdate();

			if (row > 0) {
				System.out.println("Image is inserted into DB ");
			} else {
				System.out.println("Image failed to upload ");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

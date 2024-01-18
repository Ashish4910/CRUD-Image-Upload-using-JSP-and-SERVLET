package com.AddImage;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/displayImageById")
public class DisplayImageById extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve the image ID from the request parameter
        int imageId = Integer.parseInt(request.getParameter("imageId"));

        try {
            // Load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_connection", "root",
                    "archit4910@");

            // Create the query
            String query = "SELECT imageBlob FROM imagename WHERE imageId = ?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setInt(1, imageId);

            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                // Retrieve the image data from the database
                byte[] imageData = rs.getBytes("imageBlob");

                // Set the content type to image/jpeg or the appropriate content type
                response.setContentType("image/jpeg");

                // Get the output stream of the response
                OutputStream outputStream = response.getOutputStream();

                // Write the image data to the output stream
                outputStream.write(imageData);

                // Flush and close the output stream
                outputStream.flush();
                outputStream.close();
            } else {
                response.getWriter().write("Image not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

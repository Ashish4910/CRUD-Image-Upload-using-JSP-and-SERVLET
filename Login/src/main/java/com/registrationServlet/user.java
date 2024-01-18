package com.registrationServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class user {

	int id;
	String uname;
	String uemail;
	String upwd;
	String mobile;
	String dob;
	String gender;
	String designation;
	/* byte[] image; */
	String image;

	/*
	 * public byte[] getImage() { return image; }
	 * 
	 * 
	 * public void setImage(byte[] image) { this.image = image; }
	 */


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public user(int id, String uname, String uemail, String upwd, String mobile, String dob, String gender,
			String designation, String image) {
		super();
		this.id = id;
		this.uname = uname;
		this.uemail = uemail;
		this.upwd = upwd;
		this.mobile = mobile;
		this.dob = dob;
		this.gender = gender;
		this.designation = designation;
		 
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public user() {
		super();
	
	}
	/*
	 * public List<user> getAllUser() { List<user> list = new ArrayList<user>();
	 * user u = null; try { Connection conn =
	 * DriverManager.getConnection("com.mysql.cj.jdbc.Driver"); String sql =
	 * "Select *from info order by id desc"; PreparedStatement pst =
	 * conn.prepareStatement(sql); ResultSet rs = pst.executeQuery(); while
	 * (rs.next()) { u = new user(); u.setId(rs.getInt(1));
	 * u.setUname(rs.getString(2)); u.setUemail(rs.getString(3));
	 * u.setUpwd(rs.getString(4)); u.setMobile(rs.getString(5));
	 * u.setDob(rs.getString(6)); u.setGender(rs.getString(7));
	 * u.setDesignation(rs.getString(8)); list.add(u); } } catch (Exception e) {
	 * e.printStackTrace(); } return list;
	 * 
	 * }
	 */

	public user getUserById(int id) {

		user u = null;
		try {
			Connection conn = DriverManager.getConnection("com.mysql.cj.jdbc.Driver");
			String sql = "select * from info where id =?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				u = new user();
				u.setId(rs.getInt("id"));
				u.setUname(rs.getString("uname"));
				u.setUemail(rs.getString("uemail"));
				u.setUpwd(rs.getString("upwd"));
				u.setDob(rs.getString("dob"));
				u.setMobile(rs.getString("mobile"));
				u.setDesignation(rs.getString("designation"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean adminEdit(user u) {

		boolean f = false;
		try {
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/login?user=root&password=archit4910@");
			String sql = "update info set uname =? , uemail=? ,upwd=? , umobile=?,dob=? , gender=? , designation=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "uname");
			pst.setString(2, "upwd");
			pst.setString(3, "umobile");
			pst.setString(4, "dob");
			pst.setString(5, "gender");
			pst.setString(6, "designation");
			pst.setString(7, "id");

			int i = pst.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

}

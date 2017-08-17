package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import beans.BankRedg;
import beans.client;
import oracle.jdbc.pool.OracleDataSource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataAccessObject {
	private static OracleDataSource ods; 
	public static String strDate;
	
	static
	{
			try {
				ods=new OracleDataSource();
				ods.setURL("jdbc:oracle:thin:ardent/abc123@//localhost:1521/XE");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("DataAccessObject Error --> "+e.getMessage());
			}
	}
	
	public static void main(String[] args) {
		try {
			Connection con = ods.getConnection();
			System.out.println(con);
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
			strDate = dateFormat.format(date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	public boolean register(client c) {
		// TODO Auto-generated method stub
		try {
			Connection con = ods.getConnection();
			String sql="insert into contact values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(2, c.getName());
			ps.setString(1, c.getEmail());
			ps.setString(3, c.getPhone());
			if (ps.executeUpdate() > 0)
			{
				con.commit();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean bankregister(BankRedg bd) {
		try {
			Connection con  = ods.getConnection();
			String sql="insert into bankerregister values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,bd.getEmail());
			ps.setString(2,bd.getPassword());
			ps.setString(3,bd.getFirstname());
			ps.setString(4,bd.getLastname());
			ps.setString(5,bd.getPhone());
			ps.setString(6,bd.getAddress());
			ps.setString(7,bd.getPincode());
			ps.setString(8,bd.getOpeningBalance());
			System.out.println("Opening balance "+bd.getOpeningBalance());
			ps.setString(9,bd.getAccountNumber());
			System.out.println("From Bean "+bd.getEmail());
				if (ps.executeUpdate() > 0)
				{
					con.commit();
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
		}
	public BankRedg authenticate(String uid, String pwd) {
		// TODO Auto-generated method stub
		try {
			Connection con = ods.getConnection();
			String sql = "select * from bankerregister where password=? and accountno=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, uid);
			ResultSet rs =ps.executeQuery();
			if (rs.next())
			{
				BankRedg bd = new BankRedg();
				bd.setEmail(rs.getString(1));
				bd.setPassword(rs.getString(2));
				bd.setFirstname(rs.getString(3));
				bd.setLastname(rs.getString(4));
				bd.setOpeningBalance(rs.getString(8));
				rs.close();
				ps.close();
				con.close();
				return bd;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
}

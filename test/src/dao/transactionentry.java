package dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import beans.BankRedg;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.pool.OracleDataSource;

public class transactionentry {
	private static OracleDataSource ods;
	final int NULLVALUE = 0;
	final int NOTNULL =1;
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
	public boolean deposit(BankRedg bd)
	{
		try
		{

			int amount = bd.getAmount();
			String accountno = bd.getAcc_no();			
			java.sql.Date sqlDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			System.out.println("at detabase.java:\\amount is "+ amount);
			System.out.println("at detabase.java:\\account no is "+ accountno);
			System.out.println("at detabase.java:\\date is "+sqlDate);
			Connection con = ods.getConnection();
			String sql = "insert into transaction values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,bd.getAcc_no());
			ps.setInt(2,NULLVALUE);
			ps.setInt(3,NOTNULL);
			ps.setInt(4,bd.getAmount());
			ps.setDate(5,sqlDate);
			System.out.print("Upd");
			updatecurrentbal(amount,accountno);
			if (ps.executeUpdate() > 0)
			{
				con.commit();
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at database "+e.getMessage());
		}
		return false;
	}
	public boolean withdraw(BankRedg bd)
	{
		try
		{

			int amount = bd.getAmount();
			String accountno = bd.getAcc_no();			
			java.sql.Date sqlDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			System.out.println("at detabase.java:\\withdraw amount is "+ amount);
			System.out.println("at detabase.java:\\account no is "+ accountno);
			System.out.println("at detabase.java:\\date is "+sqlDate);
			Connection con = ods.getConnection();
			String sql ="insert into transaction values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,accountno);
			ps.setInt(2,NOTNULL);
			ps.setInt(3, NULLVALUE);
			ps.setInt(4,amount);
			ps.setDate(5,sqlDate);
			balafterupdate(amount,accountno);
			System.out.print("withdraw");
			if (ps.executeUpdate() > 0)
			{
				con.commit();
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at database "+e.getMessage());
		}
		return false;
	}
	public void balafterupdate(int amount, String accountno) throws SQLException
	{
		Connection con = ods.getConnection();
		String sql = "select * from bankerregister where accountno='" + accountno+"'";
		PreparedStatement ps = null;
		ps = con.prepareStatement(sql);
		if(ps == null)
			System.out.println("Could not fetch data");
		try {
			ResultSet rs =ps.executeQuery();
			if (rs.next())
			{
				int i=rs.getInt("OPENINGBALANCE");
				System.out.println("value of i "+i);
				if((i-amount)>=100)
				{
					String query = "update bankerregister set OPENINGBALANCE=" + (i - amount) + " where accountno like '" + accountno +"'";
					ps = con.prepareStatement(query);
			        ps.executeUpdate();
			        if (ps.executeUpdate() > 0)
					{
						con.commit();
						System.out.println("update sucessful at balafterupdate//");
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at updatecurrentbalance " +e.getMessage());
		}
	}
	public void updatecurrentbal(int amount, String accountno) throws SQLException
	{
		System.out.print("ating");
		Connection con = ods.getConnection();
		BankRedg bd= new BankRedg();
		bd.setAcc_no(accountno);
		//String sql = "select openingbalance from bankerregister where accountno='?'";
		String sql = "select * from bankerregister where accountno='" + accountno+"'";
		PreparedStatement ps = null;
		ps = con.prepareStatement(sql);
		if(ps == null)
			System.out.println("Could not fetch data");
		try {
			//ps.setString(1, bd.getAcc_no());
			ResultSet rs =ps.executeQuery();
			if (rs.next())
			{
				int i=rs.getInt("OPENINGBALANCE");
				System.out.println("value of i "+i);
				String query = "update bankerregister set OPENINGBALANCE=" + (i + amount) + " where accountno like '" + accountno +"'";
				ps = con.prepareStatement(query);
		        ps.executeUpdate();
		        if (ps.executeUpdate() > 0)
				{
					con.commit();
					System.out.println("update sucessful at updatecurrentbalance//");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at updatecurrentbalance " +e.getMessage());
		}
		
	}
	public boolean transfer(BankRedg bd)
	{
		try
		{
			int i=0,j=0,count=0;
			int amount = bd.getAmount();
			String accountno = bd.getAcc_no();		
			String accountr = bd.getAccountNumber();
			java.sql.Date sqlDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			Connection con = ods.getConnection();
			String sql ="select * from bankerregister where accountno='"+accountno+"'";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			if (rs.next())
			{
				 i=rs.getInt("OPENINGBALANCE");
				 if((i-amount)>=100)
				 {
				 String query = "update bankerregister set OPENINGBALANCE=" + (i - amount) + " where accountno like '" + accountno +"'";
				 ps = con.prepareStatement(query);
			        ps.executeUpdate();
			        if (ps.executeUpdate() > 0)
					{
						con.commit();
						ps=null;
						rs=null;
						count++;
						System.out.println("transfer sucessful at sender//");
					}
				 }
			}
			String sql1 ="select * from bankerregister where accountno='"+accountr+"'";
			ps = con.prepareStatement(sql1);
			rs =ps.executeQuery();
			if (rs.next())
			{
				 j=rs.getInt("OPENINGBALANCE");
				 String query = "update bankerregister set OPENINGBALANCE=" + (j + amount) + " where accountno like '" + accountr +"'";
				 ps = con.prepareStatement(query);
			        ps.executeUpdate();
			        if (ps.executeUpdate() > 0)
					{
						con.commit();
						ps=null;
						rs=null;
						System.out.println("transfer sucessful at receiver//");
						count++;
					}
			 }
			if(count==2)
			{
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at database "+e.getMessage());
		}
		return false;
	}
	
	public int currentBalance(String accountno) throws SQLException
	{
		int i=0;
		Connection con = ods.getConnection();
		String sql = "select * from bankerregister where accountno='"+accountno+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		try {
			//ps.setString(1, bd.getAcc_no());
			ResultSet rs =ps.executeQuery();
			if (rs.next())
			{
				 i=rs.getInt("OPENINGBALANCE");
				 System.out.println("openingbal at currentbalance " +i);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error at currentbalance " +e.getMessage());
		}
		return i;
	}
	
	public ResultSet retrieve(String ac_no) throws SQLException
	{
		ResultSet rs = null;
		Connection con = ods.getConnection();
		try
		{

	      String sql = "select * from transaction where accountno ='" + ac_no + "'" + " and rownum <= 10 order by time desc";
	      PreparedStatement ps = con.prepareStatement(sql);
	      rs = ps.executeQuery(sql);
	      if(rs == null)
	    	  System.out.println("Dint fetch anything");
	      //rs.close();
	    }
		catch(Exception e)
		{
			System.out.println("Error "+e.getMessage());
		}
		return rs;
	}
	public ResultSet retrieveMonthly(String ac_no) throws SQLException
	{
		ResultSet rs = null;
		Connection con = ods.getConnection();
		try
		{
	
		  String sql = "select time,count(*) from transaction where accountno = '" + ac_no + "' group by time";
		  PreparedStatement ps = con.prepareStatement(sql);
	      rs = ps.executeQuery(sql);
	      if(rs == null)
	    	  System.out.println("Dint fetch anything");
	      //rs.close();
	    }
		catch(Exception e)
		{
			System.out.println("Error "+e.getMessage());
		}
		return rs;
	}
}

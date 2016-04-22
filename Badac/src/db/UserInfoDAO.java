package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserInfo;

public class UserInfoDAO extends BaseDAO {
	
	public int insertUserInfo(String user_name, String user_email, String user_password, String user_region, int user_phone, String user_bicycletype, int user_emailpush){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO normal_user VALUES(?,?,?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setString(2,user_name);
			ps.setString(3,user_email);
			ps.setString(4,user_password);
			ps.setString(5,user_region);
			ps.setInt(6,user_phone);
			ps.setString(7,user_bicycletype);
			ps.setInt(8,user_emailpush);
			
			while(true){
				randomNum = (int)(Math.random() * 100000000);
				if(this.selectUserNameByUserId(randomNum).equals("")){
					//System.out.println(randomNum);
					break;
				}
			}
			
			ps.setInt(1, randomNum);
			
			insertRowCnt = ps.executeUpdate();
		}
		catch (SQLException se)
		{
			System.out.println(se.getMessage());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			if(ps!=null)
			{
				try
				{
					ps.close();
				}
				catch (SQLException se)
				{
					System.out.println(se.getMessage());
				}
			}
		}
		
		return insertRowCnt;
	}
	
	public String selectUserNameByUserId(int user_id){
		String user_name = "";
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM normal_user WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				user_name = rs.getString("user_name");
			}
		}
		catch (SQLException se)
		{
			System.out.println(se.getMessage());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			if(ps!=null)
			{
				try
				{
					ps.close();
				}
				catch (SQLException se)
				{
					System.out.println(se.getMessage());
				}
			}
		}
		
		return user_name;
	}
	
	public UserInfo selectUserInfoByUserEmail(String user_email){
		UserInfo userInfo = null;
		PreparedStatement ps=null;
		try
		{
			String sql="SELECT * FROM normal_user WHERE user_email=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setString(1, user_email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				int userId = rs.getInt("user_id");
				String userName = rs.getString("user_name");
				String userPw = rs.getString("user_password");
				String userRegion = rs.getString("user_region");
				int userPhone = rs.getInt("user_phone");
				String userBicycletype = rs.getString("user_bicycletype");
				int userEmailpush = rs.getInt("user_emailpush");
				
				userInfo = new UserInfo(userId, userName, user_email, userPw, userRegion, userPhone, userBicycletype, userEmailpush);
				userInfo.setUser_name(userName);
			}
			
		}
		catch (SQLException se)
		{
			System.out.println(se.getMessage());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			if(ps!=null)
			{
				try
				{
					ps.close();
				}
				catch (SQLException se)
				{
					System.out.println(se.getMessage());
				}
			}
		}
		
		return userInfo;
	}
	
	public UserInfo selectUserInfoByUserId(int user_id){
		UserInfo userInfo = null;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM normal_user WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				String userName = rs.getString("user_name");
				String userEmail = rs.getString("user_email");
				String userPw = rs.getString("user_password");
				String userRegion = rs.getString("user_region");
				int userPhone = rs.getInt("user_phone");
				String userBicycletype = rs.getString("user_bicycletype");
				int userEmailpush = rs.getInt("user_emailpush");
				
				userInfo = new UserInfo(user_id, userName, userEmail, userPw, userRegion, userPhone, userBicycletype, userEmailpush);
				userInfo.setUser_name(userName);
			}
		}
		catch (SQLException se)
		{
			System.out.println(se.getMessage());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			if(ps!=null)
			{
				try
				{
					ps.close();
				}
				catch (SQLException se)
				{
					System.out.println(se.getMessage());
				}
			}
		}
		
		return userInfo;
	}

}

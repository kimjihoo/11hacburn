package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserInfo;

public class UserInfoDAO extends BaseDAO {
	
	public int insertUserInfo(String user_name, String user_email, String user_password, String user_region_1, String user_region_2, String user_region_3, String user_phone, String user_bicycletype, int user_emailpush, String user_lat, String user_lng){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO normal_user VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setString(2,user_name);
			ps.setString(3,user_email);
			ps.setString(4,user_password);
			ps.setString(5, user_region_1);
			ps.setString(6,user_region_2);
			ps.setString(7, user_region_3);
			ps.setString(8,user_phone);
			ps.setString(9,user_bicycletype);
			ps.setInt(10,user_emailpush);
			ps.setString(11, user_lat);
			ps.setString(12, user_lng);
			
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
	
	public int checkUserPw(int user_id, String user_pw){
		
		int chk = 0;
		String userPw="";
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM normal_user WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				userPw = rs.getString("user_password");
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
		
		if(userPw.equals(user_pw)){
			chk = 1;
		}
		
		return chk;
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
				String userRegion_1 = rs.getString("user_region_1");
				String userRegion_2 = rs.getString("user_region_2");
				String userRegion_3 = rs.getString("user_region_3");
				String userPhone = rs.getString("user_phone");
				String userBicycletype = rs.getString("user_bicycletype");
				int userEmailpush = rs.getInt("user_emailpush");
				String userLat = rs.getString("user_lat");
				String userLng = rs.getString("user_lng");
				
				userInfo = new UserInfo(userId, userName, user_email, userPw, userRegion_1, userRegion_2, userRegion_3, userPhone, userBicycletype, userEmailpush, userLat, userLng);
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
				String userRegion_1 = rs.getString("user_region_1");
				String userRegion_2 = rs.getString("user_region_2");
				String userRegion_3 = rs.getString("user_region_3");
				String userPhone = rs.getString("user_phone");
				String userBicycletype = rs.getString("user_bicycletype");
				int userEmailpush = rs.getInt("user_emailpush");
				String userLat = rs.getString("user_lat");
				String userLng = rs.getString("user_lng");
				
				userInfo = new UserInfo(user_id, userName, userEmail, userPw, userRegion_1, userRegion_2, userRegion_3, userPhone, userBicycletype, userEmailpush, userLat, userLng);
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
	
	public int returnUserCnt(){
		int result_cnt=0;
		
		PreparedStatement ps = null;
		
		try{
			String sql = "SELECT COUNT(*) FROM normal_user";
			ps=super.getConn().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				result_cnt = rs.getInt(1);
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
		
		return result_cnt;
	}
	
	public String updateUserInfo(int user_id, String password, String region_1, String region_2, String region_3, String phone, String bicycletype, int emailpush, String userlat, String userlng){
		PreparedStatement ps = null;
		
		try{
			String sql = "UPDATE normal_user SET user_password=?,user_region_1=?,user_region_2=?,user_region_3=?,user_phone=?,user_bicycletype=?,user_emailpush=?,user_lat=?,user_lng=? WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, region_1);
			ps.setString(3, region_2);
			ps.setString(4, region_3);
			ps.setString(5, phone);
			ps.setString(6, bicycletype);
			ps.setInt(7, emailpush);
			ps.setString(8, userlat);
			ps.setString(9, userlng);
			ps.setInt(10, user_id);
			ps.executeUpdate();
		}
		catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return "fail";
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			return "fail";
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
		return "Success";
	}
	
	public int deleteUserInfo(int user_id){
		int insertRowCnt = 0;
		
		PreparedStatement ps=null;
		try
		{
			String sql="DELETE FROM normal_user WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setInt(1,user_id);
			
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
}

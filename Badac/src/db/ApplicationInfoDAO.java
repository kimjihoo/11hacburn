package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ApplicationInfo;
import model.MemberInfo;

public class ApplicationInfoDAO extends BaseDAO {
	public int insertApplicationInfo(int application_id, int user_id, String tunning_title, String tunning_explanation){
		int insertRowCnt = 0;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO tunning_application VALUES(?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			ps.setInt(1, application_id);
			ps.setInt(2,user_id);
			ps.setString(3,tunning_title);
			ps.setString(4,tunning_explanation);
			ps.setInt(5,0);
			ps.setDate(6,sqlDate);
			
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
	
	public int insertApplicationReplyInfo(int tunning_answer_id, int tunning_id, int tunning_company_id, String tunning_answer){
		int insertRowCnt = 0;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO tunning_answer VALUES(?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, tunning_answer_id);
			ps.setInt(2,tunning_id);
			ps.setInt(3,tunning_company_id);
			ps.setString(4,tunning_answer);
			ps.setInt(5,0);
			
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
	
	public String selectTunningTitleByTunningId(int tunning_id){
		String tunning_title = "";
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM tunning_application WHERE tunning_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, tunning_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				tunning_title = rs.getString("tunning_title");
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
		
		return tunning_title;
	}
	
	public ArrayList<ApplicationInfo> getMyApplicationList(int userId){
		ArrayList<ApplicationInfo> applicationList = new ArrayList<ApplicationInfo>();
		PreparedStatement ps = null;
		try{
			String sql = "SELECT * FROM tunning_application WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				applicationList.add(new ApplicationInfo(rs.getInt("tunning_id"), rs.getString("tunning_title"), rs.getDate("upload_date")));
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
		
		return applicationList;
	}
	
	public ArrayList<ApplicationInfo> getApplicationList(){
		ArrayList<ApplicationInfo> applicationList = new ArrayList<ApplicationInfo>();
		PreparedStatement ps = null;
		try{
			String sql = "SELECT * FROM tunning_application";
			ps=super.getConn().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				applicationList.add(new ApplicationInfo(rs.getInt("tunning_id"), rs.getString("tunning_title"), rs.getDate("upload_date")));
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
		
		return applicationList;
	}
	
	public ApplicationInfo selectApplicationInfoByTunningId(int tunningId){
		ApplicationInfo applicationInfo = null;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM tunning_application WHERE tunning_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, tunningId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				int tunningId1 = rs.getInt("tunning_id");
				int userId = rs.getInt("user_id");
				String tunningTitle = rs.getString("tunning_title");
				String tunningExplanation = rs.getString("tunning_explanation");
				Date tunningUploadDate = rs.getDate("upload_date");
				
				applicationInfo = new ApplicationInfo(tunningId1,userId, tunningTitle, tunningExplanation, tunningUploadDate);
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
		
		return applicationInfo;
	}
	
	public int deleteApplicationInfoByTunningId(int tunningId){
		int lowCnt = -1;
		PreparedStatement ps=null;
		
		try
		{	
			String sql="";
			sql="DELETE FROM tunning_application WHERE tunning_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, tunningId);
			
			lowCnt = ps.executeUpdate();
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
		
		return lowCnt;
	}
}

package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ApplicationInfo;

public class ApplicationInfoDAO extends BaseDAO {
	public int insertApplicationInfo(int user_id, String tunning_title, String tunning_explanation){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO tunning_application VALUES(?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			ps.setInt(2,user_id);
			ps.setString(3,tunning_title);
			ps.setString(4,tunning_explanation);
			ps.setInt(5,0);
			ps.setDate(6,sqlDate);
			
			while(true){
				randomNum = (int)(Math.random() * 100000000);
				if(this.selectTunningTitleByTunningId(randomNum).equals("")){
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
}

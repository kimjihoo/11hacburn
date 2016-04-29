package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.MemberInfo;
import model.UserInfo;
import model.PictureInfo;

public class PictureInfoDAO extends BaseDAO {
	public int insertPictureInfo(int pictureId, int userId, int applicationId, String picturePath){
		int insertRowCnt = 0;
		
		PreparedStatement ps=null;
		try
		{
			if(applicationId==-1){
				deletePictureInfoByPictureId(userId,-1);
			}
			String sql="INSERT INTO picture_tb VALUES(?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setInt(1,pictureId);
			ps.setInt(2,userId);
			ps.setInt(3, applicationId);
			ps.setString(4,picturePath);
			
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
	
	public ArrayList<PictureInfo> selectPictureInfoByUserId(int userId, int appId){
		ArrayList<PictureInfo> pictureList = new ArrayList<PictureInfo>();
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM picture_tb WHERE user_id=? AND application_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, appId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				pictureList.add(new PictureInfo(rs.getInt("picture_id"), rs.getString("picture_path")));
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
		
		return pictureList;
	}
	
	public int deletePictureInfoByPictureId(int userId, int pictureId){
		int lowCnt = -1;
		PreparedStatement ps=null;
		
		try
		{	
			String sql="";
			if(pictureId==-1){
				sql="DELETE FROM picture_tb WHERE application_id=? AND user_id=?";
			}else if(pictureId!=-1){
				sql="DELETE FROM picture_tb WHERE picture_id=? AND user_id=?";
			}
			System.out.println(sql+"aaa : "+pictureId);
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, pictureId);
			ps.setInt(2, userId);
			
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
	
	
	public int selectPictureIdByPictureId(int pictureId){
		int tempPictureCode = -1;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM picture_tb WHERE picture_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, pictureId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				tempPictureCode = rs.getInt("picture_id");
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
		
		return tempPictureCode;
	}
	
	public PictureInfo selectPictureInfoByPictureId(int pictureId){
		PictureInfo pictureInfo = null;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM picture_tb WHERE picture_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, pictureId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				pictureInfo = new PictureInfo(rs.getInt("picture_id"), rs.getString("picture_path"));
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
		
		return pictureInfo;
	}
}

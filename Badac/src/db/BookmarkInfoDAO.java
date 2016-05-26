package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ApplicationInfo;
import model.BookmarkInfo;

public class BookmarkInfoDAO extends BaseDAO {
	
	public int insertBookmarkInfo(int user_id, int company_id){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO user_bookmark VALUES(?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setInt(2,user_id);
			ps.setInt(3,company_id);
			
			while(true){
				randomNum = (int)(Math.random() * 100000000);
				if(this.selectUserIdByBookmarkId(randomNum)==-1){
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
	
	public int deleteBookmarkInfo(int user_id, int company_id){
		int insertRowCnt = 0;
		
		PreparedStatement ps=null;
		try
		{
			String sql="DELETE FROM user_bookmark WHERE user_id=? AND company_id=?";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setInt(1,user_id);
			ps.setInt(2,company_id);
			
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
	
	public int selectUserIdByBookmarkId(int bookmark_id){
		int user_Id = -1;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM user_bookmark WHERE bookmark_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, bookmark_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				user_Id = rs.getInt("user_id");
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
		
		return user_Id;
	}
	
	public int checkBookmark(int user_id, int company_id){
		
		PreparedStatement ps=null;
		int user_Id=-1;
		
		try
		{
			String sql="SELECT * FROM user_bookmark WHERE user_id=? AND company_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, user_id);
			ps.setInt(2,  company_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				user_Id = rs.getInt("user_id");
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
		
		return user_Id;
	}
	
	public ArrayList<BookmarkInfo> getMyBookmarkList(int userId){
		ArrayList<BookmarkInfo> bookmarkList = new ArrayList<BookmarkInfo>();
		PreparedStatement ps = null;
		try{
			String sql = "SELECT * FROM user_bookmark WHERE user_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				bookmarkList.add(new BookmarkInfo(rs.getInt("bookmark_id"), rs.getInt("user_id"), rs.getInt("company_id")));
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
		
		return bookmarkList;
	}

}

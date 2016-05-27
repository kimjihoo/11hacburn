package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ApplicationInfo;
import model.MemberInfo;

public class MemberInfoDAO extends BaseDAO {
	public int insertMemberInfo(String company_ownername, String company_email, String company_password, String company_name, String company_region_1, String company_region_2, String company_region_3, String company_telephone, String company_phone, int company_emailpush, String company_lat, String company_lng){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO company_user VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setString(2,company_ownername);
			ps.setString(3,company_email);
			ps.setString(4,company_password);
			ps.setString(5,company_name);
			ps.setString(6,company_region_1);
			ps.setString(7,company_region_2);
			ps.setString(8,company_region_3);
			ps.setString(9,company_telephone);
			ps.setString(10,company_phone);
			ps.setInt(11,0);
			ps.setDate(12,null);
			ps.setInt(13,company_emailpush);
			ps.setString(14, company_lat);
			ps.setString(15, company_lng);
			
			while(true){
				randomNum = (int)(Math.random() * 100000000);
				if(this.selectMemberNameByCompanyId(randomNum).equals("")){
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
	
	public int insertMemberReview(int company_id, int user_id, String review){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO company_review VALUES(?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setInt(2,company_id);
			ps.setInt(3,user_id);
			ps.setString(4,review);
			
			while(true){
				randomNum = (int)(Math.random() * 100000000);
				if(this.selectCompanyIdByReviewId(randomNum)==-1){
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
	
	public String selectMemberNameByCompanyId(int company_id){
		String company_name = "";
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM company_user WHERE company_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, company_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				company_name = rs.getString("company_name");
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
		
		return company_name;
	}
	
	public int selectCompanyIdByReviewId(int review_id){
		int company_id = -1;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM company_id WHERE review_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, review_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				company_id = rs.getInt("company_id");
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
		
		return company_id;
	}
	
	public MemberInfo selectMemberInfoByCompanyEmail(String company_email){
		MemberInfo memberInfo = null;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM company_user WHERE company_email=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setString(1, company_email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				int companyId = rs.getInt("company_id");
				String companyOwnerName = rs.getString("company_ownername");
				String companyEmail = rs.getString("company_email");
				String companyPw = rs.getString("company_password");
				String companyName = rs.getString("company_name");
				String companyRegion_1 = rs.getString("company_region_1");
				String companyRegion_2 = rs.getString("company_region_2");
				String companyRegion_3 = rs.getString("company_region_3");
				String companyTelephone = rs.getString("company_telephone");
				String companyPhone = rs.getString("company_phone");
				int companyApproval = rs.getInt("company_approval");
				Date companyApprovaldate = rs.getDate("company_approvaldate");
				int companyEmailpush = rs.getInt("company_emailpush");
				String companyLat = rs.getString("company_lat");
				String companyLng = rs.getString("company_lng");
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion_1, companyRegion_2, companyRegion_3, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyEmailpush, companyLat, companyLng);
				memberInfo.setCompany_name(companyName);
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
		
		return memberInfo;
	}
	
	public MemberInfo selectMemberInfoByCompanyId(int company_id){
		MemberInfo memberInfo = null;
		PreparedStatement ps=null;
		
		try
		{
			String sql="SELECT * FROM company_user WHERE company_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, company_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				int companyId = rs.getInt("company_id");
				String companyOwnerName = rs.getString("company_ownername");
				String companyEmail = rs.getString("company_email");
				String companyPw = rs.getString("company_password");
				String companyName = rs.getString("company_name");
				String companyRegion_1 = rs.getString("company_region_1");
				String companyRegion_2 = rs.getString("company_region_2");
				String companyRegion_3 = rs.getString("company_region_3");
				String companyTelephone = rs.getString("company_telephone");
				String companyPhone = rs.getString("company_phone");
				int companyApproval = rs.getInt("company_approval");
				Date companyApprovaldate = rs.getDate("company_approvaldate");
				int companyEmailpush = rs.getInt("company_emailpush");
				String companyLat = rs.getString("company_lat");
				String companyLng = rs.getString("company_lng");
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion_1, companyRegion_2, companyRegion_3, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyEmailpush, companyLat, companyLng);
				memberInfo.setCompany_name(companyName);
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
		
		return memberInfo;
	}
	
	public ArrayList<MemberInfo> notApprovalMemberList(){
		
		ArrayList<MemberInfo> na_memberList = new ArrayList<MemberInfo>();
		PreparedStatement ps = null;
		
		try{
			String sql = "SELECT * FROM company_user WHERE company_approval=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, 0);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				na_memberList.add(new MemberInfo(rs.getInt("company_id"), rs.getString("company_ownername"), rs.getString("company_name"), rs.getString("company_telephone")));
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
		
		return na_memberList;
	}
	
	public ArrayList<MemberInfo> memberList(){
		
		ArrayList<MemberInfo> memberList = new ArrayList<MemberInfo>();
		PreparedStatement ps = null;
		
		try{
			String sql = "SELECT * FROM company_user";
			ps=super.getConn().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				memberList.add(new MemberInfo(rs.getInt("company_id"), rs.getString("company_name"), rs.getString("company_telephone"), rs.getString("company_region_2"),rs.getString("company_region_3"), rs.getString("company_lat"),rs.getString("company_lng")));
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
		
		return memberList;
	}
	
	public String memberApproval(int company_id){
		PreparedStatement ps = null;
		
		try{
			String sql = "UPDATE company_user SET company_approval=?,company_approvaldate=? WHERE company_id=?";
			ps=super.getConn().prepareStatement(sql);
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			ps.setInt(1, 1);
			ps.setDate(2, sqlDate);
			ps.setInt(3, company_id);
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
	
	public int returnMemberCnt(){
		int result_cnt=0;
		
		PreparedStatement ps = null;
		
		try{
			String sql = "SELECT COUNT(*) FROM company_user";
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
	
	public String updateMemberInfo(int company_id, String password, String name, String region_1, String region_2, String region_3, String telephone, String phone, int emailpush, String lat, String lng){
		PreparedStatement ps = null;
		
		try{
			String sql = "UPDATE company_user SET company_password=?,company_name=?, company_region_1=?,company_region_2=?,company_region_3=?,company_telephone=?,company_phone=?,company_emailpush=?,company_lat=?,company_lng=? WHERE company_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, name);
			ps.setString(3, region_1);
			ps.setString(4, region_2);
			ps.setString(5, region_3);
			ps.setString(6, telephone);
			ps.setString(7, phone);
			ps.setInt(8, emailpush);
			ps.setString(9, lat);
			ps.setString(10, lng);
			ps.setInt(11, company_id);
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
	
	public ArrayList<MemberInfo> getMyReviewList(int companyId){
		ArrayList<MemberInfo> reviewList = new ArrayList<MemberInfo>();
		PreparedStatement ps = null;
		try{
			String sql = "SELECT * FROM company_review WHERE company_id=?";
			ps=super.getConn().prepareStatement(sql);
			ps.setInt(1, companyId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				reviewList.add(new MemberInfo(rs.getInt("company_id"),rs.getInt("user_id"), rs.getString("company_review")));
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
		
		return reviewList;
	}
}

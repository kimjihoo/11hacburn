package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.MemberInfo;

public class MemberInfoDAO extends BaseDAO {
	public int insertMemberInfo(String company_ownername, String company_email, String company_password, String company_name, String company_region_1, String company_region_2, String company_region_3, String company_telephone, String company_phone, int company_emailpush){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO company_user VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
				String companyRegion_3 = rs.getString("compnay_region_3");
				String companyTelephone = rs.getString("company_telephone");
				String companyPhone = rs.getString("company_phone");
				int companyApproval = rs.getInt("company_approval");
				Date companyApprovaldate = rs.getDate("company_approvaldate");
				int companyEmailpush = rs.getInt("company_emailpush");
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion_1, companyRegion_2, companyRegion_3, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyEmailpush);
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
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion_1, companyRegion_2, companyRegion_3, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyEmailpush);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

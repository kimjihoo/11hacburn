package db;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.MemberInfo;

public class MemberInfoDAO extends BaseDAO {
	public int insertMemberInfo(String company_ownername, String company_email, String company_password, String company_name, String company_region, int company_telephone, int company_phone, String company_photo, int company_emailpush){
		int insertRowCnt = 0;
		int randomNum = -1;
		
		PreparedStatement ps=null;
		try
		{
			String sql="INSERT INTO company_user VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=super.getConn().prepareStatement(sql);
			
			ps.setString(2,company_ownername);
			ps.setString(3,company_email);
			ps.setString(4,company_password);
			ps.setString(5,company_name);
			ps.setString(6,company_region);
			ps.setInt(7,company_telephone);
			ps.setInt(8,company_phone);
			ps.setInt(9,0);
			ps.setDate(10,null);
			ps.setString(11,company_photo);
			ps.setInt(12,company_emailpush);
			
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
				String companyRegion = rs.getString("company_region");
				int companyTelephone = rs.getInt("company_telephone");
				int companyPhone = rs.getInt("company_phone");
				int companyApproval = rs.getInt("company_approval");
				Date companyApprovaldate = rs.getDate("company_approvaldate");
				String companyPhoto = rs.getString("company_photo");
				int companyEmailpush = rs.getInt("company_emailpush");
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyPhoto, companyEmailpush);
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
				String companyRegion = rs.getString("company_region");
				int companyTelephone = rs.getInt("company_telephone");
				int companyPhone = rs.getInt("company_phone");
				int companyApproval = rs.getInt("company_approval");
				Date companyApprovaldate = rs.getDate("company_approvaldate");
				String companyPhoto = rs.getString("company_photo");
				int companyEmailpush = rs.getInt("company_emailpush");
				
				memberInfo = new MemberInfo(companyId, companyOwnerName, companyEmail, companyPw, companyName, companyRegion, companyTelephone, companyPhone, companyApproval, companyApprovaldate, companyPhoto, companyEmailpush);
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
}

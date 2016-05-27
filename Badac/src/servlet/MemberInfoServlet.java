package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.MemberInfoDAO;
import model.MemberInfo;

/**
 * Servlet implementation class MemberInfoServlet
 */

public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String emailRegex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
	private static final String passwordRegex = "^[a-z0-9]{4,12}$";
	private static final String nameRegex = "^[°¡-ÆRa-z]{2,8}$";
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		String dispatchUrl = null;
		
		if (action.equals("member_logout")) {
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id") || cookieName.equals("company_ownername") || cookieName.equals("company_email") || cookieName.equals("company_password") || cookieName.equals("company_name") || cookieName.equals("company_region_1") || cookieName.equals("company_region_2") || cookieName.equals("company_region_3") || cookieName.equals("company_telephone") || cookieName.equals("company_phone") || cookieName.equals("company_emailpush") || cookieName.equals("company_lat") || cookieName.equals("company_lng")){
							cookie[i].setValue(null);
							cookie[i].setMaxAge(0);
							response.addCookie(cookie[i]);
						}
					}
				}
			}

			response.sendRedirect("start_page");
		} else if( action.equals("member_sign_up_page") ){
			dispatchUrl = "MemberSignUp.jsp";
		} else if( action.equals("login_page") ){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				response.sendRedirect("member_main_page");
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		} else if(action.equals("member_not_approval_list")){
			
			MemberInfoDAO mid = new MemberInfoDAO();
			
			ArrayList<MemberInfo> na_memberList = mid.notApprovalMemberList();
			mid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			
			if(na_memberList.size()==0){
				msg = "Not Approval Member is none";
			}else{
				JSONArray na_memberListJson = new JSONArray();
				JSONObject na_memberInfo;
				
				try{
					for(MemberInfo temp : na_memberList){
						na_memberInfo = new JSONObject();
						
						na_memberInfo.put("id", temp.getCompany_id());
						na_memberInfo.put("ownername", temp.getCompany_ownername());
						na_memberInfo.put("name", temp.getCompany_name());
						na_memberInfo.put("telephone", temp.getCompany_telephone());
						
						na_memberListJson.put(na_memberInfo);
					}
					json.put("na_memberList", na_memberListJson);
				}
				catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try{
				json.put("msg", msg);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}else if(action.equals("member_list")){
			
			MemberInfoDAO mid = new MemberInfoDAO();
			
			ArrayList<MemberInfo> memberList = mid.memberList();
			mid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			
			if(memberList.size()==0){
				msg = "MemberList is none";
			}else{
				JSONArray memberListJson = new JSONArray();
				JSONObject memberInfo;
				
				try{
					for(MemberInfo temp : memberList){
						memberInfo = new JSONObject();
						
						memberInfo.put("id", temp.getCompany_id());
						memberInfo.put("name", temp.getCompany_name());
						memberInfo.put("telephone", temp.getCompany_telephone());
						memberInfo.put("region2", temp.getCompany_region_2());
						memberInfo.put("region3", temp.getCompany_region_3());
						memberInfo.put("lat", temp.getCompany_lat());
						memberInfo.put("lng", temp.getCompany_lng());
						
						memberListJson.put(memberInfo);
					}
					json.put("memberList", memberListJson);
				}
				catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try{
				json.put("msg", msg);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}
		else if( action.equals("member_main_page") ){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "MemberMainPage.jsp";
			}
			else{
				response.sendRedirect("login_page");
			}
		} else if(action.equals("return_member_cnt")){
			
			MemberInfoDAO mid = new MemberInfoDAO();
			int memberCnt = mid.returnMemberCnt();
			mid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("memberCnt", memberCnt);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		} else if(action.equals("go_member_update_information")){
			String userId = null;
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userId = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userId != null && !(userId.equals("") && Pattern.matches("^[0-9]+$", userId))){
				dispatchUrl="MemberInformationPage.jsp";
			}
			else{
				response.sendRedirect("login_page");
			}
		} else if(action.equals("get_member_info")){
			int id = Integer.parseInt(request.getParameter("id"));
			
			MemberInfoDAO mid = new MemberInfoDAO();
			MemberInfo memberInfo = mid.selectMemberInfoByCompanyId(id);
			mid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("companyOwnerName", memberInfo.getCompany_ownername());
				json.put("companyEmail", memberInfo.getCompany_email());
				json.put("companyPassword", memberInfo.getCompany_password());
				json.put("companyName", memberInfo.getCompany_name());
				json.put("companyRegion_1", memberInfo.getCompany_region_1());
				json.put("companyRegion_2", memberInfo.getCompany_region_2());
				json.put("companyRegion_3", memberInfo.getCompany_region_3());
				json.put("companyTelephone", memberInfo.getCompany_telephone());
				json.put("companyPhone", memberInfo.getCompany_phone());
				json.put("companyEmailpush", memberInfo.getCompany_emailpush());
				json.put("companyLat", memberInfo.getCompany_lat());
				json.put("companyLng", memberInfo.getCompany_lng());
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}else if(action.equals("get_member_address")){
			int id = Integer.parseInt(request.getParameter("id"));
			
			MemberInfoDAO mid = new MemberInfoDAO();
			MemberInfo memberInfo = mid.selectMemberInfoByCompanyId(id);
			mid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("companyLat", memberInfo.getCompany_lat());
				json.put("companyLng", memberInfo.getCompany_lng());
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		

		if (dispatchUrl != null) {
			RequestDispatcher view = request.getRequestDispatcher(dispatchUrl);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		
		if (action.equals("member_email_check")) {
			String errorMsg = "Success";

			String email = request.getParameter("email");

			// email Çü½Ä°Ë»ç
			if (!(Pattern.matches(emailRegex, email))) {
				errorMsg = "EmailRegixError";
			}

			// ÀÖ´Â e-mailÀÎÁö °Ë»ç
			MemberInfoDAO mid = new MemberInfoDAO();
			MemberInfo temp = mid.selectMemberInfoByCompanyEmail(email);
			mid.disconnect();

			if (temp != null) {
				errorMsg = "ExistentEmailError";
			}

			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(errorMsg);
		} else if(action.equals("member_sign_up")){
			String ownername = request.getParameter("ownername");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String region_1 = request.getParameter("region_1");
			String region_2 = request.getParameter("region_2");
			String region_3 = request.getParameter("region_3");
			String telephone = request.getParameter("telephone");
			String phone = request.getParameter("phone");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			String lat = request.getParameter("lat");
			String lng = request.getParameter("lng");
			
			
			String msg = "Success";

			if (ownername == null || ownername.trim().equals("")) {
				msg = "NoInputOwnerName";
			} 
			else if (email == null || email.trim().equals("")) {
				msg = "NoInputEmail";
			} 
			else if (password == null || password.trim().equals("")) {
				msg = "NoInputPassword";
			} 
			else if (name == null || name.trim().equals("")) {
				msg = "NoInputName";
			}
			else if (region_1 == null || region_1.trim().equals("")) {
				msg = "NoInputRegion_1";
			} 
			else if (region_2 == null || region_2.trim().equals("")) {
				msg = "NoInputRegion_2";
			} 
			else if (region_3 == null || region_3.trim().equals("")) {
				msg = "NoInputRegion_3";
			} 
			else if (telephone == null) {
				msg = "NoInputTelePhone";
			}
			else if (phone == null) {
				msg = "NoInputPhone";
			}
			else if(emailpush == -1){
				msg = "NoInputEmailpush";
			}
			else if (lat == null || lat.trim().equals("")) {
				msg = "NoInputlat";
			} 
			else if (lng == null || lng.trim().equals("")) {
				msg = "NoInputlng";
			} 
			else {
				int flag = 1;

				// email Çü½Ä°Ë»ç
				if (!(Pattern.matches(emailRegex, email))) {
					msg = "EmailRegixError";
					flag = -1;
				}

				// ÀÖ´Â e-mailÀÎÁö °Ë»ç
				MemberInfoDAO mid = new MemberInfoDAO();
				MemberInfo temp = mid.selectMemberInfoByCompanyEmail(email);
				mid.disconnect();

				if (temp != null) {
					msg = "ExistentEmailError";
					flag = -1;
				}

				// ºñ¹Ð¹øÈ£ À¯È¿¼º °Ë»ç (¿µ¹® ¼ýÀÚ Á¶ÇÕ 8~12±ÛÀÚ)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}

				if (!(Pattern.matches(nameRegex, name))) {
					msg = "NameRegixError";
					flag = -1;
				}

				if (flag == 1) {
					mid = new MemberInfoDAO();
					mid.insertMemberInfo(ownername, email, password, name, region_1, region_2, region_3, telephone, phone, emailpush, lat, lng);
					mid.disconnect();
				}
			}
			
			JSONObject json = new JSONObject();

			try {
				json.put("msg", msg);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}else if(action.equals("member_approval")){
			int company_id = Integer.parseInt(request.getParameter("company_id"));
			MemberInfoDAO mid = new MemberInfoDAO();
			String temp = mid.memberApproval(company_id);
			mid.disconnect();
			
			String msg = "Success";
			
			if(temp =="fail"){
				msg = "UpdateFail";
			}
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}else if(action.equals("member_login")){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			String msg = "Success";
			
			if(email==null || email.trim().equals("")){
				msg = "No Input Email";
			}else if(password==null || password.trim().equals("")){
				msg = "No Input Password";
			}else{
				int flag = 1;
				
				// email Çü½Ä°Ë»ç
				if (!(Pattern.matches(emailRegex, email))) {
					msg = "EmailRegixError";
					flag = -1;
				}

				// ÀÖ´Â e-mailÀÎÁö °Ë»ç
				MemberInfoDAO mid = new MemberInfoDAO();
				MemberInfo temp = mid.selectMemberInfoByCompanyEmail(email);
				mid.disconnect();

				if (temp == null) {
					msg = "NoEmailError";
					flag = -1;
				}
				
				if(temp.getCompany_approval()==0){
					msg = "No Approval Member";
					flag = -1;
				}

				// ºñ¹Ð¹øÈ£ À¯È¿¼º °Ë»ç (¿µ¹® ¼ýÀÚ Á¶ÇÕ 8~12±ÛÀÚ)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}
				
				if (flag == 1) {
					if (temp.getCompany_password().equals(password)) {
						// ·Î±×ÀÎ ¼º°ø
						Cookie cookie = new Cookie("company_id", Integer.toString(temp.getCompany_id()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_ownername", URLEncoder.encode(temp.getCompany_ownername(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_email", temp.getCompany_email());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_password", temp.getCompany_password());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_name", URLEncoder.encode(temp.getCompany_name(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_region_1", temp.getCompany_region_1());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_region_2", URLEncoder.encode(temp.getCompany_region_2(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_region_3", URLEncoder.encode(temp.getCompany_region_3(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_telephone", temp.getCompany_telephone());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_phone", temp.getCompany_phone());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_emailpush", Integer.toString(temp.getCompany_emailpush()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_lat", URLEncoder.encode(temp.getCompany_lat(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_lng", URLEncoder.encode(temp.getCompany_lng(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
					} 
					else {
						msg = "PasswordError";
					}
				}
				
			}
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}else if(action.equals("member_update_information")){
			int id = Integer.parseInt(request.getParameter("id"));
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String region_1 = request.getParameter("region_1");
			String region_2 = request.getParameter("region_2");
			String region_3 = request.getParameter("region_3");
			String telephone = request.getParameter("telephone");
			String phone = request.getParameter("phone");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			String lat = request.getParameter("lat");
			String lng = request.getParameter("lng");
			
			String msg = "Success";

			
			if (password == null || password.trim().equals("")) {
				msg = "NoInputPassword";
			}
			else if (name == null || name.trim().equals("")) {
				msg = "NoInputName";
			} 
			else if (region_1 == null || region_1.trim().equals("")) {
				msg = "NoInputRegion_1";
			}
			else if (region_2 == null || region_2.trim().equals("")) {
				msg = "NoInputRegion_2";
			}
			else if (region_3 == null || region_3.trim().equals("")) {
				msg = "NoInputRegion_3";
			}
			else if (telephone == null) {
				msg = "NoInputTelePhone";
			}
			else if (phone == null) {
				msg = "NoInputPhone";
			}
			else if (emailpush==-1) {
				msg = "NoInputEmailpush";
			} 
			else if (lat == null || lat.trim().equals("")) {
				msg = "NoInputlat";
			}
			else if (lng == null || lng.trim().equals("")) {
				msg = "NoInputlng";
			}
			else {
				int flag = 1;


				// ÀÖ´Â È¸¿øÀÎÁö °Ë»ç
				MemberInfoDAO mid = new MemberInfoDAO();
				MemberInfo temp = mid.selectMemberInfoByCompanyId(id);
				mid.disconnect();

				if (temp == null) {
					msg = "NotExistentMemberError";
					flag = -1;
				}

				// ºñ¹Ð¹øÈ£ À¯È¿¼º °Ë»ç (¿µ¹® ¼ýÀÚ Á¶ÇÕ 8~12±ÛÀÚ)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}

				if (flag == 1) {
					mid = new MemberInfoDAO();
					msg = mid.updateMemberInfo(id, password, name, region_1, region_2, region_3, telephone, phone, emailpush, lat, lng);
					mid.disconnect();
				}
			}
			
			JSONObject json = new JSONObject();

			try {
				json.put("msg", msg);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.getWriter().write(json.toString());
			
		}
	}

}

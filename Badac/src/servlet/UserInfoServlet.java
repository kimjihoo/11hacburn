package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONException;
import org.json.JSONObject;

import db.BookmarkInfoDAO;
import db.UserInfoDAO;
import model.UserInfo;

/**
 * Servlet implementation class UserInfoServlet
 */
@MultipartConfig
@WebServlet(urlPatterns = { "/", "/index", "/Badac", "/signup_type", "/start_page", "/go_aboutus", "/go_my_application_page", "/go_my_bookmark_page", "/go_delete_user_page", "/application_reply", "/show_application", "/show_member", "/user_logout", "/user_sign_up_page", "/login_page", "/user_main_page", "/return_user_cnt", "/go_user_update_information", "/go_company_application_page", "/get_user_info", "/user_email_check", "/user_sign_up", "/user_login", "/user_update_information", "/delete_userinfo"})
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String emailRegex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
	private static final String passwordRegex = "^[a-z0-9]{4,12}$";
	private static final String nameRegex = "^[��-�Ra-z]{2,8}$";

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
		
		if (action.equals("index") || action.trim().equals("") || action.trim().equals("Badac")) {
			String userId = null;
			String companyId = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					if( cookie[i].getName().equals("user_id")){
						userId = cookie[i].getValue();
					}else if( cookie[i].getName().equals("company_id")){
						companyId = cookie[i].getValue();
					}
				}
				
				if (userId != null && !(userId.equals("")) && Pattern.matches("^[0-9]+$", userId)) {
					response.sendRedirect("user_main_page");
				}else if(companyId != null && !(companyId.equals("")) && Pattern.matches("^[0-9]+$", companyId)){
					response.sendRedirect("member_main_page");
				}
				else {
					response.sendRedirect("start_page");
				}
			}
			else{
				response.sendRedirect("start_page");
			}
		}else if(action.equals("signup_type")){
			dispatchUrl = "SignUpConfirm.jsp";
		}else if(action.equals("start_page")){
			dispatchUrl = "StartPage.jsp";
		}else if(action.equals("go_aboutus")){
			dispatchUrl = "AboutUs.jsp";
		}else if(action.equals("go_my_application_page")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "UserMyApplicationPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}else if(action.equals("go_my_bookmark_page")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "UserBookMarkPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}else if(action.equals("go_delete_user_page")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "DeleteUserPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}
		else if(action.equals("application_reply")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "MemberApplicationReplyPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}
		else if(action.equals("show_application")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "ShowApplicationPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}
		else if(action.equals("show_member")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "UserCompanyInformation.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}
		else if (action.equals("user_logout")) {
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id") || cookieName.equals("user_name") || cookieName.equals("user_email") || cookieName.equals("user_password")|| cookieName.equals("user_region_1") || cookieName.equals("user_region_2")|| cookieName.equals("user_region_3") || cookieName.equals("user_phone") || cookieName.equals("user_bicycletype") ||cookieName.equals("user_emailpush") ||cookieName.equals("user_lat") ||cookieName.equals("user_lng")){
							cookie[i].setValue(null);
							cookie[i].setMaxAge(0);
							response.addCookie(cookie[i]);
						}
					}
				}
			}
			response.sendRedirect("start_page");
		} else if( action.equals("user_sign_up_page") ){
			dispatchUrl = "UserSignUp.jsp";
		} else if( action.equals("login_page") ){
			//System.out.println("�α��� ������");
			
			String userCode = null;
			String companyCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
						if(cookieName.equals("company_id")){
							companyCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				response.sendRedirect("user_main_page");
			}
			if (companyCode != null && !(companyCode.equals("") && Pattern.matches("^[0-9]+$", companyCode))){
				response.sendRedirect("member_main_page");
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		} else if( action.equals("user_main_page") ){
			String userId = null;
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userId = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userId != null && !(userId.equals("") && Pattern.matches("^[0-9]+$", userId))){
				dispatchUrl = "UserMainPage.jsp";
			}
			else{
				
				response.sendRedirect("login_page");
			}
		} else if(action.equals("return_user_cnt")){
			
			UserInfoDAO uid = new UserInfoDAO();
			int userCnt = uid.returnUserCnt();
			uid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("userCnt", userCnt);
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		else if(action.equals("go_user_update_information")){
			String userId = null;
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userId = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userId != null && !(userId.equals("") && Pattern.matches("^[0-9]+$", userId))){
				dispatchUrl="UserInformationPage.jsp";
			}
			else{
				response.sendRedirect("login_page");
			}
		}else if(action.equals("go_company_application_page")){
			String userId = null;
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("company_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userId = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userId != null && !(userId.equals("") && Pattern.matches("^[0-9]+$", userId))){
				dispatchUrl="CompanyApplicationPage.jsp";
			}
			else{
				response.sendRedirect("login_page");
			}
		}
		else if(action.equals("get_user_info")){
			int id = Integer.parseInt(request.getParameter("id"));
			
			UserInfoDAO uid = new UserInfoDAO();
			UserInfo userInfo = uid.selectUserInfoByUserId(id);
			uid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("userName", userInfo.getUser_name());
				json.put("userEmail", userInfo.getUser_email());
				json.put("userPassword", userInfo.getUser_password());
				json.put("userRegion_1", userInfo.getUser_region_1());
				json.put("userRegion_2", userInfo.getUser_region_2());
				json.put("userRegion_3", userInfo.getUser_region_3());
				json.put("userPhone", userInfo.getUser_phone());
				json.put("userBicycletype", userInfo.getUser_bicycletype());
				json.put("userEmailpush", userInfo.getUser_emailpush());
				json.put("userLat", userInfo.getUser_lat());
				json.put("userLng", userInfo.getUser_lng());
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
		
		if (action.equals("user_email_check")) {
			String errorMsg = "Success";

			String email = request.getParameter("email");

			// email ���İ˻�
			if (!(Pattern.matches(emailRegex, email))) {
				errorMsg = "EmailRegixError";
			}

			// �ִ� e-mail���� �˻�
			UserInfoDAO uid = new UserInfoDAO();
			UserInfo temp = uid.selectUserInfoByUserEmail(email);
			uid.disconnect();

			if (temp != null) {
				errorMsg = "ExistentEmailError";
			}

			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(errorMsg);
		} else if(action.equals("user_sign_up")){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String region_1 = request.getParameter("region_1");
			String region_2 = request.getParameter("region_2");
			String region_3 = request.getParameter("region_3");
			String phone = request.getParameter("phone");
			String bicycletype = request.getParameter("bicycletype");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			String lat = request.getParameter("lat");
			String lng = request.getParameter("lng");
			
			String msg = "Success";

			if (email == null || email.trim().equals("")) {
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
			else if (phone == null) {
				msg = "NoInputPhone";
			} 
			else if (bicycletype == null || bicycletype.trim().equals("")) {
				msg = "NoInputBicycletype";
			} 
			else if (emailpush==-1) {
				msg = "NoInputEmailpush";
			}
			else if (lat==null || lat.trim().equals("")) {
				msg = "NoInputLat";
			} 
			else if (lng==null || lng.trim().equals("")) {
				msg = "NoInputLng";
			} 
			else {
				int flag = 1;

				// email ���İ˻�
				if (!(Pattern.matches(emailRegex, email))) {
					msg = "EmailRegixError";
					flag = -1;
				}

				// �ִ� e-mail���� �˻�
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserEmail(email);
				uid.disconnect();

				if (temp != null) {
					msg = "ExistentEmailError";
					flag = -1;
				}

				// ��й�ȣ ��ȿ�� �˻� (���� ���� ���� 8~12����)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}

				if (!(Pattern.matches(nameRegex, name))) {
					msg = "NameRegixError";
					flag = -1;
				}

				if (flag == 1) {
					uid = new UserInfoDAO();
					uid.insertUserInfo(name, email, password, region_1, region_2, region_3, phone, bicycletype,emailpush,lat,lng);
					uid.disconnect();

					uid = new UserInfoDAO();
					UserInfo userInfo = uid.selectUserInfoByUserEmail(email);
					uid.disconnect();
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
			
		} else if(action.equals("user_login")){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			String msg = "Success";
			
			if(email==null || email.trim().equals("")){
				msg = "No Input Email";
			}else if(password==null || password.trim().equals("")){
				msg = "No Input Password";
			}else{
				int flag = 1;
				
				// email ���İ˻�
				if (!(Pattern.matches(emailRegex, email))) {
					msg = "EmailRegixError";
					flag = -1;
				}

				// �ִ� e-mail���� �˻�
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserEmail(email);
				uid.disconnect();
				
				if (temp == null) {
					msg = "NoEmailError";
					flag = -1;
				}

				// ��й�ȣ ��ȿ�� �˻� (���� ���� ���� 8~12����)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}

				if (flag == 1) {
					if (temp.getUser_password().equals(password)) {
						// �α��� ����
						Cookie cookie = new Cookie("user_id", Integer.toString(temp.getUser_id()));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_name", URLEncoder.encode(temp.getUser_name(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_email", temp.getUser_email());
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_password", temp.getUser_password());
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_region_1", temp.getUser_region_1());
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_region_2", URLEncoder.encode(temp.getUser_region_2(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_region_3", URLEncoder.encode(temp.getUser_region_3(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_phone", temp.getUser_phone());
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_bicycletype", URLEncoder.encode(temp.getUser_bicycletype(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_emailpush", Integer.toString(temp.getUser_emailpush()));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_lat", URLEncoder.encode(temp.getUser_lat(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_lng", URLEncoder.encode(temp.getUser_lng(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24�ð� ��Ű ����
						
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
			
		}else if(action.equals("user_update_information")){
			int id = Integer.parseInt(request.getParameter("id"));
			String password = request.getParameter("password");
			String region_1 = request.getParameter("region_1");
			String region_2 = request.getParameter("region_2");
			String region_3 = request.getParameter("region_3");
			String phone = request.getParameter("phone");
			String bicycletype = request.getParameter("bicycletype");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			String lat = request.getParameter("lat");
			String lng = request.getParameter("lng");
			
			String msg = "Success";

			
			if (password == null || password.trim().equals("")) {
				msg = "NoInputPassword";
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
			else if (phone == null) {
				msg = "NoInputPhone";
			} 
			else if (bicycletype == null || bicycletype.trim().equals("")) {
				msg = "NoInputBicycletype";
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


				// �ִ� ȸ������ �˻�
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserId(id);
				uid.disconnect();

				if (temp == null) {
					msg = "NotExistentUserError";
					flag = -1;
				}

				// ��й�ȣ ��ȿ�� �˻� (���� ���� ���� 8~12����)
				if (!(Pattern.matches(passwordRegex, password))) {
					msg = "PasswordRegixError";
					flag = -1;
				}

				if (flag == 1) {
					uid = new UserInfoDAO();
					msg = uid.updateUserInfo(id, password, region_1, region_2, region_3, phone, bicycletype,emailpush, lat, lng);
					uid.disconnect();
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
			
		}else if(action.equals("delete_userinfo")){
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String user_pw = request.getParameter("user_pw");
			
			String msg = "Success";
			
			UserInfoDAO uid = new UserInfoDAO();
			int temp = uid.checkUserPw(user_id, user_pw);
			uid.disconnect();
			if(temp==1){
				uid = new UserInfoDAO();
				uid.deleteUserInfo(user_id);
				uid.disconnect();
			}else{
				msg = "Password Error";
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

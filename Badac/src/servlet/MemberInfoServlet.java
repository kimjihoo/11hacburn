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
						if( cookieName.equals("company_id") || cookieName.equals("company_ownername") || cookieName.equals("company_email") || cookieName.equals("company_password") || cookieName.equals("company_name") || cookieName.equals("company_region") || cookieName.equals("company_telephone") || cookieName.equals("company_phone") || cookieName.equals("company_emailpush")){
							cookie[i].setValue(null);
							cookie[i].setMaxAge(0);
							response.addCookie(cookie[i]);
						}
					}
				}
			}

			response.sendRedirect("login_page");
		} else if( action.equals("member_sign_up_page") ){
			dispatchUrl = "MemberSignUp.jsp";
		} else if( action.equals("login_page") ){
			//System.out.println("·Î±×ÀÎ ÆäÀÌÁö");
			
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
		} else if( action.equals("member_main_page") ){
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

		String dispatchUrl = null;
		
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
			String region = request.getParameter("region");
			int telephone = Integer.parseInt(request.getParameter("telephone"));
			int phone = Integer.parseInt(request.getParameter("phone"));
			String photo = request.getParameter("photo");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			
			
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
			else if (region == null || region.trim().equals("")) {
				msg = "NoInputRegion";
			} 
			else if (telephone == -1) {
				msg = "NoInputTelePhone";
			}
			else if (phone == -1) {
				msg = "NoInputPhone";
			}
			else if(emailpush == -1){
				msg = "NoInputEmailpush";
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
					mid.insertMemberInfo(ownername, email, password, name, region, telephone, phone, photo, emailpush);
					mid.disconnect();

					mid = new MemberInfoDAO();
					MemberInfo memberInfo = mid.selectMemberInfoByCompanyEmail(email);
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
			
		} else if(action.equals("member_login")){
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
						
						cookie = new Cookie("company_region", URLEncoder.encode(temp.getCompany_region(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_telephone", Integer.toString(temp.getCompany_telephone()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_phone", Integer.toString(temp.getCompany_phone()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("company_emailpush", Integer.toString(temp.getCompany_emailpush()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
					} 
					else {
						msg = "PasswordError";
					}
				}
				
			}
			
			JSONObject json = new JSONObject();
			
			//System.out.println(msg);
			
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
		doGet(request, response);
	}

}

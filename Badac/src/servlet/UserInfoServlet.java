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

import db.UserInfoDAO;
import model.UserInfo;

/**
 * Servlet implementation class UserInfoServlet
 */
@MultipartConfig
//@WebServlet(urlPatterns = { "", "/index", "/id_check", "/sign_up", "/login", "/logout", "/login_page", "/sign_up_page", "/main_page"})
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String emailRegex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
	private static final String passwordRegex = "^[a-z0-9]{4,12}$";
	private static final String nameRegex = "^[°¡-ÆRa-z]{2,8}$";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					if( cookie[i].getName().equals("user_id")){ // ¿©·¯´ë È®ÀÎÇØ
						//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
						//System.out.println("Index : " +cookie[i].getValue());
						userCode = cookie[i].getValue();
					}
				}
				
				if (userCode != null && !(userCode.equals("")) && Pattern.matches("^[0-9]+$", userCode)) {
					response.sendRedirect("main_page");
				} else {
					response.sendRedirect("login_page");
				}
			}
			else{
				response.sendRedirect("login_page");
			}
		} else if (action.equals("logout")) {
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_code") || cookieName.equals("user_check") || cookieName.equals("user_id") || cookieName.equals("user_name")){
							cookie[i].setValue(null);
							cookie[i].setMaxAge(0);
							response.addCookie(cookie[i]);
						}
					}
				}
			}

			response.sendRedirect("");
		} else if( action.equals("sign_up_page") ){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				response.sendRedirect("main_page");
			}
			else{
				dispatchUrl = "GeneralSignUP.jsp";
			}
		} else if( action.equals("login_page") ){
			//System.out.println("·Î±×ÀÎ ÆäÀÌÁö");
			
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				response.sendRedirect("main_page");
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		} else if( action.equals("main_page") ){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){ // ¿©·¯´ë È®ÀÎÇØ
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
			}
			
			if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))){
				dispatchUrl = "MainPage.jsp";
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
		
		if (action.equals("email_check")) {
			String errorMsg = "Success";

			String email = request.getParameter("email");

			// email Çü½Ä°Ë»ç
			if (!(Pattern.matches(emailRegex, email))) {
				errorMsg = "EmailRegixError";
			}

			// ÀÖ´Â e-mailÀÎÁö °Ë»ç
			UserInfoDAO uid = new UserInfoDAO();
			UserInfo temp = uid.selectUserInfoByUserEmail(email);
			uid.disconnect();

			if (temp != null) {
				errorMsg = "ExistentEmailError";
			}

			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(errorMsg);
		} else if(action.equals("sign_up")){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String region = request.getParameter("region");
			int phone = Integer.parseInt(request.getParameter("phone"));
			String bicycletype = request.getParameter("bicycletype");
			int emailpush = Integer.parseInt(request.getParameter("emailpush"));
			
			
		} else if(action.equals("login")){
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
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserEmail(email);
				uid.disconnect();

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
					if (temp.getUser_password().equals(password)) {
						// ·Î±×ÀÎ ¼º°ø
						Cookie cookie = new Cookie("user_id", Integer.toString(temp.getUser_id()));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_name", URLEncoder.encode(temp.getUser_name(), "UTF-8"));
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						cookie = new Cookie("user_email", temp.getUser_email());
						
						cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
						
						response.addCookie(cookie);
						
						//if( checkBox != null ){ // ¼¼¼Ç
							cookie = new Cookie("user_check", "true");
							
							cookie.setMaxAge(24*60*60); // 24½Ã°£ ÄíÅ° À¯Áö
							
							response.addCookie(cookie);
						//}
						
						//response.sendRedirect("");
						
						//dispatchUrl = "MainPage.jsp";
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

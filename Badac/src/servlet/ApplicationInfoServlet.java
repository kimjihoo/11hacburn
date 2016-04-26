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

import db.ApplicationInfoDAO;
import db.UserInfoDAO;
import model.ApplicationInfo;
import model.UserInfo;

/**
 * Servlet implementation class ApplicationInfoServlet
 */
public class ApplicationInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

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
		
		if(action.equals("write_application")){
			dispatchUrl = "ApplicationWritePage.jsp";
		}else if(action.equals("my_application")){
			dispatchUrl = "MyApplicationPage.jsp";
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
		
		if(action.equals("insert_application")){
			int user_id = Integer.parseInt(request.getParameter("id"));
			String tunning_title = request.getParameter("title");
			String tunning_explanation = request.getParameter("explanation");
			
			String msg = "Success";
			
			if(tunning_title==null || tunning_title.trim().equals("")){
				msg="NoTitleError";
			}else if(tunning_explanation==null || tunning_explanation.trim().equals("")){
				msg="NoExplanationError";
			}else{
				int flag = 1;
				
				//존재하는 사용자 코드인지 확인
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserId(user_id);
				uid.disconnect();
				
				if(temp==null){
					msg="NoExistUser";
					flag = -1;
				}
				
				if(flag==1){
					ApplicationInfoDAO aid = new ApplicationInfoDAO();
					aid.insertApplicationInfo(user_id, tunning_title, tunning_explanation);
					aid.disconnect();
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

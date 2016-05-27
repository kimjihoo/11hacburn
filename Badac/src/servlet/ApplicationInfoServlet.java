package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import db.MemberInfoDAO;
import db.PictureInfoDAO;
import db.UserInfoDAO;
import model.ApplicationInfo;
import model.MemberInfo;
import model.PictureInfo;
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
				dispatchUrl = "UserApplicationRegistPage.jsp";
			}
			else{
				dispatchUrl = "LoginPage.jsp";
			}
		}else if(action.equals("my_application_list")){
			int user_id = Integer.parseInt(request.getParameter("userId"));
			
			ApplicationInfoDAO aid = new ApplicationInfoDAO();
			
			ArrayList<ApplicationInfo> applicationList = aid.getMyApplicationList(user_id);
			aid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			
			if(applicationList.size()==0){
				msg = "Not Exist Application";
			}else{
				JSONArray applicationListJson = new JSONArray();
				JSONObject applicationInfo;
				
				try{
					for(ApplicationInfo temp : applicationList){
						applicationInfo = new JSONObject();
						
						applicationInfo.put("id", temp.getTunning_id());
						applicationInfo.put("title", temp.getTunning_title());
						applicationInfo.put("date", temp.getUpload_date());
						
						applicationListJson.put(applicationInfo);
					}
					json.put("applicationList", applicationListJson);
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
		}else if(action.equals("company_application_list")){
			int company_id = Integer.parseInt(request.getParameter("id"));
			
			ApplicationInfoDAO aid = new ApplicationInfoDAO();
			
			ArrayList<ApplicationInfo> applicationList = aid.getCompanyApplicationList(company_id);
			aid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			
			if(applicationList.size()==0){
				msg = "Not Exist Application";
			}else{
				JSONArray applicationListJson = new JSONArray();
				JSONObject applicationInfo;
				
				try{
					for(ApplicationInfo temp : applicationList){
						applicationInfo = new JSONObject();
						
						applicationInfo.put("id", temp.getTunning_id());
						applicationInfo.put("title", temp.getTunning_title());
						applicationInfo.put("date", temp.getUpload_date());
						applicationInfo.put("chk", temp.getChk());
						
						applicationListJson.put(applicationInfo);
					}
					json.put("applicationList", applicationListJson);
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
		else if(action.equals("application_list")){
			int company_id = Integer.parseInt(request.getParameter("id"));
			
			ApplicationInfoDAO aid = new ApplicationInfoDAO();
			
			ArrayList<ApplicationInfo> applicationList = aid.getApplicationList(company_id);
			aid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			
			if(applicationList.size()==0){
				msg = "Not Exist Application";
			}else{
				JSONArray applicationListJson = new JSONArray();
				JSONObject applicationInfo;
				
				try{
					for(ApplicationInfo temp : applicationList){
						applicationInfo = new JSONObject();
						
						applicationInfo.put("id", temp.getTunning_id());
						applicationInfo.put("title", temp.getTunning_title());
						applicationInfo.put("date", temp.getUpload_date());
						applicationInfo.put("chk", temp.getChk());
						
						applicationListJson.put(applicationInfo);
					}
					json.put("applicationList", applicationListJson);
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
		else if(action.equals("get_application_info")){
			int id = Integer.parseInt(request.getParameter("tunningId"));
			
			ApplicationInfoDAO aid = new ApplicationInfoDAO();
			ApplicationInfo applicationInfo = aid.selectApplicationInfoByTunningId(id);
			aid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("id", applicationInfo.getTunning_id());
				json.put("title", applicationInfo.getTunning_title());
				json.put("explanation", applicationInfo.getTunning_explanation());
				json.put("date", applicationInfo.getUpload_date());
			}
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		else if(action.equals("get_application_info_2")){
			int id = Integer.parseInt(request.getParameter("tunningId"));
			
			ApplicationInfoDAO aid = new ApplicationInfoDAO();
			ApplicationInfo applicationInfo = aid.selectApplicationInfoByTunningId(id);
			int user_id = applicationInfo.getUser_id();
			System.out.println(user_id);
			UserInfoDAO uid = new UserInfoDAO();
			String user_name = uid.selectUserNameByUserId(user_id);
			System.out.println(user_name);
			aid.disconnect();
			uid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			
			try{
				json.put("msg", msg);
				json.put("id", applicationInfo.getTunning_id());
				json.put("name", user_name);
				json.put("title", applicationInfo.getTunning_title());
				json.put("explanation", applicationInfo.getTunning_explanation());
				json.put("date", applicationInfo.getUpload_date());
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
		
		if(action.equals("insert_application")){
			int user_id = Integer.parseInt(request.getParameter("id"));
			String tunning_title = request.getParameter("title");
			String tunning_explanation = request.getParameter("explanation");
			
			String msg = "Success";
			JSONObject json = new JSONObject();
			if(tunning_title==null || tunning_title.trim().equals("")){
				msg="NoTitleError";
			}else if(tunning_explanation==null || tunning_explanation.trim().equals("")){
				msg="NoExplanationError";
			}else{
				int flag = 1;
				
				//�����ϴ� ����� �ڵ����� Ȯ��
				UserInfoDAO uid = new UserInfoDAO();
				UserInfo temp = uid.selectUserInfoByUserId(user_id);
				uid.disconnect();
				
				if(temp==null){
					msg="NoExistUser";
					flag = -1;
				}
				
				if(flag==1){
					ApplicationInfoDAO aid = new ApplicationInfoDAO();
					int randomNum=0;
					while(true){
						randomNum = (int)(Math.random() * 100000000);
						if(aid.selectTunningTitleByTunningId(randomNum).equals("")){
							//System.out.println(randomNum);
							break;
						}
					}
					try {
						json.put("appId",randomNum);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					aid.insertApplicationInfo(randomNum,user_id, tunning_title, tunning_explanation);
					aid.disconnect();
				}
			}
			

			try {
				json.put("msg", msg);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		else if(action.equals("application_reply_regist")){
			int tunning_id = Integer.parseInt(request.getParameter("tunningId"));
			int tunning_company_id = Integer.parseInt(request.getParameter("tunningCompanyId"));
			String tunning_answer = request.getParameter("reply");
			
			String msg = "Success";
			JSONObject json = new JSONObject();
			if(tunning_answer==null || tunning_answer.trim().equals("")){
				msg="NoAnswerError";
			}else{
				int flag = 1;
				
				//�����ϴ� ����� �ڵ����� Ȯ��
				ApplicationInfoDAO aid = new ApplicationInfoDAO();
				ApplicationInfo temp = aid.selectApplicationInfoByTunningId(tunning_id);
				aid.disconnect();
				
				if(temp==null){
					msg="NoApplication Error";
					flag = -1;
				}
				
				if(flag==1){
					aid = new ApplicationInfoDAO();
					int randomNum=0;
					while(true){
						randomNum = (int)(Math.random() * 100000000);
						if(aid.selectTunningTitleByTunningId(randomNum).equals("")){
							//System.out.println(randomNum);
							break;
						}
					}
					aid.insertApplicationReplyInfo(randomNum,tunning_id, tunning_company_id, tunning_answer);
					aid.disconnect();
				}
			}
			

			try {
				json.put("msg", msg);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
		else if(action.equals("delete_application")){
			String userCode = null;
			
			Cookie[] cookie = request.getCookies();
			
			if( cookie != null ){
				int cLen = cookie.length;
				for (int i = 0; i < cLen; i++) {
					String cookieName = cookie[i].getName();
					
					if( cookieName != null ){
						if( cookieName.equals("user_id")){
							userCode = cookie[i].getValue();
						}
						else if( cookieName.equals("company_id")){
							userCode = cookie[i].getValue();
						}
					}
				}
				
				if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))) {
					String msg = "Success";
					
					if( userCode == null || userCode.equals("") ){
						msg = "Fail";
					}
					else{
						int tunningId = Integer.parseInt(request.getParameter("tunningId"));
						if( tunningId == 0 ){
							msg = "ParameterError";
						}
						else{
							ApplicationInfoDAO pid = new ApplicationInfoDAO();
							pid.deleteApplicationInfoByTunningId(tunningId);
							pid.disconnect();
						}			
					}
					
					JSONObject json = new JSONObject();
			        
			        try{
						json.put("msg", msg);
					}
					catch(JSONException e){
						e.printStackTrace();
					}
					
					response.setContentType("application/json");
					response.getWriter().write(json.toString());
				} else {
					response.sendRedirect("");
				}
			}
			else{
				response.sendRedirect("");
			}
		}
	}

}
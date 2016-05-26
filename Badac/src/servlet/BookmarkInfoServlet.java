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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.UserInfoDAO;
import model.UserInfo;
import db.MemberInfoDAO;
import model.MemberInfo;
import db.ApplicationInfoDAO;
import db.BookmarkInfoDAO;
import model.ApplicationInfo;
import model.BookmarkInfo;

/**
 * Servlet implementation class BookmarkInfoServlet
 */
@WebServlet("/BookmarkInfoServlet")
public class BookmarkInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		
		if(action.equals("show_my_bookmark")){
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			
			BookmarkInfoDAO bid = new BookmarkInfoDAO();
			
			ArrayList<BookmarkInfo> bookmarkList = bid.getMyBookmarkList(user_id);
			bid.disconnect();
			
			String msg = "Success";
			
			JSONObject json = new JSONObject();
			if(bookmarkList.size()==0){
				msg = "Not Exist BookmarkList";
			}else{
				JSONArray bookmarkListJson = new JSONArray();
				JSONObject bookmarkInfo;
				
				try{
					for(BookmarkInfo temp : bookmarkList){
						bookmarkInfo = new JSONObject();
						
						bookmarkInfo.put("companyId", temp.getCompany_id());
						
						bookmarkListJson.put(bookmarkInfo);
					}
					json.put("bookmarkList", bookmarkListJson);
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
			
		}else if(action.equals("check_bookmark")){
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			int company_id = Integer.parseInt(request.getParameter("company_id"));
			
			String msg = "Success";
			
			BookmarkInfoDAO bid = new BookmarkInfoDAO();
			int userID = bid.checkBookmark(user_id, company_id);
			bid.disconnect();
			
			JSONObject json = new JSONObject();

			try {
				json.put("msg", msg);
				json.put("chk", userID);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		
		if(action.equals("add_bookmark")){
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			int company_id = Integer.parseInt(request.getParameter("company_id"));
			
			String msg = "Success";
			BookmarkInfoDAO bid = new BookmarkInfoDAO();
			int temp = bid.checkBookmark(user_id, company_id);
			bid.disconnect();
			if(temp==-1){
				bid = new BookmarkInfoDAO();
				bid.insertBookmarkInfo(user_id, company_id);
				bid.disconnect();
			}else{
				msg = "Already marked Company";
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
		}else if(action.equals("delete_bookmark")){
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			int company_id = Integer.parseInt(request.getParameter("company_id"));
			
			String msg = "Success";
			BookmarkInfoDAO bid = new BookmarkInfoDAO();
			int temp = bid.checkBookmark(user_id, company_id);
			bid.disconnect();
			if(temp!=-1){
				bid = new BookmarkInfoDAO();
				bid.deleteBookmarkInfo(user_id, company_id);
				bid.disconnect();
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

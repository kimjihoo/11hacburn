package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
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

import db.MemberInfoDAO;
import db.PictureInfoDAO;
import db.UserInfoDAO;
import model.MemberInfo;
import model.PictureInfo;
import model.UserInfo;
/**
 * Servlet implementation class PictureInfoServlet
 */
@WebServlet("/PictureInfoServlet")
public class PictureInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PictureInfoServlet() {
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
		
		if(action.equals("get_picture_list")){
			//HttpSession session = request.getSession();
			//String userCode = (String)session.getAttribute("user_code");
			
			//String userCode = "1";
			
			String userCode = null;
			int appId = Integer.parseInt(request.getParameter("appId"));
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
						else if( cookieName.equals("company_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
							userCode = cookie[i].getValue();
						}
					}
				}
				
				if (userCode != null && !(userCode.equals("") && Pattern.matches("^[0-9]+$", userCode))) {
					PictureInfoDAO pid = new PictureInfoDAO();
					ArrayList<PictureInfo> pictureList=null;
					pictureList = pid.selectPictureInfoByUserId(Integer.parseInt(userCode), appId);
					
					pid.disconnect();
					
					String msg = "Success";
					
					JSONObject json = new JSONObject();
					
					if( pictureList.size() == 0 ){
						msg = "NoPicture";
					}
					else{
						JSONArray pictureListJson = new JSONArray();
						JSONObject pictureInfo;
						
						try{
							for(PictureInfo temp : pictureList){
								pictureInfo = new JSONObject();
								
								pictureInfo.put("id", temp.getPictureId());
								pictureInfo.put("path", temp.getPicturePath());
								
								pictureListJson.put(pictureInfo);
							}
							
							json.put("pictureList", pictureListJson);
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
				} else {
					response.sendRedirect("");
				}
			}
			else{
				response.sendRedirect("");
			}			
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
		
		// TODO Auto-generated method stub
		if(action.equals("upload_picture")){
			//HttpSession session = request.getSession();
			//String userCode = (String)session.getAttribute("user_code");
			
			//String userCode = "1"; // �ӽ� �����ڵ�
			int appId = Integer.parseInt(request.getParameter("appId"));
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
						}else if(cookieName.equals("company_id")){
							userId = cookie[i].getValue();
						}
					}
				}
				
				if (userId != null && !(userId.equals("") && Pattern.matches("^[0-9]+$", userId))) {
					//System.out.println("Upload File Directory="+getServletContext().getRealPath("/").toString());
					
					String applicationPath = request.getServletContext().getRealPath("");
					String uploadFilePath=null;
					if(appId==0){
						uploadFilePath = applicationPath + "picture/" + userId + "/";
					}else if(appId!=0){
						uploadFilePath = applicationPath + "picture/" + userId + "/"+appId+"/";
					}
			        //String uploadFilePath = "C:\\PIE\\picture\\" + userCode + "\\";
			          
			        java.io.File fileSaveDir = new java.io.File(uploadFilePath);
			        if (!fileSaveDir.exists()) {
			            fileSaveDir.mkdirs();
			        }
			         
			        String msg = "Success";
			        
			        if( request.getPart("file").getContentType().equals("application/octet-stream") ){
			        	msg = "NoFile";
			        }
			        else{
			        	PictureInfoDAO pid = new PictureInfoDAO();
			        	
			        	ArrayList<PictureInfo> pictureList=null;
			        	
			        	if(appId==0){
			        		pictureList = pid.selectPictureInfoByUserId(Integer.parseInt(userId));
						}else if(appId!=0){
							pictureList = pid.selectPictureInfoByUserId(Integer.parseInt(userId), appId);
						}
			        	pid.disconnect();
			        	
			        	//System.out.println(uploadFilePath);
			        	//System.out.println("���ε� ���� ���� : " + request.getParts().size());
			        	//System.out.println("DB�� �ִ� ���� ���� : " + pictureList.size());
			        	
			        	if (((request.getParts().size()) + (pictureList.size())) > 10 ){
			        		msg = "TooMuchFile";
			        	}
			        	else{
			        		// To do
				        	// File name : JPG / JPEG / PNG �� �ޱ�
				        	// File size : X mb ���ϸ� �ޱ�
				        	
				        	String fileName = null;
					       
					        //System.out.println(request.getParts().size());
					        
					        int uploadFileCnt = 0;
					        
					        for (Part part : request.getParts()) {
					            fileName = getFilename(part);
					            
					            if( fileName != null ){
					            	int fileTypeIndex = fileName.lastIndexOf(".");
						    		String fileType = fileName.substring(fileTypeIndex+1);
						    		
						    		if( !(fileType.trim().equals("")) && (fileType.equals("png") || fileType.equals("PNG") || fileType.equals("jpg") || fileType.equals("JPG") || fileType.equals("jpeg") || fileType.equals("JPEG"))){
						    			int randomNum = -1;
						            	
						            	pid = new PictureInfoDAO();
						            	
						            	while(true){
						            		randomNum = (int)(Math.random() * 100000000);
						    				if(pid.selectPictureIdByPictureId(randomNum) == -1){
						    					//System.out.println(randomNum);
						    					break;
						    				}
						            	}
						            	
						            	pid.disconnect();
						            	
						            	part.write(uploadFilePath + Integer.toString(randomNum)+"." + fileType);
						            	
						            	//String widgetCode = request.getParameter("w_code");
						            	
						            	pid = new PictureInfoDAO();
						            	pid.insertPictureInfo(randomNum, Integer.parseInt(userId), appId, "picture/"+userId+"/"+Integer.toString(randomNum)+"."+fileType);
						            	pid.disconnect();
						            	
						            	uploadFileCnt++;
						    		}
						    		else{
						    			msg = "fileTypeError";
						    		}
					            }
					            else{
					            	msg = "ParameterError!";
					            }
					        }
					        
					        if( uploadFileCnt != request.getParts().size() ){
					        	msg = "Fail";
					        }
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
		else if(action.equals("delete_picture")){
			//HttpSession session = request.getSession();
			//String userCode = (String)session.getAttribute("user_code");
			
			//String userCode = "1"; // �ӽ� �����ڵ�
			
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
						else if( cookieName.equals("company_id")){ // ������ Ȯ����
							//System.out.println(cookie[i].getName() + " : " + cookie[i].getValue());
							//System.out.println("Index : " +cookie[i].getValue());
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
						String code = request.getParameter("picture_id");
						
						if( code == null || code == "" ){
							msg = "ParameterError";
						}
						else{
							PictureInfoDAO pid = new PictureInfoDAO();
							PictureInfo pictureInfo = pid.selectPictureInfoByPictureId(Integer.parseInt(code));
							pid.disconnect();
							
							if( pictureInfo == null ){
								msg = "NoPicture";
							}
							else{
								String applicationPath = request.getServletContext().getRealPath("");
								
								//System.out.println(applicationPath + pictureInfo.getPicturePath());
								
								try{
									Files.delete(Paths.get(applicationPath + pictureInfo.getPicturePath()));
								}
								catch(Exception e){
									msg = "DeleteFail";
								}
								
								pid = new PictureInfoDAO();
								pid.deletePictureInfoByPictureId(Integer.parseInt(userCode), Integer.parseInt(code));
								pid.disconnect();
							}
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
	
	private String getFilename(Part part) {
        String contentDispositionHeader = part.getHeader("content-disposition");
        String[] elements = contentDispositionHeader.split(";");
        
        for(String element:elements){
        	if( element.trim().startsWith("filename")){
        		return element.substring(element.indexOf('=')+1).trim().replace("\"", "");
        	}
        }
        
        return null;
	}

}
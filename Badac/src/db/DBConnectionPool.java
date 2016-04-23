package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnectionPool
{
	private static DBConnectionPool instance;
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/badac?useSSL=false";
	private String user = "root";
	private String password = "tonykim";

	public static synchronized DBConnectionPool getInstance(){
		if(instance == null)
		{
			instance = new DBConnectionPool();
			return instance;
		}
		return instance;
	}

	private DBConnectionPool(){
		driverLoading(this.driver,this.url,this.user,this.password);
	}

	public Connection getConnection() throws SQLException{
		return DriverManager.getConnection(url,user,password);
	}

	public void driverLoading(String driver,String url,String user,String password){
		if(driver != null)
			this.driver = driver;
		if(url != null)
			this.url = url;
		if(user != null)
			this.user = user;
		if(password != null)
			this.password = password;
		try
		{
			System.out.println(this.url);
			Class.forName(driver);
		}
		catch (Exception e)
		{
			
			System.out.println("Driver Loading Error :");
		}
	}
}
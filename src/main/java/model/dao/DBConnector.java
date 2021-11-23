package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	// database 접속을 위한 connection singleton 방식으로
	private static DBConnector instance = new DBConnector();
	private DBConnector() {}
	
	public static DBConnector getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/boarddb?characterEncoding=UTF-8&allowMultiQueries=true";
		String user = "root";
		String password = "1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class UserDAO{
	Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword)
	{
		String SQL = "SELECT UserPass FROM USER WHERE UserID =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					return 1;
				}else
					return 0;
			}
			return -1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public int join(String Id, String Pas, String Email, String Tel) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Id);
			pstmt.setString(2, Pas);
			pstmt.setString(3, Email);
			pstmt.setString(4, Tel);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
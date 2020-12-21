package bbs;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO{
	Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
	public BbsDAO() {
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
	public int getNext() {
		String SQL = "SELECT Cnum FROM card ORDER BY Cnum DESC";		//글번호가져오기
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;		//게시물이 하나일 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;			//db오류
	}
	
	public int write(String UserID, String Cname, String Uname, String Uphone, String Upos, String Udep, String Uemail) {
		String SQL = "INSERT INTO card VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext());		//게시물 번호
			pstmt.setString(2, UserID);
			pstmt.setString(3, Cname);				//Available값
			pstmt.setString(4, Uname);
			pstmt.setString(5, Uphone);
			pstmt.setString(6, Udep);
			pstmt.setString(7, Upos);
			pstmt.setString(8, Uemail);
			
			return pstmt.executeUpdate();	//성공했을 경우 0 이상의 값

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1; //데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber, String id){ 

		String SQL = "SELECT * FROM card WHERE Cnum < ? and userID = ? ORDER BY Cnum DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setCnum(rs.getInt(1));
				bbs.setUserID(rs.getString(2));
				bbs.setCname(rs.getString(3));
				bbs.setUname(rs.getString(4));
				bbs.setUphone(rs.getString(5));
				bbs.setUdep(rs.getString(6));
				bbs.setUpos(rs.getString(7));
				bbs.setUemail(rs.getString(8));
				list.add(bbs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage (int pageNumber) {

		String SQL = "SELECT * FROM card WHERE Cnum < ? ORDER BY ID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM card WHERE Cnum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setCnum(rs.getInt(1));
				bbs.setUserID(rs.getString(2));
				bbs.setCname(rs.getString(3));
				bbs.setUname(rs.getString(4));
				bbs.setUphone(rs.getString(5));
				bbs.setUdep(rs.getString(6));
				bbs.setUpos(rs.getString(7));
				bbs.setUemail(rs.getString(8));

				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int update(int Cnum, String Cname, String Uname, String Uphone, String Udep, String Upos, String Uemail) {
		String SQL = "UPDATE card SET Cname = ?, Uname = ?, Uphone = ?, Udep = ?, Upos = ?, Uemail = ?, WHERE Cnum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Cname);		//게시물 번호
			pstmt.setString(2, Uname);
			pstmt.setString(3, Uphone);
			pstmt.setString(4, Udep);
			pstmt.setString(5, Upos);
			pstmt.setString(6, Uemail);
			pstmt.setInt(7, Cnum);
			
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int ID) {
		String SQL = "DELETE FROM card WHERE Cnum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setInt(1, ID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}
package com;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Com;

public class ComDAO{
	Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
	public ComDAO() {
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
		String SQL = "SELECT ComID FROM com ORDER BY ComID DESC";		//�۹�ȣ��������
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;		//�Խù��� �ϳ��� ���
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;			//db����
	}
	
	public int write(String Cname, String Caddress, String Cphone, String Ccontext) {
		String SQL = "INSERT INTO com VALUES(?, ?, ?, ?, ?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Cname);
			pstmt.setString(2, Caddress);
			pstmt.setString(3, Cphone);
			pstmt.setString(4, Ccontext);
			pstmt.setInt(5, getNext());		//�Խù� ��ȣ
			
			return pstmt.executeUpdate();	//�������� ��� 0 �̻��� ��

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1; //�����ͺ��̽� ����
	}
	
	public ArrayList<Com> getList(int pageNumber){ 

		String SQL = "SELECT * FROM com WHERE ComID < ? ORDER BY ComID DESC LIMIT 10";
		ArrayList<Com> list = new ArrayList<Com>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Com com = new Com();
				com.setCname(rs.getString(1));
				com.setCaddress(rs.getString(2));
				com.setCphone(rs.getString(3));
				com.setCcontext(rs.getString(4));
				com.setComID(rs.getInt(5));
				list.add(com);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage (int pageNumber) {

		String SQL = "SELECT * FROM com WHERE ComID < ? ORDER BY ComID DESC LIMIT 10";
		ArrayList<Com> list = new ArrayList<Com>();
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
	
	public Com getCom(int comID) {
		String SQL = "SELECT * FROM com WHERE ComID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Com com = new Com();
				com.setCname(rs.getString(1));
				com.setCaddress(rs.getString(2));
				com.setCphone(rs.getString(3));
				com.setCcontext(rs.getString(4));
				com.setComID(rs.getInt(5));
				
				return com;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int update(int ComID, String Cname, String Caddress, String Cphone, String Ccontext) {
		String SQL = "UPDATE com SET Cname = ?, Caddress = ?, Cphone = ?, Ccontext = ? WHERE ComID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Cname);		//�Խù� ��ȣ
			pstmt.setString(2, Caddress);
			pstmt.setString(3, Cphone);
			pstmt.setString(4, Ccontext);
			pstmt.setInt(5, ComID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int delete(int ID) {
		String SQL = "DELETE FROM com WHERE ComID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setInt(1, ID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}
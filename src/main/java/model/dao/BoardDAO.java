package model.dao;

import model.dto.BoardDTO;

import java.util.List;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	
	public static BoardDAO getDAO() {
		return instance;
	}
	
	// List담아서 보내는 메소드
	public List<BoardDTO> getArticles(int num) {
		// DB연결
		DBConnector dbins = DBConnector.getInstance();
		Connection conn = null;
		// PreparedStatement, ResultSet를 생성
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> articles = null;
		try {
			conn = dbins.getConnection();
			// sql = board에 있는 모든 정보를 가져오는 쿼리문
			// String sql = "select * from board";
			String sql  = "select num, writer, subject, content, reg_date, ";
				   sql += "readcount, lev, step, ref, ip, passwd, email ";
				   sql += "from board ";
			// 단일 회원정보 가져올 때
			if(num != 0) {
				   sql += "where num = ? ";
			}
			       sql += "order by step asc, ref desc, num desc ";
			
			pstmt=conn.prepareStatement(sql);
			if(num != 0) { pstmt.setInt(1, num); }
			rs = pstmt.executeQuery();
			// while로 모든 정보를 담고
			articles = new ArrayList<BoardDTO>();
			while(rs.next()) {
				BoardDTO article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getString("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setLev(rs.getInt("lev"));
				article.setStep(rs.getInt("step"));
				article.setRef(rs.getInt("ref"));
				article.setIp(rs.getString("ip"));
				article.setPasswd(rs.getString("passwd"));
				article.setEmail(rs.getString("email"));
				articles.add(article);
			}
		} catch(Exception e) {
			System.out.println("리스트 처리 실패"+e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return articles;
	}
	
	public boolean writeArticle(BoardDTO article) {
		boolean result = false;
		DBConnector dbins = DBConnector.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dbins.getConnection();
			
			sql = "select ifnull(max(num)+1, 1) AS num from Board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int newNum = 0;
			if(rs.next()) {
				newNum = rs.getInt("num");
			}
			
			// 답글
			if(article.getNum()!=0 && article.getRef()!=0) {
				article.setStep(article.getStep()+1);
				article.setLev(article.getLev()+1);
			} else {
				article.setRef(newNum);
			}
			article.setNum(newNum);
			
			if(pstmt != null) pstmt.close();
			
			sql   = "insert into Board(num, writer, subject, content, reg_date, lev, step, ref, ip, passwd, email) ";
			sql  += "values(?, ?, ?, ?, sysdate(), ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, article.getNum());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getLev());
			pstmt.setInt(6, article.getStep());
			pstmt.setInt(7, article.getRef());
			pstmt.setString(8, article.getIp());
			pstmt.setString(9, article.getPasswd());
			pstmt.setString(10, article.getEmail());
			result = pstmt.execute();
		} catch(SQLException e) {
			System.out.println("저장 실패: "+e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null) try { conn.close(); } catch (SQLException e) {}
		}		
		return result;
 	}
	
	public boolean updateArticle(BoardDTO article) {
		boolean result = false;
		DBConnector dbins = DBConnector.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbins.getConnection();
			
			String sql  = "update Board set ";
				   sql += "subject = ?, ";
				   sql += "writer = ?, ";
				   sql += "content = ?, ";
				   sql += "email = ?, "; 
				   sql += "passwd = ?, ";
				   sql += "ip = ?, "; 
				   sql += "reg_date = sysdate() ";
				   sql += "where num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getEmail());
			pstmt.setString(5, article.getPasswd());
			pstmt.setString(6, article.getIp());
			pstmt.setInt(7, article.getNum());
			result = pstmt.execute();
		} catch(SQLException e) {
			System.out.println("수정 실패: "+e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null) try { conn.close(); } catch (SQLException e) {}
		}		
		return result;
 	}
	
	public boolean delArticle(BoardDTO article) {
		boolean result = false;
 		// 데이터베이스 connection 얻기
		Connection conn = null;
		// PreparedStatement를 생성
		PreparedStatement pstmt = null;
		try {
			DBConnector dbins = DBConnector.getInstance();
			conn = dbins.getConnection();
			String sql = "delete from Board where num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			result = pstmt.execute();
		} catch(SQLException e) {
			System.out.println("삭제 실패: "+e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null) try { conn.close(); } catch (SQLException e) {}
		}		
		return result;
 	}
	
	public void updateReadCount(int num) {
		Connection conn = null;
		// PreparedStatement를 생성
		PreparedStatement pstmt = null;
		try {
			DBConnector dbins = DBConnector.getInstance();
			conn = dbins.getConnection();
			String sql = "update board set readcount = readcount+1 where num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("수정 실패: "+e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null) try { conn.close(); } catch (SQLException e) {}
		}		
 	}
}
package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import board.BoardDBBean;

public class BoardDBBean {
		// DB 연동, 쿼리 실행에서 사용하는 변수 선언
		private Connection conn = null;         // DB 연동을 위한 변수
		private PreparedStatement pstmt = null; // SQL문 실행을 위한 변수
		private ResultSet rs = null;            // 검색 결과를 테이블 형태로 받기 위한 변수
		private String sql = "";
		
		// 싱글톤 패턴 설정
		private BoardDBBean() {}
		
		private static BoardDBBean instance = new BoardDBBean();
		
		public static BoardDBBean getInstance() {
			return instance;
		}
		
		// 커넥션풀(Connection Pool)을 설정
		private Connection getConnection() throws Exception {
			Context initCtx = new InitialContext();                    // context를 생성
			Context envCtx = (Context)initCtx.lookup("java:comp/env"); // context 환경을 서칭
			DataSource ds = (DataSource)envCtx.lookup("jdbc/db01");    // context 내용을 읽어서 실행
			return ds.getConnection();                                 // ds를 통해 커넥션을 리턴
		}
		
		private void close() {
			try { if(rs != null) rs.close(); } catch(Exception e) { e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch(Exception e) { e.printStackTrace();}
			try { if(conn != null) conn.close(); } catch(Exception e) { e.printStackTrace();}
		}
		// 전체 게시글 보기
		public List<BoardDataBean> getBoardList(){
			List<BoardDataBean> boardList = new ArrayList<BoardDataBean>();
			BoardDataBean board = null;
			try {
				conn = getConnection();
				sql = "select * from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			
				while(rs.next()) {
					board = new BoardDataBean();
					board.setNum(rs.getInt("num"));
					board.setWriter(rs.getString("writer"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getTimestamp("regdate"));
					board.setReadcount(rs.getInt("readcount"));
					board.setRef(rs.getInt("ref"));
					board.setRe_step(rs.getInt("re_step"));
					board.setRe_level(rs.getInt("re_level"));
					boardList.add(board);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return boardList;
		}

		//전체 글수를 구하는 메소드
		public int getBoardListCount() {
			int cnt = 0;
			try {
				conn = getConnection();
				sql = "select count(*) cnt from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
		}
		
		public BoardDataBean getBoard(int num) {
			BoardDataBean board = new BoardDataBean();
			try {
				conn = getConnection();
				sql = "select * from board where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
			
				if(rs.next()) {
					board.setNum(rs.getInt("num"));
					board.setWriter(rs.getString("writer"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getTimestamp("regdate"));
					board.setReadcount(rs.getInt("readcount"));
					board.setRef(rs.getInt("ref"));
					board.setRe_step(rs.getInt("re_step"));
					board.setRe_level(rs.getInt("re_level"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return board;
		}
		
		public int boardUpdate(BoardDataBean board) {
			int chk = 0;
			try {
				conn = getConnection();
				sql = "update board set subject=?, content=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getSubject());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getNum());
				chk = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return chk; 
		}
		
		public int boardDelete(int num) {
			int chk = 0;
			try {
				conn = getConnection();
				sql = "delete from board where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				chk = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return chk; 
		}
		
}
		

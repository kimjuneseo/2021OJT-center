package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.text.AbstractDocument.Content;

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
		/*
		 * public List<BoardDataBean> getBoardList(){ List<BoardDataBean> boardList =
		 * new ArrayList<BoardDataBean>(); 
		 * BoardDataBean board = null; 
		 * try { 
		 * conn = getConnection(); 
		 * sql = "select * from board"; 
		 * pstmt =onn.prepareStatement(sql); 
		 * rs = pstmt.executeQuery();
		 * 
		 * while(rs.next()) { board = new BoardDataBean();
		 * board.setNum(rs.getInt("num")); board.setWriter(rs.getString("writer"));
		 * board.setSubject(rs.getString("subject"));
		 * board.setContent(rs.getString("content"));
		 * board.setRegdate(rs.getTimestamp("regdate"));
		 * board.setReadcount(rs.getInt("readcount")); boardList.add(board); }
		 * 
		 * }catch(Exception e) { e.printStackTrace(); }finally { close(); } 
		 * return boardList; 
		 * }
		 */
		// 글 조회 메소드 - 10건의 데이터를 가져갈수 있도록 설정
		// page 변수 : 몇 세이지에인지의 정보
		// limit 변수 : 몇개인지의 정보
		public List<BoardDataBean> getBoardList(int page, int limit, String s_search, String i_search){
			int startRow = (page -1) * 10 + 1;	// 가져올 페이지의 시작행
			int endRow = startRow + limit -1; // 가져울 페이지의 마지막행
			
			List<BoardDataBean> boardList = new ArrayList<BoardDataBean>();
			BoardDataBean board = null;
			try {
				conn = getConnection();
				if(i_search == null || i_search.length() == 0) {
				sql = "select * from" + 
						"    (select rownum rnum, num, writer, subject, content, regdate, readcount, imagefile from " + 
						"        (select * from board order by num desc)) " + 
						"            where rnum >=? and rnum <= ?" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				}else {
				sql = "select * from" + 
						"    (select rownum rnum, num, writer, subject, content, regdate, readcount, imagefile from " + 
						"        (select * from board where "+ s_search +" like ? order by num desc)) " + 
						"            where rnum >=? and rnum <= ?" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+i_search+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				}
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board = new BoardDataBean();
					board.setNum(rs.getInt("num"));
					board.setWriter(rs.getString("writer"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getTimestamp("regdate"));
					board.setReadcount(rs.getInt("readcount"));
					board.setImagfile(rs.getString("imagefile"));
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
		
		// 검색한 글수를 구하는 메소드
		public int getBoardSearchListCount(String s_search, String i_search) {
			int cnt = 0;
			try {
				conn = getConnection();
				sql = "select count(*) cnt from board where "+s_search+" = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, i_search);
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
		
		// 검색 처리 메소드 : s_search : 검색 키워드 (subject, content, wrieter), i_search: 입력한 검색 내용
		// page: 안쓰면 기본 1page, limit: 10으로 설정하고 사용
		public List<BoardDataBean> getBoardSearchList(int page, int limit, String s_search, String i_search){
			int startRow = (page -1) * 10 + 1;	// 가져올 페이지의 시작행
			int endRow = startRow + limit -1; // 가져울 페이지의 마지막행
			List<BoardDataBean> boardList = new ArrayList<BoardDataBean>();
			BoardDataBean board = null;
			try {
				conn = getConnection();
				sql = "select * from" + 
						"    (select rownum rnum, num, writer, subject, content, regdate, readcount, imagefile from " + 
						"        (select * from board where "+ s_search +" like ? order by num desc)) " + 
						"            where rnum >=? and rnum <= ?" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+i_search+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board = new BoardDataBean();
					board.setNum(rs.getInt("num"));
					board.setWriter(rs.getString("writer"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getTimestamp("regdate"));
					board.setReadcount(rs.getInt("readcount"));
					board.setImagfile(rs.getString("imagefile"));
					boardList.add(board);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return boardList;
		}
		
		// 글 상세보기(글 1건)
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
					board.setImagfile(rs.getString("imagefile"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return board;
		}
		// 게시글 수정 하는 메소드
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
		// 게시글 지우는 메소드
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
		// 조회수 올려주는 메소드
		public void readCountOnePlus(int num) {
			
			try {
				conn = getConnection();
				sql = "update board set readcount = readcount + 1 where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
		//글 상세보기(글 1건)
		public int insertBoard(BoardDataBean board) {
			int chk = 0;
			try {
				conn = getConnection();
				sql = "insert into board (num ,writer, subject, content, imagefile) values (board_seq.nextval,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getWriter());
				pstmt.setString(2, board.getSubject());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, board.getImagfile());
				chk = pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return chk;
		}
		
		
	
}
		

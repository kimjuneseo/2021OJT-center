package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardDataBean;


public class ReviewDBBean {
	// DB 연동, 쿼리 실행에서 사용하는 변수 선언
	private Connection conn = null;         // DB 연동을 위한 변수
	private PreparedStatement pstmt = null; // SQL문 실행을 위한 변수
	private ResultSet rs = null;            // 검색 결과를 테이블 형태로 받기 위한 변수
	private String sql = "";
	
	// 싱글톤 패턴 설정
	private ReviewDBBean() {}
	
	private static ReviewDBBean instance = new ReviewDBBean();
	
	public static ReviewDBBean getInstance() {
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
	
	// 리뷰 확인 메소드 : 원글에 대한 모든 리뷰를 리턴
	/*
	 * public List<ReviewDataBean> getReview(int renum) { List<ReviewDataBean>
	 * reviewList = new ArrayList<ReviewDataBean>(); ReviewDataBean review = null;
	 * try { conn = getConnection(); sql = "select * from review where ref=?"; pstmt
	 * = conn.prepareStatement(sql); pstmt.setInt(1, renum); rs =
	 * pstmt.executeQuery();
	 * 
	 * while(rs.next()) { review = new ReviewDataBean();
	 * review.setRenum(rs.getInt("renum"));
	 * review.setWriter(rs.getString("writer"));
	 * review.setContent(rs.getString("content"));
	 * review.setRegdate(rs.getTimestamp("regdate"));
	 * review.setRef(rs.getInt("ref")); reviewList.add(review); } }catch (Exception
	 * e) { e.printStackTrace(); }finally { close(); } return reviewList; }
	 */
	// 원글에 대한 댓글 리스트 : 5개씩 
	// num: board 테이블의 원글, review 테이블에 ref에 해당), page: 해당 페이지, limit: 페이지 댓글에 갯수
	public List<ReviewDataBean> getReview(int num, int page, int limit) {
		int startRow = (page - 1) * 5 + 1;
		int endRow = startRow + limit - 1;
		
		List<ReviewDataBean> reviewList  = new ArrayList<ReviewDataBean>();
		ReviewDataBean review = null;
		try {
			conn = getConnection();
			sql = "select * from " + 
					"(select rownum rnum, renum, writer, content, regdate, ref from " + 
					"(select * from review where ref=? order by renum desc)) " + 
					"where rnum >=? and rnum <= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review = new ReviewDataBean();
				review.setRenum(rs.getInt("renum"));
				review.setWriter(rs.getString("writer"));
				review.setContent(rs.getString("content"));
				review.setRegdate(rs.getTimestamp("regdate"));
				review.setRef(rs.getInt("ref"));
				reviewList.add(review);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return reviewList;
	}
	
	// 원글에 대한 댓글 갯수
	public int getReviewCount(int ref) {
		int count = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from review where ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return count;
	}
	
	// 댓글 추가
	public int insertReview(ReviewDataBean review) {
		int chk = 0;
		try {
			conn = getConnection();
			sql = "insert into review(renum, writer, content, ref) values (review_seq.nextval,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getWriter());
			pstmt.setString(2,	review.getContent());
			pstmt.setInt(3, review.getRef());
			chk = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return chk;
		
		
	}
	// 댓글 삭제
	public int deleteReview(int num) {
		int chk = 0;
		try {
			conn = getConnection();
			sql = "delete from review where renum=?";
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
	
	// 댓글 수정
	public int updateReview(ReviewDataBean review){
		int chk = 0;
		try {
			conn = getConnection();
			sql = "update review set content=? where renum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getContent());
			pstmt.setInt(2, review.getRenum());
			chk = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return chk;
	}
	
	
}

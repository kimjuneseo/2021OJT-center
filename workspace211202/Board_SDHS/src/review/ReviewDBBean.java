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
	public List<ReviewDataBean> getReview(int renum) {
		List<ReviewDataBean> reviewList  = new ArrayList<ReviewDataBean>();
		ReviewDataBean review = null;
		try {
			conn = getConnection();
			sql = "select * from review where ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, renum);
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
	
	
}

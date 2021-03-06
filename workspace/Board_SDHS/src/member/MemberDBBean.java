package member;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.List;
import java.util.ArrayList;

/*
 커넥션풀(Connection Pool)
- 커넥션(Connection, DB 연결객체)를 일정갯수 만큼만 생성하여 두고, 사용하고 반납하는 방식
- 커넥션의 부하가 생기지 않아서 시스템을 안정적으로 사용할 수 있음.
- 웹개발에서 필수적으로 사용해야 함.
- http://commons.apache.org

싱글톤 패턴(singleton pattern) 
- 웹개발의 DB 연동을 위해 사용하는 디자인 패턴
- MemberDBBean 클래스를 new에 의해서 여러 개를 생성할 수 없도록 하고, 반드시 1개만 만들어서 공유할 수 있도록 하는 방법

*/

public class MemberDBBean {
	// DB 연동, 쿼리 실행에서 사용하는 변수 선언
	private Connection conn = null;         // DB 연동을 위한 변수
	private PreparedStatement pstmt = null; // SQL문 실행을 위한 변수
	private ResultSet rs = null;            // 검색 결과를 테이블 형태로 받기 위한 변수
	private String sql = "";
	
	// 싱글톤 패턴 설정
	private MemberDBBean() {}
	
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	// 커넥션풀(Connection Pool)을 설정
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();                    // context를 생성
		Context envCtx = (Context)initCtx.lookup("java:comp/env"); // context 환경을 서칭
		DataSource ds = (DataSource)envCtx.lookup("jdbc/db01");    // context 내용을 읽어서 실행
		return ds.getConnection();                                 // ds를 통해 커넥션을 리턴
	}
	
	// DB 연동, SQL문 실행 변수를 해제하는 메소드
	private void close() {
		try { if(rs != null) rs.close(); } catch(Exception e) { e.printStackTrace();}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) { e.printStackTrace();}
		try { if(conn != null) conn.close(); } catch(Exception e) { e.printStackTrace();}
	}
	
	/* < 회원 정보의 DB 처리를 위한 메소드들 > */
	// 바인딩 변수(binding) : PreparedStatement 객체를 사용할 때 쓰는 물음표, 홀더
	
	// 회원 가입 메소드
	// 리턴값 - check 변수 사용 : 1(가입 성공), 0(가입 실패)
	public int insertMember(MemberDataBean member) {
		int check = 0;
		try {
			conn = getConnection();
			sql = "insert into member(id, pwd, name, tel, address1, address2, email) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getAddress1());
			pstmt.setString(6, member.getAddress2());
			pstmt.setString(7, member.getEmail());
			check = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
	
	// 중복 아이디 체크
	// 리턴값 설정 : x
	// x가 1일 때 : 입력한 아이디가 테이블에 존재하는 경우
	// x가 0일 때 : 입력한 아이디가 테이블에 존재하지 않는 경우
	public int confirmId(String id) {
		int x = 0;
		try {
			conn = getConnection();
			sql = "select id from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = 1; // 입력한 아이디가 존재하는 경우
			else x = 0;          // 입력한 아이디가 존재하지 않는 경우
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		return x;
	}
	
	// 회원 조회(1명) - 회원 개인별로 사용
	public MemberDataBean getMember(String id, String pwd) {
		MemberDataBean member = new MemberDataBean();
		try {
			conn = getConnection();
			sql = "select * from member where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setEmail(rs.getString("email"));
				member.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}
	
	
	// 관리자 확인 - check: 1(성공), 0(실패)
	public int checkAdmin(String id, String pwd) {
		int check = 0;
		try {
			conn = getConnection();
			sql = "select * from member where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			// 성공이면 check: 1, 실패면 check: 0
			if(rs.next()) check = 1;
		} catch(Exception e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		return check;
	}
	
	// 회원 전체 조회 - 관리자가 사용(id: admin, pwd: 1234)
	public List<MemberDataBean> getMemberList() {
		List<MemberDataBean> memberList = new ArrayList<MemberDataBean>();
		MemberDataBean member = null;
		try {
			conn = getConnection();
			sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberDataBean();
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setEmail(rs.getString("email"));
				member.setRegdate(rs.getTimestamp("regdate"));
				memberList.add(member);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}
	
	// 회원 강퇴 처리 - 관리자가 전체 회원 확인 페이지에서 사용
	public void deleteChoiceMember(String[] deleteMemberList) {
		try {
			conn = getConnection();
			// 1번 방법 - 단점 : sql을 여러번 실행
			/*
			sql = "delete from member where id=?"; 
			for(String m : deleteMemberList) {
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, m);
				pstmt.executeUpdate(); 
			}
			*/
			
			// 2번 방법 - 장점 : 하나의 sql으로 실행, 권장하는 방법
			// String.join() : 문자열을 특정문자(문자열)로 연결하는 메소드
			// ex) {"ygx", "want", "cnb"} -> ygx','want','cnb
			sql = "delete from member where id in ('" + String.join("','", deleteMemberList) + "')";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// 회원 수정
	public int updateMember(MemberDataBean member) {
		int x = 0;
		try {
			conn = getConnection();
			sql = "update member set pwd=?, name=?, tel=?, address1=?, address2=?, email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getAddress1());
			pstmt.setString(5, member.getAddress2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getId());
			x = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return x;
	}
	
	// 회원 삭제 - 회원 탈퇴인 경우
	public int deleteMember(String id) { 
		int x = 0;
		try {
			conn = getConnection();
			sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			x = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return x;
	}
	
	// 아이디 찾기 : 아이디를 모를 때 이름과 전화번호를 확인하여 아이디를 알려줌
	public String findId(String name, String tel) {
		String id = null;
		try {
			conn = getConnection();
			sql = "select id from member where name=? and tel=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			
			// 이름과 전화번호 맞는 회원이 있을 때는 가져온 아이디로 값을 설정, 없을 때는 null
			if(rs.next()) { 
				id = rs.getString("id");
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return id;
	}
	
	// 로그인 - x의 값 설정: 로그인(1), id가 불일치(-1), id는 일치하고 pwd 불일치(0)
	public int userCheck(String id, String pwd) {
		int x = -1;
		try {
			conn = getConnection();
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디가 일치할 때
				String dbPwd = rs.getString("pwd");
				if(dbPwd.equals(pwd)) x = 1; // 아이디는 일치하고 비밀번호도 일치하는 경우
				else x = 0;					 // 아이디는 일치하고 비밀번호는 일치하지 않는 경우
			}else x = -1;					 // 아이디가 불일치 할 때
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return x;
	}
	
	// 로그아웃
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

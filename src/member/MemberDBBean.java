package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 - 커넥션풀(Connection Poll)
 - 커넥션(Connection, DB 연결객체)를 일정갯수 만큼만 생성하여 두고, 사용하고 반납한는 방식
 - 커넥션의 부하가 생기지 않아서 시스템을 안정적으로 사용할 수 있다.
 - 웹개발에서는 필수적으로 사용하야 함.
 
 싱글톤 패턴( singleton Pattern) 
 - 앱개발의 DB 연동을 위해 사용하는 디자인 패턴
 - MemberDBBen 클래스 new에 의해서 여러개를 생성할 수 없도록 하고, 반드시 1개만 만들어서 공유할 수 있도록 하는 방법
 
*/

public class MemberDBBean {
	//DB 연동, 쿼리 실행에서 사요응 하는 변수 사용
	private Connection conn = null;				//DB 연동을 위한 클래스
	private PreparedStatement pstmt = null; 	//SQL문 실행을 클래스
	private ResultSet rs = null;				//검색 결과를 테이블 형태로 받기 위한 클래스
	private String sql = "";
	
	// 싱글톤 패턴 설정
	private MemberDBBean() {}
	
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	// 커넥션 풀(Connection Pool)을 설정
	private Connection getConnenction() throws Exception{
		Context initCtx = new InitialContext();						 // context를 생성
		Context envCtx = (Context)initCtx.lookup("java:comp/env"); 	 // context 환경을 서칭
		DataSource ds = (DataSource)envCtx.lookup("jdbc/db01"); 	 // context 내용을 읽어서 실행
		return ds.getConnection();									 // ds를 통해 커넥션을 리턴
	}
	
	// DB 연동, SQL문 실행 변수를 해제하는 메소드
	private void close() {
		try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
	}
	/* <회원 정보의 DB처리를 위한 메소드 */
	// 바인딩 변수(bindin) : PreparedStatement 객체를 사용할 떄 쓰는 물음표, 홀더
	// 회원가입 메소드
	// 리턴값 - check 변수 사용 : 1(가입 성공), 0(가입 실패)
	public int insertMember(MemberDataBean member) {
		int check = 0;
		try {
			conn = getConnenction();
			sql = "insert into member(id, pwd, name, tel, address1, address2, email) values(?, ?, ?, ?, ? ,?, ?)";
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
	// 리턴값 설정: x
	// x가 1일때 : 입력한 아이디가 테이블에 존재하는 경우
	// x가 0일때 : 이력한 아이기가 테이블에 존재하지 않는 경
	public int confirmId(String id) {
		int x = 0;	
		try {
			conn = getConnenction();
			sql = "select id from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = 1; // 입력한 아이디가 존재하는 경우
			else x = 0;			 // 입력한 아이디가 존재하지 않는 경우
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	return x;
	}
	// 회원조회(1명) - 회원 개인별로 사용
	public MemberDataBean getMember(String id, String pwd) {
		MemberDataBean member = new MemberDataBean();
		try {
			conn = getConnenction();
			sql = "select * from member where id = ? and pwd = ?";
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
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	return member;
	}
	// 회원 조회(전체) - 게시판 관리자가 사용
	public ArrayList<MemberDataBean> getAllMembers(String id, String pwd){
		ArrayList<MemberDataBean> memberList = new ArrayList<MemberDataBean>();
		MemberDataBean member =  new MemberDataBean();
		try {
			conn = getConnenction();
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
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return memberList;
	}
	
	// 회원 수정
	public int updateMember(MemberDataBean member) {
		int check = 0;
		try {
			conn = getConnenction();
			sql = "update member set pwd=?, name=?, tel=?, address1=?, address2=?, email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getAddress1());
			pstmt.setString(5, member.getAddress2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getId());
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	// 회원 삭제 - 회원 탈퇴인 경우
	
	public int deleteMember(String id) {
		int check = 0;
		try {
			conn = getConnenction();
			sql = "delete from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	
	// 아이디 찾기
	public String findMemberId(String name, String tel) {
		String id = "";
		try {
			conn = getConnenction();
			sql = "select id from member where name=? and tel=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return id;
	}
	//비밀번호 찾기
	public String findMemberPwd(String id, String tel, String email) {
		String pwd = "";
		try {
			conn = getConnenction();
			sql = "select pwd from member where id=? and tel=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, tel);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return pwd;
	}
}

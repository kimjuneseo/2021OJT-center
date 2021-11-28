package member;

import java.sql.Timestamp;

/*
 < 자바빈(JavaBean) >
 - 웹개발에서 데이터의 전달과 DB처리를 위해서 사용하는 자바 클래스
 - ***DataBean: 웹에서 데이터의 전달을 위해서 사용하는 자바 클래스, ***VO, ***DTO
 - ***DBBean : 웹에서 전달한 데이터를 DB로 연결하여 처리하는 자바 클래스, ***DAO
 
 < 자바빈을 만들 때의 규칙 >
 - 디폴트 생성자를 사용
 - 모든 멤버변수는 private 접근 제한자를 사용
 - 멤버변수에 getter/setter 메소드를 만들어서 사용
  */
public class MemberDataBean {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String address1;
	private String address2;
	private String email;
	private Timestamp regdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}

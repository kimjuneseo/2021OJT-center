package users;

/*
< 자바빈을 사용하는 규칙 >
1. 모든 멤버변수는 반드시 private 접근제한을 가진다.
2. 생성자는 기본 생성자를 사용한다.
3. 멤버변수에 대한 getter/setter 메소드를 만들어 사용한다.

*/
public class User {
	private String name;
	private String tel;
	private String email;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

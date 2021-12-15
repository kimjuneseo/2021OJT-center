package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private Timestamp regdate;
	private int readcount;
	private String imagfile; //업로드한 이미지 파일의 이름 -> 추가 작업으로 처리

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getImagfile() {
		return imagfile;
	}

	public void setImagfile(String imagfile) {
		this.imagfile = imagfile;
	}


}

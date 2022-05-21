package admin.BusinessTest.bean;

import java.sql.Date;

public class checkDTO 
{
	/*
	 * num : 글 번호
	 * writer : 작성자
	 * b_name : 비즈니스명
	 * location : 지역
	 * category : 카테고리
	 * price : 가격
	 * content : 상세내용
	 * status : 글 상태
	 * reg_date : 등록일
	 * read_date : 조회일
	 */
	
	private int num;
	private String writer;
	private String b_name;
	private String location;
	private String category;
	private int price;
	private String content;
	private String status;
	private String reg_date;
	private String read_date;
	private String standard;
	
	public checkDTO(){
		
	}
	public checkDTO(int inputNum, String status) {
		super();
		this.num = inputNum;
		this.status = status;
	}
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
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getRead_date() {
		return read_date;
	}
	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	
}

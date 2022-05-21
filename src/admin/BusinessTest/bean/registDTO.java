package admin.BusinessTest.bean;

public class registDTO 
{
	private String writer;
	private String b_name;
	private String location;
	private String category;
	private int price;
	private String content;
	
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
	
	public registDTO(String writer, String b_name, String location, String category, int price, String content)
	{
		super();
		this.writer = writer;
		this.b_name = b_name;
		this.location = location;
		this.category = category;
		this.price = price;
		this.content = content;
	}
}

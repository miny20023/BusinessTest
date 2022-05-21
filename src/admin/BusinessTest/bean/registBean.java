package admin.BusinessTest.bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class registBean 
{
	@Autowired
	private SqlSessionTemplate dao = null;
	
	// 등록Form 페이지
	@RequestMapping("registForm.do")
	public String registForm()
	{
		return "/function/registForm";
	}
	
	// 등록Pro 페이지
	/*
	 * -들어오는 데이터-
	 * 작성자 : writer
	 * 비즈니스명 : b_name
	 * 지역 : location
	 * 카테고리 : category
	 * 금액 : price
	 * 상세내용 : content
	 * 
	 * 카테고리와 지역 데이터가 0이 넘어온다면 선택 안한 것
	 * 
	 */
	@RequestMapping("registPro.do")
	public String registPro(HttpServletRequest request, Model model)
	{
		int select_check = 0;
		int returnSQL = 0;
		
		String writer = request.getParameter("writer");
		String b_name = request.getParameter("b_name");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");

		if(location.equals("0"))
		{
			select_check = 1;
		}
		else if(category.equals("0"))
		{
			select_check = 2;
		}
		else 
		{
			select_check = 3;
		
			registDTO dto = new registDTO(writer, b_name, location, category, price, content);
			returnSQL = dao.insert("regist.insert",dto);
			// 업뎃하면 1 못하면 0
			System.out.println(returnSQL);
		}
		model.addAttribute("select_check",select_check);
		
		return "/function/registPro";
	}
}

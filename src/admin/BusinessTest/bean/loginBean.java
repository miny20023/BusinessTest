package admin.BusinessTest.bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginBean 
{
	@Autowired
	private SqlSessionTemplate dao = null;
	
	// 로그인Form 이동
	@RequestMapping("login.do")
	public String login()
	{
		return "/login/loginForm";
	}
	
	// 로그인 시 정보일치 여부 확인
	@RequestMapping("loginPro.do")
	public String loginPro(@RequestParam("id") String id, @RequestParam("pw") String pw, loginDTO dto, Model model, HttpSession session) throws Exception
	{
		dto = dao.selectOne("member.login",dto);
		if(dto != null)
		{
			int status = 10;
			session.setAttribute("dto", dto);
			session.setAttribute("id", dto.getId());
			session.setAttribute("status", status);
			model.addAttribute("dto", dto);
		}
		return "/login/loginPro";
	}
	
	// 로그아웃 시
	// 세션 삭제 후 메인 이동
	@RequestMapping("logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "/main";
	}
}

package admin.BusinessTest.bean;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class checkBean 
{
	@Autowired
	private SqlSessionTemplate dao = null;
	
	// ����Ͻ� ��� Form
	@RequestMapping(value="checkForm.do")
	public String content_list()
	{
		return "/function/checkForm";
	}
	
	// ����Ͻ� �ܰ� ��ȸ
	@RequestMapping("checkSingleForm.do")
	public String content_list_single(@RequestParam(value="num") String num, Model model) throws Exception
	{
		int inputNum = Integer.parseInt(num);
		// db�� num�� �̿��� ��ȸ
		checkDTO dto = new checkDTO();
		dto = dao.selectOne("check.getArticle",inputNum);
		
		// read_date update
		dao.update("check.updateArticle",inputNum);
		
		model.addAttribute("num",num);
		model.addAttribute("article",dto);
		return "/function/checkSingleForm";
	}
	
	// ����Ͻ� ���� ���� ��ư ��
	@RequestMapping("checkSingleFormPro.do")
	public String change_status(@RequestParam(value="num") String num, @RequestParam(value="status") String status, Model model) throws Exception
	{
		int inputNum = Integer.parseInt(num);
		int statusCheck = 0;
		if(status.equals("�ŷ��Ϸ�")) 
		{
			statusCheck = 1;
		}
		else if(status.equals("�ŷ���"))
		{
			statusCheck = 2;
		}
		checkDTO dto = new checkDTO(inputNum, status);
		dao.update("updateStatus",dto);
		
		model.addAttribute("num",num);
		model.addAttribute("statusCheck",statusCheck);
		return "/function/checkSingleFormPro";
	}
	
	// ī�װ� ���� �� ��ȸ �� ajax callback
	// @ResponseBody ���ڵ� �ȵ�
	@RequestMapping(value="checkForm_data.do")
	public String content_list_data(String select_category, Model model) throws Exception 
	{
		List articleList = new ArrayList();
		articleList = dao.selectList("check.getArticles",select_category);
		
		System.out.println(articleList.size());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(articleList);
		System.out.println(json);
		
		model.addAttribute("JsonList", json);
		
		return "/function/checkForm_data_return";
	}
}

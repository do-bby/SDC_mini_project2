package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberLoginDAO;
import vo.MemberVO;

@Controller
public class MemberLoginController {

	@Autowired
	MemberLoginDAO mDao;
	
	@GetMapping("/memberLogin")
	public String loginpage() {
		return "/memberLogin";
	}
	
	@PostMapping("/selectLoginMember")
	@ResponseBody
	public boolean selectLoginMember(HttpServletRequest request ,MemberVO vo) {
		HttpSession session = request.getSession();
		boolean result = false;
		int count = mDao.selectLoginMember(vo);
		if(count==1) {
			result = true;
		}
		return result;
	}
	
	@PostMapping("/memberlogout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
		return "memberLogin";
	}

}

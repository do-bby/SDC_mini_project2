package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberLoginDAO;
import vo.MemberVO;

@Controller
public class MemberLoginController {

	@Autowired
	MemberLoginDAO mDao;
	
	//로그인 페이지 보여주기
	@GetMapping("/memberLogin")
	public String loginpage() {
		return "/memberLogin";
	}
	
	//로그인
	@PostMapping("/selectLoginMember")
	@ResponseBody
	public ModelAndView selectLoginMember(HttpServletRequest request ,MemberVO vo) {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		int count = mDao.selectLoginMember(vo);
		//로그인 성공시 세션에 정보 담아줌
		if(count==1) {
			session = request.getSession();
			session.setAttribute("vo", vo);
			mav.setViewName("memberLoginSuccess");
		}else {
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요.");
			mav.setViewName("memberLogin");
		}
		return mav;
	}
	
	//로그아웃
	@PostMapping("/memberlogout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
		return "memberLogout";
	}

}

package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
			mav.setViewName("bootcampMain");
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

	
//	//회원탈퇴
//	@PostMapping("/deleteMember")
//	public String deleteMember(HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//	    if (session != null) {
//	    	mDao.deleteMember(mVo.getId());
//	        session.invalidate();
//	    }
//		return "memberLogin";
//	}
//	
//	@RequestMapping(value = "/pw_auth.me")
//	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String email = (String)request.getParameter("email");
//		String name = (String)request.getParameter("name");
//
//		MemberVO vo = memberSV.selectMember(email);
//			
//		if(vo != null) {
//		Random r = new Random();
//		int num = r.nextInt(999999); // 랜덤난수설정
//		
//		if (vo.getName().equals(name)) {
//			session.setAttribute("email", vo.getEmail());
//
//			String setfrom = "ivedot@naver.com"; // naver 
//			String tomail = email; //받는사람
//			String title = "[삼삼하개] 비밀번호변경 인증 이메일 입니다"; 
//			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
//					+ "삼삼하개 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
//
//			try {
//				MimeMessage message = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
//
//				messageHelper.setFrom(setfrom); 
//				messageHelper.setTo(tomail); 
//				messageHelper.setSubject(title);
//				messageHelper.setText(content); 
//
//				mailSender.send(message);
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			}
//
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_auth");
//			mv.addObject("num", num);
//			return mv;
//		}else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_find");
//			return mv;
//		}
//		}else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_find");
//			return mv;
//		}
//		
//		@RequestMapping(value = "/pw_set.me", method = RequestMethod.POST)
//		public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
//					@RequestParam(value = "num") String num) throws IOException{
//				
//				if(email_injeung.equals(num)) {
//					return "YM/pw_new";
//				}
//				else {
//					return "YM/pw_find";
//				}
//		} //이메일 인증번호 확인
}

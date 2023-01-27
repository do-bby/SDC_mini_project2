package controller;

import java.io.IOException;
import java.util.List;
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

import dao.BootcampDAO;
import dao.MemberLoginDAO;
import vo.BootcampVO;
import vo.MemberVO;

@Controller
public class MemberLoginController {

	@Autowired
	MemberLoginDAO mDao;
	
	@Autowired
	BootcampDAO bootcampDao;
	
	//로그인 페이지 보여주기
	@GetMapping("/memberLogin")
	public String loginpage() {
		return "/memberLogin";
	}
	
	//로그인
	@PostMapping("/selectLoginMember")
	@ResponseBody //여기 값을 jsp body로 넘길때 사용
	public ModelAndView selectLoginMember(HttpServletRequest request ,MemberVO vo) {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		List<BootcampVO> list = bootcampDao.selectList();
		MemberVO voList = mDao.selectMemberInfo(vo);
		int count = mDao.selectLoginMember(vo);
		//로그인 성공시 세션에 정보 담아줌
		if(count==1) {
			session = request.getSession();
			session.setAttribute("vo", voList);
			//부트캠프 리스트가 있으면
			if(list.size() != 0) {
				mav.addObject("bootcampList",list);
			}
			mav.setViewName("bootcampMain");
//			mav.setViewName("memberLoginSuccess");
		}else {
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요.");
			mav.setViewName("memberLogin");
		}
		return mav;

	}
	
	//로그아웃
	@PostMapping("/memberlogout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		List<BootcampVO> list = bootcampDao.selectList();
	    if (session != null) {
	        session.invalidate();
	    }
	    if(list.size() != 0) {
			mav.addObject("bootcampList",list);
		}
		mav.setViewName("bootcampMain");
	    return mav;
	}
	
//	//아이디 찾기
//	@PostMapping("/memberFindId")
//	public ModelAndView memberFindId(MemberVO vo) {
//		ModelAndView mav = new ModelAndView();
//		String count = mDao.selectMemberPwd(vo);
//		if(count==1) {
//			mav.setViewName("memberFindId");
//		}else {
//			mav.addObject("msg", "이름 또는 전화번호를 확인하세요.");
//			mav.setViewName("memberLogin");
//		}
//		return mav;
//	}
	
	//비밀번호 찾기창 이동
	@GetMapping("/findPwdPage")
	public String findPwd() {
		return "/memberFindPwd";
	}
	
	//비밀번호 찾기
	@PostMapping("/memberFindPwd")
	public ModelAndView memberFindPwd(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		String question = mDao.selectMemberPwd(vo);
			mav.addObject("question", question);
			mav.setViewName("memberAnswer");
		return mav;
	}
	
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
//	
//		@RequestMapping(value = "/pw_new.me", method = RequestMethod.POST)
//		public String pw_new(MemberVO vo, HttpSession session) throws IOException{
//			int result = memberSV.pwUpdate_M(vo);
//			if(result == 1) {
//				return "jj/loginForm";
//			}
//			else {
//				System.out.println("pw_update"+ result);
//				return "YM/pw_new";
//			}
//		}
	
}

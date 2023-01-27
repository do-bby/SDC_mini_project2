package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import dao.MemberMyBatisDao;
import vo.MemberVO;
import vo.PagingVO;

@Controller
public class MemberController {
	@Autowired
	MemberMyBatisDao dao;
	@GetMapping("/memberSignup")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberSignUp");
		return mav;
	}
	
	
	
	@PostMapping("/insertNewmember") /// 회원가입 기능
	public ModelAndView insert(MemberVO vo) {
		boolean res = dao.insertM(vo);
		ModelAndView mav = new ModelAndView();
		if (res) {
			mav.addObject("msg", "성공적으로 회원가입이 완료되었습니다");
		} else {
			mav.addObject("msg", "오류가 발생했습니다.");
		}
		mav.setViewName("memberLogin");// 회원가입 이후 로그인 창 이동
		return mav;
	}
	
	@PostMapping("/memberinfo")
	public ModelAndView viewinfo(int mnum) {
		MemberVO vo = dao.getMembervo(mnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("val",vo);
		mav.setViewName("updateMemberInfo");
		return mav;
	}
	
	@PostMapping("/updateMemberInfo") /// 회원정보 수정 기능
	public ModelAndView update(MemberVO vo) { 
		boolean res = dao.updateM(vo);
		ModelAndView mav = new ModelAndView();
		if (res) {
			mav.addObject("list",dao.getMemberInfo(vo.getId()));
			mav.addObject("msg", "회원정보 수정이 완료되었습니다");
			mav.setViewName("memberInfo"); // 회원정보 수정 후 회원정보 조회창 이동
		} else {
			mav.addObject("msg", "오류가 발생했습니다.");
		}
		return mav;
	}
	
	
	//@PostMapping(value = "/deleteMember", produces = "application/json")
	
	@PostMapping("/deleteMember")
	@ResponseBody
	public String deleteMember(HttpServletRequest request, @RequestParam("password") String password) {
		HttpSession session = request.getSession(false);
		String res;
		if (session != null) {
			MemberVO svo = (MemberVO) session.getAttribute("vo");
			MemberVO val = dao.getMembervo(svo.getMnum());
			System.out.println(password);
			String actualPassword = val.getPwd(); // password출력
			System.out.println(actualPassword);
			if (actualPassword.equals(password)) { // 실제 비번과 입력비번 비교
				System.out.println("if문 안");
				dao.deleteMember(svo.getId());
				System.out.println("delete실행됨");
				session.invalidate();
				System.out.println("invalidate 실행됨");
				res = "{ \"msg\":계정이 성공적으로 삭제되었습니다}";
				System.out.println("msg 입력");
			} else {
				res = "{ \"msg\": 비밀번호가 맞지 않습니다.삭제에 실패했습니다.}";
			}
		} else {
			res = "{ \"msg\": 세션이 유효하지 않습니다. }";
		}
		return res;
	}
	

	@GetMapping(value="/viewMemberInfo")
	@ResponseBody
	public ModelAndView list_info(HttpServletRequest request) {
        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("vo");
		List<MemberVO> list = dao.getMemberInfo(vo.getId());
        ModelAndView mav = new ModelAndView();
        if (list.size() != 0) {
			mav.addObject("list", list);
			mav.setViewName("memberInfo");
        } else {
			mav.addObject("msg", "등록된 회원정보가 없습니다.");
			mav.setViewName("bootmoaMain");
		}
		return mav;
    }
	
	 @GetMapping("/duplicateCheck") //여기서 input은 id or 닉네임. type은 id인지 닉네임인지 구분목적
	 @ResponseBody
	 public String duplicateCheck(String input,String type) { 
		    String val = "";
		    String res;
		    if(type.equals("nick"))  
		        val = dao.searchN(input);
		    else if(type.equals("id")) 
		        val = dao.searchI(input); 

		    if(val != null) { 
		    	res  = "{ \"isDuplicate\": true }";
		    } else {
		    	res  = "{ \"isDuplicate\": false }";
		    } 
		    return res;
		}

}

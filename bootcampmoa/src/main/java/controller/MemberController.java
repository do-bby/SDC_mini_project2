package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberMyBatisDao;
import vo.MemberVO;

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
		mav.setViewName("memberSignUp"); // 회원가입 이후 로그인 창 이동
		return mav;
	}
	
	
	@PostMapping("/updateMemberInfo") /// 회원정보 수정 기능
	public ModelAndView update(MemberVO vo) { 
		boolean res = dao.updateM(vo);
		ModelAndView mav = new ModelAndView();
		if (res) {
			mav.addObject("msg", "회원정보 수정이 완료되었습니다");
		} else {
			mav.addObject("msg", "오류가 발생했습니다.");
		}
		mav.setViewName("memberInfo"); // 회원정보 수정 후 회원정보 조회창 이동
		return mav;
	}
	
	
	@GetMapping(value="/viewMemberInfo")
	@ResponseBody
	public ModelAndView list_info(int mnum) {
        List<MemberVO> list = dao.getMemberInfo(mnum);
        ModelAndView mav = new ModelAndView();
        if (list.size() != 0) {
			mav.addObject("list", list);
		} else {
			mav.addObject("msg", "등록된 회원정보가 없습니다.");
		}
		mav.setViewName("memberInfo");
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

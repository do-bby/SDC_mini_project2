package controller;

import java.util.List;

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
	@PostMapping("/insertNewmember") /// 회원가입 기능
	public ModelAndView insert(MemberVO vo) {
		boolean res = dao.insertM(vo);
		ModelAndView mav = new ModelAndView();
		if (res) {
			mav.addObject("msg", "성공적으로 회원가입이 완료되었습니다");
		} else {
			mav.addObject("msg", "오류가 발생했습니다.");
		}
		mav.setViewName("home"); // 임의 작성
		return mav;
	}
	
	@PostMapping("/updateMemberInfo") /// 회원가입 기능
	public ModelAndView update(MemberVO vo) {
		boolean res = dao.updateM(vo);
		ModelAndView mav = new ModelAndView();
		if (res) {
			mav.addObject("msg", "회원정보 수정이 완료되었습니다");
		} else {
			mav.addObject("msg", "오류가 발생했습니다.");
		}
		mav.setViewName("memberInfo"); // 임의 작성
		return mav;
	}
	
	
	@GetMapping(value="/viewMemberInfo")
	@ResponseBody
	public ModelAndView list_info(@RequestParam(value = "mnum", required = false, defaultValue = "4") int mnum) {
        List<MemberVO> list = dao.getMemberInfo(mnum); //test를 위해 4로 임의 설정상태
        ModelAndView mav = new ModelAndView();
        if (list.size() != 0) {
			mav.addObject("list", list);
		} else {
			mav.addObject("msg", "등록된 회원정보가 없습니다.");
		}
		mav.setViewName("memberInfo");
		return mav;
    }
	
	 @GetMapping("/duplicateCheck") //여기서 input은 id or 닉네임이고 type은 id인지 닉네임인지 구분하기 
	 public ModelAndView duplicateCheck(String input,String type) { //중복확인용
	 ModelAndView mav = new ModelAndView(); String val = "";
	 if(type.equals("nick"))  
		 val = dao.searchN(input); //dao에서 닉네임을 찾는 메소드 }else
	 if(type.equals("id")) 
		 val = dao.searchI(input); //dao에서 아이디를 찾는 메소드 }
	  
	 if(val.length() != 0) { mav.addObject("msg","이미 존재하는 값입니다 "); }else {
	 mav.addObject("msg","사용가능한 값입니다"); } mav.setViewName("memberLogin"); //다 끝내고 로그인/회원가입창으로 이동 
	 return mav; 
	 } 
}

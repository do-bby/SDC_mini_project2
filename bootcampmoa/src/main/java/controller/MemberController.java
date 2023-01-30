package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	
	
	@PostMapping(value = "/deleteMember", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int deleteMember(HttpServletRequest request, @RequestParam("password") String password) {
		HttpSession session = request.getSession(false);
		int res = 0;
		if (session != null) {
			MemberVO svo = (MemberVO) session.getAttribute("vo");
			MemberVO val = dao.getMembervo(svo.getMnum());
			String actualPassword = val.getPwd(); // password출력
			if (actualPassword.equals(password)) { // 실제 비번과 입력비번 비교
				dao.deleteMember(svo.getId());
				session.invalidate();
				res = 1; //성공
			} else {
				res =2; //비밀번호 오류
			}
		} else {
			res=3; //세션 유효하지 않음
	
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
	 	
		
	 	
	 @RequestMapping("/uploadProfile")
	 @ResponseBody
		public Map<String, Object> saveFile(MemberVO vo, @RequestParam("uploadProfile") MultipartFile profile) {
			String fileName = profile.getOriginalFilename();

			int res = 0;

			byte[] byteArray;
			Map<String, Object> result = new HashMap<String, Object>();
	     
	     try {
	         byteArray = profile.getBytes(); //파일 변환
	     } catch (IOException e) {
	         e.printStackTrace();
	         res = 1;
	         result.put("res", res);
	         return result;
	     }
	     
	     String uploadDirectory ="C:/Users/ss263/git/SDC_mini_project2/bootcampmoa/src/main/webapp/resources/profiles/" + fileName;
	     File f = new File(uploadDirectory);
	     Path path = Paths.get(uploadDirectory);
	     if (f.exists()) { //파일이 존재할 때
	         res = 2;
	         result.put("res", res);
	     } else {	    	 
	         try {
	             Files.write(path, byteArray); //파일 저장
	             vo.setProfile(fileName);
	             res = 3;
	             result.put("res", res);
	             result.put("vo", vo);
	         } catch (IOException e) { //파일 저장 중 예외 발생
	             e.printStackTrace();
	             res = 4;
	             result.put("res", res);
	         }
	     }
	     return result;
	 }
}
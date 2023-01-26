package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import dao.BootcampDAO;
import dao.MemberMyBatisDao;
import vo.BootcampVO;
import vo.MemberVO;




@Controller
public class BootcampController {
	@Autowired
	BootcampDAO bootcampDao;
	
	@GetMapping("/bootmoaMain") // 최신 등록된 부트캠프 리스트 6개 출력  - 아직 구현 x
	public ModelAndView selectRecentList() {
		
		List<BootcampVO> list = null;
		list = bootcampDao.selectList();
		ModelAndView mav = new ModelAndView();
		if(list.size() != 0) {
			mav.addObject("bootcampList",list);
		}
		mav.setViewName("bootcampMain");
		return mav;
	}
	@GetMapping("/bootcampListAll") // 모든 부트캠프 리스트 출력  
	public ModelAndView selectList() {
		List<BootcampVO> list = null;
		list = bootcampDao.selectList();
		ModelAndView mav = new ModelAndView();
		if(list.size() != 0) {
			mav.addObject("bootcampListAll",list);
		}
		mav.setViewName("bootcampListAll");
		return mav;
			
	
	}
	
	@GetMapping("/bootcampInsertRequest") //부트캠프 등록 요청 페이지로 이동
	public ModelAndView insertRequest() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bootcampInsertRequest");
		return mav;
	} 
	
	@PostMapping("/bootcampInsertRequest/success") //부트캠프 등록 요청 =>  
	public ModelAndView insertRequestSuccess(BootcampVO bootcamp) {
		boolean result = bootcampDao.insertMember(bootcamp);
		ModelAndView mav = new ModelAndView();
		if (result) {
			mav.addObject("msg", "등록 요청이 완료되었습니다. ");
		} else {
			mav.addObject("msg", "등록 요청에 문제가 발생하였습니다.");
		}
		mav.setViewName("insertRequestSuccess");
		return mav;
		
	} 
	
	@GetMapping("/bootcampInsertResponse") //부트캠프 등록 허용 결정 페이지 에서 등록 요청을 받은 부트캠프들만 볼 수 있음   
	public ModelAndView insertResponse(BootcampVO bootcamp) {
		List<BootcampVO> invisibleList = new ArrayList<BootcampVO>();
		List<BootcampVO> list = bootcampDao.selectList();
		ModelAndView mav = new ModelAndView();
		if(list.size() != 0) {
			for(BootcampVO vo: list) {
				if(vo.getVisible() == 0) {
					
					invisibleList.add(vo);
				}
			}
			mav.addObject("invisibleList",invisibleList);
		}else {
			mav.addObject("msg", "등록 요청이 없습니다.");
		}
		mav.setViewName("bootcampInsertResponse");
		return mav;
		
	} 
	

}

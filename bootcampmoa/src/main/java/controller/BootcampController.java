package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import dao.BootcampDAO;
import vo.BootcampVO;




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
	@GetMapping("/bootcampListAll") // 모든 부트캠프 리스트 출력  , +visible이 1인 컬럼만 보여줘야함
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
	

}

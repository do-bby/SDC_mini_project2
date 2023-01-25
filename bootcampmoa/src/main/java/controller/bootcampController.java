package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import dao.BootcampDAO;
import vo.BootcampVO;



@Controller
public class bootcampController {
	@Autowired
	BootcampDAO bootcampDao;
	@GetMapping("/bootmoaMain") // 최신 등록된 부트캠프 리스트 6개 출력  - 아직 구현 x
	public ModelAndView list() {
		
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
	public ModelAndView listAll() {
		List<BootcampVO> list = null;
		list = bootcampDao.selectList();
		ModelAndView mav = new ModelAndView();
		if(list.size() != 0) {
			mav.addObject("bootcampList",list);
		}
		mav.setViewName("bootcampListAll");
		return mav;
		
	}
	
	

}

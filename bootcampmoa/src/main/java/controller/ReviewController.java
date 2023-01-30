package controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BootcampDAO;
import dao.ReviewDAO;
import vo.BootcampVO;
import vo.PagingVO;
import vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	@Autowired
	BootcampDAO bdao;
	@GetMapping("/bootcamp/{bnum}")
	public ModelAndView list(@ModelAttribute("paging")PagingVO paging,@PathVariable int bnum) {
		int rowcount = dao.getTotalRowCount(paging);		
		paging.setTotalRowCount(rowcount);
		paging.pageSetting();
		List<ReviewVO> list = dao.selectall(paging);
		BootcampVO bvo = bdao.selectOne(bnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bvo",bvo);
		if (list.size() != 0) {
			mav.addObject("list", list);			
		} else {
			mav.addObject("msg", "추출된 결과가 없어요");
		}		
		mav.setViewName("bootcampInfo");
		return mav;
	}
	@GetMapping("/review")
	public ModelAndView one(int id) {
		ReviewVO rvo = dao.selectone(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("rvo",rvo);
		mav.setViewName("updateReview");
		return mav;
	}
	
	@GetMapping("/review/deletereview")
	public String delete(@ModelAttribute("paging")PagingVO paging,int id) {
		dao.delete(id);			
		return "redirect:/bootmoaMain";
	}
	@GetMapping("/bootcamp/review/{bnum}")
	public ModelAndView insertreview(@PathVariable int bnum) {		
		ModelAndView mav = new ModelAndView();
		BootcampVO bvo = bdao.selectOne(bnum); 
		mav.addObject("bvo",bvo);
		mav.setViewName("insertReview");
		return mav;
	}
	@PostMapping("/review/insertreview")
	public String insert(ReviewVO rvo) {
		dao.insert(rvo);		
		return "redirect:/bootmoaMain";
	}

	@PostMapping("/review/updatereview")
	public String update(ReviewVO rvo) {
		dao.update(rvo);				
		return "redirect:/bootmoaMain";
	}

}

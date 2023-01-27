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
	@GetMapping("/bootcamp/{bnum}/reviews")
	public ModelAndView list(@ModelAttribute("paging")PagingVO paging, @PathVariable int bnum) {
		int rowcount = dao.getTotalRowCount(paging);		
		paging.setTotalRowCount(rowcount);
		paging.pageSetting();
		List<ReviewVO> list = dao.selectall(paging);
		BootcampVO bvo = bdao.selectOne(bnum);
		ModelAndView mav = new ModelAndView();	
		if (list.size() != 0) {
			mav.addObject("list", list);
			mav.addObject("bvo",bvo);
		} else {
			mav.addObject("msg", "추출된 결과가 없어요");
		}
		mav.setViewName("bootcampInfo");
		return mav;
	}
	@GetMapping("/review")
	public ModelAndView one(int id) {
		ReviewVO vo = dao.selectone(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("updateReview");
		return mav;
	}
	
	@GetMapping("/review/delete")
	public String delete(@ModelAttribute("paging")PagingVO paging,int id) {
		boolean result = dao.delete(id);
		ModelAndView mav = new ModelAndView();	
		if (result) {
			mav.addObject("list", dao.selectall(paging));
		} else {
			mav.addObject("msg", "삭제를 처리하는 동안 오류 발생");
		}
		return "redirect:/bootmoaMain";
	}
	
	@PostMapping("/review/insert")
	public String insert(@ModelAttribute("paging")PagingVO paging,ReviewVO vo) {
		boolean result = dao.insert(vo);
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.addObject("list",dao.selectall(paging));
		}
		else {
			mav.addObject("msg","등록에 실패했습니다.");
		}
		return "redirect:/reviews";
	}
	
	@PostMapping("/review/update")
	public String update(@ModelAttribute("paging")PagingVO paging,ReviewVO vo) {
		boolean result = dao.update(vo);		
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.addObject("list",dao.selectall(paging));
		}
		else {
			mav.addObject("msg","등록에 실패했습니다.");
		}
		return "redirect:/bootmoaMain";
	}
	
}

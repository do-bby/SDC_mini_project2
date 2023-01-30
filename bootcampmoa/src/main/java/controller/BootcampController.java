package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

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
	@Autowired
	ServletContext context;
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
	public ModelAndView insertMember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bootcampInsertRequest");
		return mav;
	} 
	
	@PostMapping("/bootcampInsertRequest/success") //부트캠프 등록 요청 =>  
	public ModelAndView insertMemberResult(BootcampVO bootcamp) {
		boolean result = bootcampDao.insertMember(bootcamp);
		ModelAndView mav = new ModelAndView();
		if (result) {
			mav.addObject("msg", "등록 요청 접수가 완료되었습니다. ");
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
	
	@GetMapping("/requestDelete") // 등록 요청 삭제
	public ModelAndView requestDelete(BootcampVO bootcamp) {
		List<BootcampVO> list = bootcampDao.selectList();
		List<BootcampVO> invisibleList = new ArrayList<BootcampVO>();
		ModelAndView mav = new ModelAndView();
		boolean result = bootcampDao.delete(bootcamp.getBnum());
		if(result) {
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
		}	
		return mav;
	}
	
	@GetMapping("/insertManager") // 등록 요청 버튼 => 부트캠프 등록 창
	public ModelAndView insertManager(BootcampVO bootcamp) {
		ModelAndView mav = new ModelAndView();
		BootcampVO vo = bootcampDao.selectOne(bootcamp.getBnum());
		mav.addObject("vo", vo);
		mav.setViewName("insertManager");
		return mav;
	}
	
	@PostMapping("/insertManager/result")// 부트캠프 등록 창 => 등록 버튼 클릭 => 사이트 메인 페이지에 등록
	   public void InsertManagerResult(BootcampVO bootcamp) {
	      
	      String logoName = bootcamp.getLogoFile().getOriginalFilename(); // 넘겨 받은 파일 이름 추출
	      String imgName = bootcamp.getImgFile().getOriginalFilename();
	      bootcamp.setLogo(logoName);
	      bootcamp.setImg(imgName);
	      
	      System.out.println(bootcamp.toString());
	      // 파일을 images 폴더 아래에 저장
	      try {
	         //String path = "C:/Users/YB/git/SDC_mini_project2/bootcampmoa/src/main/webapp/resources/images/";
	         String logoInfo = context.getRealPath("/") + "resources/images/"+logoName;
	         String imgInfo = context.getRealPath("/") + "resources/images/"+imgName;
	         
	         File logo = new File(logoInfo);
	         File img = new File(imgInfo);
	         
	         bootcamp.getLogoFile().transferTo(logo);
	         bootcamp.getImgFile().transferTo(img);
	             
	         // 등록된 정보를 DB에 저장
	         bootcampDao.update(bootcamp);   
	         
	         // 넘겨받은 bnum 값으로 요청 리스트에서 삭제 + 메인화면에 등록(= visible 0 => 1) 
	         bootcampDao.updateManager(bootcamp);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      
	   }
	   
	
	@GetMapping("/updateManager") // 수정 버튼 => 부트캠프 등록 창
	public ModelAndView updateManager(BootcampVO bootcamp) {
		ModelAndView mav = new ModelAndView();
		BootcampVO vo = bootcampDao.selectOne(bootcamp.getBnum());
		mav.addObject("vo", vo);
		mav.setViewName("updateManager");
		return mav;
	}
	
	
	@PostMapping("/updateManager/result")// 부트캠프 등록 창 => 등록 버튼 클릭 => 사이트 메인 페이지에 등록
	public void updateManagerResult(BootcampVO bootcamp) {
		
		String logoFile = bootcamp.getLogoFile().getOriginalFilename(); // 넘겨 받은 파일 이름 추출
		String imgFile = bootcamp.getImgFile().getOriginalFilename();
		bootcamp.setLogo(logoFile);
		bootcamp.setImg(imgFile);
		
		byte[] logoContent = null;
		byte[] imgContent = null;
		
		System.out.println(bootcamp.toString());
		// 파일을 images 폴더 아래에 저장
		try {
			logoContent = logoFile.getBytes();
			imgContent = imgFile.getBytes();
			File logo = new File("C:/Users/YB/git/SDC_mini_project2/bootcampmoa/src/main/webapp/resources/images/"+logoFile);
			File img = new File("C:/Users/YB/git/SDC_mini_project2/bootcampmoa/src/main/webapp/resources/images/"+imgFile);
			FileOutputStream fos1 = new FileOutputStream(logo);
			FileOutputStream fos2 = new FileOutputStream(img);
			
   		 	fos1.write(logoContent);
   		 	fos2.write(imgContent);
   		 	
   		 	fos1.close();
   		 	fos2.close();
   		 	
   		// 등록된 정보를 DB에 저장
   		bootcampDao.update(bootcamp);	
   		
   		// 넘겨받은 bnum 값으로 요청 리스트에서 삭제 + 메인화면에 등록(= visible 0 => 1) 
   		bootcampDao.updateManager(bootcamp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@GetMapping("/bootcampDelete") // 등록 요청 삭제
	public ModelAndView bootcampDelete(BootcampVO bootcamp) {
		List<BootcampVO> list = bootcampDao.selectList();
		List<BootcampVO> visibleList = new ArrayList<BootcampVO>();
		ModelAndView mav = new ModelAndView();
		boolean result = bootcampDao.delete(bootcamp.getBnum());
		if(result) {
			if(list.size() != 0) {
				for(BootcampVO vo: list) {
					if(vo.getVisible() == 1) {
						
						visibleList.add(vo);
					}
				}
				mav.addObject("visibleList",visibleList);
			}else {
				mav.addObject("msg", "등록 요청이 없습니다.");
			}
			
			mav.setViewName("bootcampManagement");
		}	
		return mav;
	}
	
	@GetMapping("/bootcampSearch") // 등록 요청 버튼 => 부트캠프 등록 창 & 메인화면 카테고리 
	public ModelAndView bootcampSearch(String keyword) {
		ModelAndView mav = new ModelAndView();
		if(keyword==null) {
			mav.setViewName("bootcampSearch");
			
		}else {
			List<BootcampVO> list = bootcampDao.search(keyword);
			
			if (list.size() != 0) {
				mav.addObject("msg1", "'"+keyword+"'"+"에 대한 검색결과 입니다.");
				mav.addObject("searchList", list);
				
			}else {
				mav.addObject("msg2", "'"+keyword+"'"+"에 대한 검색 결과가 없어요😭");
				
			}
			mav.setViewName("bootcampSearch");
			
		}
		
		return mav;
	}
	
	
	@GetMapping("/bootcampManagement") //관리자 로그인 시 관리 페이지 에서 등록된 부트캠프만 볼 수 있음   
	public ModelAndView bootcampManagement(BootcampVO bootcamp) {
		List<BootcampVO> visibleList = new ArrayList<BootcampVO>();
		List<BootcampVO> list = bootcampDao.selectList();
		ModelAndView mav = new ModelAndView();
		if(list.size() != 0) {
			for(BootcampVO vo: list) {
				if(vo.getVisible() == 1) {
					
					visibleList.add(vo);
				}
			}
			mav.addObject("visibleList",visibleList);
		}else {
			mav.addObject("msg", "등록된 부트캠프가 없습니다.");
		}
		mav.setViewName("bootcampManagement");
		return mav;
		
	}


}

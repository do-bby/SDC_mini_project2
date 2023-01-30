package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.BootcampVO;
import vo.PagingVO;

@Repository 
public class BootcampDAO {
	@Autowired
	SqlSession session;
	//저장된 부트 캠프 수
	   public int getTotalRowCount(PagingVO paging)
	   {   int cnt = 0;
	      String statement = "resource.BootcampMapper.totalRowCount";
	      cnt = session.selectOne(statement);
	      
	      return cnt;
	   }

	// 해당 페이지의 전체 부트캠프 리스트 반환
	public List<BootcampVO> selectList(PagingVO paging){
		List<BootcampVO> list = null;
		try {
			String statement = "resource.BootcampMapper.selectBootcamp";
			list = session.selectList(statement,paging); 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	// 페이지에 상관 없이 전체 부트캠프 리스트 반환
	public List<BootcampVO> selectListAll(){
		List<BootcampVO> list = null;
		try {
			String statement = "resource.BootcampMapper.selectBootcampAll";
			list = session.selectList(statement); 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	} 
	
	
	// 특정 부트캠프 번호(pk)에 해당하는 부트캠프 한 개 반환
	public BootcampVO selectOne(int bnum) {
		BootcampVO vo = null;
		try {
			String statement = "resource.BootcampMapper.selectBootcampOne";
			vo = session.selectOne(statement,bnum);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return vo; 
	}
	
	
	// 부트캠프 등록 visible이 무조건 0
	public boolean insertMember(BootcampVO bootcamp) { 
		Boolean result = false;
		try {
			String statement = "resource.BootcampMapper.insertMember";
			session.insert(statement,bootcamp);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result; 
		
	}
	
	// 부트캠프 등록 visible이 무조건 1
	public boolean insertManager(BootcampVO bootcamp) { 
		Boolean result = false;
		try {
			String statement = "resource.BootcampMapper.insertManager";
			session.insert(statement,bootcamp);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result; 
		
	}
	
	
	
	// 부트캠프 정보 수정
	public boolean update(BootcampVO bootcamp) {
		Boolean result = false;
		try {
			String statement = "resource.BootcampMapper.updateBootcamp";
			session.update(statement, bootcamp);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 승인받은 부트캠프의 visible 값을 1로 바꾸어줌
		public boolean updateManager(BootcampVO bootcamp) {
			Boolean result = false;
			try {
				String statement = "resource.BootcampMapper.updateManager";
				session.update(statement, bootcamp);
				result = true;
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return result;
		}
	
	// 부트캠프 정보 삭제 
	public boolean delete(int bnum) {
		boolean result = false;
		try {
			String statement = "resource.BootcampMapper.deleteBootcamp";
			session.delete(statement,bnum);
			result = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 부트캠프 정보 검색
	public List<BootcampVO> search(String keyword){
		List<BootcampVO> list = null;
		try {
			String statement = "resource.BootcampMapper.searchBootcamp";
			list = session.selectList(statement,keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}

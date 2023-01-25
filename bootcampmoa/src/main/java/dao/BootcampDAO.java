package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.BootcampVO;

@Repository
public class BootcampDAO {
	@Autowired
	SqlSession session;
	
	// 전체 부트캠프 리스트 반환
	public List<BootcampVO> selectList(){
		List<BootcampVO> list = null;
		try {
			String statement = "resource.BootcampMapper.selectBootcamp";
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
	
	// 부트캠프 등록 
	public boolean insert(BootcampVO bootcamp) { 
		Boolean result = false;
		try {
			String statement = "resource.BootcampMapper.insertBootcamp";
			session.insert(statement,bootcamp);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result; 
	}
	
	
	

}

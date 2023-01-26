package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSession session = null;	
	
	public List<ReviewVO> selectall(){
		List<ReviewVO> list = null;
		try {
			String statement = "review.selectReview";
			list = session.selectList(statement);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ReviewVO selectone(int id){
		ReviewVO vo = null;
		try {
			String statement = "review.selectOneReview";
			vo = session.selectOne(statement,id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public boolean insert(ReviewVO vo) {
		boolean result = false;
		try {
			String statement = "review.insertReview";
			session.insert(statement, vo);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public boolean delete(int id) {
		boolean result = false;
		try {			
			String statement = "review.deleteReview";
			session.delete(statement, id);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public boolean update(ReviewVO vo) {
		boolean result = false;
		try {			
			String statement = "review.updateReview";
			session.update(statement, vo);
			System.out.println(vo.getRnum());
			System.out.println(vo.getBad());
			System.out.println(vo.getGood());
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

}
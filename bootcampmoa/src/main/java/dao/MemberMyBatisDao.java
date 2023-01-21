package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberMyBatisDao {
	@Autowired
	SqlSession session = null;
	public boolean insertM(MemberVO vo) {
		boolean res = true;
		String statement = "members.insertMember"; //resource의 mapper에 설정필요
		if(session.insert(statement,vo) != 1) {
			res = false;
		}
		return res;
	}
	
	public String searchN(String input){
		String statement = "members.searchNick"; // searchNick, searchId처럼 분리 예정
		String val = session.selectOne(statement,input); //닉네임 중복체크
		return val;
	}
	
	public String searchI(String input){
		String statement = "members.searchId";
		String val = session.selectOne(statement,input);//아이디 중복체크
		return val;
	}
	
	public List<MemberVO> getMemberInfo(int mnum){
		String statement = "members.getMemberInfo";
		List<MemberVO> list = session.selectList(statement,mnum);//아이디 중복체크
		return list;
	}
	
	public boolean updateM(MemberVO vo) {
		boolean res = true;
		String statement = "members.updatetMember"; //resource의 mapper에 설정필요
		if(session.insert(statement,vo) != 1) {
			res = false;
		}
		return res;
	}
}

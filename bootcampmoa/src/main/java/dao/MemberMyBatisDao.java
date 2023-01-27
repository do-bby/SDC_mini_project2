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
		String statement = "members.insertMember"; //회원가입
		if(session.insert(statement,vo) != 1) {
			res = false;
		}
		return res;
	}
	
	public String searchN(String input){
		String statement = "members.searchNick"; 
		String val = session.selectOne(statement,input); //닉네임 중복체크
		return val;
	}
	
	public String searchI(String input){
		String statement = "members.searchId";
		String val = session.selectOne(statement,input);//아이디 중복체크
		return val;
	}
	
	public List<MemberVO> getMemberInfo(String id){
		String statement = "members.getMemberInfo";
		List<MemberVO> list = session.selectList(statement,id);//회원정보가져오기
		return list;
	}
	
	
	public MemberVO getMembervo(int mnum) {
		MemberVO vo = null;
		try {
			String statement = "members.getOneMemberInfo";
			vo = session.selectOne(statement,mnum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public boolean updateM(MemberVO vo) {
		boolean res = false;
		try {
			String statement = "members.updateMember"; //회원정보 수정
			session.update(statement,vo);
			res = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//회원탈퇴
		public void deleteMember(String id) {
			String statement = "MemberLoginMapper.deleteMember";
			session.delete(statement,id);
		}
}

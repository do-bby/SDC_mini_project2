package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.MemberVO;

@Repository
public class MemberLoginDAO {

	@Autowired
	SqlSession session = null;
	//로그인
	public int selectLoginMember(MemberVO vo) {
		int count = 0;
		try {
			String statement = "MemberLoginMapper.selectMemberLogin";
			count = session.selectOne(statement, vo);	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//비밀번호찾기
	public void selectMemberPwd(MemberVO vo) {
		String statement = "MemberLoginMapper.selectMemberPwd";
		session.selectOne(statement, vo);
	}
	
	//회원탈퇴
	public void deleteMember(String id) {
		String statement = "MemberLoginMapper.deleteMember";
		session.delete(statement);
	}
}

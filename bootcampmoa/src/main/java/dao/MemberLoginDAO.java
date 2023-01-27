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
	public String selectMemberPwd(MemberVO vo) {
		String count = null;
		try {
			String statement = "MemberLoginMapper.selectMemberPwd";
			count = session.selectOne(statement, vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//멤버정보 불러오기
	public MemberVO selectMemberInfo(MemberVO vo) {
		MemberVO list = null;
		try {
			String statement = "MemberLoginMapper.selectMemberInfo";
			 list = session.selectOne(statement, vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}

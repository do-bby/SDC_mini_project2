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
	
	//비밀번호질문 불러오기
	public String selectMemberAnswer(MemberVO vo) {
		String count = null;
		try {
			String statement = "MemberLoginMapper.selectMemberAnswer";
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

	//비밀번호 체크
	public int selectAnswerCheck(MemberVO vo) {
		int count = 0;
		try {
			String statement = "MemberLoginMapper.selectAnswerCheck";
			count = session.selectOne(statement, vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//비밀번호 체크
	public int selectPwdCheck(MemberVO vo) {
		int count = 0;
		try {
			String statement = "MemberLoginMapper.selectPwdCheck";
			count = session.selectOne(statement, vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//비밀번호 수정
	public int updatePwd(MemberVO vo) {
		int num = 0;
		try {
			String statement = "MemberLoginMapper.updatePwd";
			num = session.update(statement, vo);//말도안되는것 같지만 해봄 업데이트 된 row 갯수를 반환해준다고함
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	//아이디 찾기
	public String selectMemberId(MemberVO vo) {
		String id = null;
		try {
			String statement = "MemberLoginMapper.selectMemberId";
			id = session.selectOne(statement, vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}

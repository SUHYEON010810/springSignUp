package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("MemberDAO")
public class MemberDAO extends EgovAbstractDAO{

	/* 로그인 */
	public int selectlogin(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("MemberVO.selectlogin", vo);
	}

	/* member 등록 */
	public String InsertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("memberDAO.insertMember", vo);
	}

	/* ID 중복 체크 */
	public int idcheck(String userID) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.idcheck", userID) ;
	}

	/* 회원 목록 */
	public List<?> SelectMemberList(MemberVO vo) {
		// TODO Auto-generated method stub

		return list("memberDAO.SelectMemberList", vo);
	}

	/* 회원 정보 수정 */
	public MemberVO seleteuserdata(String userid) {
		// TODO Auto-generated method stub
		return (MemberVO) select("memberDAO.seleteuserdata",userid);
	}

	/* 회원 정보 수정 데이터 저장*/
	public int updateUser(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) update("memberDAO.updateUser", vo);
	}

	/* 회원 삭제 */
	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return (int) delete("memberDAO.deleteMember", userid);
	}

	public int selectTotal(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("MemberVO.selectTotal", vo);
	}



}

package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("MemberDAO")
public class MemberDAO extends EgovAbstractDAO{

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


	public List<?> SelectMemberList(MemberVO vo) {
		// TODO Auto-generated method stub

		return list("memberDAO.SelectMemberList", vo);
	}

	/* 회원 정보 수정 */
	public MemberVO seleteuserdata(String userid) {
		// TODO Auto-generated method stub
		return (MemberVO) select("memberDAO.seleteuserdata",userid);
	}

	public int updateUser(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("dao 진입");
		return (int) update("memberDAO.updateUser", vo);
	}

	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return (int) delete("memberDAO.deleteMember", userid);
	}


	public List<?> userSearch(String data) {
		// TODO Auto-generated method stub
		return list("memberDAO.userSearch");
	}













}

package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("MemberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService{

	@Resource(name="MemberDAO")
	private MemberDAO memberDAO;

	/* 로그인 */
	@Override
	public int selectlogin(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectlogin(vo);
	}

	/* 회원 등록 */
	@Override
	public String InsertMember(MemberVO vo) throws Exception {
		return memberDAO.InsertMember(vo);
	}

	/* ID 중복 체크 */
	@Override
	public int idcheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		int result = memberDAO.idcheck(userid);
		return result;
	}

	/* 회원 목록*/
	@Override
	public List<?> SelectMemberList(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.SelectMemberList(vo);
	}

	/* 회원 정보 수정 */
	@Override
	public MemberVO seleteuserdata(String userid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스 진입");
		return memberDAO.seleteuserdata(userid);
	}
	/* 화원 정보 수정 저장 */
	@Override
	public int updateUser(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.updateUser(vo);
	}


	/* 회원 정보 삭제 */
	@Override
	public int deleteMember(String userid) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.deleteMember(userid);
	}

	/* 토탈 갯수 얻어오기 */
	@Override
	public int selectTotal(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectTotal(vo);
	}










}

package egovframework.example.sample.service;

import java.util.List;

public interface MemberService {

	/* 로그인  */
	public int selectlogin(MemberVO vo)throws Exception;

	/* 회원 등록 */
	public String InsertMember(MemberVO vo) throws Exception;

	/* ID 중복확인 */
	public int idcheck(String userid) throws Exception;

	/* 회원 LIST */
	public List<?> SelectMemberList(MemberVO vo) throws Exception;

	/* 회원 정보 수정 */
	public MemberVO seleteuserdata(String userid) throws Exception;

	public int updateUser(MemberVO vo) throws Exception;

	/* 회원 정보 삭제 */
	public int deleteMember(String userid)  throws Exception;
}

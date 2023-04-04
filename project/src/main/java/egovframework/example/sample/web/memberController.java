package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;

@Controller
public class memberController {

	@Resource(name="MemberService")
	private MemberService memberService;

	/* 로그인 폼 */
	@RequestMapping(value="/loginWrite.do")
	public String loginWrite() {
		return "member/loginWrite";
	}

	/* 로그인 확인 */
	/* 결과 메세지를 다시 보내기 위해 @ResponseBody 선언 */
	@ResponseBody
	@RequestMapping(value="/logincheck.do")
	public String logincheck(MemberVO vo) throws Exception{
		System.out.println("id === "+ vo.getUserID());
		System.out.println("pass ===="+ vo.getPassword());

		int result = memberService.selectlogin(vo);
		System.out.println("데이터 ==== "+result);
		String mesage = "";

		return mesage;
	}

	/* 회원가입 폼 */
	@RequestMapping(value="/signUpWrite.do")
	public String signUpWrite() {
		return "member/signUpWrite";
	}

	/* 회원가입 데이터 등록 */
	@RequestMapping(value="/signUpWriteSave.do")
	public String InsertLogin(MemberVO vo) throws Exception{


			System.out.println(vo.getUserID());
			System.out.println(vo.getPhone());

			String result = memberService.InsertMember(vo);
			if(result == null) {
				System.out.println("저장 완료");
			}else {
				System.out.println("저장 실패");
			}
		System.out.println("ddd");
		return "redirect:memberList.do";
	}

	/*	 아이디 중복 체크 */
	@ResponseBody
	@RequestMapping(value="/idcheck.do")
	public String idcheck(String userid) throws Exception{
		String message = "";

		int count = memberService.idcheck(userid);
		if(count == 0) {

			message = "ok";
		}
		return message;
	}

	/* 회원 목록 */
	@RequestMapping(value="/memberList.do")
	public String selectMemberList(MemberVO vo, ModelMap model) throws Exception{
		System.out.println("검색목록==========" + vo.getSearchGubun());
		System.out.println("검색이름==========" + vo.getSearchText());
		List<?> list = memberService.SelectMemberList(vo);

		/* JSP로 데이터 전달
		 * addAttribute( JSP에 사용할 변수명, 실 데이터) */
		model.addAttribute("resultList",list);

		System.out.println(list);

		return "member/memberList";
	}


	/* 회원 수정 */
	@RequestMapping(value="/memberModify.do")
	public String memberUpdate(String userid, ModelMap model) throws Exception{

		MemberVO vo = memberService.seleteuserdata(userid);
		model.addAttribute("vo", vo);

		return "member/memberModify";
	}

	/* 수정 데이터 저장 */
	@RequestMapping(value="/memberModifySave.do")
	public String memberUpdateSave(MemberVO vo)throws Exception{
		System.out.println("수정 컨트롤러 시작");
		int result = memberService.updateUser(vo);
		System.out.println("수정 컨트롤러 끝");
		return "redirect:/memberList.do";
	}

	/*회원 삭제*/
	@RequestMapping(value="/memberDelect.do")
	public String deleteMember(String userid)throws Exception{

		int result = memberService.deleteMember(userid);
		if(result == 1) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 실패");
		}


		return "redirect:memberList.do";
	}

	/* 회원 검색 */


}

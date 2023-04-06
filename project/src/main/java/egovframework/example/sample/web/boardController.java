package egovframework.example.sample.web;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.boardService;
import egovframework.example.sample.service.boardVO;
import egovframework.example.sample.service.impl.boardDAO;

@Controller
public class boardController {

	@Resource (name="boardService")
	private boardService boardService;

	/* 게시글 등록 및 저장 */
	@RequestMapping(value="boardWrite")
	public String boardWrite() {
		return "board/boardwrite";
	}

	@RequestMapping(value="/boardWriteSave.do")
	public String InsertLogin(boardVO vo ) throws Exception{

			/* 게시판 번호 세팅 */
			int column = boardService.selectColumn();
			column += 1;
			vo.setBoardID(column);

			System.out.println("작성자 ====== "+vo.getUserID());




			Calendar cal = new GregorianCalendar();
			Date date = new Date(cal.getTimeInMillis());
			System.out.println("날짜 ==== "+date);
			vo.setRegDate(date);

			String result = boardService.Insertboard(vo);


		return "aaa";
	}

}

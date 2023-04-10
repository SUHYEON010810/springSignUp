package egovframework.example.sample.web;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.boardService;
import egovframework.example.sample.service.boardVO;
import egovframework.example.sample.service.impl.boardDAO;

@Controller
public class boardController {

	@Resource (name="boardService")
	private boardService boardService;

	/* 게시글 등록 및 저장 */
	@RequestMapping(value="boardWrite.do")
	public String boardWrite() {
		return "board/boardwrite";
	}

	@RequestMapping(value="/boardWriteSave.do")
	public String InsertLogin(@ModelAttribute("boardVO") boardVO vo ) throws Exception{

		String fileName = null;
		MultipartFile uploadFile  = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." +ext;
			uploadFile.transferTo(new File("D:\\upload\\"+fileName));
		}

		vo.setB_file(fileName);
		System.out.println("파일======="+vo.getB_file());

		/* 등록 날짜 세팅*/
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegDate(date);

		String result = boardService.Insertboard(vo);
		if(result == "1") {
			System.out.println("등록 완료");
		}else {
			System.out.println("등록실패");
		}

		return "redirect:boardList.do";
	}



	/* 게시글 리스트 */
	@RequestMapping(value="/boardList.do")
	public String boardList(boardVO vo, ModelMap model) throws Exception{
		System.out.println("정렬기준"+vo.getSortGubun());
		System.out.println("검색 내용"+vo.getSearchText());

		List<?> list = boardService.SelectBoardList(vo);
		model.addAttribute("resultList",list);

		System.out.println(list);


		return "board/boardList";
	}

	/* 게시글 상세보기 */
	@RequestMapping(value="/boardDetail.do")
	public String boardDetail(int boardID, int viewCnt, boardVO d_vo, ModelMap model) throws Exception{
		/* 조회수 */
		viewCnt +=1;
		d_vo.setViewCnt(viewCnt);
		int data = boardService.updateViewCnt(d_vo);
		if (data == 1) {
			System.out.println("조회수 증가 완료");
		}else {
			System.out.println("조회수 증가 실패");
		}

		boardVO vo = boardService.seleteBoardData(boardID);

		model.addAttribute("vo", vo);

		return "board/boardDetail";
	}

	/* 게시글 삭제 */
	@RequestMapping(value="/boardDelect.do")
	public String boardDelect(int boardID)throws Exception{

		int result = boardService.deleteBoard(boardID);
		if(result == 1) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("삭제 실패");
		}


		return "redirect:boardList.do";
	}

	@RequestMapping(value="/boardModify.do")
	public String boardModify(int boardID, ModelMap model) throws Exception{
		boardVO vo = boardService.seleteBoardData(boardID);
		model.addAttribute("vo", vo);
		return "board/boardModify";
	}

	@RequestMapping(value="/boardModifySave.do")
	public String boardModifySave(boardVO vo)throws Exception{

		int result = boardService.updateboard(vo);

		System.out.println(result);

		return "redirect:boardList.do";
	}



}

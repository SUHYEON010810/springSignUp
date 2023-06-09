package egovframework.example.sample.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.boardService;
import egovframework.example.sample.service.boardVO;
import egovframework.example.sample.service.impl.boardDAO;

@Controller
public class boardController {

	@Resource(name = "boardService")
	private boardService boardService;

	/* 게시글 등록 및 저장 */
	@RequestMapping(value = "boardWrite.do")
	public String boardWrite() {
		return "board/boardwrite";
	}

	@RequestMapping(value = "/boardWriteSave.do")
	public String InsertLogin( boardVO vo, MultipartHttpServletRequest req) throws Exception {

		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("D:\\upload\\" + fileName));
		}

		vo.setB_file(fileName);
		System.out.println("파일=======" + vo.getB_file());

		/* 등록 날짜 세팅 */
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegDate(date);

		String result = boardService.Insertboard(vo);
		if (result == "1") {
			System.out.println("등록 완료");
		} else {
			System.out.println("등록실패");
		}

		return "redirect:boardList.do";
	}

	/* 게시글 리스트 */
	@RequestMapping(value = "/boardList.do")
	public String boardList(boardVO vo, ModelMap model) throws Exception {



		System.out.println("정렬기준" + vo.getSortGubun());
		System.out.println("검색 내용" + vo.getSearchText());

		List<?> list = boardService.SelectBoardList(vo);
		System.out.println("리스트 ==== " + list);
		model.addAttribute("resultList", list);


		System.out.println(list);

		return "board/boardList";
	}

	/* 게시글 상세보기 */
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(int boardID, int viewCnt, boardVO d_vo, ModelMap model) throws Exception {

		/* 조회수 */
		viewCnt += 1;
		d_vo.setViewCnt(viewCnt);
		int data = boardService.updateViewCnt(d_vo);
		if (data == 1) {
			System.out.println("조회수 증가 완료");
		} else {
			System.out.println("조회수 증가 실패");
		}

		boardVO vo = boardService.seleteBoardData(boardID);
		model.addAttribute("vo", vo);

		return "board/boardDetail";
	}

	/* 게시글 삭제 */
	@RequestMapping(value = "/boardDelect.do")
	public String boardDelect(int boardID) throws Exception {

		int result = boardService.deleteBoard(boardID);
		if (result == 1) {
			System.out.println("삭제 완료");
		} else {
			System.out.println("삭제 실패");
		}
		System.out.println("redirect 사용 전 ==========");

		return "redirect:boardList.do";
	}

	@RequestMapping(value = "/boardModify.do")
	public String boardModify(int boardID, ModelMap model) throws Exception {
		boardVO vo = boardService.seleteBoardData(boardID);
		model.addAttribute("vo", vo);
		return "board/boardModify";
	}

	// 파일 수정
	@RequestMapping(value = "/boardModifySave.do")
	public String boardModifySave(boardVO vo) throws Exception {
		int result = boardService.updateboard(vo);
		if (result == 1) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}

		System.out.println(result);

		return "redirect:boardList.do";
	}

	/* 파일 다운로드 */
	@RequestMapping(value = "fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("파일 다운로드 시작");

		String b_file = request.getParameter("b_file");
		System.out.println("파일이름 ========>" + b_file);
		String realFilename = "";

		try {
			String browser = request.getHeader("User-Agent"); // 유저의 시스템 정보

			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				b_file = URLEncoder.encode(b_file, "UTF-8").replaceAll("\\+", "%20");
			} else {
				b_file = new String(b_file.getBytes("UTF-8"), "ISO-8859-1");
			}

			realFilename = "D:\\upload\\" + b_file;
			System.out.println(realFilename);

			File file = new File(realFilename);
			if (!file.exists()) { // 파일이 존재하는지 확인
				System.out.println("파일 존재 x");
				return;
			}

			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + b_file + "\"");
			System.out.println("b_file =====> " + b_file);

			OutputStream out = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int cnt = 0;
			byte[] bytes = new byte[1024];

			while ((cnt = fis.read(bytes)) != -1) {
				out.write(bytes, 0, cnt);
			}

			fis.close();
			out.close();
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException 발생");
		}

	}



	/*
	 *
	 *
	 *
	 *
	 *
	*/




	/* 글등록 데이터 저장*/
	@RequestMapping(value = "/userboardWriteSave.do")
	public void userboardWriteSave(boardVO vo, HttpServletResponse response)throws Exception {
		System.out.println("저장 들어옴 ================  ");
		System.out.println("데이터 === >"+vo.toString());

		/* 등록 날짜 세팅 */
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegDate(date);

		String result = boardService.Insertboard(vo);
		if (result == "1") {
			System.out.println("등록 완료");
		} else {
			System.out.println("등록실패");
		}
	}

	/* 사용자 글 리스트 */
	@RequestMapping(value = "/userBoardList.do")
	public String userboardinsert(boardVO vo, ModelMap model) throws Exception {
	/*	System.out.println("정렬기준" + vo.getSortGubun());
		System.out.println("검색 내용" + vo.getSearchText());*/

		List<?> list = boardService.SelectBoardList(vo);
		/*System.out.println("리스트 ==== " + list);*/
		model.addAttribute("resultList", list);

		System.out.println(list);
		return "userBoard/userBoardList";

	}

	/* 게시글 상세보기 */
	@RequestMapping(value = "/userboardDet.do")
	public void userboardDet(@RequestParam("boardid") int boardid, @RequestParam("viewcnt") int viewcnt, boardVO d_vo, HttpServletResponse response)throws Exception {
		/* 한글 인코딩 설정 */
		response.setCharacterEncoding("utf-8");
		String personJson ;

		System.out.println("보드아이디 입니다."+boardid);
		System.out.println("조회수 입니다."+viewcnt);

		viewcnt += 1;
		d_vo.setViewCnt(viewcnt);
		d_vo.setBoardID(boardid);
		int data = boardService.updateViewCnt(d_vo);
		if (data == 1) {
			System.out.println("조회수 증가 완료");
		}else {
				System.out.println("조회수 증가 실패");
		}

		boardVO vo = boardService.seleteBoardData(boardid);
		System.out.println("들어오 데이터 : "+vo.toString());

		personJson = "{\"boardid\":\"" + vo.getBoardID() + "\",\"userID\":\"" + vo.getUserID() +"\",\"content\":\"" + vo.getContent() + "\",\"title\":\"" + vo.getTitle() + "\",\"b_file\":\"" + vo.getB_file()+ "\",\"password\":\"\"}";

		try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* 게시글 수정 */
	@RequestMapping(value = "/userboardMod.do")
	public void userboardMod(@RequestParam("boardid") int boardid, boardVO d_vo, HttpServletResponse response)throws Exception {
		/* 한글 인코딩 설정 */
		response.setCharacterEncoding("utf-8");
		String personJson ;

		System.out.println("보드아이디 입니다."+boardid);

		boardVO vo = boardService.seleteBoardData(boardid);
		System.out.println("들어오 데이터 : "+vo.toString());

		personJson = "{\"boardid\":\"" + vo.getBoardID() + "\",\"userID\":\"" + vo.getUserID() +"\",\"content\":\"" + vo.getContent() + "\",\"title\":\"" + vo.getTitle() + "\",\"b_file\":\"" + vo.getB_file()+ "\",\"password\":\"\"}";

		try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* 게시글 수정 저장*/
	@RequestMapping(value = "/userboardModsave.do")
	public void userboardMod(boardVO vo, HttpServletResponse response)throws Exception {
		System.out.println("수정 저장 들어옴 ");
		System.out.println(vo.toString());
		int result = boardService.updateboard(vo);
		if (result == 1) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}

		System.out.println(result);
	}





/*
 *
 *
 *
 *
 *
*/

	@RequestMapping(value = "/cardBoardList.do")
	public String cardBoardList(boardVO vo, ModelMap model)throws Exception {

		/* 페이징 처리를 위해 토탈 갯수 얻어오기 */
		int total = boardService.selectTotal(vo);

		int totalPage = (int) Math.ceil((double)total/10);
		int viewPage = vo.getViewPage();

		System.out.println("검색 내용" + vo.getSearchText());


		int startIndex = (viewPage-1)*9+1;
		int endIndex = startIndex + (9-1);

		if(viewPage > totalPage || viewPage <1) {
			viewPage = 1;
		}

		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);

		List<?> list = boardService.SelectBoardList2(vo);
		model.addAttribute("resultList", list);
		model.addAttribute("tota", total);
		model.addAttribute("totalPage", totalPage);

		return "userBoard/cardBoardList";
	}

}
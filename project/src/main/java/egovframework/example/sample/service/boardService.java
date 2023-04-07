package egovframework.example.sample.service;

import java.util.List;

public interface boardService {
	/* 게시글 등록 */
	public String Insertboard(boardVO vo) throws Exception;

	/* 게시판 리스트 */
	public List<?> SelectBoardList(boardVO vo) throws Exception;

	/* 게시글 상세보기 */
	public boardVO seleteBoardData(int boardID) throws Exception;

	/* 게시글 삭제 */
	public int deleteBoard(int boardID) throws Exception;

	/* 조회수 증가 */
	public int updateViewCnt(boardVO d_vo);

	public int updateboard(boardVO vo);
}

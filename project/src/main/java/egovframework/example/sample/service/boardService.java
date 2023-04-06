package egovframework.example.sample.service;

public interface boardService {
	/* 게시글 등록 */
	public String Insertboard(boardVO vo) throws Exception;

	/* 테이블 행 갯수 구하기 */
	public int selectColumn() throws Exception;
}

package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.boardService;
import egovframework.example.sample.service.boardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class boardServiceImpl extends EgovAbstractServiceImpl implements boardService{
	@Resource(name="boardDAO")
	private boardDAO boardDAO;

	/* 게시글 등록 */
	@Override
	public String Insertboard(boardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.insertboard(vo);
	}

	/* 게시판 리스트 */
	@Override
	public List<?> SelectBoardList(boardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectList(vo);
	}

	/* 게시글 상세보기 */
	@Override
	public boardVO seleteBoardData(int boardID) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.seleteBoardData(boardID);
	}
	/* 게시글 삭제 */
	@Override
	public int deleteBoard(int boardID) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(boardID);
	}



	/* 조회수 증가 */
	@Override
	public int updateViewCnt(boardVO d_vo) {
		// TODO Auto-generated method stub
		return boardDAO.updateViewCnt(d_vo);
	}

}

package egovframework.example.sample.service.impl;

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

	/* 게시글 개수 확인 */
	@Override
	public int selectColumn() throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectColumn();
	}
}

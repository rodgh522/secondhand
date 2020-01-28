package org.kh.test.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.kh.test.board.model.vo.AdminQ;
import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.Comment;
import org.kh.test.board.model.vo.Options;
import org.kh.test.board.model.vo.Qna;
import org.kh.test.board.model.vo.Search;
import org.kh.test.board.model.vo.SearchOption;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	public int insert(SqlSessionTemplate session, Board board) {

		return session.insert("board.insertBoard", board);
	}

	public int insertOptions(SqlSessionTemplate session, Board board) {

		return session.insert("board.insertOptions", board);
	}

	public int insertPhotos(SqlSessionTemplate session, Board board) {

		return session.insert("board.insertPhotos", board);
	}

	public ArrayList<Board> searchList(SqlSessionTemplate session, Board board) {

		List<Board> list = session.selectList("board.searchList", board);
		return (ArrayList<Board>) list;
	}

	public List<String> searchPhoto(SqlSessionTemplate session, int boardNo) {

		List list = session.selectList("board.searchPhoto", boardNo);
		return list;
	}

	public ArrayList<Options> searchOption(SqlSessionTemplate session, int boardNo) {

		List list = session.selectList("board.searchOption", boardNo);
		return (ArrayList<Options>) list;
	}

	public ArrayList<Board> searching(SqlSessionTemplate session, SearchOption search) {

		if (search.getMin() != "" && search.getMin() != null) {
			search.setMinP(Integer.parseInt(search.getMin()));
		}
		if (search.getMax() != "" && search.getMax() != null) {
			search.setMaxP(Integer.parseInt(search.getMax()));
		}
		List list = session.selectList("board.searching", search);
		return (ArrayList<Board>) list;
	}

	public int totalBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.totalcount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate session, int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Qna> list = session.selectList("board.qnaList", map);

		return (ArrayList<Qna>) list;
	}

	public Qna qnaOne(SqlSessionTemplate session, int qNo) {
		return session.selectOne("board.qnaOne", qNo);
	}

	public int qnaPassCheck(SqlSessionTemplate session, String qPw, int qNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qPw", qPw);
		map.put("qNo", String.valueOf(qNo));
		int result = session.selectOne("board.qnaPassCheck", map);
		return result;
	}

	public int insertQna(SqlSessionTemplate session, Qna q) {
		return session.insert("board.insertQna", q);
	}

	public int qnaUpdate(SqlSessionTemplate session, Qna q) {
		return session.update("board.qnaUpdate", q);
	}

	public int qnaDelete(SqlSessionTemplate session, int qNo) {
		return session.delete("board.qnaDelete", qNo);
	}

	public int answerup(SqlSessionTemplate session, Qna q) {
		return session.update("board.answerup", q);
	}

	public ArrayList<Qna> searchBoardList(SqlSessionTemplate session, Search search) {
		List list = session.selectList("board.searchBoardList", search);
		return (ArrayList<Qna>) list;
	}

	public int searchBoardCount(SqlSessionTemplate session, Search search) {
		return session.selectOne("board.searchBoardCnt", search);
	}

	public int adminQ(SqlSessionTemplate session, AdminQ a) {
		return session.insert("board.adminQ", a);
	}

	public ArrayList<AdminQ> adminList(SqlSessionTemplate session, AdminQ a) {
		List<AdminQ> list = session.selectList("board.adminList", a);
		return (ArrayList<AdminQ>) list;
	}

	public int adminDel(SqlSessionTemplate session, int adNo) {
		return session.delete("board.adminDel", adNo);
	}

	public int adminUp(SqlSessionTemplate session, AdminQ a) {
		return session.update("board.adminUp", a);
	}

	public ArrayList<Board> selectHistroy(SqlSessionTemplate session, Board board) {
		List list = session.selectList("board.selectHistory", board);
		return (ArrayList<Board>) list;
	}

	public List<String> selectFileHistory(SqlSessionTemplate session, String boardNo) {
		List list = session.selectList("board.selectHistoryFile", boardNo);
		return (ArrayList<String>) list;
	}

	public int insertheart(SqlSessionTemplate session, WishList wish) {
		int result = session.insert("board.insertheart", wish);
		return result;
	}

	public WishList selectHeart(SqlSessionTemplate session, String boardNo, String memberId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);

		WishList wish = session.selectOne("board.wishList", map);
		return wish;
	}

	public int deleteheart(SqlSessionTemplate session, WishList wish) {
		int result = session.delete("board.deleteheart", wish);
		return result;
	}

	public List<Integer> selectHeartList(SqlSessionTemplate session, String memberId) {
		List list = session.selectList("board.selectHeartList", memberId);
		return list;
	}

	public Board selectHeartBoardList(SqlSessionTemplate session, int boardNo) {
		Board board = session.selectOne("board.selectHeartBoardList", boardNo);
		return board;
	}

	public ArrayList<WishList> selectHeartli(SqlSessionTemplate session, String memberId) {
		List<WishList> wishlist = session.selectList("board.arrayWish", memberId);
		return (ArrayList<WishList>) wishlist;
	}

	public Board selectHeartList(SqlSessionTemplate session, WishList wish) {
		Board boardList = session.selectOne("board.heartList", wish);

		return boardList;
	}

	public List<String> selectHeartFile(SqlSessionTemplate session, int boardNo) {
		List heartFile = session.selectList("board.heartFileList", boardNo);
		return heartFile;
	}

	public Board selectBoardAjax(SqlSessionTemplate session, WishList wish) {
		Board board = session.selectOne("board.selectBoardAjax", wish);
		return board;
	}

	public int deleteBoardColumn(SqlSessionTemplate session, Board board) {

		return session.delete("board.deleteColumn", board);
	}

	public int deletePhotoColumn(SqlSessionTemplate session, Board board) {

		return session.delete("board.deletePhoto", board);
	}

	public int deleteOptionColumn(SqlSessionTemplate session, Board board) {

		return session.delete("board.deleteOption", board);
	}

	public int deleteBoard(SqlSessionTemplate session, Board board) {

		return session.delete("board.deleteBoard", board);
	}

	public int upReadCount(SqlSessionTemplate session, Board board) {

		return session.update("board.readcount", board);
	}

	public int updateMoney(SqlSessionTemplate session, Member mem) {

		return session.update("board.updateMoney", mem);
	}

	public Member selectOne(SqlSessionTemplate session, Member mem) {

		return session.selectOne("board.selectOne", mem);
	}
	

	public int insetComment(SqlSessionTemplate session, Comment comment) {
		int result = session.insert("board.insertComment" , comment);
		return result;
	}

	public ArrayList<Comment> selectCommentList(SqlSessionTemplate session, int boardNo) {
		List list = session.selectList("board.listComment" , boardNo);
		return (ArrayList<Comment>)list;
	}

	public int updateComment(SqlSessionTemplate session, Comment comment) {
		int result = session.update("board.updateComment" , comment);
		return result;
	}

	public int deleteComment(SqlSessionTemplate session, Comment comment) {
		int result = session.delete("board.delteComment" , comment);
		return result;
	}

	public int insertRecomment(SqlSessionTemplate session, Comment comment) {
		int result = session.insert("board.insertRecomment" , comment);
		return result;
	}


	public Comment selectRecomment(SqlSessionTemplate session, Comment comment) {
		Comment recomment = session.selectOne("board.selectRecomment" , comment);
		return recomment;
	}

	public Comment selectRecomment1(SqlSessionTemplate session, int commentNo) {
		Comment recomment = session.selectOne("board.selectRecomment1" , commentNo);
		return recomment;
	}

	public int deleteReComment(SqlSessionTemplate session, Comment recomment) {
		int result = session.update("board.delteRecomment" , recomment);
		return result;
	}

}

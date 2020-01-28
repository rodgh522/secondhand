package org.kh.test.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.test.board.model.dao.BoardDao;
import org.kh.test.board.model.vo.AdminQ;
import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.Comment;
import org.kh.test.board.model.vo.PageData;
import org.kh.test.board.model.vo.Qna;
import org.kh.test.board.model.vo.Search;
import org.kh.test.board.model.vo.SearchOption;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

	@Autowired
	BoardDao bDao;
	@Autowired
	SqlSessionTemplate session;

	public int insert(Board board) {

		int result = 0;
		result += bDao.insert(session, board);
		System.out.println("1. "+result);
		result += bDao.insertOptions(session, board);
		System.out.println("2. "+result);
		result += bDao.insertPhotos(session, board);
		System.out.println("3. "+result);

		return result;
	}

	public ArrayList<Board> searchList(Board board) {
		ArrayList<Board> list = bDao.searchList(session, board);
		for (Board b : list) {
			b.setFiles(bDao.searchPhoto(session, b.getBoardNo()));
			if (b.getFiles().size() == 0) {
				b.getFiles().add("nothing");
			}
			b.setOptions(bDao.searchOption(session, b.getBoardNo()));
		}
		return list;
	}

	public Board boardInfo(Board board) {

		ArrayList<Board> list = bDao.searchList(session, board);
		Board b = list.get(0);
		b.setReadCount(b.getReadCount() + 1);
		bDao.upReadCount(session, b);
		b.setFiles(bDao.searchPhoto(session, b.getBoardNo()));
		b.setOptions(bDao.searchOption(session, b.getBoardNo()));
		return b;
	}

	public ArrayList<Board> searching(SearchOption search) {

		ArrayList<Board> list = bDao.searching(session, search);
		for (Board b : list) {
			b.setFiles(bDao.searchPhoto(session, b.getBoardNo()));
			if (b.getFiles().size() == 0) {
				b.getFiles().add("nothing");
			}
			b.setOptions(bDao.searchOption(session, b.getBoardNo()));
		}
		return list;
	}

	public PageData selectQnaList(String currentPage) {

		int numPerPage = 10;
		int currentP = Integer.parseInt(currentPage);
		int start = (currentP - 1) * numPerPage + 1;
		int end = currentP * numPerPage;

		ArrayList<Qna> list = bDao.selectQnaList(session, start, end);

		int totalCount = bDao.totalBoardCount(session);

		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int pageNaviSize = 5;

		int startNavi = ((currentP - 1) / pageNaviSize) * pageNaviSize + 1;
		int endNavi = startNavi + pageNaviSize - 1;

		if (endNavi > totalPage) {
			endNavi = totalPage;
		}

		StringBuilder sb = new StringBuilder();

		if (startNavi != 1) {
			sb.append("<a href='/qnaList.do?currentPage=" + (startNavi - 1) + "' class='pagi'>[이전]</a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i != currentP) {
				sb.append("<a href='/qnaList.do?currentPage=" + i + "' class='pagi'>" + i + "</a>");
			} else {
				sb.append("<span class='pagi'>" + i + "</span>");
			}
		}
		if (endNavi != totalPage) {
			sb.append("<a href='/qnaList.do?currentPage=" + (endNavi + 1) + "' class='pagi'>[다음]</a>");
		}

		PageData bpd = new PageData(list, sb.toString());
		return bpd;
	}

	public Qna qnaOne(int qNo) {
		Qna qna = bDao.qnaOne(session, qNo);
		return qna;
	}

	public int qnaPassCheck(String qPw, int qNo) {
		int result = bDao.qnaPassCheck(session, qPw, qNo);
		return result;
	}

	public int insertQna(Qna q) {
		int result = bDao.insertQna(session, q);
		return result;
	}

	public int qnaUpdate(Qna q) {
		int result = bDao.qnaUpdate(session, q);
		return result;
	}

	public int qnaDelete(int qNo) {
		return bDao.qnaDelete(session, qNo);
	}

	public int answerup(Qna q) {
		int result = bDao.answerup(session, q);
		return result;
	}

	public PageData searchBoardList(int currentPage, Search search) {
		int numPerPage = 10;
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		search.setStart(start);
		search.setEnd(end);

		// 게시물 10개 조회
		ArrayList<Qna> list = bDao.searchBoardList(session, search);

		// 전체 게시물 수 조회
		// int totalCount = boardDao.totalBoardCount();
		int totalCount = bDao.searchBoardCount(session, search);

		// 전체 페이지 수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		// pageNavi 제작
		int pageNaviSize = 5;

		// currentPage = 1~5 --> 1 2 3 4 5
		// currentPage = 6~10 --> 6 7 8 9 10
		int startNavi = ((currentPage - 1) / pageNaviSize) * pageNaviSize + 1;
		int endNavi = startNavi + pageNaviSize - 1;
		if (endNavi > totalPage) {
			endNavi = totalPage;
		}

		StringBuilder sb = new StringBuilder();
		if (startNavi != 1) {
			sb.append("<a href='/searchBoard.do?currentPage=" + (startNavi - 1) + "&keyword=" + search.getKeyword()
					+ "&select=" + search.getSelect() + "'>[이전]</a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i != currentPage) {
				sb.append("<a href='/searchBoard.do?currentPage=" + i + "&keyword=" + search.getKeyword() + "&select="
						+ search.getSelect() + "'>" + i + "</a>");
			} else {
				sb.append("<span>" + i + "</span>");
			}
		}
		if (endNavi != totalPage) {
			sb.append("<a href='/searchBoard.do?currentPage=" + (endNavi + 1) + "&keyword=" + search.getKeyword()
					+ "&select=" + search.getSelect() + "'>[다음]</a>");
		}

		PageData pd = new PageData(list, sb.toString());

		return pd;
	}

	public int adminQ(AdminQ a) {
		int result = bDao.adminQ(session, a);
		return result;
	}

	public ArrayList<AdminQ> adminList(AdminQ a) {
		ArrayList<AdminQ> list = bDao.adminList(session, a);
		return list;
	}

	public int adminDel(int adNo) {
		return bDao.adminDel(session, adNo);
	}

	public int adminUp(AdminQ a) {
		int result = bDao.adminUp(session, a);
		return result;
	}

	public ArrayList<Board> selectHistory(Board board) {
		ArrayList<Board> list = bDao.selectHistroy(session, board);

				for (Board b : list) {
					b.setFiles(bDao.searchPhoto(session, b.getBoardNo()));
					if (b.getFiles().size() == 0) {
						b.getFiles().add("nothing");
					}
				}
		return list;
	}

	public int insertheart(WishList wish) {
		int result = bDao.insertheart(session, wish);
		return result;
	}

	public WishList selectHeart(String boardNo, String memberId) {
		WishList wish = bDao.selectHeart(session, boardNo, memberId);
		return wish;
	}

	public int deleteheart(WishList wish) {
		int result = bDao.deleteheart(session, wish);
		return result;
	}

	public List<Integer> selectHeartList(String memberId) {
		List<Integer> boardNoList = bDao.selectHeartList(session, memberId);
		return boardNoList;
	}

	public ArrayList<Board> selectHeartBoardList(List<Integer> boardNoList) {
		Board board = new Board();

		ArrayList<Board> selectHeartBoardList = new ArrayList<Board>();

		if (boardNoList.size() != 0) {
			for (int i = 0; i < boardNoList.size(); i++) {

				board = bDao.selectHeartBoardList(session, boardNoList.get(i));

				selectHeartBoardList.add(board);
			}
		}

		for (int i = 0; i < selectHeartBoardList.size(); i++) {
			if (selectHeartBoardList.size() != 0) {
				List<String> fileList = bDao.selectHeartFile(session, boardNoList.get(i));
				selectHeartBoardList.get(i).setFiles(fileList);
			}
		}

		return selectHeartBoardList;
	}

	public ArrayList<Board> selectHeartList(ArrayList<WishList> wishlist) {
		Board board = new Board();

		ArrayList<Board> boardList = new ArrayList<Board>();

		if (wishlist.size() != 0) {
			for (int i = 0; i < wishlist.size(); i++) {
				board = bDao.selectHeartList(session, wishlist.get(i));
				boardList.add(board);

			}

		}

		if (wishlist.size() != 0) {
			for (int i = 0; i < boardList.size(); i++) {
				List<String> fileList = bDao.selectHeartFile(session, (wishlist.get(i).getRegBoardNo()));
				boardList.get(i).setFiles(fileList);
			}
		}

		return boardList;
	}

	public ArrayList<WishList> selectHeartli(String memberId) {

		ArrayList<WishList> wishList = bDao.selectHeartli(session, memberId);

		return wishList;
	}

	public Board selectBoardAjax(WishList wish) {
		Board board = bDao.selectBoardAjax(session, wish);

		List<String> fileList = bDao.selectHeartFile(session, wish.getRegBoardNo());

		board.setFiles(fileList);

		return board;
	}

	public void update(Board board) {

		System.out.println(board.getRegDate());
		bDao.deleteBoardColumn(session, board);
		bDao.deletePhotoColumn(session, board);
		bDao.deleteOptionColumn(session, board);
		bDao.insert(session, board);
		bDao.insertOptions(session, board);
		bDao.insertPhotos(session, board);

	}

	public int deleteBoard(Board board) {

		return bDao.deleteBoard(session, board);
	}

	public int updateMoney(Member mem) {

		return bDao.updateMoney(session, mem);
	}

	public Member selectOne(Member mem) {

		return bDao.selectOne(session, mem);
	}

	public int insertComment(Comment comment) {
		int result = bDao.insetComment(session, comment);
		return result;
	}

	public ArrayList<Comment> selectCommentList(int boardNo) {
		ArrayList<Comment> list = bDao.selectCommentList(session, boardNo);
		return list;
	}

	public int updateComment(Comment comment) {
		int result = bDao.updateComment(session, comment);
		return result;
	}

	public int deleteComment(Comment comment) {
		int result = bDao.deleteComment(session, comment);
		return result;
	}

	public int insertRecomment(Comment comment) {
		int result = bDao.insertRecomment(session, comment);
		return result;
	}

	public Comment selectRecomment(Comment comment) {
		Comment recomment = bDao.selectRecomment(session, comment);
		return recomment;

	}

	public ArrayList<Comment> selectRecommentList(ArrayList<Comment> commentList) {
		ArrayList<Comment> recommentList = new ArrayList<>();

		if (commentList.size() > 0) {
			for (int i = 0; i < commentList.size(); i++) {
				Comment comment = new Comment();
				comment = bDao.selectRecomment1(session, commentList.get(i).getCommentNo());
				recommentList.add(comment);
			}
		}
		return recommentList;
	}

	public int deleteReComment(Comment recomment) {
		int result = bDao.deleteReComment(session, recomment);
		return result;
	}
}

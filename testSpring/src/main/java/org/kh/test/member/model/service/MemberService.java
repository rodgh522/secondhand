package org.kh.test.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.test.board.model.dao.BoardDao;
import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.model.dao.MemberDao;
import org.kh.test.member.model.vo.BuyPoint;
import org.kh.test.member.model.vo.Member;
import org.kh.test.member.model.vo.Message;
import org.kh.test.report.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDao mDao;
	@Autowired
	BoardDao bDao;
	@Autowired
	SqlSessionTemplate session;

	public int signIn(Member member) {

		return mDao.signIn(session, member);
	}

	public ArrayList<Member> allMember() {

		return mDao.allMember(session);
	}

	public ArrayList<Member> memberList() {
		return mDao.memberList(session);
	}

	public int memberDelete(String id) {
		return mDao.memberDelete(session, id);
	}

	/* JungWonho */

	public int updateMember(Member member) {

		return mDao.updateMember(session, member);
	}

	public Member selectOne(Member member) {

		return mDao.selectOne(session, member);
	}

	public int buyPoint(BuyPoint bp) {

		return mDao.buyPoint(session, bp);
	}

	public ArrayList<Board> myBoardList(Member member) {

		ArrayList<Board> list = mDao.myBoardList(session, member);
		for (Board b : list) {
			b.setFiles(bDao.searchPhoto(session, b.getBoardNo()));
			if (b.getFiles().size() == 0) {
				b.getFiles().add("nothing");
			}
			b.setOptions(bDao.searchOption(session, b.getBoardNo()));
		}
		return list;
	}

	public ArrayList<Report> myReport(Member member) {

		return mDao.myReport(session, member);
	}

	public int deleteMyReport(Report report) {

		return mDao.deleteMyReport(session, report);
	}

	public ArrayList<WishList> selectMyWishList(Member member) {

		return mDao.selectMyWishList(session, member);
	}

	public ArrayList<Board> selectMyBoardWishList(ArrayList<WishList> wishlist) {
		Board board = new Board();
		ArrayList<Board> boardList = new ArrayList<Board>();

		if (wishlist.size() != 0) {
			for (int i = 0; i < wishlist.size(); i++) {
				System.out.println("쪼개버리기" + wishlist.get(i).getRegBoardNo());
				board = mDao.selectMyBoardWishList(session, wishlist.get(i).getRegBoardNo());
				List<String> fileList = mDao.selectHeartFile(session, wishlist.get(i).getRegBoardNo());
				System.out.println(fileList);
				if (!fileList.isEmpty()) {
					board.setFiles(fileList);

				}

				boardList.add(board);
			}
		}

		/*
		 * if(wishlist.size() != 0) { for(int i = 0 ; i < boardList.size() ; i ++) {
		 * List<String> fileList = mDao.selectHeartFile(session ,
		 * (wishlist.get(i).getRegBoardNo()));
		 * System.out.println("사진이름:"+fileList.get(0));
		 * boardList.get(i).setFiles(fileList); } }
		 */

		return boardList;
	}

	public int sendMessage(Message message) {

		return mDao.sendMessage(session, message);
	}

	public ArrayList<Message> newMessage(Member member) {

		return mDao.newMessage(session, member);
	}

	public ArrayList<Message> endMessage(Member member) {

		return mDao.endMessage(session, member);
	}

	public int totalCount(Member member) {

		return mDao.totalCount(session, member);
	}

	public int newCount(Member member) {

		return mDao.newCount(session, member);
	}

	public int oldCount(Member member) {

		return mDao.oldCount(session, member);
	}

	public int sendCount(Member member) {

		return mDao.sendCount(session, member);
	}

	public int msDelete(int messageNo) {

		return mDao.msDelete(session, messageNo);
	}

	public Message msRead(int messageNo) {

		return mDao.msRead(session, messageNo);
	}

	public int updateRead(int messageNo) {

		return mDao.updateRead(session, messageNo);
	}

	public int emailCheck(String memberId) {

		return mDao.emailCheck(session, memberId);
	}

	public int firstMessage(Member member) {

		return mDao.firstMessage(session, member);
	}

}

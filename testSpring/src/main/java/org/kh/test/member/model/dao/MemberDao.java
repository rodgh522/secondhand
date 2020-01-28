package org.kh.test.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.model.vo.BuyPoint;
import org.kh.test.member.model.vo.Member;
import org.kh.test.member.model.vo.Message;
import org.kh.test.report.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	public int signIn(SqlSessionTemplate session, Member member) {

		return session.insert("member.insertMember", member);
	}

	public ArrayList<Member> allMember(SqlSessionTemplate session) {

		List list = session.selectList("member.allMember");
		return (ArrayList<Member>) list;
	}

	public ArrayList<Member> memberList(SqlSessionTemplate session) {
		List mlist = session.selectList("member.memberList");
		return (ArrayList<Member>) mlist;
	}

	public int memberDelete(SqlSessionTemplate session, String id) {
		System.out.println("아이디값:" + id);
		int result = session.delete("member.memberDelete", id);
		return result;
	}

	/* JungWonho */

	public int updateMember(SqlSessionTemplate session, Member member) {

		return session.update("member.updateMember", member);
	}

	public Member selectOne(SqlSessionTemplate session, Member member) {

		return session.selectOne("member.selectOne", member);
	}

	public int buyPoint(SqlSessionTemplate session, BuyPoint bp) {

		return session.update("member.updatePoint", bp);
	}

	public ArrayList<Board> myBoardList(SqlSessionTemplate session, Member member) {

		List list = session.selectList("member.myBoardList", member);
		return (ArrayList<Board>) list;
	}

	public ArrayList<Report> myReport(SqlSessionTemplate session, Member member) {

		List list = session.selectList("member.myReportList", member);
		return (ArrayList<Report>) list;
	}

	public int deleteMyReport(SqlSessionTemplate session, Report report) {

		return session.delete("member.deleteMyReport", report);
	}

	public ArrayList<WishList> selectMyWishList(SqlSessionTemplate session, Member member) {
		List list = session.selectList("member.selectMyWishList", member);
		return (ArrayList<WishList>) list;
	}

	public Board selectMyBoardWishList(SqlSessionTemplate session, int regBoardNo) {
		Board board = session.selectOne("member.selectMyBoardWishList", regBoardNo);
		return board;
	}

	public List<String> selectHeartFile(SqlSessionTemplate session, int boardNo) {
		List heartFile = session.selectList("member.heartFileList", boardNo);
		return heartFile;
	}

	public int sendMessage(SqlSessionTemplate session, Message message) {

		return session.insert("member.sendMessage", message);
	}

	public ArrayList<Message> newMessage(SqlSessionTemplate session, Member member) {
		List msList = session.selectList("member.newMessage", member);
		return (ArrayList<Message>) msList;
	}

	public ArrayList<Message> endMessage(SqlSessionTemplate session, Member member) {
		List msList = session.selectList("member.endMessage", member);
		return (ArrayList<Message>) msList;
	}

	public int totalCount(SqlSessionTemplate session, Member member) {

		return session.selectOne("member.totalCount", member);
	}

	public int newCount(SqlSessionTemplate session, Member member) {

		return session.selectOne("member.newCount", member);
	}

	public int oldCount(SqlSessionTemplate session, Member member) {

		return session.selectOne("member.oldCount", member);
	}

	public int sendCount(SqlSessionTemplate session, Member member) {

		return session.selectOne("member.sendCount", member);
	}

	public int msDelete(SqlSessionTemplate session, int messageNo) {

		return session.delete("member.msDelete", messageNo);
	}

	public Message msRead(SqlSessionTemplate session, int messageNo) {

		return session.selectOne("member.msRead", messageNo);
	}

	public int updateRead(SqlSessionTemplate session, int messageNo) {

		return session.update("member.updateRead", messageNo);
	}

	public int emailCheck(SqlSessionTemplate session, String memberId) {
		int result = session.selectOne("member.emailCheck", memberId);
		return result;
	}

	public int firstMessage(SqlSessionTemplate session, Member member) {

		return session.insert("member.firstMessage", member);
	}

}

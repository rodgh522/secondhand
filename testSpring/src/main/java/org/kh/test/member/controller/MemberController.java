package org.kh.test.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.controller.NaverLoginBO;
import org.kh.test.member.model.service.MemberService;
import org.kh.test.member.model.vo.BuyPoint;
import org.kh.test.member.model.vo.Member;
import org.kh.test.member.model.vo.Message;
import org.kh.test.report.model.vo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	MemberService mService;

	@Autowired
	NaverLoginBO naverLoginBO;

	@Inject
	JavaMailSender mailSender;

	@RequestMapping("/goLogin.do")
	public String goLogin(Model model, HttpSession session, Board board) {
		// 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		// 생성한 인증 URL을 View로 전달

		return "loginPage";
	}

	@RequestMapping("/signIn.do")
	public String signIn(Member member, Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		ArrayList<Member> list = mService.allMember();
		for (Member m : list) {
			if (m.getMemberId().equals(member.getMemberId())) {
				model.addAttribute("exist", 1);
				return "loginPage";
			}
		}
		model.addAttribute("url", naverAuthUrl);
		int result = mService.signIn(member);
		if(result > 0) {
			mService.firstMessage(member);
		}
		
		return "loginPage";
	}

	@RequestMapping("/login.do")
	public String logIn(HttpServletRequest request, Member member, Model model, Board board) {

		ArrayList<Member> list = mService.allMember();
		int i = 0;
		for (Member m : list) {
			if (member.getMemberId() == null) {
				if (m.getPhone().equals(member.getPhone()) && m.getMemberName().equals(member.getMemberName())) {
					model.addAttribute("id", m);
					return "email2";
				} else if (i + 1 == list.size()) {
					model.addAttribute("exist", 3);
					return "loginPage";
				}
				i++;
			} else if (member.getMemberId().equals(m.getMemberId()) && member.getMemberPw().equals(m.getMemberPw())) {
				HttpSession session = request.getSession(false);
				session.setAttribute("member", m);
				if(board != null) {
					session.setAttribute("lastPage", "1");
				}
				return "redirect:/";
			}
		}
		model.addAttribute("exist", 2);
		return "loginPage";
	}

	@RequestMapping("/idCheck.do")
	@ResponseBody
	public boolean idCheck(String email) {

		ArrayList<Member> list = mService.allMember();
		for (Member m : list) {
			if (m.getMemberId().equals(email)) {
				return true;
			}
		}
		return false;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("member");
		return "redirect:/";
	}

	@RequestMapping("/send.do")
	public ModelAndView sendMail(HttpServletRequest request, String e_mail, HttpServletResponse response)
			throws IOException {
		Random r = new Random();
		int dice = r.nextInt(8587451) + 54321;

		String setfrom = "SupplyJung9987@gamil.com";
		String tomail = request.getParameter("e_mail");
		String title = "비밀번호 찾기 이메일 인증 입니다.";
		String content = " 인증번호는 " + dice + " 입니다. ";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("dice", dice);
		mv.addObject("email", e_mail);
		mv.setViewName("/email2");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out.flush();

		return mv;
	}

	@RequestMapping("/getpassword.do")
	@ResponseBody
	public String getPw(String email) {

		ArrayList<Member> list = mService.allMember();
		for (Member m : list) {
			if (m.getMemberId().equals(email)) {
				return m.getMemberPw();
			}
		}
		return null;
	}

	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		List<Member> mlist = mService.memberList();
		model.addAttribute("mlist", mlist);
		return "adminPageList";
	}

	@RequestMapping("/memberDelete.do")
	public String memberDelete(@RequestParam("id") String id) {
		int result = mService.memberDelete(id);
		if (result > 0) {
			return "adminPageList";
		}
		return "error";
	}

	@RequestMapping("/adminPage.do")
	public String adminPage() {
		/*
		 * adminPage(여기에 모델 추가해서) 모델로 객체들 가져오기! ArrayList<Report> reportList=
		 * rService.selectReportList(); List<Member>memberList = mService.memberList();
		 * model.addAttribute("rList",reportList);
		 * model.addAttribute("mList",memberList);
		 */
		return "adminPage";
	}

	/* JungWonho */

	@RequestMapping("/myInfo.do")
	public String myInfoPage() {
		return "member/myInfo";
	}

	@RequestMapping(value = "/updateMember.do")
	public String updateMember(Member m, HttpSession session) {

		int result = mService.updateMember(m);

		if (result > 0) {

			Member memOne = mService.selectOne(m);

			session.setAttribute("member", memOne);

			return "member/myInfo";
		} else {
			return "redirect: /";
		}
	}

	@RequestMapping(value = "/payment.do")
	public String paymentPage() {
		return "member/payment";
	}

	@ResponseBody
	@RequestMapping("/buyPoint.do")
	public int buyPoint(HttpSession session, BuyPoint bp) {

		int sData = bp.getMileage() + bp.getmData();
		bp.setSubData(sData);

		int result = mService.buyPoint(bp);
		Member m = new Member();
		m.setMemberId(bp.getMemberId());

		if (result > 0) {
			Member memOne = mService.selectOne(m);
			session.setAttribute("member", memOne);

		} 

		return bp.getSubData();
	}

	@RequestMapping("/myBoard.do")
	public String myBoardPage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		ArrayList<Board> blist = mService.myBoardList(member);
		ArrayList<Report> rlist = mService.myReport(member);

		model.addAttribute("myBoard", blist);
		model.addAttribute("myReport", rlist);
		return "member/myBoard";
	}

	@RequestMapping("/deleteMyReport.do")
	public String deleteMyReport(Report report) {

		int result = mService.deleteMyReport(report);

		return "redirect:/myBoard.do";
	}

	@RequestMapping("/myMessage.do")
	public String myMessagePage() {
		return "member/myMessage";
	}

	@RequestMapping("/myWishList.do")
	public String myWishListPage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		ArrayList<WishList> wishlist = mService.selectMyWishList(member);

		if (!wishlist.isEmpty()) {
			ArrayList<Board> myWishBoardList = mService.selectMyBoardWishList(wishlist);

			if (!myWishBoardList.isEmpty()) {
				model.addAttribute("myWishBoardList", myWishBoardList);

				/*
				 * for(Board b : myWishBoardList) { System.out.println("foreachNo : "
				 * +b.getBoardNo()); System.out.println("foreachId : " +b.getContent()); }
				 */

			} 

		}

		return "member/myWishList";
	}

	/* 쪽지 기능(후..웹소켓은 쓰다 암걸릴뻔해서 샷건때리고 다시합니다..) */
	@ResponseBody
	@RequestMapping("/sendMessage.do")
	public int sendMessage(Message message) {
		int result = mService.sendMessage(message);

		return result;
	}

	@ResponseBody
	@RequestMapping("/countMessage.do")
	public int[] countMessage(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		int[] count = new int[4];

		int totalCount = mService.totalCount(member);
		int newCount = mService.newCount(member);
		int oldCount = mService.oldCount(member);
		int sendCount = mService.sendCount(member);


		count[0] = totalCount;
		count[1] = newCount;
		count[2] = oldCount;
		count[3] = sendCount;

		return count;
	}

	@ResponseBody
	@RequestMapping("/newMessage.do")
	public ArrayList<Message> newMessage(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		ArrayList<Message> msList = mService.newMessage(member);

		return msList;
	}

	@ResponseBody
	@RequestMapping("/endMessage.do")
	public ArrayList<Message> endMessage(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		ArrayList<Message> msList = mService.endMessage(member);

		return msList;
	}

	@ResponseBody
	@RequestMapping("/msDelete.do")
	public int msDelete(int messageNo) {

		int result = mService.msDelete(messageNo);

		return result;
	}

	@ResponseBody
	@RequestMapping("/msRead.do")
	public Message msRead(int messageNo) {

		int result = mService.updateRead(messageNo);
		Message msRead = mService.msRead(messageNo);
		return msRead;
	}

}

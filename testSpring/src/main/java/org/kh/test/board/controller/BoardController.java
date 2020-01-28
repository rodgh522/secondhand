package org.kh.test.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.kh.test.board.model.vo.WishList;
import org.kh.test.member.model.vo.Member;
import org.kh.test.board.model.vo.Comment;
import org.kh.test.board.model.service.BoardService;
import org.kh.test.board.model.vo.AdminQ;
import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.Options;
import org.kh.test.board.model.vo.PageData;
import org.kh.test.board.model.vo.Qna;
import org.kh.test.board.model.vo.Search;
import org.kh.test.board.model.vo.SearchOption;
import org.kh.test.board.model.vo.UploadFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService bService;

	@RequestMapping(value = "/filepost.do", produces = "text/plain;charset=utf-8") // ajax에서 호출하는 부분
	@ResponseBody
	public ResponseEntity<String> upload(HttpServletRequest request, MultipartFile file) throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		return new ResponseEntity<String>(
				UploadFile.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping("/displayFile.do") // ajax >> 파일 미리보기 메소드
	public ResponseEntity<byte[]> displayFile(HttpServletRequest request, String filename) throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		InputStream is = null;
		ResponseEntity<byte[]> entity = null;
		try {
			HttpHeaders headers = new HttpHeaders();

			is = new FileInputStream(uploadPath + filename);

			filename = filename.substring(filename.indexOf("_") + 1);
			headers.add("Content-Disposition",
					"attachment; filename=" + new String(filename.getBytes("utf-8"), "iso-8859-1"));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);

		} catch (Exception e) {

			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			if (is != null)
				is.close();
		}

		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(HttpServletRequest request, String fileName) {
		logger.info("fileName:" + fileName);
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");

		String front = fileName.substring(0, 12);
		String end = fileName.substring(14);

		new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();

		// 썸네일 삭제
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		/* boardService.deleteFile(fileName); */

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@RequestMapping("/post.do")
	public String posting(HttpServletRequest request, Board board, Options option, String[] filename) {
		HttpSession session = request.getSession();
		board.setUserId(((Member) session.getAttribute("member")).getMemberId());

		board.setFiles(setPhotoName(filename));
		System.out.println(board.getBoardNo());
		board.setOptions(option.getList());

		bService.insert(board);

		/* 추가할 부분 ################################### */
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		int gradePay = Integer.parseInt(request.getParameter("gradePay"));
		int updateMoney = mileage - gradePay;
		Member mem = new Member();
		mem.setMemberId(((Member) session.getAttribute("member")).getMemberId());
		mem.setMileage(updateMoney);
		int result = bService.updateMoney(mem);

		if (result > 0) {
			Member memOne = bService.selectOne(mem);
			session.setAttribute("member", memOne);
		}

		return "redirect:/";
	}

	@RequestMapping("/goPosting.do")
	public String goPosting() {
		return "redirect:/p-post1.html";
	}

	@RequestMapping("/update.do")
	public String update(HttpServletRequest request, Board board, Options option, String[] filename) {
		HttpSession session = request.getSession();
		board.setUserId(((Member) session.getAttribute("member")).getMemberId());

		board.setFiles(setPhotoName(filename));
		board.setOptions(option.getList());
		
		System.out.println(board.getFiles().size());
		System.out.println(board.getOptions().size());
		bService.update(board);
		return "redirect:/";

	}

	public ArrayList<String> setPhotoName(String[] filename) {

		ArrayList<String> filelist = new ArrayList<String>();
		if (filename != null) {
			for (String name : filename) {
				String rename1 = name.substring(0, 12);
				String rename2 = name.substring(14, name.length());
				String rename = rename1 + rename2;
				filelist.add(rename);
			}
		}
		return filelist;
	}

	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(Board board) {

		bService.deleteBoard(board);

		return "redirect:/";
	}

	@RequestMapping("/goList.do")
	public String goList(Board board, Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		ArrayList<Board> list = bService.searchList(board);
		ArrayList<Board> listP = new ArrayList<Board>();
		ArrayList<Board> listT = new ArrayList<Board>();
		for (Board b : list) {
			if (b.getGrade().equals("t")) {
				listT.add(b);
				listP.add(b);
			} else if (b.getGrade().equals("p")) {
				listP.add(b);
			}

		}
		List<String> CookieList = new ArrayList<>();
		ArrayList<WishList> wishlist = bService.selectHeartli(memberId);
		ArrayList<Board> wishlistBoard = bService.selectHeartList(wishlist);
		Collections.reverse(list);
		Collections.reverse(listP);
		Collections.reverse(listT);
		model.addAttribute("listP", listP);
		model.addAttribute("listT", listT);
		model.addAttribute("list", list);
		if (board.getBoardNo() == 0) {
			return "searchList";

		} else if (board.getBoardNo() == 1) {
			return "index";

		} else {
			
			Board b = bService.boardInfo(board);
			System.out.println(b.getRegDate());
			ArrayList<Options> optionList = b.getOptions();
			Board bod = new Board();
			bod.setCategory(b.getCategory());
			bod.setCategoryM(b.getCategoryM());
			ArrayList<Board> boardList = bService.searchList(bod);
			String boardNoVal = null;

			List<String> thumbnailList = new ArrayList<>();

			if (b.getFiles().size() != 0 && !b.getFiles().get(0).equals("nothing")) {
				List<String> fileList = b.getFiles();
				for (String file : fileList) {
					String path = file.substring(0, 12);
					String Name = file.substring(12, file.length());

					String newFileName = path + "s_" + Name;

					thumbnailList.add(newFileName);
				}
			}

			/* 최근 본 글 쿠키 추가 */
			Cookie cookie = new Cookie("boardNo" + b.getBoardNo(), Integer.toString(b.getBoardNo()));

			cookie.setMaxAge(60 * 60 * 24);

			response.addCookie(cookie);

			Cookie[] boardNoList = request.getCookies();

			for (Cookie boardNo1 : boardNoList) {

				if (boardNo1.getName().substring(0, 7).equals("boardNo")) {
					boardNoVal = boardNo1.getValue();
					CookieList.add(boardNoVal);
				}

				b.setCookieList(CookieList);
			}

			ArrayList<Board> history = bService.selectHistory(b);

			Collections.reverse(history);

			WishList wish = bService.selectHeart(Integer.toString(b.getBoardNo()), memberId);

			if (history.size() != 0) {
				history.get(0).setWishList(wishlist);
			}
			b.setWishList(wishlist);

			ArrayList<Comment> commentList = bService.selectCommentList(board.getBoardNo());

			ArrayList<Comment> recommentList = bService.selectRecommentList(commentList);

			Comment recomment = new Comment();

			if (recommentList.size() == 1) {
				recomment = recommentList.get(0);
			}

			model.addAttribute("commentList", commentList);
			model.addAttribute("recommentList", recommentList);
			model.addAttribute("thumbnailList", thumbnailList);
			model.addAttribute("recomment", recomment);
			model.addAttribute("options", optionList);
			model.addAttribute("board", b);
			model.addAttribute("history", history);
			model.addAttribute("cookieList", CookieList);
			model.addAttribute("wish", wish);
			model.addAttribute("boardList", boardList);
			model.addAttribute("wishList", wishlistBoard);
			model.addAttribute("wishRealList", wishlist);

			return "boardInfo";
		}
	}

	@RequestMapping("/p-post2.do")
	public String goPrePost(HttpServletRequest request, String category, String categoryM, Model model) {

		HttpSession session = request.getSession();
		session.removeAttribute("board");
		model.addAttribute("category", category);
		model.addAttribute("categoryM", categoryM);
		return "posting";
	}

	@RequestMapping("/searching.do")
	public String searching(SearchOption search, Model model) {

		ArrayList<Board> list = bService.searching(search);
		ArrayList<Board> listP = new ArrayList<Board>();
		for (Board b : list) {
			if (b.getGrade().equals("p") || b.getGrade().equals("t")) {
				listP.add(b);
			}
		}
		Collections.reverse(list);
		Collections.reverse(listP);
		model.addAttribute("listP", listP);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "searchList";
	}

	@RequestMapping("/searchDetail.do")
	public String detail(SearchOption search, Options option, Model model) {

		ArrayList<Board> list = bService.searching(search);
		ArrayList<Board> listP = new ArrayList<Board>();
		for (Board b : list) {
			if (b.getGrade().equals("p") || b.getGrade().equals("t")) {
				listP.add(b);
			}
		}
		model.addAttribute("listP", listP);
		ArrayList<Board> result = new ArrayList<Board>();
		// 전체 게시물 forEach
		for (Board b : list) {
			// 개별 게시물의 카테고리가 null이면 건너뛰고
			if (b.getCategory() == null) {
				continue;
				// 검색조건중 카테고리가 null이면 전체 조회
			} else if (search.getCategory() == "") {
				result.add(b);
				// 검색 조건중 중분류가 있으면
			} else if (b.getCategoryM() != null && b.getCategoryM().equals(search.getCategoryM())) {
				if (optionCheck(b, search, option)) {
					result.add(b);
				}
				// 카테고리로 분류
			} else if (b.getCategory().equals(search.getCategory())) {
				if (optionCheck(b, search, option)) {
					result.add(b);
				}
			}

		}
		model.addAttribute("list", result);
		return "searchList";
	}

	public boolean optionCheck(Board board, SearchOption search, Options option) {
		// 개별 게시물의 Option리스트 forEach
		for (Options opt : option.getList()) {
			// 검색 조건의 option리스트 forEach
			for (Options op : board.getOptions()) {
				// 옵션 이름이 같고, 옵션값이 null이 아니면서 값도 서로 다르면 제외
				if (opt.getOptionName().equals(op.getOptionName())) {
					if (!opt.getOptionValue().equals("") && !opt.getOptionValue().equals(op.getOptionValue())) {
						return false;
					}
				}
			}
		}
		return true;
	}

	@RequestMapping("/qnaForm.do")
	public String qnaForm() {
		return "qnaForm";
	}

	@RequestMapping("/qnaListgo.do")
	public String qnaListgo() {
		return "qnaList";
	}

	@RequestMapping("/qnaList.do")
	public String selectQnaList(String currentPage, String qNo, Model model) {
		PageData bpd = bService.selectQnaList(currentPage);

		if (!bpd.getPageList().isEmpty()) {
			model.addAttribute("list", bpd.getPageList());
			model.addAttribute("pageNavi", bpd.getPageNavi());
			return "qnaList";
		}
		return "redirect:/";
	}

	@RequestMapping("/qnaOne.do")
	public String selectQnaOne(int qNo, Model model) {
		Qna qna = bService.qnaOne(qNo);

		if (qna != null) {
			model.addAttribute("q", qna);
			return "qnaOne";
		}
		return "redirect:/";
	}

	// 게시판 비밀번호 확인
	@RequestMapping(value = "/passCheck.do", produces = "text/html; charset=utf-8")
	public String boardPassCheck(String qPw, int qNo, Model model) {
		int result = bService.qnaPassCheck(qPw, qNo);

		if (result > 0) {
			// 해당 게시판으로 조회하는 메소드
			Qna qna = bService.qnaOne(qNo);
			if (qna != null) {
				model.addAttribute("q", qna);
				return "qnaOne";
			}
			return "redirect:/";

		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");

		}
		model.addAttribute("loc", "/qnaList.do?currentPage=1");
		return "msg";

	}

	@RequestMapping("/qna.do")
	public String qna() {
		return "qna";
	}

	@RequestMapping("/insertQna.do")
	public String insertQna(Qna q, Model model) {
		int result = bService.insertQna(q);
		if (result > 0) {
			model.addAttribute("msg", "글작성 완료");
		} else {
			model.addAttribute("msg", "글작성 실패");
		}
		model.addAttribute("loc", "/qnaList.do?currentPage=1");
		return "msg";
	}

	@RequestMapping("/qnaUpgo.do")
	public String qnaUpgo(int qNo, Model model) {
		Qna qna = bService.qnaOne(qNo);
		model.addAttribute("q", qna);
		return "qnaUpdate";
	}

	@RequestMapping("/qnaUpdate.do")
	public String qnaUpdate(Qna q, Model model) {
		int result = bService.qnaUpdate(q);
		if (result > 0) {
			model.addAttribute("msg", "수정성공");
			model.addAttribute("loc", "/qnaOne.do?qNo=" + q.getqNo());
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("loc", "/");
		}
		return "msg";
	}

	@RequestMapping("/qnaDelete.do")
	public String qnaDelete(Qna q, Model model) {
		int result = bService.qnaDelete(q.getqNo());
		if (result > 0) {
			model.addAttribute("msg", "삭제성공");
		} else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc", "/qnaList.do?currentPage=1");
		return "msg";
	}

	@RequestMapping("/answerup.do")
	public String answerup(Qna q, Model model) {
		int result = bService.answerup(q);
		if (result > 0) {
			model.addAttribute("msg", "글작성 완료");

		} else {
			model.addAttribute("msg", "글작성 실패");
		}
		model.addAttribute("loc", "/qnaList.do?currentPage=1");
		return "msg";
	}

	@RequestMapping("/searchBoard.do")
	public String searchBoard(int currentPage, Search search, Model model) {
		PageData pd = bService.searchBoardList(currentPage, search);

		if (!pd.getPageList().isEmpty()) {
			model.addAttribute("list", pd.getPageList());
			model.addAttribute("pageNavi", pd.getPageNavi());
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("keyword", search.getKeyword());
			return "qnaSearch";
		}
		return "qnaList";
	}

	@RequestMapping("/adminQ.do")
	public String adminQ(AdminQ a, Model model) {
		int result = bService.adminQ(a);
		if (result > 0) {
			model.addAttribute("msg", "글작성 완료");
		} else {
			model.addAttribute("msg", "글작성 실패");
		}
		model.addAttribute("loc", "/adminList.do");
		return "msg";
	}

	@RequestMapping("/adminList.do")
	public String adminList(AdminQ a, Model model) {
		ArrayList<AdminQ> list = bService.adminList(a);
		model.addAttribute("list", list);
		return "qnaForm";
	}

	@RequestMapping("/adminDel.do")
	public String adminDel(AdminQ a, Model model) {
		int result = bService.adminDel(a.getAdNo());
		if (result > 0) {
			model.addAttribute("msg", "삭제성공");
		} else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc", "/adminList.do");
		return "msg";
	}

	@RequestMapping("/adminUp.do")
	public String adminUp(AdminQ a, Model model) {
		int result = bService.adminUp(a);
		if (result > 0) {
			model.addAttribute("msg", "수정성공");
			model.addAttribute("loc", "adminList.do");
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("loc", "/");
		}
		return "msg";
	}

	@ResponseBody
	@RequestMapping("/insertheart.do")
	public int insertheart(int boardNo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = ((Member) session.getAttribute("member")).getMemberId();

		WishList wish = new WishList();

		wish.setRegBoardNo(boardNo);
		wish.setMemberId(memberId);

		int result = bService.insertheart(wish);
		return result;
	}

	@ResponseBody
	@RequestMapping("/deleteheart.do")
	public int deleteheart(int boardNo, String memberId) {

		WishList wish = new WishList();

		wish.setRegBoardNo(boardNo);
		wish.setMemberId(memberId);

		int result = bService.deleteheart(wish);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/selectHeart.do", produces = "application/json;charset=utf-8")
	public String selectHeart(int boardNo, HttpServletRequest request) {
		WishList wish = new WishList();
		HttpSession session = request.getSession();

		String memberId = (String) session.getAttribute("memberId");

		wish.setMemberId(memberId);
		wish.setRegBoardNo(boardNo);

		Board board = bService.selectBoardAjax(wish);

		return new Gson().toJson(board);
	}

	@RequestMapping("/goModify.do")
	public String modifyBoard(int boardNo, Model model) {

		Board b = new Board();
		List<String> optionValueList = new ArrayList<>();
		List<String> thumbnailList = new ArrayList<>();

		b.setBoardNo(boardNo);
		Board board = bService.boardInfo(b);

		for (String file : board.getFiles()) {

			String path = file.substring(0, 12);
			String thumbnail = file.substring(12, file.length());

			String thumbnailfile = (path + "s_" + thumbnail);

			thumbnailList.add(thumbnailfile);

		}

		model.addAttribute("board", board);
		model.addAttribute("category", board.getCategory());
		model.addAttribute("categoryM", board.getCategoryM());
		model.addAttribute("thumbnailList", thumbnailList);

		return "posting";
	}

	@RequestMapping("/insertComment.do")
	public String insertComment(int ratingScore, String inputTitle, String inputContent, int reviewBoardNo,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();

		Comment comment = new Comment();

		comment.setRegBoardNo(reviewBoardNo);
		comment.setScore(ratingScore);
		comment.setCommentTitle(inputTitle);
		comment.setCommentContent(inputContent);
		comment.setCommentId(memberId);

		int result = bService.insertComment(comment);

		if (result > 0) {
			model.addAttribute("comment", comment);
		}

		return "redirect:/goList.do?boardNo=" + reviewBoardNo;
	}

	@RequestMapping("/commentUpdate.do")
	public String updateComment(String inputTitle, String inputContent, int reviewBoardNo, int commentNo) {
		Comment comment = new Comment();

		comment.setCommentTitle(inputTitle);
		comment.setCommentContent(inputContent);
		comment.setCommentNo(commentNo);
		int result = bService.updateComment(comment);

		return "redirect:/goList.do?boardNo=" + reviewBoardNo;
	}

	@RequestMapping("/deleteComment.do")
	public String deleteComment(int reviewboardNo, int commentNo) {
		Comment comment = new Comment();

		comment.setCommentNo(commentNo);

		int result = bService.deleteComment(comment);

		return "redirect:/goList.do?boardNo=" + reviewboardNo;
	}

	@RequestMapping("/insertRecomment.do")
	public String insertRecomment(int reviewBoardNo, int commentNo1, String commentContent1, HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();

		Member member = (Member) session.getAttribute("member");
		Comment comment = new Comment();
		comment.setReCommentId(member.getMemberId());
		comment.setRegCommentNo(commentNo1);
		comment.setRecommentContent(commentContent1);
		comment.setRegBoardNo(reviewBoardNo);
		comment.setCommentNo(commentNo1);
		int result = bService.insertRecomment(comment);

		return "redirect:/goList.do?boardNo=" + reviewBoardNo;
	}

	@RequestMapping("/selectRecomment.do")
	public String selectRecommnet(int boardNo, int commentNo, Model model) {
		Comment comment = new Comment();
		comment.setCommentNo(commentNo);

		Comment recomment = bService.selectRecomment(comment);

		model.addAttribute("recomment", recomment);

		return "redirect:/goList.do?boardNo=" + boardNo;

	}

	@RequestMapping("/deleteRecomment.do")
	public String deleteRecomment(int reviewboardNo, int commentNo) {
		Comment Recomment = new Comment();

		Recomment.setCommentNo(commentNo);

		int result = bService.deleteReComment(Recomment);

		return "redirect:/goList.do?boardNo=" + reviewboardNo;
	}

}

package org.kh.test.report.controller;

import java.util.ArrayList;

import org.kh.test.report.model.service.ReportService;
import org.kh.test.report.model.vo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReportController {

	@Autowired
	ReportService rService;
	@RequestMapping("/report.do")
	public String reportBoard(Report report ,Model model) {
		int result = rService.reportBoard(report);
		if(result>0) {
			model.addAttribute("report", report);
		}else {
			model.addAttribute("msg", "실패");
		}
		//우선은 searchList로 보냈어용~
		return "redirect:/";
	}
	
	@RequestMapping("/selectReportList.do")
	//신고게시판 전체 샐랙
	public ModelAndView selectReportList(ModelAndView mav) {
		ArrayList<Report> rlist= rService.selectReportList();
		
			mav.addObject("rlist",rlist);
			mav.setViewName("adminPageReport");
		
		return mav;
	}
	@ResponseBody
	@RequestMapping("/reportComplete.do")
	//신고후 확인누르기(ongoing 값 1로)
	public int reportComplete(Report report, Model model, int complete) {
		int result = rService.reportComplete(complete);
		return result;
	}
	
	
	@RequestMapping("/delete.do")
	public String reportDelete(@RequestParam("no")int no) {
		int result=rService.reportDelete(no);
		if(result>0) {
			return "adminPageReport";
		}
		return "adminPageReport";
	}
}

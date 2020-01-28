package org.kh.test.report.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.test.board.model.vo.Board;
import org.kh.test.report.model.dao.ReportDao;
import org.kh.test.report.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReportService {
	
	@Autowired
	ReportDao rDao;
	@Autowired
	SqlSessionTemplate session;
	public int reportBoard(Report report) {
		return rDao.reportBoard(session, report);
	}
	
	public ArrayList<Report> selectReportList() {
		List list = rDao.selectReportList(session);
		return (ArrayList<Report>)list;
	}

	public int reportComplete(int complete) {
		return rDao.reportComplete(session, complete);
	}

	public int reportDelete(int no) {
		return rDao.reportDelete(session, no);
	}


	


}

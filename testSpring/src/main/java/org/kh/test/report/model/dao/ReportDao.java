package org.kh.test.report.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.kh.test.board.model.vo.Board;
import org.kh.test.board.model.vo.Options;
import org.kh.test.report.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class ReportDao {
	
	public int reportBoard(SqlSessionTemplate session, Report report) {
		return session.insert("report.insertReportBoard", report);
	}

	//신고리스트 전체 불러오기
	public List selectReportList(SqlSessionTemplate session) {
		Report report = null;
		List list = session.selectList("report.selectReportList");
		return (ArrayList<Report>)list; 
	}

	public int reportComplete(SqlSessionTemplate session, int complete) {
		return session.update("report.updateReportComplete", complete);
	}

	public int reportDelete(SqlSessionTemplate session, int no) {
		return session.delete("report.reportDelete", no);
	}

	
}

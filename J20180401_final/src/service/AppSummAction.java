package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SearchDAO;

public class AppSummAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docName = request.getParameter("docName");
		String deptNo = request.getParameter("deptNo");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String memNo = request.getParameter("memNo");
		
		SearchDAO searchDAO = SearchDAO.getInstance();
		
		String docNo;
		int result = 0;
		try {
			docNo = searchDAO.selectDocInfo(docName, deptNo);
			result = searchDAO.multAppChk(memNo, docNo, date, time);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("docName", docName);
		request.setAttribute("deptNo", deptNo);
		request.setAttribute("date", date);
		request.setAttribute("time", time);
		request.setAttribute("result", result);
		return "appSummary.jsp";
	}

}

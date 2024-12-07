package com.DFSolutions.report;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DFSolutions.dbhelper.DBConnector;
import com.DFSolutions.payment.Payment;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final String TABLE_NAME = "report";
	private static final String[] ColumnNames = { "reportid", "text", "description", "date", "type", "frequency" };
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirect = request.getParameter("redirect");
		switch (action) {
		case "create":
			createReport(request, response);
			break;
		case "update":
			updateReport(request, response);
			break;
		case "delete":
			deleteReport(request, response);
			break;
		}
		response.sendRedirect(redirect);
	}

	private static String[] getValues(HttpServletRequest request) {
		return new String[] { request.getParameter("reportid"), request.getParameter("text"),
                request.getParameter("description"), request.getParameter("date"), request.getParameter("type"),
                request.getParameter("frequency") };
	}
	
	private static void deleteReport(HttpServletRequest request, HttpServletResponse response) {
		DBConnector.delete(TABLE_NAME, "reportid", request.getParameter("reportid"));
	}

	private static void updateReport(HttpServletRequest request, HttpServletResponse response) {
		DBConnector.update(TABLE_NAME, ColumnNames, getValues(request));	
	}

	private static void createReport(HttpServletRequest request, HttpServletResponse response) {
		DBConnector.addwithoutfirst(TABLE_NAME, ColumnNames, getValues(request));
	}
	
    public static List<Report> getAllReports() {
        ResultSet rs = DBConnector.getAll(TABLE_NAME, ColumnNames);
        List<Report> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Report report = new Report(
                    rs.getInt("reportid"), 
                    rs.getString("text"), 
                    rs.getString("description"), 
                    rs.getString("date"), 
                    rs.getString("type"), 
                    rs.getString("frequency")
                );
                list.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Report getReport(String id) {
        ResultSet rs = DBConnector.get(TABLE_NAME, ColumnNames, "reportid", id);
        Report report = null;
        try {
            if (rs.next()) {
                report = new Report(
                    rs.getInt("reportid"), 
                    rs.getString("text"), 
                    rs.getString("description"), 
                    rs.getString("date"), 
                    rs.getString("type"), 
                    rs.getString("frequency")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return report;
    }

}

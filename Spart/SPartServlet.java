package com.DFSolutions.Spart;

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


@WebServlet("/PartServlet")
public class SPartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static String TableName = "parts";
	private static String[] columns = {"id", "name", "type", "price"};

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String redirect = request.getParameter("redirect");
        switch (action) {
		case "create":
			addPart(request);
			break;
		case "update":
			updatePart(request);
			break;
		case "delete":
			String id = request.getParameter("id");
			deletePart(id);
			break;
		case "deleteAll":
			deleteAllParts();
			break;
        }
        response.sendRedirect(redirect);
    }

    private static String[] getValues(HttpServletRequest request) {
    	return new String[] { request.getParameter("id"), request.getParameter("name"), 
    			request.getParameter("type"), request.getParameter("price")};
    }
    
    private static int addPart(HttpServletRequest request) {
		return DBConnector.addwithoutfirst(TableName, columns, getValues(request));
	}
	
	public static int updatePart(HttpServletRequest request) {
		return DBConnector.update(TableName, columns, getValues(request));
	}
	
	public static int deletePart(String id) {
        return DBConnector.delete(TableName, "id", id);    
    }
	
	public static int deleteAllParts() {
		return DBConnector.deleteAll(TableName);
	}
		
	public static List<SPart> getAllParts()  {
		ResultSet RS = DBConnector.getAll(TableName, columns);
		List<SPart> list = new ArrayList<>();
		
		try {
			while (RS.next()) {
			    SPart part = new SPart(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			    list.add(part);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static SPart getPart(String name) {
		ResultSet RS = DBConnector.get(TableName, columns, "name", name);
		SPart part = null;
		try {
			if (RS.next()) {
				part = new SPart(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return part;
	}
	
	public static SPart getPartbyid(String id) {
		ResultSet RS = DBConnector.get(TableName, columns, "id", id);
		SPart part = null;
		try {
			if (RS.next()) {
				part = new SPart(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return part;
	}
}

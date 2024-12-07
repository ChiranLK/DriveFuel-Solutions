package com.DFSolutions.fuel;

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


@WebServlet("/FuelServlet")
public class FuelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static String TableName = "fuel";
	private static String[] columns = {"id", "name", "type", "price"};
	private static String redirect  = "fuel.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String redirect = request.getParameter("redirect");
		switch (action) {
		case "create":
			addFuel(request);
			break;
		case "update":
			updateFuel(request);
			break;
		case "delete":
			deleteFuel(request);
			break;
		case "deleteAll":
			deleteAllFuel();
			break;
		}
        response.sendRedirect(redirect);
    }

    private static String[] getValues(HttpServletRequest request) {
    	return new String[] {request.getParameter("id") ,request.getParameter("name"), request.getParameter("type"), request.getParameter("price")};
    }
    
	private static int addFuel(HttpServletRequest request) {
		String[] values = getValues(request);
		return DBConnector.addwithoutfirst(TableName, columns, values);
	}
	
	public static int updateFuel(HttpServletRequest request) {
		String[] values = getValues(request);
		return DBConnector.update(TableName, columns, values);
	}
	
	public static int deleteFuel(HttpServletRequest request) {
        return DBConnector.delete(TableName, "id", request.getParameter("id"));    
    }
	
	public static int deleteAllFuel() {
		String TableName = "fuel";
		return DBConnector.deleteAll(TableName);
	}
		
	public static List<Fuel> getAllFuel()  {
		ResultSet RS = DBConnector.getAll(TableName, columns);
		List<Fuel> list = new ArrayList<>();
		
		try {
			while (RS.next()) {
			    Fuel fuel = new Fuel(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			    list.add(fuel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Fuel getFuel(String name) {
		ResultSet RS = DBConnector.get(TableName, columns, "name", name);
		Fuel fuel = null;
		try {
			if (RS.next()) {
				fuel = new Fuel(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fuel;
	}
	
	public static Fuel getFuelbyID(int id) {
		ResultSet RS = DBConnector.get(TableName, columns, "id", Integer.toString(id));
		Fuel fuel = null;
		try {
			if (RS.next()) {
				fuel = new Fuel(RS.getInt("id"), RS.getString("name"), RS.getString("type"), RS.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fuel;
	}
}

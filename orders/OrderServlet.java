package com.DFSolutions.orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.DFSolutions.dbhelper.DBConnector;


@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static String TableName = "project.order";
	private static String[] columns = {"id","email", "unitprice", "item", "quantity", "totalprice", "status",  "type"};
	private static String[] columnsUpdate = {"id", "quantity", "totalprice", "status"};
	private static String Redirect;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	Redirect = request.getParameter("redirect");
        String action = request.getParameter("action");
        
        switch (action) {
            case "create":
				addOder(request);
				break;
			case "update":
				updateOder(request);
				break;
			case "updateadmin":
				updateadmin(request);
                break;
			case "delete":
				deleteOder(request);
				break;
			case "deleteAll":
				deleteAllOders();
				break;
			case "redirectorder":
				request.getSession().setAttribute("spartname",request.getParameter("spartname"));
				System.out.println(request.getParameter("spartname"));
				Redirect = "spartOrder.jsp";
				break;
			case "redirectfuel":
				request.getSession().setAttribute("fuelname",request.getParameter("fuelname"));
				System.out.println(request.getParameter("fuelname"));
				Redirect = "fuelOrder.jsp";
				break;
        }
        response.sendRedirect(Redirect);
    }

	private void updateadmin(HttpServletRequest request) {
		DBConnector.update(TableName, columns , getValues(request));
	}

	private static String[] getValues(HttpServletRequest request) {
		return new String[] {request.getParameter("id"), request.getParameter("email"), request.getParameter("unitprice"), request.getParameter("item"), request.getParameter("quantity"), request.getParameter("totalprice"), request.getParameter("status"), request.getParameter("type") };
	}
	    
    private static int addOder(HttpServletRequest request) {
		return DBConnector.addwithoutfirst(TableName, columns, getValues(request));
	}
	
	public static int updateOder(HttpServletRequest request) {
		Double quantity = Double.parseDouble(request.getParameter("quantity"));
		Double unitprice = Double.parseDouble(request.getParameter("unitprice"));
		Double totalprice = quantity * unitprice;
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		String[] values = {String.valueOf(id), String.valueOf(quantity), String.valueOf(totalprice), status};
		return DBConnector.update(TableName, columnsUpdate, values);
	}
	
	
	
	public static int deleteOder(HttpServletRequest request) {
        return DBConnector.delete(TableName, "id", request.getParameter("id"));    
    }
	
	public static int deleteAllOders() {
		return DBConnector.deleteAll(TableName);
	}
		
	public static List<Order> getAllOders()  {
		ResultSet RS = DBConnector.getAll(TableName, columns);
		List<Order> list = new ArrayList<>();
		
		try {
			while (RS.next()) {
			    Order user = new Order(RS.getInt("id"), RS.getString("email"), RS.getString("unitprice"), 
			    		RS.getString("item"), RS.getString("quantity"), RS.getString("totalprice"), RS.getString("status"), RS.getString("type"));
			    list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Order> getOdersFilterbyEmail(String Email)  {
		ResultSet RS = DBConnector.getAll(TableName, columns);
		List<Order> list = new ArrayList<>();
		
		try {
			while (RS.next()) {
				if (RS.getString("email").toLowerCase().equals(Email.toLowerCase())) {
			    Order user = new Order(RS.getString("id"),RS.getString("email"), RS.getString("unitprice"), RS.getString("item"), RS.getString("quantity"), RS.getString("totalprice"), RS.getString("status"), RS.getString("type"));
			    list.add(user);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Order getOder(int id) {
		ResultSet RS = DBConnector.get(TableName, columns, "id", String.valueOf(id));
		Order user = null;
		try {
			if (RS.next()) {
				user = new Order(RS.getString("id"), RS.getString("email"), RS.getString("unitprice"), RS.getString("item"), RS.getString("quantity"), RS.getString("totalprice"), RS.getString("status"), RS.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public static Order getOder(String id) {
		ResultSet RS = DBConnector.get(TableName, columns, "id", id);
		Order user = null;
		try {
			if (RS.next()) {
				user = new Order(RS.getString("id"), RS.getString("email"), RS.getString("unitprice"), RS.getString("item"), RS.getString("quantity"), RS.getString("totalprice"), RS.getString("status"), RS.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public static Order getOderbyEmail(String email) {
		ResultSet RS = DBConnector.get(TableName, columns, "email", email);
		Order user = null;
		try {
			if (RS.next()) {
				user = new Order(RS.getString("id"), RS.getString("email"), RS.getString("unitprice"), RS.getString("item"), RS.getString("quantity"), RS.getString("totalprice"), RS.getString("status"), RS.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
}

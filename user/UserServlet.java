package com.DFSolutions.user;

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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static String TableName = "user";
	private static String[] columns = {"email", "fname", "lname","hash","type","mobile","address"};
	private static String[] columnsU = {"email", "fname", "lname","type","mobile","address"};
	private String redirect;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	redirect = request.getParameter("redirect");
        String action = request.getParameter("action");
        
		switch (action) {
			case "create":
				addUser(request);
				break;
			case "update":
				updateUser(request);
				break;
			case "delete":
				deleteUserbyemail(request.getParameter("email"));
				break;
			case "deleteAll":
				deleteAllUsers();
				break;
			case "login":
				login(request);
				break;
			case "logout":
				logout(request);
				break;
		}

        response.sendRedirect(redirect);
    }
    
    public void login(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = getUser(email);
		redirect = "index.jsp";
		if (user != null) {
			if (user.getHash().equals(password)) {
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("type", user.getType().toLowerCase());
			} else {
				redirect = "loginErr.jsp";
			}
		} else {
			redirect = "loginErr.jsp";
		}
	}
    
    public void logout(HttpServletRequest request) {
    	System.out.println(redirect);
    	request.getSession().removeAttribute("user");
    }

	private static String[] getValues(HttpServletRequest request) {
    	return new String[] { request.getParameter("email") , request.getParameter("fname") ,
    			request.getParameter("lname") , request.getParameter("hash") , request.getParameter("type") ,
    			request.getParameter("mobile") , request.getParameter("address")};
    }

	private static String[] getValuesU(HttpServletRequest request) {
    	return new String[] { request.getParameter("email") , request.getParameter("fname") ,
    			request.getParameter("lname") , request.getParameter("type") ,
    			request.getParameter("mobile") , request.getParameter("address")};
    }
	
	private static int addUser(HttpServletRequest request) {
		return DBConnector.add(TableName, columns, getValues(request));
	}
	
	public static int updateUser(HttpServletRequest request) {
		int buffer = 0;
		buffer = DBConnector.updateString(TableName, columnsU, getValuesU(request));
		String email = request.getParameter("email");
		
		User user = getUser(email);
		request.getSession().setAttribute("user", user);
		return buffer;
		
	}
	
	public static int deleteUser(int id) {
        return DBConnector.delete(TableName,"id", String.valueOf(id));    
    }
	
	public static int deleteUserbyemail(String email) {
        return DBConnector.delete(TableName,"email", email);    
    }
	
	public static int deleteAllUsers() {
		String TableName = "users";
		return DBConnector.deleteAll(TableName);
	}
		
	public static List<User> getAllUsers()  {
		ResultSet RS = DBConnector.getAll(TableName, columns);
		List<User> list = new ArrayList<>();
		
		try {
			while (RS.next()) {
			    User user = new User(RS.getString("email"), RS.getString("fname"),
			    		RS.getString("lname"), RS.getString("hash"), RS.getString("type"), RS.getString("mobile"), RS.getString("address"));
			    list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static User getUser(String email) {
		ResultSet RS = DBConnector.get(TableName, columns, "email", email);
		User user = null;
		try {
			if (RS.next()) {
				user = new User(RS.getString("email"), RS.getString("fname"),
			    		RS.getString("lname"), RS.getString("hash"), RS.getString("type"), RS.getString("mobile"), RS.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
}

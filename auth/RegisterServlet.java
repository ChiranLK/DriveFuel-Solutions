package com.DFSolutions.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.DFSolutions.dbhelper.DBConnector;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String TABLE_NAME = "user";
    private static final String[] COLUMNS = {"email", "fname", "lname", "hash", "type", "mobile", "address"};

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // Set response type to JSON

        int result = DBConnector.add(TABLE_NAME, COLUMNS, getValues(request));
        
        if (result > 0) {
        	response.sendRedirect("RegisterSuccess.jsp");
        } else {
        	response.sendRedirect("RegisterFailed.jsp");
        }
    }
    
    public String[] getValues(HttpServletRequest request) {
        return new String[] {
            request.getParameter("email"),
            request.getParameter("fname"),
            request.getParameter("lname"),
            request.getParameter("hash"),
            request.getParameter("type"),
            request.getParameter("mobile"),
            request.getParameter("address")
        };
    }
}

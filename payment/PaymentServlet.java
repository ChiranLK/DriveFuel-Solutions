package com.DFSolutions.payment;

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
import com.DFSolutions.orders.Order;
import com.DFSolutions.orders.OrderServlet;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String TABLE_NAME = "payment";
    private static final String[] COLUMNS = {"email", "amount", "status", "paymentmethod", "paymentdate"};
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String redirect = request.getParameter("redirect");

        if (action == null || redirect == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request parameters");
            return;
        }

        try {
            switch (action) {
                case "create":
                    addPayment(request);
                    break;
                case "update":
                    updatePayment(request);
                    break;
                case "delete":
                    deletePayment(request);
                    break;
				case "deleteAll":
					DBConnector.deleteAll(TABLE_NAME);
					break;
				case "createadmin":
					addPaymentadmin(request);
					break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
                    return;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging instead
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
            return;
        }

        response.sendRedirect(redirect);
    }

	private void addPaymentadmin(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	private static void addPayment(HttpServletRequest request) {
        deleteorders(request.getParameter("email"));
        DBConnector.add(TABLE_NAME, COLUMNS, getValues(request));
    }

    private static void deleteorders(String email) {
		List<Order> OrderList = OrderServlet.getAllOders();
		List<Order> UserOrderList = OrderServlet.getAllOders();
		DBConnector.delete("project.order", "email", email);
	}

	private static void updatePayment(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String[] values = {
            request.getParameter("email"), 
            request.getParameter("amount"), 
            request.getParameter("status"), 
            request.getParameter("paymentmethod"), 
            request.getParameter("paymentdate")
        };
        DBConnector.updateString(TABLE_NAME, COLUMNS, values);
    }

    private static void deletePayment(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        DBConnector.delete(TABLE_NAME, "id", String.valueOf(id));
    }

    private static String[] getValues(HttpServletRequest request) {
        return new String[] {
            request.getParameter("email"),
            request.getParameter("amount"),
            request.getParameter("status"),
            request.getParameter("paymentmethod"),
            request.getParameter("paymentdate")
        };
    }

    public static List<Payment> getAllPayments() {
        ResultSet rs = DBConnector.getAll(TABLE_NAME, COLUMNS);
        List<Payment> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Payment payment = new Payment(
                    rs.getInt("id"), 
                    rs.getString("email"), 
                    rs.getString("amount"), 
                    rs.getString("status"), 
                    rs.getString("paymentmethod"), 
                    rs.getString("paymentdate")
                );
                list.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Payment getPayment(int id) {
        ResultSet rs = DBConnector.get(TABLE_NAME, COLUMNS, "id", String.valueOf(id));
        Payment payment = null;
        try {
            if (rs.next()) {
                payment = new Payment(
                    rs.getInt("id"), 
                    rs.getString("email"), 
                    rs.getString("amount"), 
                    rs.getString("status"), 
                    rs.getString("paymentmethod"), 
                    rs.getString("paymentdate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }
}

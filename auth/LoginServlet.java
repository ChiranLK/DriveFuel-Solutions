package com.DFSolutions.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");    
		
        try {
            // JDBC connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            
            // Check user credentials
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE name = ? AND hash = ?");
            ps.setString(1, username);           
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	String type = rs.getString("type");
            	String N = rs.getString("name");
            	String H = rs.getString("hash");
            	System.out.println(type + "  " + username+ "  " + password);
            	System.out.println(N + "  " + H);
                // Create a session and set an attribute for the logged-in user
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("type", type);
                session.setMaxInactiveInterval(30*60);  // Session timeout set to 30 minutes

                // Redirect to a protected page after login (e.g., dashboard)
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().write("Invalid username or password");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstanceStrong();
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }

    // Hash password using SHA-256 with salt
    public static String hashPassword(String password, String salt) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(salt.getBytes()); // Add salt to the hash function
        byte[] hashedPassword = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashedPassword);
    }
}

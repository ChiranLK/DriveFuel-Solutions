package com.DFSolutions.dbhelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {
    // JDBC connection parameters
	static String jdbcUrl = "jdbc:mysql://localhost:3306/project"; 
	static String username = "root"; 
	static String password = "Tharu@2002"; 

    static Connection conn = null;
    static String message = "";
    static PreparedStatement pstmt = null;
    
    
	public static int add(String TableName, String[] columns, String[] values) {    	
        String command = "INSERT INTO " + TableName + " (";
        command += columns[0];   		
		for (int i = 1; i < columns.length; i++) {
			command += " ," + columns[i];
		}
		command += ") VALUES (\"";
		command += values[0];
		for (int i = 1; i < values.length; i++) {
			command += "\" ,\"" + values[i];
		}
		command += "\")";
		System.out.println(command);
		return DBConnector.ExecuteQuery(command);
	}
	
	public static int addwithoutfirst(String TableName, String[] columns, String[] values) {    	
        String command = "INSERT INTO " + TableName + " (";
        command += columns[1];   		
		for (int i = 2; i < columns.length; i++) {
			command += " ," + columns[i];
		}
		command += ") VALUES (\"";
		command += values[1];
		for (int i = 2; i < values.length; i++) {
			command += "\" ,\"" + values[i];
		}
		command += "\")";
		System.out.println(command);
		return DBConnector.ExecuteQuery(command);
	}
	
	public static int update(String TableName, String[] columns, String[] values) {
		String command = "update " + TableName + " set " + columns[1] + "=\"" + values[1] + "\"";
		for (int i = 2; i < columns.length; i++) {
			command += ", " + columns[i] + "=\"" + values[i] + "\"";
		}
		command += " where " + columns[0] + "=" + values[0];
		System.out.println(command);
		return DBConnector.ExecuteQuery(command);
	}
	
	public static int updateString(String TableName, String[] columns, String[] values) {
		String command = "update " + TableName + " set " + columns[1] + "=\"" + values[1] + "\"";
		for (int i = 2; i < columns.length; i++) {
			command += ", " + columns[i] + "=\"" + values[i] + "\"";
		}
		command += " where " + columns[0] + "=\"" + values[0] + "\"";
		System.out.println(command);
		return DBConnector.ExecuteQuery(command);
	}
	
	public static int delete(String TableName, String column, String value) {
        String command = "DELETE FROM "+ TableName +" where "+ column +" = \"" + value + "\"";
        System.out.println(command);
        return DBConnector.ExecuteQuery(command);
	}
	
	public static int deleteAll(String TableName) {
        String command = "DELETE FROM " + TableName;
        return DBConnector.ExecuteQuery(command);
	}
	
	public static ResultSet getAll(String TableName, String[] columns) {
        String command = "SELECT * FROM " + TableName;
		ResultSet RS =  DBConnector.ExecuteQueryRS(command);
		return RS;
	}
	
	public static ResultSet get(String TableName, String[] columns, String column, String value) {
        String command = "SELECT * FROM " + TableName + " WHERE "+ column +" = \"" + value + "\"";
        ResultSet RS =  DBConnector.ExecuteQueryRS(command);
        System.out.println(command);
        return RS;
    }
	
    public static ResultSet ExecuteQueryRS(String query) {
        ResultSet rs = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            if (conn != null) {
                // Prepare and execute the SQL query
                pstmt = conn.prepareStatement(query);
                rs = pstmt.executeQuery();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found!");
        } catch (SQLException e) {
            System.out.println("Connection Failed: " + e.getMessage());
        }
        // Do not close the connection here since we are returning the ResultSet
        return rs;
    }

    
	public static int ExecuteQuery(String query) {
		int rs = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, username, password);

			if (conn != null) {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeUpdate();
			}
		} catch (ClassNotFoundException e) {
			message = "<span class='error'>JDBC Driver not found!</span>";
		} catch (SQLException e) {
			message = "<span class='error'>Connection Failed: " + e.getMessage() + "</span>";
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					message += "<br><span class='error'>Failed to close connection: " + e.getMessage() + "</span>";
				}
			}
		}
		System.out.println(message);
		return rs;
	}
	
    public static String queryBuilder(String command, String[] columns, String[] values) {

    	StringBuilder columnsBuilder = new StringBuilder();
    	StringBuilder valuesBuilder = new StringBuilder();
    	
        // Build the columns part
        for (String col : columns) {
            columnsBuilder.append(col.trim()).append(","); // Trimming extra spaces
        }
        // Remove last comma from columns
        if (columnsBuilder.length() > 0) {
            columnsBuilder.setLength(columnsBuilder.length() - 1);
        }

        // Build the values part
        for (String val : values) {
            if (isNumeric(val.trim())) {
                valuesBuilder.append(val.trim()).append(",");
            } else {
                valuesBuilder.append("\"").append(val.trim()).append("\"").append(",");
            }
        }
        // Remove last comma from values
        if (valuesBuilder.length() > 0) {
            valuesBuilder.setLength(valuesBuilder.length() - 1);
        }

        // Construct the final query string
        return command + " (" + columnsBuilder + ") VALUES (" + valuesBuilder + ")";
    }

    // Helper method to check if a string is numeric
    private static boolean isNumeric(String str) {
        try {
            Double.parseDouble(str); // Using Double to handle both integers and decimal numbers
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public String connect() {
        try {
            // Load MySQL JDBC driver (optional in modern Java versions)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Attempt to establish a connection
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            if (conn != null) {
                message = "<span class='success'>Conn Ok</span>";
            }
        } catch (ClassNotFoundException e) {
            message = "<span class='error'>JDBC Driver not found!</span>";
        } catch (SQLException e) {
            message = "<span class='error'>Connection Failed: " + e.getMessage() + "</span>";
        } finally {
            // Close connection if it was opened
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    message += "<br><span class='error'>Failed to close connection: " + e.getMessage() + "</span>";
                }
            }
        }
        return message;
    }
}

package com.nsgacademy.crudmvc.utils;

import java.sql.*;

public class JDBCUtils {
    // Use environment variable if available, otherwise fallback to localhost
    private static final String JDBC_HOST = System.getenv("JDBC_HOST") != null ? System.getenv("JDBC_HOST") : "localhost";
    private static final String JDBC_URL = "jdbc:mysql://" + JDBC_HOST + ":3306/crud";
    private static final String JDBC_USERNAME = System.getenv("JDBC_USERNAME") != null ? System.getenv("JDBC_USERNAME") : "root";
    private static final String JDBC_PASSWORD = System.getenv("JDBC_PASSWORD") != null ? System.getenv("JDBC_PASSWORD") : "";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
    }

    public static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                System.err.println("SQL State: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = e.getCause();
                while (t != null) {
                    System.err.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

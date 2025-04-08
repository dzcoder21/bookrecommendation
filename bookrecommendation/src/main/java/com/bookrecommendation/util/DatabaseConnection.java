package com.bookrecommendation.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/bookdb";
        String dbUsername = "root";
        String dbPassword = " "; // Make sure no extra space here

        Class.forName(dbDriver);
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }
}
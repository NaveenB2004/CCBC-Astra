/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GravityExplore22;   

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Naveen Balasooriya
 */
public class DBConnection {
    
    public static Connection connect() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.10.100:3306/gravityexplore22", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
        }
        return conn;
    }
    
}

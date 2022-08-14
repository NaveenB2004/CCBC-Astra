/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GravityExplore22;   
// 0100110101100001011001000110010100100000011000100111100100100000010011100100111001000010001000000111011101101001011101000110100000100000010100110100000101000010
// 01000011011011110111000001111001011100100110100101100111011010000111010001110011001000000111010001101111001000000110111001100001011101100110010101100101011011100110001000110010001100000011000000110100

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
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/missionimpossible", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
        }
        return conn;
    }
    
}

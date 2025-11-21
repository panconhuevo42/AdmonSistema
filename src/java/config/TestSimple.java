/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.SQLException;

public class TestSimple {
    public static void main(String[] args) {
        System.out.println("🧪 PRUEBA SIMPLE DE CONEXIÓN 🧪\n");
        
        try {
            // Prueba directa
            Connection conn = DBConnection.getConnection();
            
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ ¡CONEXIÓN EXITOSA!");
                System.out.println("📊 Base de datos: " + conn.getMetaData().getDatabaseProductName());
                System.out.println("🚀 Versión: " + conn.getMetaData().getDatabaseProductVersion());
                System.out.println("👤 Usuario: " + conn.getMetaData().getUserName());
                
                conn.close();
            } else {
                System.out.println("❌ La conexión es nula o está cerrada");
            }
            
        } catch (SQLException e) {
            System.out.println("❌ ERROR: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

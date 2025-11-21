/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestCRUD {
    public static void main(String[] args) {
        System.out.println("🧪 PROBANDO OPERACIONES CRUD 🧪\n");
        
        testInsercionUsuario();
        testConsultaAlimentos();
        testRegistroConsumo();
    }
    
    public static void testInsercionUsuario() {
        System.out.println("1. 👤 PROBANDO INSERCIÓN DE USUARIO...");
        
        String sql = "INSERT INTO Usuario (nombre, email, contrasena, edad, peso, altura) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, "Usuario Prueba");
            pstmt.setString(2, "prueba@test.com");
            pstmt.setString(3, "password123");
            pstmt.setInt(4, 30);
            pstmt.setDouble(5, 70.5);
            pstmt.setInt(6, 175);
            
            int filasAfectadas = pstmt.executeUpdate();
            
            if (filasAfectadas > 0) {
                // Obtener el ID generado
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int idGenerado = generatedKeys.getInt(1);
                    System.out.println("   ✅ Usuario insertado correctamente - ID: " + idGenerado);
                    
                    // Limpiar: eliminar el usuario de prueba
                    limpiarUsuarioPrueba(idGenerado);
                }
            } else {
                System.out.println("   ❌ No se pudo insertar el usuario");
            }
            
        } catch (SQLException e) {
            System.out.println("   ❌ Error en inserción: " + e.getMessage());
        }
        System.out.println();
    }
    
    public static void testConsultaAlimentos() {
        System.out.println("2. 🍎 PROBANDO CONSULTA DE ALIMENTOS...");
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            String sql = "SELECT a.nombre, a.calorias, a.proteinas, a.categoria " +
                        "FROM Alimento a " +
                        "WHERE a.piramide_nivel = 1 " +
                        "ORDER BY a.nombre " +
                        "LIMIT 5";
            
            ResultSet rs = stmt.executeQuery(sql);
            
            System.out.println("   📋 Alimentos del nivel 1 (Frutas y Verduras):");
            while (rs.next()) {
                System.out.println("      🥗 " + rs.getString("nombre") + 
                                 " - " + rs.getDouble("calorias") + " cal" +
                                 " - " + rs.getDouble("proteinas") + "g proteína" +
                                 " - " + rs.getString("categoria"));
            }
            
        } catch (SQLException e) {
            System.out.println("   ❌ Error en consulta: " + e.getMessage());
        }
        System.out.println();
    }
    
    public static void testRegistroConsumo() {
        System.out.println("3. 📝 PROBANDO REGISTRO DE CONSUMO...");
        
        // Primero obtener un usuario y un alimento existentes
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Obtener primer usuario
            ResultSet usuario = stmt.executeQuery("SELECT id_usuario FROM Usuario LIMIT 1");
            if (!usuario.next()) {
                System.out.println("   ❌ No hay usuarios en la base de datos");
                return;
            }
            int idUsuario = usuario.getInt("id_usuario");
            
            // Obtener primer alimento
            ResultSet alimento = stmt.executeQuery("SELECT id_alimento, calorias, proteinas FROM Alimento LIMIT 1");
            if (!alimento.next()) {
                System.out.println("   ❌ No hay alimentos en la base de datos");
                return;
            }
            int idAlimento = alimento.getInt("id_alimento");
            double caloriasPor100g = alimento.getDouble("calorias");
            double proteinasPor100g = alimento.getDouble("proteinas");
            
            // Insertar registro de consumo
            String sqlInsert = "INSERT INTO RegistroConsumo (id_usuario, id_alimento, cantidad_gr, tipo_comida, " +
                              "calorias_totales, proteinas_totales) VALUES (?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement pstmt = conn.prepareStatement(sqlInsert)) {
                double cantidad = 150.0; // 150 gramos
                double caloriasTotales = (caloriasPor100g * cantidad) / 100;
                double proteinasTotales = (proteinasPor100g * cantidad) / 100;
                
                pstmt.setInt(1, idUsuario);
                pstmt.setInt(2, idAlimento);
                pstmt.setDouble(3, cantidad);
                pstmt.setString(4, "almuerzo");
                pstmt.setDouble(5, caloriasTotales);
                pstmt.setDouble(6, proteinasTotales);
                
                int filas = pstmt.executeUpdate();
                if (filas > 0) {
                    System.out.println("   ✅ Registro de consumo insertado correctamente");
                    System.out.println("      📊 Calorías calculadas: " + caloriasTotales);
                    System.out.println("      💪 Proteínas calculadas: " + proteinasTotales);
                }
            }
            
        } catch (SQLException e) {
            System.out.println("   ❌ Error en registro de consumo: " + e.getMessage());
        }
        System.out.println();
    }
    
    private static void limpiarUsuarioPrueba(int idUsuario) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Usuario WHERE id_usuario = ?")) {
            
            pstmt.setInt(1, idUsuario);
            pstmt.executeUpdate();
            System.out.println("   🧹 Usuario de prueba eliminado (ID: " + idUsuario + ")");
            
        } catch (SQLException e) {
            System.out.println("   ⚠️ No se pudo limpiar usuario de prueba: " + e.getMessage());
        }
    }
}

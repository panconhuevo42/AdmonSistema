/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestConnection {
    public static void main(String[] args) {
        System.out.println("🧪 INICIANDO PRUEBAS DE CONEXIÓN Y ESTRUCTURA DE BD 🧪\n");
        
        testConexionBasica();
        testEstructuraTablas();
        testDatosIniciales();
    }
    
    public static void testConexionBasica() {
        System.out.println("1. 🔌 PROBANDO CONEXIÓN BÁSICA...");
        
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("   ✅ Conexión exitosa a la base de datos");
                
                // Información de la base de datos
                DatabaseMetaData metaData = conn.getMetaData();
                System.out.println("   📊 URL: " + metaData.getURL());
                System.out.println("   👤 Usuario: " + metaData.getUserName());
                System.out.println("   🚀 Driver: " + metaData.getDriverName());
                System.out.println("   📋 Versión: " + metaData.getDatabaseProductVersion());
                
            } else {
                System.out.println("   ❌ La conexión fue nula o está cerrada.");
            }
        } catch (SQLException e) {
            System.out.println("   ❌ Error al conectar: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println();
    }
    
    public static void testEstructuraTablas() {
        System.out.println("2. 🗄️ VERIFICANDO ESTRUCTURA DE TABLAS...");
        
        String[] tablasEsperadas = {
            "Usuario", "Alimento", "RegistroConsumo", 
            "Receta", "RecetaIngrediente", "Logro", 
            "UsuarioLogro", "PreferenciaUsuario", "LogSistema"
        };
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            int tablasEncontradas = 0;
            
            for (String tabla : tablasEsperadas) {
                try {
                    // Intentar contar registros para verificar que la tabla existe y es accesible
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM " + tabla);
                    if (rs.next()) {
                        int count = rs.getInt("count");
                        System.out.println("   ✅ Tabla '" + tabla + "' - " + count + " registros");
                        tablasEncontradas++;
                    }
                } catch (SQLException e) {
                    System.out.println("   ❌ Tabla '" + tabla + "' no existe o hay error: " + e.getMessage());
                }
            }
            
            System.out.println("   📈 Tablas encontradas: " + tablasEncontradas + "/" + tablasEsperadas.length);
            
        } catch (SQLException e) {
            System.out.println("   ❌ Error en verificación de estructura: " + e.getMessage());
        }
        System.out.println();
    }
    
    public static void testDatosIniciales() {
        System.out.println("3. 📊 VERIFICANDO DATOS INICIALES...");
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Verificar usuario administrador
            System.out.println("   👥 Verificando usuarios...");
            ResultSet usuarios = stmt.executeQuery("SELECT id_usuario, nombre, email, rol FROM Usuario");
            while (usuarios.next()) {
                System.out.println("      👤 ID: " + usuarios.getInt("id_usuario") + 
                                 " | Nombre: " + usuarios.getString("nombre") + 
                                 " | Email: " + usuarios.getString("email") + 
                                 " | Rol: " + usuarios.getString("rol"));
            }
            
            // Verificar alimentos
            System.out.println("   🍎 Verificando alimentos...");
            ResultSet alimentos = stmt.executeQuery(
                "SELECT COUNT(*) as total, piramide_nivel FROM Alimento GROUP BY piramide_nivel ORDER BY piramide_nivel"
            );
            while (alimentos.next()) {
                System.out.println("      🏛️ Nivel " + alimentos.getInt("piramide_nivel") + 
                                 ": " + alimentos.getInt("total") + " alimentos");
            }
            
            // Verificar recetas
            System.out.println("   🍽️ Verificando recetas...");
            ResultSet recetas = stmt.executeQuery("SELECT COUNT(*) as total FROM Receta");
            if (recetas.next()) {
                System.out.println("      📋 Recetas cargadas: " + recetas.getInt("total"));
            }
            
            // Verificar logros
            System.out.println("   🏆 Verificando logros...");
            ResultSet logros = stmt.executeQuery("SELECT COUNT(*) as total FROM Logro");
            if (logros.next()) {
                System.out.println("      🎯 Logros disponibles: " + logros.getInt("total"));
            }
            
        } catch (SQLException e) {
            System.out.println("   ❌ Error al verificar datos: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println();
    }
}
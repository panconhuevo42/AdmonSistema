/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.*;

public class TestConexionDirecta {
    public static void main(String[] args) {
        System.out.println("🔧 PRUEBA DIRECTA DE CONEXIÓN MYSQL 🔧\n");
        
        // Configuración directa
        String url = "jdbc:mysql://localhost:3306/database";
        String user = "root"; 
        String password = ""; // Si tienes contraseña, ponla aquí
        
        System.out.println("📡 Intentando conectar a: " + url);
        System.out.println("👤 Usuario: " + user);
        System.out.println("🔑 Contraseña: " + (password.isEmpty() ? "[vacía]" : "***"));
        
        try {
            // 1. Cargar driver manualmente
            System.out.println("\n1. 🚀 Cargando driver MySQL...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("   ✅ Driver cargado");
            
            // 2. Intentar conexión
            System.out.println("2. 🔌 Estableciendo conexión...");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("   ✅ ¡CONEXIÓN EXITOSA!");
            
            // 3. Mostrar información de la BD
            DatabaseMetaData meta = conn.getMetaData();
            System.out.println("3. 📊 Información de la base de datos:");
            System.out.println("   💾 Producto: " + meta.getDatabaseProductName());
            System.out.println("   🔢 Versión: " + meta.getDatabaseProductVersion());
            System.out.println("   👤 Usuario: " + meta.getUserName());
            
            // 4. Verificar si existen las tablas principales
            System.out.println("4. 🗃️ Verificando tablas...");
            verificarTabla(conn, "Usuario");
            verificarTabla(conn, "Alimento"); 
            verificarTabla(conn, "Receta");
            
            // 5. Contar registros
            System.out.println("5. 📈 Contando registros...");
            contarRegistros(conn, "Usuario", "👥 Usuarios");
            contarRegistros(conn, "Alimento", "🍎 Alimentos");
            contarRegistros(conn, "Receta", "🍽️ Recetas");
            
            conn.close();
            System.out.println("\n🎉 ¡PRUEBA COMPLETADA EXITOSAMENTE!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("❌ ERROR: No se pudo cargar el driver MySQL");
            System.out.println("💡 Solución: Verifica que mysql-connector-j-9.5.0.jar esté en el classpath");
            
        } catch (SQLException e) {
            System.out.println("❌ ERROR SQL: " + e.getMessage());
            mostrarDiagnostico(e.getMessage());
        }
    }
    
    private static void verificarTabla(Connection conn, String tablaNombre) {
        try {
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet rs = meta.getTables(null, null, tablaNombre, null);
            if (rs.next()) {
                System.out.println("   ✅ Tabla '" + tablaNombre + "' existe");
            } else {
                System.out.println("   ❌ Tabla '" + tablaNombre + "' NO existe");
            }
        } catch (SQLException e) {
            System.out.println("   ⚠️ Error verificando tabla " + tablaNombre + ": " + e.getMessage());
        }
    }
    
    private static void contarRegistros(Connection conn, String tabla, String label) {
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as total FROM " + tabla)) {
            if (rs.next()) {
                System.out.println("   " + label + ": " + rs.getInt("total"));
            }
        } catch (SQLException e) {
            System.out.println("   ⚠️ No se pudo contar " + tabla + ": " + e.getMessage());
        }
    }
    
    private static void mostrarDiagnostico(String mensajeError) {
        System.out.println("\n🔍 DIAGNÓSTICO:");
        
        if (mensajeError.contains("Unknown database")) {
            System.out.println("💡 Problema: La base de datos 'database' no existe");
            System.out.println("💡 Solución: Ejecuta en MySQL: CREATE DATABASE database;");
            
        } else if (mensajeError.contains("Access denied")) {
            System.out.println("💡 Problema: Error de acceso - usuario/contraseña incorrectos");
            System.out.println("💡 Solución: Verifica el usuario y contraseña en DBConnection.java");
            
        } else if (mensajeError.contains("Communications link failure")) {
            System.out.println("💡 Problema: MySQL no está ejecutándose");
            System.out.println("💡 Solución: Inicia el servicio MySQL");
            
        } else if (mensajeError.contains("No suitable driver")) {
            System.out.println("💡 Problema: Driver JDBC no encontrado");
            System.out.println("💡 Solución: Asegúrate de que mysql-connector-j-9.5.0.jar esté en el classpath");
            
        } else {
            System.out.println("💡 Error específico: " + mensajeError);
        }
        
        System.out.println("\n📋 VERIFICACIONES MANUALES:");
        System.out.println("1. ¿Está ejecutándose MySQL? (ver en Services o Task Manager)");
        System.out.println("2. ¿Existe la base de datos 'database'?");
        System.out.println("3. ¿El usuario 'root' tiene acceso?");
        System.out.println("4. ¿El JAR del conector está en la carpeta correcta?");
    }
}

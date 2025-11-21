package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    public static Connection getConexion() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/database",
                "root",
                "" // contraseña si tienes, por ejemplo "root"
            );
            System.out.println("✅ Conexión exitosa a la base de datos");
        } catch (Exception e) {
            System.out.println("? Error al conectar a la base de datos");
            e.printStackTrace();
        }
        return conexion;
    }
}




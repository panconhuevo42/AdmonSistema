package modelo;

import java.sql.Timestamp;

public class RegistroConsumo {
    private int id_registro;
    private int id_usuario;
    private int id_alimento;
    private double cantidad_gr;
    private String tipo_comida;
    private Timestamp fecha_consumo;
    private double calorias_totales;
    private double proteinas_totales;
    private double carbohidratos_totales;
    private double grasas_totales;

    // Getters y Setters
    public int getId_registro() { return id_registro; }
    public void setId_registro(int id_registro) { this.id_registro = id_registro; }

    public int getId_usuario() { return id_usuario; }
    public void setId_usuario(int id_usuario) { this.id_usuario = id_usuario; }

    public int getId_alimento() { return id_alimento; }
    public void setId_alimento(int id_alimento) { this.id_alimento = id_alimento; }

    public double getCantidad_gr() { return cantidad_gr; }
    public void setCantidad_gr(double cantidad_gr) { this.cantidad_gr = cantidad_gr; }

    public String getTipo_comida() { return tipo_comida; }
    public void setTipo_comida(String tipo_comida) { this.tipo_comida = tipo_comida; }

    public Timestamp getFecha_consumo() { return fecha_consumo; }
    public void setFecha_consumo(Timestamp fecha_consumo) { this.fecha_consumo = fecha_consumo; }

    public double getCalorias_totales() { return calorias_totales; }
    public void setCalorias_totales(double calorias_totales) { this.calorias_totales = calorias_totales; }

    public double getProteinas_totales() { return proteinas_totales; }
    public void setProteinas_totales(double proteinas_totales) { this.proteinas_totales = proteinas_totales; }

    public double getCarbohidratos_totales() { return carbohidratos_totales; }
    public void setCarbohidratos_totales(double carbohidratos_totales) { this.carbohidratos_totales = carbohidratos_totales; }

    public double getGrasas_totales() { return grasas_totales; }
    public void setGrasas_totales(double grasas_totales) { this.grasas_totales = grasas_totales; }
}

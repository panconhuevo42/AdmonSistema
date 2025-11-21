package modelo;

public class Alimento {
    private int id_alimento;
    private String nombre;
    private String categoria;
    private double grasas;
    private double calorias;
    private double proteinas;
    private double carbohidratos;
    private double porcion_100gr;
    private int piramide_nivel;

    // Getters y Setters
    public int getId_alimento() { return id_alimento; }
    public void setId_alimento(int id_alimento) { this.id_alimento = id_alimento; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public double getGrasas() { return grasas; }
    public void setGrasas(double grasas) { this.grasas = grasas; }

    public double getCalorias() { return calorias; }
    public void setCalorias(double calorias) { this.calorias = calorias; }

    public double getProteinas() { return proteinas; }
    public void setProteinas(double proteinas) { this.proteinas = proteinas; }

    public double getCarbohidratos() { return carbohidratos; }
    public void setCarbohidratos(double carbohidratos) { this.carbohidratos = carbohidratos; }

    public double getPorcion_100gr() { return porcion_100gr; }
    public void setPorcion_100gr(double porcion_100gr) { this.porcion_100gr = porcion_100gr; }

    public int getPiramide_nivel() { return piramide_nivel; }
    public void setPiramide_nivel(int piramide_nivel) { this.piramide_nivel = piramide_nivel; }
}

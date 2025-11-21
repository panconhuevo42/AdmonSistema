/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

public class Receta {
    private int id_receta;
    private String nombre;
    private String descripcion;
    private String categoria;
    private int tiempo_preparacion;
    private String dificultad;
    private double calorias_porcion;
    private String instrucciones;
    private String imagen;
    private String estado;

    // Getters y Setters
    public int getId_receta() { return id_receta; }
    public void setId_receta(int id_receta) { this.id_receta = id_receta; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public int getTiempo_preparacion() { return tiempo_preparacion; }
    public void setTiempo_preparacion(int tiempo_preparacion) { this.tiempo_preparacion = tiempo_preparacion; }

    public String getDificultad() { return dificultad; }
    public void setDificultad(String dificultad) { this.dificultad = dificultad; }

    public double getCalorias_porcion() { return calorias_porcion; }
    public void setCalorias_porcion(double calorias_porcion) { this.calorias_porcion = calorias_porcion; }

    public String getInstrucciones() { return instrucciones; }
    public void setInstrucciones(String instrucciones) { this.instrucciones = instrucciones; }

    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

public class PreferenciaUsuario {
    private int id_preferencia;
    private int id_usuario;
    private String tipo;
    private String estado;

    // Getters y Setters
    public int getId_preferencia() { return id_preferencia; }
    public void setId_preferencia(int id_preferencia) { this.id_preferencia = id_preferencia; }

    public int getId_usuario() { return id_usuario; }
    public void setId_usuario(int id_usuario) { this.id_usuario = id_usuario; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}

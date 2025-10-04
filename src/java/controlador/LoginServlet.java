package com.tuapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Validación simulada
        if ("admin".equals(user) && "1234".equals(pass)) {
            // Crear sesión y guardar usuario
            HttpSession session = request.getSession();
            session.setAttribute("username", user);

            // Redirigir al dashboard
            response.sendRedirect("dashboard.jsp");
        } else {
            // Enviar mensaje de error y volver a login.jsp
            request.setAttribute("error", "Usuario o contraseña inválidos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}





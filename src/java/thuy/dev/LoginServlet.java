/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thuy.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import thuy.dev.data.dao.Database;
import thuy.dev.data.dao.DatabaseDao;
import thuy.dev.data.dao.UserDao;
import thuy.dev.data.model.User;

/**
 *
 * @author Asus
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("HomeServlet");
        } else {
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DatabaseDao.init(new Database());
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDao.findByEmail(email);
        if (user == null) {
            //Failed
            session.setAttribute("error", "Login Failed");
            response.sendRedirect("LoginServlet");
        } else {
            if (user.getPassword().equals(password)) {
                //Success
                session.setAttribute("user", user);
                response.sendRedirect("HomeServlet");
            } else {
                //Failed
                session.setAttribute("error", "Login Failed");
                response.sendRedirect("LoginServlet");
            }
        }
    }

}

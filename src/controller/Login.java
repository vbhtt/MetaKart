package controller;

import model.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by fwarr on 23-Sep-15.
 */
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        user user = new user();
        user.setUser(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        System.out.println(user.getUser()+" "+user.getPassword());
        try {
            if(user.validate())
            {
                System.out.println("Validated");
                RequestDispatcher rs = request.getRequestDispatcher("welcome.jsp");
                rs.forward(request,response);
            }
            else{
                RequestDispatcher rs = request.getRequestDispatcher("/verify");
                rs.forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

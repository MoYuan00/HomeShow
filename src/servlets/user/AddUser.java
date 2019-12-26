package servlets.user;

import bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 */
@WebServlet("/addUser")
public class AddUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/addUser");
        String username = (String) req.getParameter("username");
        String password = (String) req.getParameter("password");
        String jumpPath = (String) req.getParameter("jumpPath");
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        user = user.addUser();
       resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

package servlets.user;

import bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/deleteUser");
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        User user = new User();
        user.setId(id);
        user.deleteUserById();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

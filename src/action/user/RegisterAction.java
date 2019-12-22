package action.user;

import bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 */
@WebServlet("/user/register")
public class RegisterAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/user/register");
        String username = (String) req.getParameter("username");
        String password = (String) req.getParameter("password");
        System.out.println(username + " | " + password);
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        user = user.addUser();
        if(user != null){// 成功！
            // 登录
            req.getRequestDispatcher("/user/login").forward(req, resp);
        }else{
            req.setAttribute("message", "Register Error!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

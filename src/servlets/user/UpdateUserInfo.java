package servlets.user;

import bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateUserInfo")
public class UpdateUserInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/updateUserInfo");
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        String  username =  req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        int age = Integer.parseInt(req.getParameter("age").trim());
        String birthday = req.getParameter("birthday").trim();
        String email = req.getParameter("email").trim();
        String tel = req.getParameter("tel").trim();
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setAge(age);
        user.setBirthday(birthday);
        user.setTel(tel);
        user.setEmail(email);
        user.updateUserInfoById();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

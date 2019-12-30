package servlets.profile;

import bean.Profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改简介内容
 */
@WebServlet("/deleteProfile")
public class DeleteProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/deleteProfile");
        // 处理乱码
        req.setCharacterEncoding("utf-8");
        // 获取内容
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        Profile profile = new Profile();
        profile.setId(id);
        profile.deleteProfile();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

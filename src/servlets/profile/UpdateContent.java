package servlets.profile;

import bean.Images;
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
@WebServlet("/updateContent")
public class UpdateContent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 处理乱码
        req.setCharacterEncoding("utf-8");
        // 获取内容
        String content = req.getParameter("content");
        System.out.println("要保存的内容为：" + content);
        String type =  (req.getParameter("type"));
        Profile profile = new Profile();
        profile.setType(type);
        profile.setContent(content);
        profile.updateContent();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

package servlets.message;

import bean.Message;
import util.C3P0JdbcUtil;
import util.dataUrl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "addMessage" , urlPatterns = "/addMessage")
public class addMessage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String url = dataUrl.url;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String title=request.getParameter("title");
        String content=request.getParameter("content");

        Message message = new Message();
        message.setUser_id(user_id);
        message.setTitle(title);
        message.setContent(content);
        message.addMessage();


        String jumpPath = request.getParameter("jumpPath");
        System.out.println("跳转到：" + jumpPath);
        response.sendRedirect(jumpPath);

    }
}

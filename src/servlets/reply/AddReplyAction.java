package servlets.reply;

import bean.Reply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddReplyAction", urlPatterns = "/addReply")
public class AddReplyAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        System.out.println("/user/addReply");
        Reply r = new Reply();
        r.setMessageid(Integer.parseInt(request.getParameter("rmsgId")));
        r.setTitle(request.getParameter("rTitle"));
        r.setContent(request.getParameter("rContent"));
        r.setUser_id(Integer.parseInt(request.getParameter("user_id")));
        System.out.println("reply to " + r.getMessageid());
        r.addReply();
        String jumpPath = request.getParameter("jumpPath");
        System.out.println("跳转到：" + jumpPath);
        response.sendRedirect(jumpPath);
    }
}

package servlets.reply;

import bean.Reply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateReply", urlPatterns = "/updateReply")
public class UpdateReply extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateReply");
        Reply r = new Reply();
        r.setReplyid(Integer.parseInt(request.getParameter("rId")));
        r.setTitle(request.getParameter("rTitle"));
        r.setContent(request.getParameter("rContent"));
        r.updateReplyById();
        String jumpPath = request.getParameter("jumpPath");
        System.out.println("跳转到：" + jumpPath);
        response.sendRedirect(jumpPath);
    }
}

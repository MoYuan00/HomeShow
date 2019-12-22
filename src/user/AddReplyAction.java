package user;

import bean.Reply;
import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AddReplyAction", urlPatterns = "/user/addReply")
public class AddReplyAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("/user/addReply");
        Reply r = new Reply();
        r.setMessageid(Integer.parseInt(request.getParameter("rmsgId")));
        r.setUsername(request.getParameter("rName"));
        r.setEmail(request.getParameter("rEmail"));
        r.setTitle(request.getParameter("rTitle"));
        r.setContent(request.getParameter("rContent"));
        r.setPhonenum(request.getParameter("rNumber"));
        System.out.println("reply to " + r.getMessageid());
        r.addReply();
        request.getRequestDispatcher( "/user/getMessage").forward(request,response);
    }
}

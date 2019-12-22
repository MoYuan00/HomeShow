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

@WebServlet(name = "addReply", urlPatterns = "/user/addReply")
public class addReply extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        Reply r = new Reply();
        String id_s = request.getParameter("rmsgId");
        System.out.println("reply to " + id_s);
        r.setMessageid(Integer.parseInt(id_s));
        r.setUsername(request.getParameter("rName"));
        r.setEmail(request.getParameter("rEmail"));
        r.setTitle(request.getParameter("rTitle"));
        r.setContent(request.getParameter("rContent"));
        r.setPhonenum(request.getParameter("rNumber"));

        try{
            conn = C3P0JdbcUtil.getConnection();
            String query = "INSERT INTO testdemo.t_reply(messageid,title,content,username,email,phonenum,`time`) VALUES(?,?,?,?,?,?,NOW())";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, r.getMessageid());
            pstmt.setString(2, r.getTitle());
            pstmt.setString(3, r.getContent());
            pstmt.setString(4, r.getUsername());
            pstmt.setString(5, r.getEmail());
            pstmt.setString(6, r.getPhonenum());
            pstmt.executeUpdate();
            // if no error back to message
            request.getRequestDispatcher( "/user/getMessage").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("add reply error");
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

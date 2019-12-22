package user;

import bean.Message;
import bean.Reply;
import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getMessage", urlPatterns = "/user/getMessage")
public class getMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("getMessage");
        String query = "SELECT * FROM t_message";
        String query_reply = "SELECT * FROM t_reply WHERE messageid = ?";
        List<Message> messages = new ArrayList<>();
        List<List> repliesList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt_reply = null;
        ResultSet rs = null;
        ResultSet rs_reply = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Message s = new Message();
                s.setId(rs.getInt("messageid"));
                s.setUsername(rs.getString("username"));
                s.setContent(rs.getString("content"));
                s.setTitle(rs.getString("title"));
                s.setTime(rs.getString("time"));
                messages.add(s);
                // 获得对应评论的回复
                pstmt_reply = conn.prepareStatement(query_reply);
                pstmt_reply.setInt(1, s.getId());
                rs_reply = pstmt_reply.executeQuery();
                List<Reply> replies = new ArrayList<>();
                while(rs_reply.next()){
                    Reply r = new Reply();
                    r.setReplyid(rs_reply.getInt("replyid"));
                    r.setMessageid(rs_reply.getInt("messageid"));
                    r.setTitle(rs_reply.getString("title"));
                    r.setContent(rs_reply.getString("content"));
                    r.setTime(rs_reply.getString("time"));
                    r.setUsername(rs_reply.getString("username"));
                    replies.add(r);
                }
                repliesList.add(replies);
            }
            HttpSession session = request.getSession();
            session.setAttribute("messages", messages);
            session.setAttribute("repliesList", repliesList);
            System.out.println("get messages success!");
            response.sendRedirect(request.getContextPath() + "/messageBoard.jsp");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
//            C3P0JdbcUtil.release(null, pstmt_reply, null);
        }
    }
}

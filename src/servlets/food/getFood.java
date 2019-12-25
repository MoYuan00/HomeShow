package servlets.food;

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

@WebServlet(name = "getProfileFood", urlPatterns = "/user/getProfileFood")
public class getFood extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = "SELECT * FROM t_profile where type = 'food' limit 1";
        String query_reply = "SELECT * FROM t_images WHERE type = 'food'";
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt_reply = null;
        ResultSet rs = null;
        ResultSet rs_reply = null;
        String content = "";
        List<String> replies = new ArrayList<>();
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()){
                content = rs.getString("content");

                pstmt_reply = conn.prepareStatement(query_reply);
                rs_reply = pstmt_reply.executeQuery();
                while(rs_reply.next()){
                    String img = rs_reply.getString("img");
                    replies.add(img);
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("content", content);
            session.setAttribute("list", replies);
            response.sendRedirect(request.getContextPath() + "/profile.jsp");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
    }
}

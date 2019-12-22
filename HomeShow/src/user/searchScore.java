package user;

import bean.Score;
import util.C3P0JdbcUtil;
import util.StringUtil;

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

@WebServlet(name = "searchScore", urlPatterns = "/user/searchScore")
public class searchScore extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String query = "SELECT * FROM t_score WHERE `courseid`=? OR `coursename` LIKE ?";
        String keyword = request.getParameter("sSearch");
//        String keyword = StringUtil.getNewString(_keyword);
        System.out.println("Searching..." + keyword);
        List<Score> scores = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, keyword);
            pstmt.setString(2, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            while(rs.next()){
                Score s = new Score();
                s.setId(rs.getInt("courseid"));
                s.setName(rs.getString("coursename"));
                s.setScore(rs.getDouble("score"));
                scores.add(s);
            }
            System.out.println("score search success");
            HttpSession session = request.getSession();
            session.setAttribute("searchScores", scores);
            response.sendRedirect(request.getContextPath() + "/score.jsp");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
    }
}

package user;

import bean.Score;
import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "addScore", urlPatterns = "/user/addScore")
public class addScore extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = "INSERT INTO t_score VALUES (?, ?, ?)";
        Score s = new Score();
        s.setId(Integer.parseInt(request.getParameter("cId")));
        s.setName(request.getParameter("cName"));
        s.setScore(Double.parseDouble(request.getParameter("cScore")));
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, s.getId());
            pstmt.setString(2, s.getName());
            pstmt.setDouble(3, s.getScore());
            pstmt.executeUpdate();
            System.out.println("add score success");
            request.getRequestDispatcher("/user/getScore").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

package user;

import bean.Skill;
import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "addSkill", urlPatterns = "/user/addSkill")
public class addSkill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = "INSERT INTO t_skills(name, time, description) VALUES (?, ?, ?)";
        Skill s = new Skill();
        s.setName(request.getParameter("dName"));
        s.setDate(request.getParameter("dDate"));
        s.setDescription(request.getParameter("dDescription"));
        System.out.println(s.getName()+s.getDate()+s.getDescription());
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getDate());
            pstmt.setString(3, s.getDescription());
            pstmt.executeUpdate();
            System.out.println("add skill success");
            request.getRequestDispatcher("/user/getSkill").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

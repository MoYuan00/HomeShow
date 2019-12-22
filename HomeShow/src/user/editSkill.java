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

@WebServlet(name = "editSkill", urlPatterns = "/user/editSkill")
public class editSkill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = "UPDATE t_skills SET `name`=?,`time`=?,`description`=? WHERE `id`=?";
        Skill s = new Skill();
        s.setName(request.getParameter("d_edit_Name"));
        s.setDate(request.getParameter("d_edit_Date"));
        s.setDescription(request.getParameter("d_edit_Description"));
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getDate());
            pstmt.setString(3, s.getDescription());
            pstmt.setInt(4, Integer.parseInt(request.getParameter("id")));
            pstmt.executeUpdate();
            System.out.println("edit skill success");
            request.getRequestDispatcher("/user/getSkill").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

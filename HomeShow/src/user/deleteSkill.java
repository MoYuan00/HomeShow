package user;

import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "deleteSkill", urlPatterns = "/user/deleteSkill")
public class deleteSkill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_s = request.getParameter("id");
        int id = Integer.parseInt(id_s);
        String query = "DELETE FROM t_skills WHERE `id` = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
            System.out.println("delete score success");
            request.getRequestDispatcher("/user/getSkill").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

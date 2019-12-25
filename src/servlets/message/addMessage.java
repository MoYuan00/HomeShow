package servlets.message;

import util.C3P0JdbcUtil;
import util.dataUrl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "addMessage" , urlPatterns = "/user/addMessage")
public class addMessage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String url = dataUrl.url;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title=request.getParameter("lTitle");
        String content=request.getParameter("lContent");
        String username = request.getParameter("lName");
        String email = request.getParameter("lEmail");
        String phonenum = request.getParameter("lNumber");
//        System.out.println(username + "  " + email + "\n" + title + " : " + content + "\n");
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            String query = "INSERT INTO t_message(title,content,username,email,phonenum,`time`) VALUES(?,?,?,?,?,NOW())";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,title);
            pstmt.setString(2,content);
            pstmt.setString(3,username);
            pstmt.setString(4,email);
            pstmt.setString(5,phonenum);
            pstmt.executeUpdate();
            // if no error back to message
            request.getRequestDispatcher( "/user/getMessage").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("add message error");
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
}

package action.log;

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
import util.C3P0JdbcUtil;


/**
 * Servlet implementation class loginAction
 */
@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=(String)request.getParameter("username");
		String password=(String)request.getParameter("password");

		System.out.println(username + " | " + password);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from t_user where username =? and password=? ";
		try{
			conn = C3P0JdbcUtil.getConnection();
			System.out.println("success");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String id=rs.getString("id");
				System.out.println("id==" + id);
				HttpSession session = request.getSession();
				session.setAttribute("un", rs.getString("username"));
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				//response.sendRedirect("../user/list");
			}else{
				request.setAttribute("message", "Username or Password Error");
				request.getRequestDispatcher( "/login.jsp").forward(request,response);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			C3P0JdbcUtil.release(conn, pstmt, rs);
		}

		
	}
	
 
	
	public void doGet1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginAction.doGet()");
	}


}

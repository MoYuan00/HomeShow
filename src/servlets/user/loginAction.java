package servlets.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import bean.User;


/**
 * Servlet implementation class loginAction
 */
@WebServlet("/user/login")
public class loginAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("/user/login");
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        System.out.println(username + " | " + password);

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user = user.selectByNameAndPassword();
        if (user == null) {// 失败
            request.setAttribute("message", "用户名或密码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }else{// 成功
			HttpSession session = request.getSession();
			session.setAttribute("un", user.getUsername());
			session.setAttribute("userId", user.getId());
            System.out.println("登录id：" + user.getId());
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}

    }


    public void doGet1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


}

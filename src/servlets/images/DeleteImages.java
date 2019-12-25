package servlets.images;

import bean.Images;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteImages")
public class DeleteImages extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        Images images = new Images();
        images.setId(id);
        images.deleteImage();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

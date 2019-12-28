package servlets.user;

import Utils.Utils;
import bean.User;
import org.apache.commons.fileupload.FileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 更新用户的头像
 */
@WebServlet("/updateUserPortraitImage")
public class UpdateUserPortraitImage  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("/updateUserPortraitImage");
        req.setCharacterEncoding("utf-8");
        Utils.FileUploader fileUploader = new Utils.FileUploader(req);
        Map<String, Object> stringObjectMap = fileUploader.parseRequest();

        int id = Integer.parseInt(stringObjectMap.get("id").toString().trim());
        FileItem fileItem = (FileItem) stringObjectMap.get("portrait_image");
        if(fileItem != null) {
            String filePath = fileUploader.saveFile(fileItem);
            User user = new User();
            user.setId(id);
            user.setPortrait_image(filePath);
            user.updateUserPortrait_image();
        }
        String jumpPath = stringObjectMap.get("jumpPath").toString().trim();
        System.out.println("跳转到：" + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

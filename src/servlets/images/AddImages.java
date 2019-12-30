package servlets.images;

import Utils.Utils;
import bean.Images;
import org.apache.commons.fileupload.FileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/addImages")
public class AddImages extends HttpServlet {

    /**
     * 上传数据及保存文件
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Utils.FileUploader files = new Utils.FileUploader(request);
        Map<String, Object> items = files.parseRequest();
        FileItem fileItem = (FileItem) items.get("uploadFile");
        if(fileItem != null){
            String path = files.saveFile(fileItem);
            System.out.println("存入数据库url: " + path);
            Images images = new Images();
            String type = items.get("type").toString();
            images.setImg(path);
            images.setProfile_id(Integer.parseInt(items.get("id").toString().trim()));
            images.addImage();
        }
        String jumpPath = items.get("jumpPath").toString();
        System.out.println("跳转到: " + jumpPath);
        response.sendRedirect(jumpPath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

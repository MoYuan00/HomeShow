package servlets.images;

import bean.Images;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/addImages")
public class AddImages extends HttpServlet {

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB

    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB

    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    /**
     * 上传数据及保存文件
     */

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletRequestContext requestContext = new ServletRequestContext(request);

        ServletFileUpload upload = new ServletFileUpload(factory);
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
//        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
        String basePath = getServletContext().getRealPath("./") + File.separator;
        String uploadPath = basePath + UPLOAD_DIRECTORY;
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            System.out.println("创建路径！");
            uploadDir.mkdir();
        }
        String jumpPath = "";
        try {
            // 解析请求的内容提取文件数据
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                HashMap<Images, FileItem> itemHashMap = new HashMap<>();
                Images images = new Images();
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {// 如果是文件
                        // 传入的文件名
                        String fileName = new File(item.getName()).getName();
                        // 文件后缀名
                        String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                        // 存入的文件路径
                        String name = System.currentTimeMillis() + suffix;
                        images.setImg(UPLOAD_DIRECTORY + File.separator + name);
                        itemHashMap.put(images, item);
                    }else{// 如果是其他参数
                        String name = item.getFieldName();
                        String value = item.getString();
                        if(name.equals("type"))
                            images.setType(value);
                        if(name.equals("jumpPath"))
                            jumpPath = value;
                    }
                }
                // 上传文件
                String filePath = basePath + images.getImg();
                System.out.println("输出到：" + filePath);
                File storeFile = new File(filePath);
                // 在控制台输出文件的上传路径
                System.out.println(filePath);
                // 保存文件到硬盘
                itemHashMap.get(images).write(storeFile);

                if(images.getImg() != null) {
                    // 上传成功后存入数据库
                    // 获取上传的文件 属于的简介类型
                    System.out.println("存入的图片类型为：" + images.getType());
                    images.addImage();// 添加到数据库
                    request.setAttribute("message","文件上传成功!");
                }


            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("跳转到: " + jumpPath);
        // 跳转回页面
        response.sendRedirect(jumpPath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

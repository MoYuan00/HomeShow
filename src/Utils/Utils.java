package Utils;

import bean.Images;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

/**
 * 通用的工具方法
 */
public class Utils {

    public static class FileUploader {
        // 上传文件存储目录
        private static final String UPLOAD_DIRECTORY = "upload";
        // 上传配置
        private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB

        private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB

        private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
        /**
         * 服务器根路径（文件是存放在一个文件夹下的，这个路径是文件夹的父路径）
         */
        private final String BASE_PATH;
        private final HttpServletRequest request;

        public FileUploader(HttpServletRequest request){
            this.request = request;
            BASE_PATH = request.getServletContext().getRealPath("./") + java.io.File.separator;
            // 如果目录不存在则创建
            java.io.File uploadDir = new java.io.File(BASE_PATH + UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                System.out.println("创建路径！");
                uploadDir.mkdir();
            }
        }

        /**
         *  将参数解析出来
         * @return  <>HashMap<String, Object></> <参数名, FileItem or 参数值>
         */
        public HashMap<String, Object> parseRequest(){
            HashMap<String, Object> itemHashMap = new HashMap<>();
            // 检测是否为多媒体上传
            if (!ServletFileUpload.isMultipartContent(request)) {
                // 如果不是
                return itemHashMap;
            }
            // 配置上传参数
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            // 设置临时存储目录
            factory.setRepository(new java.io.File(System.getProperty("java.io.tmpdir")));
            ServletRequestContext requestContext = new ServletRequestContext(request);

            ServletFileUpload upload = new ServletFileUpload(factory);
            // 设置最大文件上传值
            upload.setFileSizeMax(MAX_FILE_SIZE);
            // 设置最大请求值 (包含文件和表单数据)
            upload.setSizeMax(MAX_REQUEST_SIZE);
            try {
                // 解析请求的内容提取文件数据
                List<FileItem> formItems = upload.parseRequest(request);
                if (formItems != null && formItems.size() > 0) {
                    // 迭代表单数据
                    for (FileItem item : formItems) {
                        // 处理不在表单中的字段
                        if (!item.isFormField()) {// 如果是文件
                            itemHashMap.put(item.getFieldName(), item);
                        }else{// 如果是其他参数
                            itemHashMap.put(item.getFieldName(), item.getString());
                        }
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return itemHashMap;
        }

        /**
         * 保存文件到磁盘
         * @param fileItem
         * @return 返回保存文件的相对web-inf的路径 = 存放路径/文件名, 如果失败返回Null
         */
        public String saveFile(FileItem fileItem){
            if(fileItem != null) {
                try {
                    String fileName = new java.io.File(fileItem.getName()).getName();
                    String name = autoRename(fileName);
                    java.io.File file = new java.io.File(BASE_PATH + java.io.File.separator
                            + UPLOAD_DIRECTORY + java.io.File.separator + name);
                    fileItem.write(file);
                    return UPLOAD_DIRECTORY + java.io.File.separator + name;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return null;
        }

        /**
         * 重新给文件命名，反正文件名重复
         * @param fileName
         * @return
         */
        private String autoRename(String fileName){
            // 文件后缀名
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 存入的文件路径
            String name = System.currentTimeMillis() + suffix;
            return name;
        }

    }

}

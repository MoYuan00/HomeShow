package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Images {
    private int id;
    private String img;
    private String type;

    /**
     *  添加一个图片
     * @return
     */
    public Images addImage(){
        System.out.println("Images.addImage");
        String query = "insert into t_images (img,type) values(?, ?) ";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, img);
            pstmt.setString(2, type);
            int re = pstmt.executeUpdate();
            // 获取插入的主键
            ResultSet keys = pstmt.getGeneratedKeys();
            if (keys.next()) {
                 id = keys.getInt(1);
            }
            System.out.println("Images.addImage 成功！");
            return this;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
        return null;// 插入失败
    }

    /**
     *  删除美景的图片 通过id
     */
    public void deleteImage(){
        System.out.println("Images.deleteImage");
        String query = "delete from t_images where id=" + id ;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            int re = pstmt.executeUpdate();
            return;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }


    public List<Images> getImagesByType(String type){
        String query_reply = "SELECT * FROM t_images WHERE type = '" + type + "'";
        Connection conn = null;
        PreparedStatement pstmt_reply = null;
        ResultSet rs_reply = null;
        List<Images> replies = new ArrayList<>();
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt_reply = conn.prepareStatement(query_reply);
            rs_reply = pstmt_reply.executeQuery();
            while(rs_reply.next()){
                Images images = new Images();
                images.setId(rs_reply.getInt("id"));
                images.setType(rs_reply.getString("type"));
                images.setImg(rs_reply.getString("img"));
                replies.add(images);
            }
            return replies;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_reply, rs_reply);
        }
        return replies;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

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
    private int profile_id;

    /**
     *  添加一个图片
     * @return
     */
    public Images addImage(){
        System.out.println("Images.addImage");
        String query = "insert into t_images (img,profile_id) values(?, ?) ";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, img);
            pstmt.setInt(2, profile_id);
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


    public List<Images> getImagesByProfileId(){
        String query_reply = "SELECT * FROM t_images WHERE profile_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Images> imagesList = new ArrayList<>();
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query_reply);
            pstmt.setInt(1, this.profile_id);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Images images = new Images();
                images.setId(rs.getInt("id"));
                images.setImg(rs.getString("img"));
                images.setProfile_id(rs.getInt("profile_id"));
                imagesList.add(images);
            }
            return imagesList;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        return imagesList;
    }

    public int getProfile_id() {
        return profile_id;
    }

    public void setProfile_id(int profile_id) {
        this.profile_id = profile_id;
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

}

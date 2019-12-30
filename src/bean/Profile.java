package bean;


import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Profile {
    public static final String JXJJ = "jxjj";
    public static final String MJ = "mj";
    public static final String FOOD = "food";
    public static final String FTRQ = "ftrq";
    private int id;
    private String content;
    private String title;

    /**
     * 一条简介对应的图片
     */
    private List<Images> imageList;

    /**
     * 更新简介的内容
     */
    public Profile updateProfile(){
        System.out.println("Profile.updateContent()");
        String query = "update t_profile set content = ?, title=? where id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, this.content);
            pstmt.setString(2, this.title);
            pstmt.setInt(3, this.id);
            int re = pstmt.executeUpdate();
            System.out.println("Profile.updateContent() 成功！");
            return this;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
        return null;
    }


    /**
     * 获取家乡简介
     * @return
     */
    public static List<Profile> getJXJJProfile(){
        return getProfileByType(JXJJ);
    }

    /**
     * 获取食物简介
     * @return
     */
    public static List<Profile> getFoodProfile(){
        return getProfileByType(FOOD);
    }

    /**
     * 获取美景简介
     * @return
     */
    public static List<Profile> getMJProfile(){
        return getProfileByType(MJ);
    }

    /**
     * 获取风土人情简介
     * @return
     */
    public static List<Profile> getFTRQProfile(){
        return getProfileByType(FTRQ);
    }

    /**
     * 通过类型获取 简介信息
     * @param type
     * @return
     */
    private static List<Profile> getProfileByType(String type){
        String query = "SELECT * FROM t_profile where type = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Profile> profiles = new ArrayList<>();
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, type);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Profile profile = new Profile();
                profile.setContent(rs.getString("content"));
                profile.setId(rs.getInt("id"));
                profile.setTitle(rs.getString("title"));

                // 获取 当前简介信息的所有图片
                Images images = new Images();
                images.setProfile_id(profile.getId());
                profile.setImageList(images.getImagesByProfileId());

                profiles.add(profile);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        return profiles;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Images> getImageList() {
        return imageList;
    }

    public void setImageList(List<Images> imageList) {
        this.imageList = imageList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

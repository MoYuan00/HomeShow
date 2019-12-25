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
    private String type;
    private String content;

    /**
     * 更新简介的内容
     */
    public Profile updateContent(){
        System.out.println("Profile.updateContent()");
        String query = "update t_profile set content = ? where type = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, this.content);
            pstmt.setString(2, this.type);
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
    public String getJXJJContent(){
        return getContentByType("jxjj");
    }

    /**
     * 获取家乡简介 的图片
     * @return
     */
    public List<Images> getJXJJImages(){
        return getImagesByType("jxjj");
    }
    /**
     * 获取食物简介
     * @return
     */
    public String getFoodContent(){
        return getContentByType(FOOD);
    }

    /**
     * 获取食物简介的 图片
     * @return
     */
    public List<Images> getFoodImages(){
        return getImagesByType(FOOD);
    }

    /**
     * 获取美景简介
     * @return
     */
    public String getMJContent(){
        return getContentByType(MJ);
    }

    /**
     * 获取美景简介的 图片
     * @return
     */
    public List<Images> getMJImages(){
        return getImagesByType(MJ);
    }

    /**
     * 获取风土人情简介
     * @return
     */
    public String getFTRQContent(){
        return getContentByType(FTRQ);
    }

    /**
     * 获取风土人情简介的 图片
     * @return
     */
    public List<Images> getFTRQImages(){
        return getImagesByType(FTRQ);
    }
    /**
     * 通过类型获取 简介信息
     * @param type
     * @return
     */
    private String getContentByType(String type){
        String query = "SELECT * FROM t_profile where type = '" + type + "' limit 1";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String content = "";
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()){
                content = rs.getString("content");
            }
            return content;
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        return null;
    }

    /**
     * 通过类型获取 图片
     * @param type
     * @return
     */
    private List<Images> getImagesByType(String type){
       return new Images().getImagesByType(type);
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Message {
    private int id;
    private String title;
    private String content;
    private String username;
    private String email;
    private String phonenum;
    private String time;

    /**
     *  删除一条信息
     */
    public void deleteMessageById(){
        System.out.println("Message.deleteMessageById()");
        // 删除信息
        String query_m = "DELETE FROM t_Message WHERE `messageid` = ?";
        // 删除回复信息
        String query_r = "DELETE FROM t_Reply WHERE `messageid` = ?";
        Connection conn = null;
        PreparedStatement pstmt_m = null;
        PreparedStatement pstmt_r = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt_m = conn.prepareStatement(query_m);
            pstmt_m.setInt(1, id);
            pstmt_m.executeUpdate();
            System.out.println("delete Message success");
            pstmt_r = conn.prepareStatement(query_r);
            pstmt_r.setInt(1, id);
            pstmt_r.executeUpdate();
            System.out.println("delete reply success");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_m, null);
//            C3P0JdbcUtil.release(null, pstmt_r, null);
        }
    }

    /**
     * 獲取所有的留言信息
     * @return
     */
    public List<Message> getMessages(){
        System.out.println("Message.getMessage()");
        String query = "SELECT * FROM t_message";
        List<Message> messages = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Message s = new Message();
                s.setId(rs.getInt("messageid"));
                s.setUsername(rs.getString("username"));
                s.setContent(rs.getString("content"));
                s.setTitle(rs.getString("title"));
                s.setTime(rs.getString("time"));
                messages.add(s);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        return messages;
    }


    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Message{");
        sb.append("id=").append(id);
        sb.append(", title='").append(title).append('\'');
        sb.append(", content='").append(content).append('\'');
        sb.append(", username='").append(username).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", phonenum='").append(phonenum).append('\'');
        sb.append(", time='").append(time).append('\'');
        sb.append('}');
        return sb.toString();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

}

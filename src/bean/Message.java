package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class Message {
    private int id;
    private int user_id;
    private String title;
    private String content;
    private String time;

    private User user;

    /**
     * 删除一条信息
     */
    public void updateMessageById() {
        System.out.println("Message.updateMessageById()");
        // 删除信息
        String query_m = "update t_Message set title=?,content=? WHERE `messageid` = ?";
        // 删除回复信息
        Connection conn = null;
        PreparedStatement pstmt_m = null;
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt_m = conn.prepareStatement(query_m);
            pstmt_m.setString(1, title);
            pstmt_m.setString(2, content);
            pstmt_m.setInt(3, id);
            pstmt_m.executeUpdate();
            System.out.println("dupdateMessageById success");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0JdbcUtil.release(conn, pstmt_m, null);
        }
    }

    /**
     * 删除一条信息
     */
    public void deleteMessageById() {
        System.out.println("Message.deleteMessageById()");
        // 删除信息
        String query_m = "DELETE FROM t_Message WHERE `messageid` = ?";
        // 删除回复信息
        String query_r = "DELETE FROM t_Reply WHERE `messageid` = ?";
        Connection conn = null;
        PreparedStatement pstmt_m = null;
        PreparedStatement pstmt_r = null;
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt_m = conn.prepareStatement(query_m);
            pstmt_m.setInt(1, id);
            pstmt_m.executeUpdate();
            System.out.println("delete Message success");
            pstmt_r = conn.prepareStatement(query_r);
            pstmt_r.setInt(1, id);
            pstmt_r.executeUpdate();
            System.out.println("delete reply success");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0JdbcUtil.release(conn, pstmt_m, null);
//            C3P0JdbcUtil.release(null, pstmt_r, null);
        }
    }

    /**
     * 獲取所有的留言信息
     *
     * @return
     */
    public List<Message> getMessages() {
        System.out.println("Message.getMessage()");
        String query = "SELECT * FROM t_message";
        List<Message> messages = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Message s = new Message();
                s.setId(rs.getInt("messageid"));
                s.setUser_id(rs.getInt("user_id"));

                // 获取发送消息的用户信息
                User user = new User();
                user.setId(s.getUser_id());
                user = user.getUserInfoById();
                s.setUser(user);

                s.setContent(rs.getString("content"));
                s.setTitle(rs.getString("title"));
                s.setTime(rs.getString("time"));
                messages.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        return messages;
    }

    public void addMessage() {
        System.out.println("Message.addMessage()");
        String query = "INSERT INTO t_message(user_id,title,content,`time`) VALUES(?, ?, ?, NOW())";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, user_id);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            int re = pstmt.executeUpdate();
            System.out.println("Message.addMessage() 成功！");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Message.class.getSimpleName() + "[", "]")
                .add("id=" + id)
                .add("user_id=" + user_id)
                .add("title='" + title + "'")
                .add("content='" + content + "'")
                .add("time='" + time + "'")
                .add("user=" + user)
                .toString();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

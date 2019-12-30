package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Reply {
    private Integer replyid;
    private Integer messageid;
    private Integer user_id;
    private String title;
    private String content;
    private String time;

    /**
     * 回复信息的用户
     */
    private User user;

    /**
     * 通过id修改回复信息
     */
    public void updateReplyById(){
        System.out.println("Reply.updateReplyById");
        // 删除信息
        // 删除回复信息
        String query_r = "update t_Reply set title=?, content=?  WHERE `replyid` = ?";
        Connection conn = null;
        PreparedStatement pstmt_r = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt_r = conn.prepareStatement(query_r);
            pstmt_r.setString(1, title);
            pstmt_r.setString(2, content);
            pstmt_r.setInt(3, replyid);
            pstmt_r.executeUpdate();
            System.out.println("updateReplyById   success");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_r, null);
        }
    }

    public void deleteReplyById(){
        System.out.println("Reply.deleteReplyById()");
        // 删除信息
        // 删除回复信息
        String query_r = "DELETE FROM t_Reply WHERE `replyid` = ?";
        Connection conn = null;
        PreparedStatement pstmt_r = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt_r = conn.prepareStatement(query_r);
            pstmt_r.setInt(1, this.replyid);
            pstmt_r.executeUpdate();
            System.out.println("delete reply success");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_r, null);
        }
    }

    /**
     *  获取所有的回复信息
     * @return
     */
    public List<Reply> getReplies(){
        System.out.println("getMessage");
        String query_reply = "SELECT * FROM t_reply";
        List<Reply> replies = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt_reply = null;
        ResultSet rs_reply = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            //  评论的回复
            pstmt_reply = conn.prepareStatement(query_reply);
            rs_reply = pstmt_reply.executeQuery();
            while(rs_reply.next()){
                Reply r = new Reply();
                r.setReplyid(rs_reply.getInt("replyid"));
                r.setMessageid(rs_reply.getInt("messageid"));
                r.setTitle(rs_reply.getString("title"));
                r.setContent(rs_reply.getString("content"));
                r.setTime(rs_reply.getString("time"));
                r.setUser_id(rs_reply.getInt("user_id"));

                // 获取用户信息
                User user = new User();
                user.setId(r.getUser_id());
                user = user.getUserInfoById();
                r.setUser(user);

                replies.add(r);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_reply, null);
        }
        return replies;
    }

    /**
     *  添加一条回复
     */
    public Reply addReply(){
        System.out.println("Reply.AddReplyAction()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            String query = "INSERT INTO t_reply(messageid,title,content, user_id,`time`) VALUES(?,?,?,?,NOW())";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, messageid);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setInt(4, user_id);
            int re = pstmt.executeUpdate();
            if(re > 0){
                return this;
            }
            // if no error back to message
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
        System.out.println("add reply error");
        return null;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
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

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

}

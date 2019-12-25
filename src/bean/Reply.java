package bean;

import util.C3P0JdbcUtil;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Reply {
    private int replyid;
    private int messageid;
    private String title;
    private String content;
    private String username;
    private String email;
    private String phonenum;
    private String time;

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
                r.setUsername(rs_reply.getString("username"));
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
            String query = "INSERT INTO t_reply(messageid,title,content,username,email,phonenum,`time`) VALUES(?,?,?,?,?,?,NOW())";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, messageid);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setString(4, username);
            pstmt.setString(5, email);
            pstmt.setString(6, phonenum);
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



    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getReplyid() {
        return replyid;
    }

    public void setReplyid(int replyid) {
        this.replyid = replyid;
    }

    public int getMessageid() {
        return messageid;
    }

    public void setMessageid(int messageid) {
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

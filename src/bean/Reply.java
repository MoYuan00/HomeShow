package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Reply {
    private int replyid;
    private int messageid;
    private String title;
    private String content;
    private String username;
    private String email;
    private String phonenum;
    private String time;

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

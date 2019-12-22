package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 */
public class User {
    private int id;
    private String username;
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 查询密码和用户名是否匹配
     * @return 成功返回用户，失败返回null
     */
    public User selectByNameAndPassword(){
        System.out.println("User.login()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "select * from t_user where username =? and password=? ";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            // 如果登录成功
            if(rs.next()){
                this.id = rs.getInt("id");
                System.out.println("成功！" + username);
                return this;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
			C3P0JdbcUtil.release(conn, pstmt, rs);
		}
        System.out.println("失败！");
        return null;// 失败
    }

    /**
     * 添加一个用户
     * @return 返回
     */
    public User addUser(){
        System.out.println("User.register()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "insert into t_user (username, password) values(?, ?) ";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            int re = pstmt.executeUpdate();
            if(re > 0){// 注册成功！
                System.out.println("添加成功！");
                return selectByNameAndPassword();// 调用登录查询用户信息
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
        System.out.println("添加失败！");
        return null;
    }
}

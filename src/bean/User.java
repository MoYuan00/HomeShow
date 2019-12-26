package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class User {
    private int id;
    private String username;
    private String password;

    /**
     * 更新用户信息
     */
    public void updateUserById(){
        System.out.println("User.updateUserById()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "update t_user set username=?,password=? where id=?";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setInt(3, id);
            int re = pstmt.executeUpdate();
            System.out.println("User.updateUserById() 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }

    /**
     * 删除一个用户
     */
    public void deleteUserById(){
        System.out.println("User.deleteUser()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "delete from t_user where id=?";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            int re = pstmt.executeUpdate();
            System.out.println("User.deleteUser() 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
    /**
     * 获取所有的用户信息
     * @return
     */
    public List<User> getUsers(){
        System.out.println("User.getUsers()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "select * from t_user";
        List<User> users = new ArrayList<>();
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()){
                User user = new User();
                user.id = rs.getInt("id");
                user.username = rs.getString("username");
                user.password = rs.getString("password");
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, rs);
        }
        System.out.println(users.size());
        return users;
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


}

package bean;

import util.C3P0JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

/**
 *
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer age;
    private String birthday;
    private String email;
    private String tel;
    /**
     * 头像
     */
    private String portrait_image;

    /**
     *  更新用户的头像
     */
    public void updateUserPortrait_image(){
        System.out.println("User.updateUserPortrait_image()");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "update t_user set " +
                " portrait_image=? " +
                " where id=?";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, portrait_image);
            pstmt.setInt(2, id);
            int re = pstmt.executeUpdate();
            System.out.println("User.updateUserPortrait_image() 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
    /**
     * 通过id获取用户的所有信息
     * @return
     */
    public User getUserInfoById(){
        System.out.println("User.getUserInfoById");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "select * from t_user where id=?";
        ResultSet re = null;
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            re =  pstmt.executeQuery();
            User user = new User();
            if(re.next()){
                user.setId(re.getInt("id"));
                user.setUsername(re.getString("username"));
                user.setPassword(re.getString("password"));
                user.setAge(re.getInt("age"));
                user.setEmail(re.getString("email"));
                user.setPortrait_image(re.getString("portrait_image"));
                user.setTel(re.getString("tel"));
                user.setBirthday(re.getString("birthday"));
            }
            System.out.println("User.getUserInfoById() 成功！" + user);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, re);
        }
        return null;
    }

    /**
     *  更新用户的所有信息
     */
    public void updateUserInfoById(){
        System.out.println("User.updateUserInfoById");
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "update t_user set " +
                " username=?,password=?,age=?,birthday=?,email=?,tel=? " +
                " where id=?";
        try {
            conn = C3P0JdbcUtil.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setInt(3, age);
            pstmt.setString(4, birthday);
            pstmt.setString(5, email);
            pstmt.setString(6, tel);
            pstmt.setInt(7, id);
            int re = pstmt.executeUpdate();
            System.out.println("User.updateUserInfoById() 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt, null);
        }
    }
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
     * @return 成功返回用户(包括id)，失败返回null
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
                System.out.println("成功 selectByNameAndPassword: " + username);
                return this;
            }
            return null;
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

    @Override
    public String toString() {
        return new StringJoiner(", ", User.class.getSimpleName() + "[", "]")
                .add("id=" + id)
                .add("username='" + username + "'")
                .add("password='" + password + "'")
                .add("age=" + age)
                .add("birthday='" + birthday + "'")
                .add("email='" + email + "'")
                .add("tel='" + tel + "'")
                .add("portrait_image='" + portrait_image + "'")
                .toString();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPortrait_image() {
        return portrait_image;
    }

    public void setPortrait_image(String portrait_image) {
        this.portrait_image = portrait_image;
    }
}

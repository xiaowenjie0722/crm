package util;

import com.mysql.jdbc.Connection;
import domain.Customer;
import domain.LimitInfo;
import domain.User;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcUtil {
    public static  List<Customer> customerSelect(String sql, Object... object) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        if (object!=null){
            for (int i=0;i<object.length;i++){
                if (object[i]!=null) {
                    ps.setObject(i + 1, object[i]);
                }
            }
        }
        ResultSet rs=ps.executeQuery();
        List<Customer> list=new ArrayList<>();
        while (rs.next()){
            Customer customer =new Customer();
            customer.setLimit_id(rs.getInt("limit_id"));
            customer.setId(rs.getInt("id"));
            customer.setUsername(rs.getString("username"));
            customer.setRealname(rs.getString("realname"));
            customer.setEmail(rs.getString("email"));
            customer.setPhone(rs.getString("phone"));
            customer.setAddress(rs.getString("address"));
            customer.setState(rs.getInt("state"));
            list.add(customer);
        }
        rs.close();
        ps.close();
        conn.close();
        return list;
    }
    public static int Update(String sql, Object... object) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        for (int i=0;i<object.length;i++){
            ps.setObject(i + 1, object[i]);
        }
        int row=ps.executeUpdate();
        ps.close();
        conn.close();
        return row;
    }
    public static int login(String sql, Object... object) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        if (object!=null){
            for (int i=0;i<object.length;i++){
                if (object[i]!=null) {
                    ps.setObject(i + 1, object[i]);
                }
            }
        }
        ResultSet rs=ps.executeQuery();
        int id = 0;
        while (rs.next()){
            id=rs.getInt("id");
        }
        rs.close();
        ps.close();
        conn.close();
        return id;
    }
    public static List<User> userSelect(String sql, Object... object) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        if (object!=null){
            for (int i=0;i<object.length;i++){
                if (object[i]!=null) {
                    ps.setObject(i + 1, object[i]);
                }
            }
        }
        ResultSet rs=ps.executeQuery();
        List<User> list=new ArrayList<>();
        while (rs.next()){
            User user=new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setPassword(rs.getString("password"));
            user.setLimitNum(rs.getInt("limitNum"));
            user.setTel(rs.getString("tel"));
            list.add(user);
        }
        rs.close();
        ps.close();
        conn.close();
        return list;
    }
    public static int page(String sql, Object... object) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        if (object!=null){
            for (int i=0;i<object.length;i++){
                if (object[i]!=null) {
                    ps.setObject(i + 1, object[i]);
                }
            }
        }
        ResultSet rs=ps.executeQuery();
        int count = 0;
        while (rs.next()){
            count=rs.getInt("COUNT(id)");
        }
        rs.close();
        ps.close();
        conn.close();
        return count;
    }

    /**
     * 通过id查询用户信息
     * @param sql
     * @param id
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static User selectUserById(String sql, int id)throws ClassNotFoundException, SQLException {
        User user=new User();
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setLimitNum(rs.getInt("limitNum"));
            user.setPassword(rs.getString("password"));
            user.setTel(rs.getString("tel"));
        }
        return user;
    }
    /**
     * 查询所有权限表的信息
     * @param sql
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static List<LimitInfo> listInfo(String sql) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        List<LimitInfo> list=new ArrayList<>();
        while(rs.next()){
            LimitInfo limitInfo=new LimitInfo();
            limitInfo.setId(rs.getInt("id"));
            limitInfo.setLimitname(rs.getString("limitname"));
            limitInfo.setInfo(rs.getString("info"));
            limitInfo.setLimitstatus(rs.getInt("limitstatus"));
            list.add(limitInfo);
        }
        return list;
    }

    /**
     * 更新权限表的信息
     * @param sql
     * @param objects
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static int updateInfo(String sql,Object... objects) throws ClassNotFoundException, SQLException{
        int row=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        for (int i = 0; i < objects.length; i++) {
            ps.setObject(i + 1, objects[i]);
        }
        row = ps.executeUpdate();
        ps.close();
        conn.close();
        return row;
    }
    public static LimitInfo selectLimitInfoById(String sql,int id)throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm","root","1234");
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs=ps.executeQuery();
        LimitInfo limitInfo=new LimitInfo();
        if(rs.next()){
            limitInfo.setId(rs.getInt("id"));
            limitInfo.setInfo(rs.getString("info"));
            limitInfo.setLimitname(rs.getString("limitname"));
            limitInfo.setLimitstatus(rs.getInt("limitstatus"));
        }
        return limitInfo;
    }
   /* public static int edit(String sql)throws ClassNotFoundException, SQLException{
        int row=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://192.168.5.114:3306/crm", "root", "root");
        PreparedStatement ps = conn.prepareStatement(sql);
        row=ps.executeUpdate();
        return row;
    }*/
}

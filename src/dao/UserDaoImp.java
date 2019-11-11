package dao;

import domain.User;
import util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImp implements UserDao {
    @Override
    public int login(String name, String password, int limit) throws SQLException, ClassNotFoundException {
        return JdbcUtil.login("SELECT * FROM user_limit WHERE NAME=? AND PASSWORD=? AND limitNum=?",name,password,limit);
    }
    @Override
    public List<User> userMenu() throws SQLException, ClassNotFoundException {
        return JdbcUtil.userSelect("SELECT * FROM user_limit");
    }
    @Override
    public int userUpdate(String name,String password,int limitNum,String tel,int id) throws SQLException, ClassNotFoundException {
        return JdbcUtil.Update("UPDATE user_limit SET NAME=?,PASSWORD=?,limitNum=?,tel=? WHERE id=?",name,password,limitNum,tel,id);
    }

    @Override
    public User userSelectById(int id) throws SQLException, ClassNotFoundException {
        return JdbcUtil.selectUserById("select * from user_limit where id=?",id);
    }

    @Override
    public List<User> userSelect(int id) throws SQLException, ClassNotFoundException {
        return JdbcUtil.userSelect("SELECT * FROM user_limit WHERE id=?",id);
    }

    @Override
    public int editInfo(User user) throws ClassNotFoundException, SQLException {
        return JdbcUtil.Update("UPDATE user_limit SET NAME=?,PASSWORD=?,limitNum=?,tel=? WHERE id=?",
                user.getName(),user.getPassword(),user.getLimitNum(),user.getTel(),user.getId());
    }

    @Override
    public int addInfo(User user) throws ClassNotFoundException, SQLException {
        return JdbcUtil.updateInfo("INSERT INTO user_limit (NAME,PASSWORD,limitNum,tel) values (?,?,?,?)",
                user.getName(),user.getPassword(),user.getLimitNum(),user.getTel());
    }

    @Override
    public int deleteInfo(String name) throws ClassNotFoundException, SQLException {
        return JdbcUtil.Update("delete from user_limit where name=?",name);
    }
    @Override
    public int userUpdatePass(int limit_id,String password,String repass) throws SQLException, ClassNotFoundException {
        return JdbcUtil.Update("UPDATE user_limit SET PASSWORD=? WHERE id=? AND PASSWORD=?",repass,limit_id,password);
    }
}

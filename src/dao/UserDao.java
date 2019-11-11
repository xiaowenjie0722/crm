package dao;

import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    public abstract int login(String name, String password, int limit) throws SQLException, ClassNotFoundException;
    public abstract List<User> userMenu() throws SQLException, ClassNotFoundException;
    public abstract int userUpdate(String name, String password, int limitNum, String tel, int id) throws SQLException, ClassNotFoundException;
    public abstract  List<User> userSelect(int id) throws SQLException, ClassNotFoundException;
    public abstract User userSelectById(int id) throws SQLException, ClassNotFoundException;
    public abstract  int editInfo(User user) throws ClassNotFoundException, SQLException;
    public abstract  int addInfo(User user) throws ClassNotFoundException, SQLException;
    public abstract int deleteInfo(String name) throws ClassNotFoundException, SQLException;
    public abstract  int userUpdatePass(int limit_id, String password, String repass) throws SQLException, ClassNotFoundException;
}

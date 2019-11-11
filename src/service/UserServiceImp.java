package service;

import dao.UserDao;
import dao.UserDaoImp;
import domain.LimitInfo;
import domain.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImp implements UserService {
    UserDao userDao=new UserDaoImp();
    @Override
    public int login(String name, String password, int limit) throws SQLException, ClassNotFoundException {
        return userDao.login(name,password,limit);
    }

    @Override
    public List<User> userMenu() throws SQLException, ClassNotFoundException {
        return userDao.userMenu();
    }

    @Override
    public int userUpdate(String name, String password, int limitNum, String tel, int id) throws SQLException, ClassNotFoundException {
        return userDao.userUpdate(name,password,limitNum,tel,id);
    }

    @Override
    public List<User> userSelect(int id) throws SQLException, ClassNotFoundException {
        return userDao.userSelect(id);
    }

    @Override
    public User userSelectById(int id) throws SQLException, ClassNotFoundException {
        return userDao.userSelectById(id);
    }

    @Override
    public int editInfo(User user) throws ClassNotFoundException, SQLException {
        return userDao.editInfo(user);
    }

    @Override
    public int addInfo(User user) throws ClassNotFoundException, SQLException {
        return userDao.addInfo(user);
    }

    @Override
    public int deleteInfo(String name) throws ClassNotFoundException, SQLException {
        return userDao.deleteInfo(name);
    }
    @Override
    public int userUpdatePass(int limit_id,String password,String repass) throws SQLException, ClassNotFoundException {
        return userDao.userUpdatePass(limit_id,password,repass);
    }
    /**
     * 查询到所有权限表的id，并形成list集合
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<Integer> listId()throws SQLException, ClassNotFoundException{
        List<User> list=userDao.userMenu();
        List<Integer> logId=new ArrayList<>();
        for(User user:list){
            logId.add(user.getId());
        }
        return logId;
    }
}

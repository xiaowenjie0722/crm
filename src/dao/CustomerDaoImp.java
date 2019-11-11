package dao;

import domain.Customer;
import util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class CustomerDaoImp implements CustomerDao {


    @Override
    public List<Customer> customerSelect(int id, int limit_id) throws ClassNotFoundException, SQLException {
        return JdbcUtil.customerSelect("SELECT * FROM customer WHERE id=? AND limit_id=?",id,limit_id);
    }

    @Override
    public int customerUpdate(String username,String realname,String email,String phone,String address,int state,int id,int limit_id) throws ClassNotFoundException, SQLException {
        return JdbcUtil.Update("UPDATE customer SET username=?,realname=?,email=?,phone=?,address=?,state=? WHERE id=? AND limit_id=?",username,realname,email,phone,address,state,id,limit_id);
    }

    @Override
    public int customerAdd(String username,String realname,String email,String phone,String address,int state,int limit_id) throws SQLException, ClassNotFoundException {
       return JdbcUtil.Update("INSERT INTO customer(username,realname,email,phone,address,state,limit_id) VALUES (?,?,?,?,?,?,?)",username,realname,email,phone,address,state,limit_id);
    }

    @Override
    public List<Customer> customerMenu(int page, int limit_id) throws SQLException, ClassNotFoundException {
        return JdbcUtil.customerSelect("SELECT * FROM (SELECT @rownum:=@rownum+1 AS idd, customer.* FROM customer,(SELECT @rownum:=0) r WHERE limit_id=?) b WHERE b.idd>? ORDER BY b.idd LIMIT 3",limit_id,3*(page-1));
    }

    @Override
    public int page(int id) throws SQLException, ClassNotFoundException {
        return JdbcUtil.page("SELECT COUNT(id) FROM customer WHERE limit_id=?",id);
    }
    @Override
    public  int adminPage() throws SQLException, ClassNotFoundException{
        return JdbcUtil.page("SELECT COUNT(id) FROM customer");
    }
    @Override
    public int userDelete(String name) throws SQLException, ClassNotFoundException {
        return  JdbcUtil.Update("DELETE FROM customer WHERE username=?",name);
    }
    @Override
    public List<Customer> AdminMenu(int page)throws SQLException, ClassNotFoundException{
        return JdbcUtil.customerSelect("SELECT * FROM (SELECT @rownum:=@rownum+1 AS idd, customer.* FROM customer,(SELECT @rownum:=0) r) b WHERE b.idd>? ORDER BY b.idd LIMIT 3",3*(page-1));
    }
}

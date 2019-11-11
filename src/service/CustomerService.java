package service;

import domain.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    public abstract List<Customer> customerSelect(int id, int limit_id) throws ClassNotFoundException, SQLException;
    public abstract int customerUpdate(String username, String realname, String email, String phone, String address, int state, int id, int limit_id) throws ClassNotFoundException, SQLException;
    public abstract List<Customer> customerMenu(int page, int limit_id) throws SQLException, ClassNotFoundException;
    public int page(int id) throws SQLException, ClassNotFoundException;
    public int userDelete(String name) throws SQLException, ClassNotFoundException;
    public int customerAdd(String username, String realname, String email, String phone, String address, int state, int limit_id) throws SQLException, ClassNotFoundException;
    public List<Customer> AdminMenu(int page)throws SQLException, ClassNotFoundException;
    public  int adminPage() throws SQLException, ClassNotFoundException;
}

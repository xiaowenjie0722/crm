package service;

import dao.CustomerDao;
import dao.CustomerDaoImp;
import domain.Customer;
import domain.LimitInfo;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImp implements CustomerService {
    CustomerDao customerDao=new CustomerDaoImp();

    @Override
    public List<Customer> customerSelect(int id, int limit_id) throws ClassNotFoundException, SQLException {
        return customerDao.customerSelect(id,limit_id);
    }

    @Override
    public int customerUpdate(String username,String realname,String email,String phone,String address,int state,int id,int limit_id) throws ClassNotFoundException, SQLException {
        return customerDao.customerUpdate(username,realname,email,phone,address,state,id,limit_id);
    }


    @Override
    public List<Customer> customerMenu(int page, int limit_id) throws SQLException, ClassNotFoundException {
        return customerDao.customerMenu(page,limit_id);
    }

    @Override
    public int page(int id) throws SQLException, ClassNotFoundException {
        return customerDao.page(id);
    }

    @Override
    public int userDelete(String name) throws SQLException, ClassNotFoundException {
        return customerDao.userDelete(name);
    }

    @Override
    public int customerAdd(String username, String realname, String email, String phone, String address, int state, int limit_id) throws SQLException, ClassNotFoundException {
        return customerDao.customerAdd(username,realname,email,phone,address,state,limit_id);
    }
    public List<Customer> AdminMenu(int page)throws SQLException, ClassNotFoundException{
        return customerDao.AdminMenu(page);
    }
    public  int adminPage() throws SQLException, ClassNotFoundException{
        return customerDao.adminPage();
    }

}

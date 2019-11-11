package servlet;

import domain.Customer;
import service.CustomerServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/customerSelect")
public class CustmerSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        if (session.getAttribute("id")==null){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        int limit_id= (int) session.getAttribute("id");
        int id=Integer.parseInt(req.getParameter("customer_id"));
        CustomerServiceImp cs=new CustomerServiceImp();
        List<Customer> customers = null;
        try {
            customers= cs.customerSelect(id,limit_id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("customers",customers);
        req.setAttribute("id",id);
        req.getRequestDispatcher("updateCustomer.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

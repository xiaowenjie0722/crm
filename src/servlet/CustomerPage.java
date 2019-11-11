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

@WebServlet("/customerPage")
public class CustomerPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        if (session.getAttribute("id")==null){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        int limit_id= (int) session.getAttribute("id");
        int status=(int)session.getAttribute("status");
        int page=1;
        int pages=0;
        if (!req.getParameter("page").equals("1")){
            page=Integer.parseInt(req.getParameter("page"));
        }
        CustomerServiceImp cs=new CustomerServiceImp();
        List<Customer> customers = null;
        int pageNum=0;
        try {
            if (status==1) {
                pageNum=cs.page(limit_id);
                if(pageNum%3==0){
                    pages=pageNum/3;
                }else {
                    pages=pageNum/3+1;
                }
                if (page>pages){
                    page=pages;
                }else if (page<1){
                    page=1;
                }
                customers = cs.customerMenu(page, limit_id);
            }else if(status==0||status==2){
                pageNum=cs.adminPage();
                if(pageNum%3==0){
                    pages=pageNum/3;
                }else {
                    pages=pageNum/3+1;
                }
                if (page>pages){
                    page=pages;
                }else if (page<1){
                    page=1;
                }
                customers = cs.AdminMenu(page);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        req.setAttribute("customers",customers);
        req.setAttribute("page",page);
        req.setAttribute("pages",pages);
        req.getRequestDispatcher("customer.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

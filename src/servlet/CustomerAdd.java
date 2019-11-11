package servlet;

import service.CustomerServiceImp;
import util.OutputUtil;
import util.TimeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/customerAdd")
public class CustomerAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("id") == null) {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        int limit_id = (int) session.getAttribute("id");
        String username = req.getParameter("username");
        String realname = req.getParameter("realname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        int state = Integer.parseInt(req.getParameter("situation"));
        CustomerServiceImp cs = new CustomerServiceImp();
        int num = 0;
        try {
            num = cs.customerAdd(username, realname, email, phone, address, state, limit_id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (num > 0) {
            File file=new File(req.getServletContext().getRealPath("")+limit_id+"_log.txt");
            if (!file.exists()){
                file.createNewFile();
            }
            try {
                String log = TimeUtil.time() + " 用户：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：添加客户：" + username;
                System.out.println(log);
                OutputUtil.output(log, req.getServletContext().getRealPath("") + limit_id+"_log.txt");
            } catch (Exception e) {
                System.out.println("写入日志文件异常" + e.getMessage());
            }}
            req.getRequestDispatcher("/customerMenu").forward(req, resp);

    }
}

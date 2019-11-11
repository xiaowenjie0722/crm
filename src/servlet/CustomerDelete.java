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

@WebServlet("/customerDelete")
public class CustomerDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        if (session.getAttribute("id")==null){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        String name=req.getParameter("name");
        int id=(int)session.getAttribute("id");
        CustomerServiceImp cs=new CustomerServiceImp();
        int num = 0;
        try {
           num=cs.userDelete(name);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (num>0){
            try {
                File file=new File(req.getServletContext().getRealPath("")+id+"_log.txt");
                if (!file.exists()){
                    file.createNewFile();
                }
                String log = TimeUtil.time() + " 用户：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：删除客户：" + name;
                System.out.println(log);
                OutputUtil.output(log, req.getServletContext().getRealPath("") + id+"_log.txt");
            } catch (Exception e) {
                System.out.println("写入日志文件异常" + e.getMessage());
            }
            req.getRequestDispatcher("/customerMenu").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

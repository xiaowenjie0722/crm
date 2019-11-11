package servlet;

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

@WebServlet("/quit")
public class quit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int limit_id=(int)session.getAttribute("id");
        File file=new File(req.getServletContext().getRealPath("")+limit_id+"_log.txt");
        if (!file.exists()){
            file.createNewFile();
        }
        try {
            String log = TimeUtil.time() + " 用户：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：退出登录" ;
            System.out.println(log);
            OutputUtil.output(log, req.getServletContext().getRealPath("") + limit_id+"_log.txt");
        } catch (Exception e) {
            System.out.println("写入日志文件异常" + e.getMessage());
        }
        session.invalidate();
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

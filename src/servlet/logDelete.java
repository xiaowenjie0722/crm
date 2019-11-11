package servlet;

import util.LogDelete;
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

@WebServlet("/logDelete")
public class logDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session=req.getSession();
            int id=(int)session.getAttribute("id");
            File file=new File(req.getServletContext().getRealPath("")+id+"_log.txt");
            if (!file.exists()){
                file.createNewFile();
            }
            String log= "";
            LogDelete.logDelete(log,req.getServletContext().getRealPath("")+id+"_log.txt");
        }catch (Exception e){
            System.out.println("写入日志文件异常"+e.getMessage());
        }
        resp.sendRedirect("/logServlet");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

package servlet;

import service.UserServiceImp;
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

@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if (session.getAttribute("id")==null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int limit_id= (int) session.getAttribute("id");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        UserServiceImp usi=new UserServiceImp();
        int result = 0;
        try {
            result = usi.userUpdatePass(limit_id,oldPassword,newPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(result == 0){
            String error = "修改密码失败！";
            request.setAttribute("return", error);
            request.getRequestDispatcher("editPwd.jsp").forward(request,response);
        }else{
            try {
                File file=new File(request.getServletContext().getRealPath("")+limit_id+"_log.txt");
                if (!file.exists()){
                    file.createNewFile();
                }
                String log= TimeUtil.time()+" 用户："+session.getAttribute("name")+" 编号："+session.getAttribute("id")+" 操作：修改密码";
                OutputUtil.output(log,request.getServletContext().getRealPath("")+limit_id+"_log.txt");
            }catch (Exception e){
                System.out.println("写入日志文件异常"+e.getMessage());
            }
            String error = "修改密码成功！";
            request.setAttribute("return", error);
            request.getRequestDispatcher("editPwd.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

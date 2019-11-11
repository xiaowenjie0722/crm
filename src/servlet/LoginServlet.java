package servlet;

import service.UserServiceImp;
import util.JdbcUtil;
import util.OutputUtil;
import util.TimeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session=request.getSession();
        UserServiceImp us = new UserServiceImp();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        System.out.println(password);
        String l = request.getParameter("limit");
       /* String statusStr=request.getParameter("status");
        int status=Integer.parseInt(statusStr);*/
       /* System.out.println(status);*/
        int limit = Integer.parseInt(l);
        int id=0;
        try {
            id=us.login(name,password,limit);
        } catch (SQLException e) {
        } catch (ClassNotFoundException e) {
        }
        if (id!=0){
            try {
                File file=new File(request.getServletContext().getRealPath("")+id+"_log.txt");
                if (!file.exists()){
                    file.createNewFile();
                }
                String log=TimeUtil.time()+" 用户："+name+" 编号："+id+" 操作：登录";
                OutputUtil.output(log,request.getServletContext().getRealPath("")+id+"_log.txt");
            }catch (Exception e){
                System.out.println("写入日志文件异常"+e.getMessage());
            }
            response.getWriter().print("true");
            session.setAttribute("status",limit);
            session.setAttribute("name",name);
            session.setAttribute("id",id);
            request.getRequestDispatcher("/main.jsp").forward(request,response);
        }else {
            request.setAttribute("error","用户不存在或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
//        out.close();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}

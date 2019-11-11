package servlet;

import service.LimitServiceImp;
import service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/logServlet")
public class logServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int limit_id=(int)session.getAttribute("id");
        int status=(int)session.getAttribute("status");
        List<String> log = new ArrayList<>();
        if (status==1) {
            File file=new File(req.getServletContext().getRealPath("") + limit_id + "_log.txt");
            if (!file.exists()){
                file.createNewFile();
            }
            FileReader fr = new FileReader(req.getServletContext().getRealPath("") + limit_id + "_log.txt");
            BufferedReader bf = new BufferedReader(fr);
            String str;
            while ((str = bf.readLine()) != null) {
                log.add(str);
                str = null;
            }
            bf.close();
            fr.close();
        }else if(status==0||status==2){
            UserServiceImp ls=new UserServiceImp();
            List<Integer> listId=new ArrayList<>();
            try{
                listId=ls.listId();
            }catch (Exception e){
                System.out.println("查询权限id异常"+e.getMessage());
            }
            FileReader fr;
            BufferedReader bf;
           for (int id:listId){
               File file=new File(req.getServletContext().getRealPath("") + id + "_log.txt");
               if (!file.exists()){
                   file.createNewFile();
               }
               fr = new FileReader(req.getServletContext().getRealPath("") + id + "_log.txt");
               bf = new BufferedReader(fr);
               String str;
               while ((str = bf.readLine()) != null) {
                   log.add(str);
                   str = null;
               }
               bf.close();
               fr.close();
           }
        }
        req.setAttribute("log",log);
        req.getRequestDispatcher("log.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

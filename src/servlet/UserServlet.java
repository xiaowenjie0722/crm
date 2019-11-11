package servlet;

import domain.User;
import service.UserService;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        if (session.getAttribute("id")==null){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        String type=req.getParameter("type");
        System.out.println(type+"type");
        if(type==null||type.equals("".trim())){
            //用户信息展示
            userList(req,resp);
        }else if(type.equals("del")){
            String name=req.getParameter("name");
            System.out.println(name);
//            int id=Integer.parseInt(idStr);
            //删除用户信息
            del(name,req,resp);
        }else if(type.equals("edit")){
            //修改用户信息展示
            String idStr=req.getParameter("userid");
            int id=Integer.parseInt(idStr);
            System.out.println("editId"+id);
            editInfo(id,req,resp);
        }else if(type.equals("update")){
            //修改用户操作
            edit(req,resp);
        }else if(type.equals("add")){
            //添加用户
            add(req,resp);
        }
    }

    /**
     * 用户信息展示
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void userList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService=new UserServiceImp();
        List<User> list=new ArrayList<>();
        try {
            list= userService.userMenu();
        }catch (Exception e){
            System.out.println("用户查询异常"+e.getMessage());
        }
        req.setAttribute("userlist",list);
        req.getRequestDispatcher("/user_limit/userlist.jsp").forward(req,resp);
    }

    public static void del(String name,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        UserService userService=new UserServiceImp();
            List<User> list=null;
            String msg=null;
            int row=0;
            try{
                    File file=new File(req.getServletContext().getRealPath("")+session.getAttribute("id")+"_log.txt");
                    if (!file.exists()){
                        file.createNewFile();
                    }
                    String log = TimeUtil.time() + " 管理员：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：删除用户：" + name;
                    System.out.println(log);
                    OutputUtil.output(log, req.getServletContext().getRealPath("") + session.getAttribute("id")+"_log.txt");
                row=userService.deleteInfo(name);
                System.out.println(row);
                list=userService.userMenu();
            }catch (Exception e){
                System.out.println("删除用户信息异常"+e.getMessage());
            }finally {
                if(row==0){
                    msg="该用户负责的客户跟进中不能被删除，解除其工作才能被删除";
                    System.out.println(msg);
                    try{
                        list=userService.userMenu();
                        System.out.println(list);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                req.setAttribute("msg",msg);
//                req.setAttribute("msg","<script>alert('该用户负责的客户跟进中不能被删除，解除其工作才能被删除')</script>");
                req.setAttribute("userlist",list);
                req.getRequestDispatcher("/user_limit/userlist.jsp").forward(req,resp);
            }
    }
    /**
     * 修改信息展示
     * @param id
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void editInfo(int id,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        UserService userService=new UserServiceImp();
        User user=new User();
        List<User> userList=new ArrayList<>();
        try{
            user=userService.userSelectById(id);
            userList=userService.userMenu();
        }catch (Exception e){
            System.out.println("修改信息展示异常"+e.getMessage());
        }
        req.setAttribute("user",user);
        req.getRequestDispatcher("/user_limit/useredit.jsp").forward(req,resp);
    }

    /**
     * 修改信息更新
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        UserService userService=new UserServiceImp();
        User user=new User();
        String idStr=req.getParameter("infoid");
        int id=Integer.parseInt(idStr);
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String limitNumStr=req.getParameter("limitNum");
        int limitNum=Integer.parseInt(limitNumStr);
        String tel=req.getParameter("tel");
        List<User> list=null;
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setLimitNum(limitNum);
        user.setTel(tel);
        try{
            userService.editInfo(user);
            list=userService.userMenu();
            File file=new File(req.getServletContext().getRealPath("")+session.getAttribute("id")+"_log.txt");
            if (!file.exists()){
                file.createNewFile();
            }
            String limitname=null;
            if(limitNum==0){
                limitname="管理员";
            }else if (limitNum==1){
                limitname="业务员";
            }else if (limitNum==2){
                limitname="客户经理";
            }
            String log = TimeUtil.time() + " 管理员：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：修改用户：" + name+" 权限："+limitname;
            System.out.println(log);
            OutputUtil.output(log, req.getServletContext().getRealPath("") + session.getAttribute("id")+"_log.txt");
        }catch (Exception e){
            System.out.println("修改信息更新异常："+e.getMessage());
        }
        req.setAttribute("userlist",list);
        req.getRequestDispatcher("/user_limit/userlist.jsp").forward(req,resp);
    }

    /**
     * 添加信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        UserService userService=new UserServiceImp();
        User user=new User();
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String limitNumStr=req.getParameter("limitNum");
        int limitNum=Integer.parseInt(limitNumStr);
        String tel=req.getParameter("tel");
        List<User> list=null;
        try{
            user.setName(name);
            user.setPassword(password);
            user.setLimitNum(limitNum);
            user.setTel(tel);
            userService.addInfo(user);
            list=userService.userMenu();
            File file=new File(req.getServletContext().getRealPath("")+session.getAttribute("id")+"_log.txt");
            if (!file.exists()){
                file.createNewFile();
            }
            String limitname=null;
            if(limitNum==0){
                limitname="管理员";
            }else if (limitNum==1){
                limitname="业务员";
            }else if (limitNum==2){
                limitname="客户经理";
            }
                String log = TimeUtil.time() + " 管理员：" + session.getAttribute("name") + " 编号：" + session.getAttribute("id") + " 操作：添加用户：" + name+" 权限："+limitname;
                System.out.println(log);
                OutputUtil.output(log, req.getServletContext().getRealPath("") + session.getAttribute("id")+"_log.txt");
        }catch (Exception e){
            System.out.println("添加信息更新异常："+e.getMessage());
        }
        req.setAttribute("userlist",list);
        req.getRequestDispatcher("/user_limit/userlist.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}

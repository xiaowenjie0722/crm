package servlet;

import domain.LimitInfo;
import service.LimitService;
import service.LimitServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/limitServlet")
public class LimitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        if (session.getAttribute("id")==null){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        String type=req.getParameter("type");
        System.out.println("type1:"+type);
        List<LimitInfo> list=new ArrayList<>();
        int row=0;
        if(type==null||type.equals("".trim())){
            //展示信息
            show(req,resp);
        }else if(type.equals("edit")){
            String idStr=req.getParameter("infoid");
            int id=Integer.parseInt(idStr);
            //修改信息
            editInfo(id,req,resp);
           /* show(req,resp);*/
        }else if(type.equals("update")){
            edit(req,resp);
        }else if(type.equals("del")) {
            String idStr=req.getParameter("infoid");
            int id=Integer.parseInt(idStr);
            //删除信息
            row=del(id);
            show(req,resp);
        }else if(type.equals("add")){
           add(req,resp);
        }

    }

    /**
     * 信息展示
     * @return
     */
    public static List show(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        LimitService limitService=new LimitServiceImp();
        List<LimitInfo> list=new ArrayList<>();
        try{
            list=limitService.listInfo();
        }catch (Exception e){
            System.out.println("展示异常"+e.getMessage());
        }
        req.setAttribute("list",list);
        req.getRequestDispatcher("/limitInfo/userLimit.jsp").forward(req,resp);
        return list;
    }

    /**
     * 修改信息展示
     * @param id
     * @return
     */
    public static LimitInfo editInfo(int id,HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        LimitService limitService=new LimitServiceImp();
        LimitInfo listEdit=new LimitInfo();
        try{
            listEdit=limitService.selectLimitInfoById(id);
        }catch (Exception e){
            System.out.println("修改信息显示异常"+e.getMessage());
        }
        req.setAttribute("listEdit",listEdit);
        req.getRequestDispatcher("/limitInfo/limitEdit.jsp").forward(req,resp);
        return listEdit;
    }

    /**
     * 修改更新
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LimitService limitService=new LimitServiceImp();
        LimitInfo limitInfo=new LimitInfo();
        String idStr=req.getParameter("infoid");
        System.out.println(idStr+"idStr");
        int id=Integer.parseInt(idStr);
        String liminame=req.getParameter("liminame");
        System.out.println("limitname"+liminame);
        String info=req.getParameter("info");
        System.out.println("info"+info);
        limitInfo.setId(id);
        limitInfo.setLimitname(liminame);
        limitInfo.setInfo(info);
        List<LimitInfo> list=null;
        try {
            limitService.editInfo(limitInfo);
            list=limitService.listInfo();
            System.out.println("listupdate:"+list);
        }catch (Exception e){
            System.out.println("修改更新异常"+e.getMessage());
        }
        req.setAttribute("list",list);
        req.getRequestDispatcher("/limitInfo/userLimit.jsp").forward(req,resp);
    }
    /**
     * 删除信息
     * @param id
     * @return
     */
    public static int del(int id){
        int row=0;
        LimitService limitService=new LimitServiceImp();
        try {
            row = limitService.deleteInfo(id);
        }catch (Exception e){
            System.out.println("删除异常"+e.getMessage());
        }
        return row;
    }

    /**
     * 添加权限信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public static void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LimitService limitService=new LimitServiceImp();
        LimitInfo limitInfo=new LimitInfo();
        String limitname=req.getParameter("limitname");
        String limitstatusStr=req.getParameter("limitstatus");
        int limitstatus=Integer.parseInt(limitstatusStr);
        System.out.println("limitname"+limitname);
        String info=req.getParameter("info");
//        System.out.println("info"+info);
//        limitInfo.setId(id);
        limitInfo.setLimitname(limitname);
        limitInfo.setLimitstatus(limitstatus);
        limitInfo.setInfo(info);
        List<LimitInfo> list=null;
        try {
            limitService.addInfo(limitInfo);
            list=limitService.listInfo();
            System.out.println("listuadd:"+list);
        }catch (Exception e){
            System.out.println("添加异常"+e.getMessage());
        }
        req.setAttribute("list",list);
        req.getRequestDispatcher("/limitInfo/userLimit.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}

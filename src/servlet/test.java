package servlet;

import domain.Customer;
import service.CustomerServiceImp;
import service.LimitServiceImp;
import util.OutputUtil;
import util.TimeUtil;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class test {
    public static void main(String[] args) throws Exception {
        LimitServiceImp limitServiceImp=new LimitServiceImp();
        List<Integer> list=new ArrayList<>();
        list= limitServiceImp.listId();
        for(Integer i:list){
            System.out.println(i);
        }

    }

}

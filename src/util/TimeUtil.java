package util;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    public static String time(){
        Date date=new Date();
        SimpleDateFormat sc=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
        return sc.format(date);
    }
}

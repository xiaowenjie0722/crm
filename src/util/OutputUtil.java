package util;

import java.io.BufferedWriter;
import java.io.FileWriter;

/*
将日志输出到txt文件
 */
public class OutputUtil {
    public static void output(String log,String url)throws Exception{
        FileWriter fw=new FileWriter(url,true);
        BufferedWriter bw=new BufferedWriter(fw);
        bw.write(log);
        bw.newLine();
        bw.close();
        fw.close();
    }
}

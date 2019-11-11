package util;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class LogDelete {
    public static void logDelete(String log,String url)throws Exception{
        FileWriter fw=new FileWriter(url);
        BufferedWriter bw=new BufferedWriter(fw);
        bw.write(log);
        bw.close();
        fw.close();
    }
}

import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;

/**
 * Created by RD_bjjlg on 14-5-20.
 */
public class RhinoTest {
    public static void main(String[] args){
        Context ct = Context.enter();
        Scriptable scope = ct.initStandardObjects();
        String fileName = "D:\\nodejs\\app\\all.js";
        try {
            LineNumberReader reader = new LineNumberReader(new FileReader(fileName));
            String tmp = null;

            StringBuffer sb = new StringBuffer();
            while((tmp = reader.readLine())!=null){
                sb.append(tmp).append("\n");
            }
            Object result = ct.evaluateString(scope,sb.toString(),null,1,null);
            System.out.println(result);

//            Object result1 = ct.evaluateString(scope,"tools.testPlus(9,5);",null,1,null);
//            System.out.println(result1);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

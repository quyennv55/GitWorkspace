package Utils;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

/**
 * Created with IntelliJ IDEA.
 * User: cfdcom3g
 * Date: 4/10/14
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
public class DBUtils {
    private static final String CLASS_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/case_study";
    private static final String USER_NAME ="root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws Exception{
        Class.forName(CLASS_NAME);
        try{
            return DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void close(Connection c){
        try{
            if(c!=null && !c.isClosed()){
                c.close();
                c = null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

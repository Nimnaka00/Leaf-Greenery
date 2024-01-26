package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class MyConnection {
    public static final String username = "root"; // here you have to set your mysql username
    public static final String password = "Induja@01"; // here you have to set your mysql password
    public static final String url = "jdbc:mysql://127.0.0.1:3306/online_shopping";
    public static Connection con = null;
    
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ""+ex,"",JOptionPane.WARNING_MESSAGE);
        }
        return con;
    }
}

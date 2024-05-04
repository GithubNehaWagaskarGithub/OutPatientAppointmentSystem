package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	Connection con;
	PreparedStatement pStmt;
    ResultSet rs;
	public void init() throws ServletException 
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/operation?useSSL=true&requireSSL=true","root","Neha@123");
			} catch (SQLException e) {
				
			}
		} catch (ClassNotFoundException e) {
			
		}
	}
	//-------------------------------------------------------------------------------------------------------------------------
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                response.sendRedirect("adminpage.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

            //con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


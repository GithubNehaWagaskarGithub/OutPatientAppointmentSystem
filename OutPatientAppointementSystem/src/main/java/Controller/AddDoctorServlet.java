package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {
	
	Connection con;
	PreparedStatement pStmt;
    ResultSet rs;
	@Override
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
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorName = request.getParameter("doctorName");
        String doctorDepartment = request.getParameter("department");

        try {
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO doctor (name, department) VALUES (?, ?)");
            ps.setString(1, doctorName);
            ps.setString(2, doctorDepartment);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to AdminPage.jsp with success message
                response.sendRedirect("adminpage.jsp?message=Doctor added successfully!");
            } else {
                // Redirect to AdminPage.jsp with error message
                response.sendRedirect("adminpage.jsp?error=Failed to add doctor.");
            }
            //con.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to AdminPage.jsp with error message
            response.sendRedirect("adminpage.jsp?error=An error occurred. Please try again later.");
        }
    }    
	
}
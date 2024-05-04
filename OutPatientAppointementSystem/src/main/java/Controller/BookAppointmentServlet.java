package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
	
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
	//------------------------------------------------------------------------------------------------------------------------------------
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String datetime = request.getParameter("datetime");
        //String time = request.getParameter("time");
        String phone = request.getParameter("phone");
        //long phno=Long.parseLong("phone");
        String doctorName = request.getParameter("name");
        String doctorDepartment = request.getParameter("department");
        String message=request.getParameter("message");
        
//        List<String> doctorNames=new ArrayList<>();
//        List<String> doctorDepartments=new ArrayList<>();
//        
//        
//			PreparedStatement ps=con.prepareStatement("select Name,Department from doctor");
//			rs=ps.executeQuery();
//			while(rs.next())
//			{
//				doctorNames.add(rs.getString("Name"));
//				doctorDepartments.add(rs.getString("Department"));
//			}
        try {
        	PreparedStatement ps;
			ps = con.prepareStatement("INSERT INTO appointment (FullName, DateTime, PhNo, DrName, Drdepartment,YourMessage) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, fullName);
            ps.setString(2, datetime);
            //ps.setString(3, time);
            ps.setString(3, phone);
            ps.setString(4, doctorName);
            ps.setString(5, doctorDepartment);
            ps.setString(6, message);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("message", "Appointment booked successfully!");
                // Redirect to UserPage.jsp with success message
                
                request.getRequestDispatcher("userpage.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to book appointment.");
                // Redirect to UserPage.jsp with error message
                request.getRequestDispatcher("userpage.jsp").forward(request, response);
            }
		} catch (SQLException e) {
			e.printStackTrace();
            request.setAttribute("message", "An error occurred. Please try again later.");
            // Redirect to UserPage.jsp with error message
            request.getRequestDispatcher("userpage.jsp").forward(request, response);
		}
//        request.setAttribute("doctorNames", doctorNames);
//        request.setAttribute("doctorDepartments", doctorDepartments);
//        request.getRequestDispatcher("userpage.jsp").forward(request, response);
    }
}
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    <h2>Appointment List</h2>
    <table border="1">
        <thead>
            <tr>
              
                <th>Full Name</th>
                <th>DateTime</th>
                <th>Phone Number</th>
                <th>Doctor Name</th>
                <th>Doctor Department</th>
                <th>YourMessage</th>
            </tr>
        </thead>
        <tbody>
            <% 
                try {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/operation", "root", "Neha@123");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
            %>
                        <tr>
                           
                            <td><%= rs.getString("FullName") %></td>
                            <td><%= rs.getString("DateTime") %></td>
                           	<td><%= rs.getString("PhNo") %></td>
                            <td><%= rs.getString("DrName") %></td>
                            <td><%= rs.getString("Drdepartment") %></td>
                            <td><%= rs.getString("YourMessage") %></td>
                        </tr>
            <% 
                    }
                    //con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
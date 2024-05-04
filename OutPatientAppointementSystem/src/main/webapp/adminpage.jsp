<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    <h2>Admin Page</h2>
    <a href="viewappointment.jsp" class="btn btn-primary">View Appointments</a><br><br>
    <!-- Doctor registration form -->
    <form action="AddDoctorServlet" method="post">
        <label for="doctorName">Doctor Name:</label>
        <input type="text" id="doctorName" name="doctorName" class="from-control mb-4 col-3"><br><br>
        <label for="department">Department:</label>
        <input type="text" id="department" name="department" class="from-control mb-4 col-3"><br><br>
        <button type="submit" class="btn btn-primary">Add Doctor</button>
    </form>
    <div>
        <p>${message}</p>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    <h2>Book Appointment</h2>
    	<form action="BookAppointmentServlet" method="post">
    	<label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" class="from-control mb-4 col-3"><br><br>
        
        <label for="date">DateTime:</label>
        <input type="datetime-local" id="date" name="datetime" class="from-control mb-4 col-3"><br><br>
        
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" class="from-control mb-4 col-3"><br><br>
    	
        <label for="name">Select Doctor Name :</label>
                <select name="name" id="name" class="from-control mb-4 col-3">
                    <option value="" ></option>
                    <option value="Dr Rakesh">Dr.Rakesh</option>
                    <option value="Dr Mohan">Dr.Mohan</option>
                    <option value="Dr Ravi">Dr.Ravi</option>
                    <option value="Dr.Sonam">Dr.Sonam</option>
                    <option value="Dr Komal">Dr.Komal</option>
                    <option value="Dr Ayush">Dr.Ayush</option>
                    <option value="Dr Punam">Dr.Punam</option>
                    <option value="Dr Sudesh">Dr.Sudesh</option>
                </select><br><br>
        <label for="department">Select Doctor Departments :</label>
                <select name="department" id="department" class="from-control mb-4 col-3">
                    <option value=""></option>
                    <option value="Cardiologist">Cardiologist</option>
                    <option value="Endocrinologist">Endocrinologist</option>
                    <option value="Gynecologist">Gynecologist</option>
                    <option value="Oncologist">Oncologist</option>
                    <option value="Pediatrician">Pediatrician</option>
                    <option value="Dermatologist">Dermatologist</option>
                    <option value="Gastroenterologist">Gastroenterologist</option>
                    <option value="Neurologist">Neurologist</option>
                </select> <br><br>       
        
        
        <label for="message">Message:</label><br>
        <textarea id="message" name="message" class="from-control mb-4 col-3"></textarea><br><br>
        <button type="submit" class="btn btn-primary">Book Appointment</button>
    </form>
    <div>
        <p>${message}</p>
    </div>
</body>
</html>
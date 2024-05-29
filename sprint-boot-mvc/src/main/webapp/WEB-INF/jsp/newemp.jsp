<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List"%>
    <%@ page import="com.spring.sprint_boot_mvc.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form</title>
</head>
<body>
    <h2>Add New Employee</h2>
    <form method="POST" >
        <table>
            <tr>
                <td>Employee Number:</td>
                <td><input name="empNo" /></td>
            </tr>
            <tr>
                <td>Department Number:</td>
                <td><input name="deptNo" /></td>
            </tr>
            <tr>
                <td>Employee Name:</td>
                <td><input name="eName"/></td>
            </tr>
            <tr>
                <td>Job:</td>
                <td><input name="job" /></td>
            </tr>
            <tr>
                <td ><input action="http://localhost:8080/sprint-boot-mvc/savenewemp" method="post" type="submit" value="Save" /></td>
                <td ><input action="http://localhost:8080/sprint-boot-mvc/updemp" method="post" type="submit" value="update" /></td>
                <td ><input action="http://localhost:8080/sprint-boot-mvc/delemp" method="post" type="submit" value="delete" /></td>
            </tr>
        </table>
    </form>
   <table id="employeeTable" border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Department No</th>
            <th>Job</th>
        </tr>
        <% 
    	List<Employee> e1=(List<Employee>)request.getAttribute("elist");
                for (Employee emp2 : e1) {
        %>
        <tr id="data">
            <td><%= emp2.getEmpNo() %></td>
            <td><%= emp2.getEName() %></td>
            <td><%= emp2.getDeptNo() %></td>
            <td><%= emp2.getJob() %></td>
        </tr>
        <%
                
            }
        %>
    </table>
</body>
</html>
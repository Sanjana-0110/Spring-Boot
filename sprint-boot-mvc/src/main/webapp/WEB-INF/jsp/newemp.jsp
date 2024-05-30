<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List"%>
    <%@ page import="com.spring.sprint_boot_mvc.models.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <script type="text/javascript">
        function showCreateForm() {
            document.getElementById('d1').innerHTML = `
                <form method="POST" action="savenewemp">
                    <label for="empNo">Employee No:</label>
                    <input name="empNo" id="empNo"/><br/>
                    <label for="ename">Employee Name:</label>
                    <input name="eName" id="ename"/><br/>
                    <label for="deptNo">Department No:</label>
                    <input name="deptNo" id="deptNo"/><br/>
                    <label for="job">Job:</label>
                    <input name="job" id="job"/><br/>
                    <input type="submit" value="Save"/>
                </form>
            `;
        }

        function showEditForm() {
            document.getElementById('d1').innerHTML = `
                <form method="POST" action="updemp" >
                    <label for="empNo">Employee No:</label>
                    <input name="empNo" id="empNo"/><br/>
                    <label for="ename">Employee Name:</label>
                    <input name="eName" id="ename"/><br/>
                    <label for="deptNo">Department No:</label>
                    <input name="deptNo" id="deptNo"/><br/>
                    <label for="job">Job:</label>
                    <input name="job" id="job"/><br/>
                    <input type="submit" value="Update"/>
                </form>
            `;
        }

        function showDeleteForm() {
            document.getElementById('d1').innerHTML = `
                <form method="POST" action="delemp" >
                    <label for="empNo">Employee No:</label>
                    <input name="empNo" id="empNo"/><br/>
                    <input type="submit" value="Delete"/>
                </form>
            `;
        }
    </script>
</head>
<body>
    <h2>Employee Management</h2>
    <button onclick="showCreateForm()">Create New Employee</button>
    <button onclick="showEditForm()">Edit Employee</button>
    <button onclick="showDeleteForm()">Delete Employee</button>

    <div id="d1">
        <!-- Forms will be displayed here -->
    </div>
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
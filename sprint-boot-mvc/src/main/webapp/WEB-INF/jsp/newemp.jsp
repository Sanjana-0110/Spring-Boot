<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.sprint_boot_mvc.models.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>
<script type="text/javascript">
    function showCreateForm() {
    	
        document.getElementById('d1').innerHTML = `
            <form method="POST" action="savenewemp">
                <label for="empNo">Employee No:</label>
                <input type="number" id="empNo" name="empNo" required/><br/>
                <label for="ename">Employee Name:</label>
                <input type="text" id="ename" name="eName" required/><br/>
                <label for="deptNo">Department No:</label>
                <input type="number" id="deptNo" name="deptNo" required/><br/>
                <label for="job">Job:</label>
                <input type="text" id="job" name="job" required/><br/>
                <label for="salary">Salary:</label>
                <input type="number" step="0.01" id="salary" name="salary"/><br/>
                <label for="commission">Commission:</label>
                <input type="number" step="0.01" id="commission" name="commission"/><br/>
                <label for="hiredate">Hire Date:</label>
                <input type="date" id="hiredate" name="hiredate" placeholder="yyyy-MM-dd" required/><br/>
                <input type="submit" value="Save"/>
            </form>
        `;
    }

    function showEditForm() {
        document.getElementById('d1').innerHTML = `
            <form method="POST" action="updemp">
                <label for="empNo">Employee No:</label>
                <input type="number" id="empNo" name="empNo" required/><br/>
                <label for="ename">Employee Name:</label>
                <input type="text" id="ename" name="eName" required/><br/>
                <label for="deptNo">Department No:</label>
                <input type="number" id="deptNo" name="deptNo" required/><br/>
                <label for="job">Job:</label>
                <input type="text" id="job" name="job" required/><br/>
                <label for="salary">Salary:</label>
                <input type="number" step="0.01" id="salary" name="salary"/><br/>
                <label for="commission">Commission:</label>
                <input type="number" step="0.01" id="commission" name="commission"/><br/>
                <label for="hiredate">Hire Date:</label>
                <input type="date" id="hiredate" name="hiredate" placeholder="yyyy-MM-dd" required/><br/>
                <input type="submit" value="Update"/>
            </form>
        `;
    }

    function showDeleteForm() {
        document.getElementById('d1').innerHTML = `
            <form method="POST" action="delemp">
                <label for="empNo">Employee No:</label>
                <input type="number" id="empNo" name="empNo" required/><br/>
                <input type="submit" value="Delete"/>
            </form>
        `;
    }
</script>
</head>
<body>
<%
    List<Employee> empList = (List<Employee>) request.getAttribute("elist");
%>
<h2>Employee Management</h2>
<button onclick="showCreateForm()">Create New Employee</button>
<button onclick="showEditForm()">Edit Employee</button>
<button onclick="showDeleteForm()">Delete Employee</button>

<div id="d1">
    <!-- Forms will be displayed here -->
</div>

<h3>Employee List</h3>
<table>
    <thead>
        <tr>
            <th>Employee No</th>
            <th>Employee Name</th>
            <th>Department No</th>
            <th>Job</th>
            <th>Salary</th>
            <th>Commission</th>
            <th>Hire Date</th>
        </tr>
    </thead>
    <tbody>
<%
    if (empList != null) {
        for (Employee e : empList) {
%>
        <tr onclick="fillForm('<%= e.getEmpNo() %>', '<%= e.getEName() %>', '<%= e.getJob() %>', '<%= e.getDeptNo() %>', '<%= e.getSalary() %>', '<%= e.getCommission() %>', '<%= e.getHiredate() %>')">
            <td><%= e.getEmpNo() %></td>
            <td><%= e.getEName() %></td>
            <td><%= e.getDeptNo() %></td>
            <td><%= e.getJob() %></td>
            <td><%= e.getSalary() %></td>
            <td><%= e.getCommission() %></td>
            <td><%= e.getHiredate() %></td>
        </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="7">No employees found</td>
        </tr>
<%
    }
%>
    </tbody>
</table>

<script>
function fillForm(empNo, eName, job, deptNo, salary, commission, hiredate) {
	console.log(empNo);
    document.getElementById('d1').innerHTML = `
        <form method="POST" action="updemp">
            <label for="empNo">Employee No:</label>
            <input type="number" id="empNo" name="empNo" value="`+empNo+`" required/><br/>
            <label for="ename">Employee Name:</label>
            <input type="text" id="ename" name="ename" value="`+eName+`" required/><br/>
            <label for="deptNo">Department No:</label>
            <input type="number" id="deptNo" name="deptNo" value="`+deptNo+`" required/><br/>
            <label for="job">Job:</label>
            <input type="text" id="job" name="job" value="`+job+`" required/><br/>
            <label for="salary">Salary:</label>
            <input type="number" step="0.01" id="salary" name="salary" value="`+salary+`"/><br/>
            <label for="commission">Commission:</label>
            <input type="number" step="0.01" id="commission" name="commission" value="`+commission+`"/><br/>
            <label for="hiredate">Hire Date:</label>
            <input type="date" id="hiredate" name="hiredate" value="`+hiredate+`" placeholder="yyyy-MM-dd" required/><br/>
            <input type="submit" value="Update"/>
        </form>
    `;
}
</script>

</body>
</html>

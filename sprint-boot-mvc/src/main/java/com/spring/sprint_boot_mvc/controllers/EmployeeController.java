package com.spring.sprint_boot_mvc.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.sprint_boot_mvc.models.Employee;
import com.spring.sprint_boot_mvc.services.EmpService;

@Controller
public class EmployeeController {

	@Autowired
	EmpService empService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(java.util.Date.class,
				new org.springframework.beans.propertyeditors.CustomDateEditor(
						new java.text.SimpleDateFormat("yyyy-MM-dd"), true));
	}

	@GetMapping(value = "/emplist")
	public String getAllEmployees(Model model) {
		List<Employee> empList = empService.getAllEmp();
		model.addAttribute("elist", empList);
		return "newemp";
	}

	@RequestMapping(value = "/savenewemp", method = RequestMethod.POST)
	public String saveNewEmployee(@Validated Employee emp, @DateTimeFormat(pattern = "yyyy-MM-dd") Model model) {
		// Trim the time component from the hiredate
		empService.CreateEmp(emp);
		return "redirect:/emplist";
	}

	@RequestMapping(value = "/delemp", method = RequestMethod.POST)
	public String deleteEmployee(@Validated Employee emp, Model model) {
		int id = emp.getEmpNo();
		empService.deleteEmp(id);
		return "redirect:/emplist";
	}

	@RequestMapping(value = "/updemp", method = RequestMethod.POST)
	public String updateEmployee(@Validated Employee emp, Model model) {
		int id = emp.getEmpNo();
		empService.deleteEmp(id);
		empService.CreateEmp(emp);
		return "redirect:/emplist";
	}


}

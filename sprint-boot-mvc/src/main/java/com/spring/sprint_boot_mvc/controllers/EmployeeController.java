package com.spring.sprint_boot_mvc.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.sprint_boot_mvc.models.Employee;
import com.spring.sprint_boot_mvc.services.EmpService;

@Controller
public class EmployeeController {

	@Autowired
	EmpService empService;

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	/**
	 * 
	 * selects the employees list view to render by returning its name.
	 * 
	 */

	@GetMapping(value = "/emplist")
	public String getAllEmployees(Model model) {

		logger.info("Handling /emplist request");

		// get all employees from service

		logger.info("about to invoke service method");

		System.out.println("about to invoke service method");

		List<Employee> empList = empService.getAllEmp();

		logger.info("Got emplist from service");

		System.out.println("got emplist from service");

		System.out.println(empList.toString());

		// set it to the model

		model.addAttribute("elist", empList);

		logger.info("about to call logical view");

		System.out.println("about to call logical view");

		// call the view
		return "newemp";

	}

	@RequestMapping(value = "/savenewemp", method = RequestMethod.POST)
	public String saveNewEmployee(@Validated Employee emp, Model model) {

		System.out.println("Save New Employee Page Requested");

		// get all employees from DAO

		empService.CreateEmp(emp);

		// set it to the model

		return "redirect:/emplist";

	}

	@RequestMapping(value = "/delemp", method = RequestMethod.POST)
	public String deleteEmployee(@Validated Employee emp, Model model) {

		System.out.println("Save New Employee Page Requested");

		// get all employees from DAO
		int id = emp.getEmpNo();
		empService.deleteEmp(id);

		// set it to the model

		return "redirect:/emplist";

	}

	@RequestMapping(value = "/updemp", method = RequestMethod.POST)
	public String updateEmployee(@Validated Employee emp, Model model) {

		System.out.println("Save New Employee Page Requested");

		// get all employees from DAO
		int id = emp.getEmpNo();
		empService.deleteEmp(id);
		empService.CreateEmp(emp);
		// set it to the model

		return "redirect:/emplist";

	}

}

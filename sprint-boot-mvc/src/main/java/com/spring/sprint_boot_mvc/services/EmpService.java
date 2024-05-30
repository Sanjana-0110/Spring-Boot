package com.spring.sprint_boot_mvc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sprint_boot_mvc.models.Employee;
import com.spring.sprint_boot_mvc.repositories.EmpRepository;

@Service
public class EmpService {

	@Autowired
	private EmpRepository empRepository;

	public List<Employee> getAllEmp() {

		System.out.println("about to invoke repository method");

		return empRepository.findAll();

	}

	public void CreateEmp(Employee e) {

		System.out.println("about to invoke repository method");

		empRepository.save(e);

	}

	public void deleteEmp(Integer id) {
		empRepository.deleteById(id);
	}
}

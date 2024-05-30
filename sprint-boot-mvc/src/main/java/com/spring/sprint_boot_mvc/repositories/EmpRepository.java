package com.spring.sprint_boot_mvc.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.sprint_boot_mvc.models.Employee;

public interface EmpRepository extends JpaRepository<Employee, Integer> {

}

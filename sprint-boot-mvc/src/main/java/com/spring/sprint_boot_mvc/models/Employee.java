package com.spring.sprint_boot_mvc.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "sanjana187emp")
public class Employee {

	@Id
	@Column(name = "empno", nullable = false)
	private Integer empNo;

	@Column(name = "deptno", nullable = false)
	private Integer deptNo;

	@Column(name = "ename", nullable = false)
	private String eName;

	@Column(name = "job", nullable = false)
	private String job;

	@Column(name = "salary", nullable = true)
	private Double salary;

	@Column(name = "comm", nullable = true)
	private Double commission;

	@Column(name = "hiredate", nullable = false)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date hiredate;

	public Employee() {
	}

	public Employee(Integer eno, Integer dno, String enm, String jb) {
		this.empNo = eno;
		this.eName = enm;
		this.job = jb;
		this.deptNo = dno;
	}

	public Integer getEmpNo() {
		return empNo;
	}

	public void setEmpNo(Integer eno) {
		this.empNo = eno;
	}

	public Integer getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(Integer dno) {
		this.deptNo = dno;
	}

	public String getEName() {
		return eName;
	}

	public void setEName(String enm) {
		this.eName = enm;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String jb) {
		this.job = jb;
	}

	public Double getCommission() {
		return commission;
	}

	public void setCommission(Double commission) {
		this.commission = commission;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Employee{" + "Emp No=" + empNo + ", deptNo=" + deptNo + ", EmpName='" + eName + '\'' + ", job='" + job
				+ '\'' + '}';
	}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.classes;

/**
 *
 * @author georgia
 */
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class SortEmployeeDate {
    int empID;
    String EFirst;
    String ELast;
    int salary;
    int empID1;
    String hiringDate;

    public SortEmployeeDate() {
    }

    public SortEmployeeDate(int empID, String EFirst, String ELast, int salary, int empID1, String hiringDate) {
        this.empID = empID;
        this.EFirst = EFirst;
        this.ELast = ELast;
        this.salary = salary;
        this.empID1 = empID1;
        this.hiringDate = hiringDate;
    }

    public int getEmpID1() {
        return empID1;
    }

    public void setEmpID1(int empID1) {
        this.empID1 = empID1;
    }

    public SortEmployeeDate(int empID, String EFirst, String ELast, int salary, String hiringDate) {
        this.empID = empID;
        this.EFirst = EFirst;
        this.ELast = ELast;
        this.salary = salary;
        this.hiringDate = hiringDate;
    }

    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getEFirst() {
        return EFirst;
    }

    public void setEFirst(String EFirst) {
        this.EFirst = EFirst;
    }

    public String getELast() {
        return ELast;
    }

    public void setELast(String ELast) {
        this.ELast = ELast;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getHiringDate() {
        return hiringDate;
    }

    public void setHiringDate(String hiringDate) {
        this.hiringDate = hiringDate;
    }
    
}

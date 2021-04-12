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
public class Employee {
    int empID;
    String EFirst;
    String ELast;
    int salary;

    public Employee() {
    }

    public Employee(int empID, String EFirst, String ELast, int salary) {
        this.empID = empID;
        this.EFirst = EFirst;
        this.ELast = ELast;
        this.salary = salary;
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
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import com.mymaven.classes.EmployeePerSalary;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.GenericType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author georgia
 */
public class EmployeePerSalaryClient {
    public ArrayList<EmployeePerSalary> getAnswerEmployeePerSalary()
    {
        ArrayList<EmployeePerSalary> mlist = (ArrayList<EmployeePerSalary>) Client.create().resource("http://localhost:8080/project/webresources/services/getanswerEmployeePerSalary").get(new GenericType<List<EmployeePerSalary>>(){});
        return mlist;
        
    }
}

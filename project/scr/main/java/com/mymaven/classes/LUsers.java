/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.classes;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author georgia
 */
@XmlRootElement
public class LUsers {
    int role;
    String sessionid;
    String username;
    
    public LUsers()
    {
        
    }
    public LUsers(int role,String username) 
    {
        this.role = role;
        this.username=username;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}

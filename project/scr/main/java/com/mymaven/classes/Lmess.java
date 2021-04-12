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
public class Lmess {
    String message;
    int role;
    int personid;
    
    public Lmess()
    {
        
    }
    
    public Lmess (String message) {
        this.message=message;
    }
    
    public Lmess(String message, int role,int personid) {
        this.message = message;
        this.role = role;
        this.personid = personid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }


    public int getPersonid() {
        return personid;
    }

    public void setPersonid(int personid) {
        this.personid = personid;
    }
    
}

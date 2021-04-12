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
public class Rmess {
    String message;
    String sqlmess;
    
    public Rmess()
    {
        
    }
    
    public Rmess(String message,String sqlmess) {
        this.message = message;
        this.sqlmess=sqlmess;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSqlmess() {
        return sqlmess;
    }

    public void setSqlmess(String sqlmess) {
        this.sqlmess = sqlmess;
    }
    
    
}

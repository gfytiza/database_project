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
public class UpdateClass {
    int ISBN;
    String category;
    String new_value;

    public UpdateClass() {
    }

    public UpdateClass(int ISBN, String category, String new_value) {
        this.ISBN = ISBN;
        this.category = category;
        this.new_value = new_value;
    }

    public int getISBN() {
        return ISBN;
    }

    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getNew_value() {
        return new_value;
    }

    public void setNew_value(String new_value) {
        this.new_value = new_value;
    }

   
    
}

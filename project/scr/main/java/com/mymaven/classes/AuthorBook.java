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
public class AuthorBook {
    int count;

    public AuthorBook() {
    }

    public AuthorBook(int count) {
        this.count = count;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
}

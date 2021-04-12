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
public class Copy {
    int ISBN;
    int copyNr;
    int shelf;

    public Copy() {
    }

    public Copy(int ISBN, int copyNr, int shelf) {
        this.ISBN = ISBN;
        this.copyNr = copyNr;
        this.shelf = shelf;
    }

    public int getISBN() {
        return ISBN;
    }

    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    public int getCopyNr() {
        return copyNr;
    }

    public void setCopyNr(int copyNr) {
        this.copyNr = copyNr;
    }

    public int getShelf() {
        return shelf;
    }

    public void setShelf(int shelf) {
        this.shelf = shelf;
    }
    
    
}

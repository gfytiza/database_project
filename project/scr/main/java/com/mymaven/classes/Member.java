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
public class Member {
    int member_id;
    String MFirst;
    String MLast;
    String Street;
    int street_number;
    int PostalCode;
    String Mbirthday;

    public Member() {
    }

    public Member(int member_id, String MFirst, String MLast, String Street, int street_number, int PostalCode, String Mbirthday) {
        this.member_id = member_id;
        this.MFirst = MFirst;
        this.MLast = MLast;
        this.Street = Street;
        this.street_number = street_number;
        this.PostalCode = PostalCode;
        this.Mbirthday = Mbirthday;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getMFirst() {
        return MFirst;
    }

    public void setMFirst(String MFirst) {
        this.MFirst = MFirst;
    }

    public String getMLast() {
        return MLast;
    }

    public void setMLast(String MLast) {
        this.MLast = MLast;
    }

    public String getStreet() {
        return Street;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public int getStreet_number() {
        return street_number;
    }

    public void setStreet_number(int street_number) {
        this.street_number = street_number;
    }

    public int getPostalCode() {
        return PostalCode;
    }

    public void setPostalCode(int PostalCode) {
        this.PostalCode = PostalCode;
    }

    public String getMbirthday() {
        return Mbirthday;
    }

    public void setMbirthday(String Mbirthday) {
        this.Mbirthday = Mbirthday;
    }
    
   
}

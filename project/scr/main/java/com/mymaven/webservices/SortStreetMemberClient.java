/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import com.mymaven.classes.Book;
import com.mymaven.classes.SortStreetMember;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.GenericType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author georgia
 */
public class SortStreetMemberClient {
    public ArrayList<SortStreetMember> getAnswerSortStreetMember()
    {
        ArrayList<SortStreetMember> mlist = (ArrayList<SortStreetMember>) Client.create().resource("http://localhost:8080/project/webresources/services/getanswerSortStreetMember").get(new GenericType<List<SortStreetMember>>(){});
        return mlist;
        
    }
}

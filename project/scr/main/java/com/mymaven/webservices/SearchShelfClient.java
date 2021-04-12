/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import com.mymaven.classes.Book;
import com.mymaven.classes.Copy;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.GenericType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author georgia
 */
public class SearchShelfClient {
    public ArrayList<Copy> getAnswerShelf(String il)
    {
        ArrayList<Copy> mlist = (ArrayList<Copy>) Client.create().resource("http://localhost:8080/project/webresources/services/getanswerShelf").queryParam("il", il).get(new GenericType<List<Copy>>(){});
        return mlist;
        
    }
}
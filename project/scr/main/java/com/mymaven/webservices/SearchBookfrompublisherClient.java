/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import com.mymaven.classes.Book;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.GenericType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author georgia
 */
public class SearchBookfrompublisherClient {
    public ArrayList<Book> getAnswerBookfrompublisher(String il)
    {
        ArrayList<Book> mlist = (ArrayList<Book>) Client.create().resource("http://localhost:8080/project/webresources/services/getanswerBookfrompublisher").queryParam("il", il).get(new GenericType<List<Book>>(){});
        return mlist;
        
    }
}

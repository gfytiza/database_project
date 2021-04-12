package com.mymaven.webservices;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.mymaven.classes.NumofReminder;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.GenericType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author georgia
 */
public class NumofReminderClient {
    public ArrayList<NumofReminder> getAnswerNumofReminder()
    {
        ArrayList<NumofReminder> mlist = (ArrayList<NumofReminder>) Client.create().resource("http://localhost:8080/project/webresources/services/getanswerNumofReminder").get(new GenericType<List<NumofReminder>>(){});
        return mlist;
        
    }
}
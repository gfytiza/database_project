/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.classes;

import java.util.HashMap;

/**
 *
 * @author giorg
 */
public class Authent {

    HashMap<String, String> Users;
    HashMap<String, LUsers> Sessions;
    static Authent Inst = null;

    //CONSTRUCTOR
    private Authent() 
    {
        Users = new HashMap();
        Sessions = new HashMap();
    }

    public static Authent getInstance() 
    {
        if (Inst == null) {
            Inst = new Authent();
        }
        return Inst;
    }

    public void login(LUsers user, String session) 
    {
        if (!Users.containsKey(user.getUsername())) 
        {
            Users.put(user.getUsername(), session);
            Sessions.put(session, user);
        } 
        else //
        {
            Sessions.remove(Users.get(user.getUsername())); //kanei remove to session
            Users.replace(user.getUsername(), session);
            Sessions.put(session, user);
        }
    }

    public boolean logout(String session) 
    {
        if (Sessions.containsKey(session)) 
        {
            String s_user = Sessions.get(session).getUsername();
            Sessions.remove(session);
            Users.remove(s_user);
            return true;
        }
        return false;
    }

    //Elegxei an to session einai egkuro
    public boolean checkLogin(String session) 
    {
        return Sessions.containsKey(session);
    }

    //Mas epistrefei to username pou antistoixei sto session
    public String getUserName(String session) 
    {
        if (Sessions.containsKey(session)) {
            return Sessions.get(session).getUsername();
        }
        return "NO";
    }

    
}

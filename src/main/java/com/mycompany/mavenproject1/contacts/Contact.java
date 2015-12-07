/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class Contact {
    private String uname;
    

    public Contact(String aUname){
        this.uname = aUname;
        
    }
    
    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    
    
}

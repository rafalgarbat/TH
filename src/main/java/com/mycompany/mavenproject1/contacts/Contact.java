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
    private String city;
    private String state;
    private String personalInfo;
    
    /**
     * Informacja czy jestescie juz znajomymi
     */
    private boolean czyZnajomy;
    
        
    public Contact(String aUname){
        this.uname = aUname;        
    }

    public Contact() {   
    }
    
    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    

    public String getPersonalInfo() {
        return personalInfo;
    }

    public void setPersonalInfo(String personalInfo) {
        this.personalInfo = personalInfo;
    }

    public boolean isCzyZnajomy() {
        return czyZnajomy;
    }

    public void setCzyZnajomy(boolean czyZnajomy) {
        this.czyZnajomy = czyZnajomy;
    }

    
    
}

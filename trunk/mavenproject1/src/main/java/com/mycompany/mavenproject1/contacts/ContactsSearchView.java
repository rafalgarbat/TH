/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

import com.mycompany.mavenproject1.auth.Users;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Named("contactssearchview")
@ViewScoped
public class ContactsSearchView {
    
    private String unameSearchExpr;
    private List<Contact> searchedContacts;
    
    @ManagedProperty("#{contactsService}")
    private ContactsService service;
    
    @PostConstruct
    public void init() {
         searchedContacts = new ArrayList<>(); 
         Contact c= new Contact("x1");
         searchedContacts.add(c);
    }
    
    public void performSearch(){
       
    }
    
    public String getUnameSearchExpr() {
        return unameSearchExpr;
    }

    public void setUnameSearchExpr(String unameSearchExpr) {
        this.unameSearchExpr = unameSearchExpr;
    }

    public List<Contact> getSearchedContacts() {
        return searchedContacts;
    }

    public void setSearchedContacts(List<Contact> searchedContacts) {
        this.searchedContacts = searchedContacts;
    }

    public ContactsService getService() {
        return service;
    }

    public void setService(ContactsService service) {
        this.service = service;
    }
    
    
    
}

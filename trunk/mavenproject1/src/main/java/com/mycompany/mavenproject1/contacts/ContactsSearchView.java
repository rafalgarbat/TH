/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "contactssearchview")
@ViewScoped
public class ContactsSearchView {
    
    private String unameSearchExpr;
    private List<Contact> searchedContacts;
    
    @ManagedProperty("#{contactsService}")
    private ContactsService service;
    
    @PostConstruct
    public void init() {
        searchedContacts = new ArrayList<>(); 
    }
    
    public void performSearch(){
       // service.getUserContacts(unameSearchExpr);
        Contact pTmp = new Contact("xxx");
        searchedContacts.clear();
        searchedContacts.add(pTmp);
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

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

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "usercontactsView")
@ViewScoped
public class UsercontactsView {
    
    private List<Contact> users;
     
    private Contact selectedContact;
     
    @ManagedProperty("#{contactsService}")
    private ContactsService service;
     
    @PostConstruct
    public void init() {
        users = new ArrayList<>();  
        
    }
    
    public List<Contact> getUserContacts(String aUname) {
        Contact pContact;
        for(Users pUC : service.getUserContacts("ala")){
            pContact = new Contact(pUC.getUname());    
            users.add(pContact);
        }
        /*Users tmp = new Users();
        tmp.setUname("z11");
        Contact tmp = new Contact("jarek");        
        users.add(tmp);
         tmp = new Contact("marek");        
        users.add(tmp);
         tmp = new Contact("janek");        
        users.add(tmp);*/
        return users;
    }

    public List<Contact> getUsers() {
        return users;
    }

    public void setUsers(List<Contact> users) {
        this.users = users;
    }

    public Contact getSelectedContact() {
        return selectedContact;
    }

    public void setSelectedContact(Contact selectedContact) {
        this.selectedContact = selectedContact;
    }

    public ContactsService getService() {
        return service;
    }

    public void setService(ContactsService service) {
        this.service = service;
    }
   
    
}

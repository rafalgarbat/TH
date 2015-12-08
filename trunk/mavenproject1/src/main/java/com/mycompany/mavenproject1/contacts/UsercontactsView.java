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
    private List<Contact> propUsers;
    
    private Contact selectedContact;
     
    @ManagedProperty("#{contactsService}")
    private ContactsService service;
     
    @PostConstruct
    public void init() {
        users = new ArrayList<>(); 
        propUsers = new ArrayList<>();
        
    }
    
    public List<Contact> getUserContacts(String aUname) {
        Contact pContact;
        users.clear();
        for(Users pUC : service.getUserContacts("ala")){
            pContact = new Contact(pUC.getUname());    
            pContact.setPersonalInfo("Personal info");
            pContact.setAddrInfo("Addr info");
            users.add(pContact);
        }
       
        return users;
    }

      public List<Contact> getUserPropContacts(String aUname) {
        Contact pContact;
               
        Contact tmp = new Contact("jarek");        
        propUsers.add(tmp);
         tmp = new Contact("marek");        
        propUsers.add(tmp);
         tmp = new Contact("janek");        
        propUsers.add(tmp);
        return propUsers;
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

    public List<Contact> getPropUsers() {
        return propUsers;
    }

    public void setPropUsers(List<Contact> propUsers) {
        this.propUsers = propUsers;
    }
   
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "contactsService")
@ApplicationScoped
public class ContactsService {

    @EJB
    private LoginFacade loginFacade;

    private List<Users> userContacts;

    public List<Users> getUserContacts(String aUname) {
        Users pUser = loginFacade.getUser(aUname);
        userContacts = new ArrayList<>();
        for (Usercontacts pUC : pUser.getUsercontactsCollection()) {
            userContacts.add(pUC.getContactId());
        }
        return userContacts; 
    }
    
    public List<Users> searchForUsers(String aUname){        
        return loginFacade.getUsers(aUname);    
    }

    public List<Users> getUserContacts() {
        return userContacts;
    }

    public void setUserContacts(List<Users> userContacts) {
        this.userContacts = userContacts;
    }
    
    

}

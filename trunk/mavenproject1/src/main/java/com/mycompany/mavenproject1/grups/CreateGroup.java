/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

import com.mycompany.mavenproject1.contacts.Contact;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.grups.Grups;
import com.mycompany.mavenproject1.grups.GrupsFacade;
import com.mycompany.mavenproject1.slowniki.Wartosci;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Named;

@ManagedBean(name="creategroup")
@ViewScoped
public class CreateGroup {
 
    @EJB
    private GrupsFacade groupsFacade;

    private Grups newGroup;
    

    
    @PostConstruct
    public void init() {
        newGroup = new Grups();
    }

    

    
    public String utworzGrupe(){
        getGroupsFacade().zapiszGrup(newGroup);
        return "";
    }
    
    
    public Grups getNewGroup() {
        return newGroup;
    }

    public void setNewGroup(Grups newGroup) {
        this.newGroup = newGroup;
    }

  


    public GrupsFacade getGroupsFacade() {
        return groupsFacade;
    }

    public void setGroupsFacade(GrupsFacade groupsFacade) {
        this.groupsFacade = groupsFacade;
    }

  


    
}

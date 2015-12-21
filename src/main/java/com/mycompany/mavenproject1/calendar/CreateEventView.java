/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.contacts.Contact;
import com.mycompany.mavenproject1.event.Events;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name="createeventview")
@ViewScoped
public class CreateEventView {
 
    private Events newEvent;
    
    private String czyCykliczne;
    
    @PostConstruct
    public void init() {
    czyCykliczne="0";
    }

    public Events getNewEvent() {
        return newEvent;
    }

    public void setNewEvent(Events newEvent) {
        this.newEvent = newEvent;
    }

    public String getCzyCykliczne() {
        return czyCykliczne;
    }

    public void setCzyCykliczne(String czyCykliczne) {
        this.czyCykliczne = czyCykliczne;
    }
    
    
    
}

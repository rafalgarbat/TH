/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.contacts.Contact;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.slowniki.Wartosci;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
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
 
    @EJB
    private EventFacade eventFacade;

    private Events newEvent;
    
    private boolean czyCykliczne;
    
    private Wartosci wartDystans;
    
    @PostConstruct
    public void init() {
        czyCykliczne=false;
        newEvent = new Events();
    }

    
    public List<Wartosci> getWartosciDystansow(){
        List <Wartosci> pTmpDystanse = new ArrayList<>();
        pTmpDystanse = getEventFacade().getEntityManager().createNamedQuery("Wartosci.findAll").getResultList(); 
        return pTmpDystanse;
    }
    
    public String utworzWydarzenie(){
        getEventFacade().zapiszEvent(newEvent);
        return "";
    }
    
    
    public Events getNewEvent() {
        return newEvent;
    }

    public void setNewEvent(Events newEvent) {
        this.newEvent = newEvent;
    }

    public Boolean getCzyCykliczne() {
        return czyCykliczne;
    }

    public void setCzyCykliczne(Boolean czyCykliczne) {
        this.czyCykliczne = czyCykliczne;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }

    public boolean isCzyCykliczne() {
        return czyCykliczne;
    }

    public void setCzyCykliczne(boolean czyCykliczne) {
        this.czyCykliczne = czyCykliczne;
    }

    public Wartosci getWartDystans() {
        return wartDystans;
    }

    public void setWartDystans(Wartosci wartDystans) {
        this.wartDystans = wartDystans;
    }
    
    
    
}

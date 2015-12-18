/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.todaytraining;

import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.Userevents;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.persistence.Query;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean
@ViewScoped
public class TodayTrainingController implements Serializable {

    @EJB
    private EventFacade eventFacade;
    
    private Userevents myUserEvent;

    private Events myEvent;
    
    public Events getEvent(int aUserEventId){    
        Query pQ = eventFacade.getEntityManager().createNamedQuery("Userevents.findByUid").setParameter("uid", aUserEventId);
        Userevents pTmp = (Userevents)pQ.getSingleResult();            
        return pTmp.getEventId();
    }

    public void loadEvent(int aUserEventId){
    Query pQ = eventFacade.getEntityManager().createNamedQuery("Userevents.findByUid").setParameter("uid", aUserEventId);
        Userevents pTmp = (Userevents)pQ.getSingleResult();            
        myEvent = pTmp.getEventId();
    }
    
    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }

    public Userevents getMyUserEvent() {
        return myUserEvent;
    }

    public void setMyUserEvent(Userevents myUserEvent) {
        this.myUserEvent = myUserEvent;
    }

    public Events getMyEvent() {
        return myEvent;
    }

    public void setMyEvent(Events myEvent) {
        this.myEvent = myEvent;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.ToggleEvent;
import org.primefaces.event.UnselectEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "eventList")
@ViewScoped
public class EventList implements Serializable {

    private List<UserScheduleEvent> events;
    private UserScheduleEvent selectedEvent;

    @ManagedProperty("#{eventService}")
    private EventService service;

    @PostConstruct
    public void init() {
        loadEvents();
    }

    public void loadEvents(){
       events = service.getEvents();
       FacesMessage msg = new FacesMessage("Events loaded: "+events.toString());
       FacesContext.getCurrentInstance().addMessage(null, msg);
    }
            
    public void rowExpanded(ToggleEvent event) {        
        //Events eve = (Events)service.getEventFacade().getEntityManager().createNamedQuery("Events.findById").setParameter("id", selectedEvent.getDbEventId()).getResultList().get(0);
       // selectedEvent.setIloscZapisanych(eve.getUsereventsCollection().size());     
    }
       
    
    public void zapiszSieNaEvent(String uname){
       service.getEventFacade().zapiszNaEvent(selectedEvent,uname);
    }  
    
    public List getEvents() {
        return events;
    }

    public void setService(EventService service) {
        this.service = service;
    }

    public UserScheduleEvent getSelectedEvent() {
        return selectedEvent;
    }

    public void setEvents(List<UserScheduleEvent> events) {
        this.events = events;
    }

    public void setSelectedEvent(UserScheduleEvent selectedEvent) {
        this.selectedEvent = selectedEvent;
    }

    public void onRowSelect(SelectEvent event) {
    }

    public void onRowUnselect(UnselectEvent event) {
    }
    
    
    
}

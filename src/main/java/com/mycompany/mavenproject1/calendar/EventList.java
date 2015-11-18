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
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name="eventList")
@ViewScoped
public class EventList implements Serializable {
     
    private List<UserScheduleEvent> events;
    private UserScheduleEvent selectedEvent;
    
    @ManagedProperty("#{eventService}")
    private EventService service;
 
    @PostConstruct
    public void init() {
        events = service.getEvents();
    }
     
    public List<UserScheduleEvent> getEvents() {
        return events;
    }
 
    public void setService(EventService service) {
        this.service = service;
    }

    public UserScheduleEvent getSelectedEvent() {
        return selectedEvent;
    }

    public void setSelectedEvent(UserScheduleEvent selectedEvent) {
        this.selectedEvent = selectedEvent;
    }
    
    
}
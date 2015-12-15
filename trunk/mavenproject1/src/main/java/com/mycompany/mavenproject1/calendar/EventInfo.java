/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class EventInfo {
    
    
    private int eventId;
    private String eventTitle;    
    private int daysToEvent;
    
    
    public EventInfo(int aEventId, String aTitle, int aDays){
    this.daysToEvent = aDays;
    this.eventTitle = aTitle;
    this.eventId = aEventId;
    }

    public EventInfo() {
      
    }
    
    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public int getDaysToEvent() {
        return daysToEvent;
    }

    public void setDaysToEvent(int daysToEvent) {
        this.daysToEvent = daysToEvent;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }
    
    
    
}

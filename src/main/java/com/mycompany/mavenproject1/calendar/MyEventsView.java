/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.common.SimpleView;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.todaytraining.DisplayEventInfo;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "myeventsview")
@ViewScoped
public class MyEventsView extends SimpleView{
    
    private Events selectedEvent;
    
    private Date currentDate = new Date();


    
    @EJB
    private EventFacade eventFacade;
    
     public List<Events> getMojeEventy() {
        return eventFacade.getMojeEventy(getUserUname());
    }

     public void onRowSelect(SelectEvent event) {
     } 
 
     public Date getCurrentDate() {
    return currentDate;
}
     
    public Events getSelectedEvent() {
        return selectedEvent;
    }

    public void setSelectedEvent(Events selectedEvent) {
        this.selectedEvent = selectedEvent;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }
    
}

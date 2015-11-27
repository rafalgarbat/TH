/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.io.Serializable;
import java.util.Date;
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
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.ScheduleModel;
import org.primefaces.model.map.Circle;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "eventList")
@ViewScoped
public class EventList implements Serializable {

    private List<UserScheduleEvent> events;
    private UserScheduleEvent selectedEvent;
    
    private List<Calendars> userCalendars;
    
    /**
     * Wykorzystywany do schedulera 
     */
    private ScheduleModel eventModel;
    
    private MapModel simpleModel;
    private Marker marker;

    @ManagedProperty("#{eventService}")
    private EventService service;

    @PostConstruct
    public void init() {
        loadEvents();
    }
    
    public List<Calendars> loadCalendars(String aUname){
        return service.getUserCalendars(aUname);
    }
    
    public void loadEvents(){
       events = service.getEvents();
       
       if (!events.isEmpty()){
            selectedEvent = events.get(0);
       }
       loadGmapMarkes();
       eventModel =  new DefaultScheduleModel();
       for(UserScheduleEvent eve: events){
           if (eve.getStartDate() !=null){
            eventModel.addEvent(eve);
           }
       }
       
       FacesMessage msg = new FacesMessage("Events loaded: "+events.toString());
       FacesContext.getCurrentInstance().addMessage(null, msg);
             
       
    }
    
    public void onEventSelect(SelectEvent selectEvent) {
        selectedEvent = (UserScheduleEvent) selectEvent.getObject();
    }
     
    public void onDateSelect(SelectEvent selectEvent) {
        selectedEvent = new UserScheduleEvent("", (Date) selectEvent.getObject(), (Date) selectEvent.getObject());
    }
    
    public void loadGmapMarkes(){
        simpleModel = new DefaultMapModel(); 
        LatLng pCoord;
        for(UserScheduleEvent eve: events){
           String pCoords =  eve.getGmap_cords();
           if(pCoords != null && pCoords.length()>3){           
            String[] parts =  pCoords.split(", ");
            Double pLat = new Double(parts[0]);
            Double pLng = new Double(parts[1]);
            pCoord = new LatLng(pLat, pLng);
            Marker pMarker = new Marker(pCoord,eve.getTitle());
            pMarker.setData(new MarkerData(eve.getTitle(), eve.getDescription()));
            simpleModel.addOverlay(pMarker);
            
          /*  Circle circle1 = new Circle(pCoord, 500);  
        circle1.setStrokeColor("#d93c3c");  
        circle1.setFillColor("#d93c3c");  
        circle1.setFillOpacity(0.7);
        simpleModel.addOverlay(circle1);
         */   
           }
        }
    } 
    
    public void rowExpanded(ToggleEvent event) {        
        //Events eve = (Events)service.getEventFacade().getEntityManager().createNamedQuery("Events.findById").setParameter("id", selectedEvent.getDbEventId()).getResultList().get(0);
       // selectedEvent.setIloscZapisanych(eve.getUsereventsCollection().size());     
    }
       
    
    public void obserwujWydarzenie(String uname){
       service.getEventFacade().obserwujWydarzenie(selectedEvent,uname);
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
    
    public void onMarkerSelect(OverlaySelectEvent event) {
        marker = (Marker) event.getOverlay();
    }
      
    public MapModel getSimpleModel() {
        return simpleModel;
    }
     public Marker getMarker() {
        return marker;
    }

    public ScheduleModel getEventModel() {
        return eventModel;
    }

    public void setEventModel(ScheduleModel eventModel) {
        this.eventModel = eventModel;
    }

    public List<Calendars> getUserCalendars() {
        return userCalendars;
    }

    public void setUserCalendars(List<Calendars> userCalendars) {
        this.userCalendars = userCalendars;
    }
     
     
}

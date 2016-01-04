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
import java.util.Iterator;
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

    /**
     * Wszystkie wydarzenia
     */
    private List<UserScheduleEvent> allEvents;

    private DefaultScheduleModel allEventModel;

    private UserScheduleEvent selectedEvent;

    /*Lista wszystkich kalendarzy usera
     */
    private List<Calendars> userCalendars;

    /**
     * Model konkretnego, wybranego kalendarza
     */
    private List<DefaultScheduleModel> userCalendarModel;

    /**
     * Wykorzystywany do schedulera
     */
    private List<ScheduleModel> userEventsModel;

    private MapModel simpleModel;
    private Marker marker;

    @ManagedProperty("#{eventService}")
    private EventService service;

    @PostConstruct
    public void init() {
        loadEvents();
    }

    public List<Calendars> loadCalendars(String aUname) {
        return service.getUserCalendars(aUname);
    }

    /*Pobiera model danych dla wybranego kalendarza*/
    public DefaultScheduleModel loadCalendarModel(String aUname, String aCalendarName) {
        DefaultScheduleModel pCalendarModel = new DefaultScheduleModel();
        /*  List<UserScheduleEvent> pCalendarEvents = service.getUserCalendarEvents(aUname, aUname);
        for (UserScheduleEvent pUSE : pCalendarEvents) {
            pCalendarModel.addEvent(pUSE);
        }*/
        return pCalendarModel;
    }

    /*Pobiera wszystkie eventy - todo: zmienic to na lazy!!!*/
    public void loadEvents() {
        allEvents = service.getEvents();
        if (!allEvents.isEmpty()) {
            selectedEvent = allEvents.get(0);
        }
        loadGmapMarkes();

        allEventModel = new DefaultScheduleModel();
        for (UserScheduleEvent eve : allEvents) {
            if (eve.getStartDate() != null) {
          //      allEventModel.addEvent(eve);
            }
        }

        FacesMessage msg = new FacesMessage("Events loaded: " + allEvents.toString());
        FacesContext.getCurrentInstance().addMessage(null, msg);

    }

    public void onEventSelect(SelectEvent selectEvent) {
        selectedEvent = (UserScheduleEvent) selectEvent.getObject();
    }

    public void onDateSelect(SelectEvent selectEvent) {
        selectedEvent = new UserScheduleEvent("", (Date) selectEvent.getObject(), (Date) selectEvent.getObject());
    }

    public void loadGmapMarkes() {
        simpleModel = new DefaultMapModel();
        LatLng pCoord;
        for (UserScheduleEvent eve : allEvents) {
            String pCoords = eve.getGmap_cords();
            if (pCoords != null && pCoords.length() > 3) {
                String[] parts = pCoords.split(", ");
                Double pLat = new Double(parts[0]);
                Double pLng = new Double(parts[1]);
                pCoord = new LatLng(pLat, pLng);
                Marker pMarker = new Marker(pCoord, eve.getTitle());
                pMarker.setData(new MarkerData(eve.getTitle(), eve.getDescription()));
                simpleModel.addOverlay(pMarker);
            }
        }
    }

    public void rowExpanded(ToggleEvent event) {
        //Events eve = (Events)service.getEventFacade().getEntityManager().createNamedQuery("Events.findById").setParameter("id", selectedEvent.getDbEventId()).getResultList().get(0);        
    }

    public void obserwujWydarzenie(String uname) {
        service.getEventFacade().obserwujWydarzenie(selectedEvent, uname);
    }

    public List getEvents() {
        return allEvents;
    }

    public void setService(EventService service) {
        this.service = service;
    }

    public UserScheduleEvent getSelectedEvent() {
        return selectedEvent;
    }

    public void setEvents(List<UserScheduleEvent> events) {
        this.allEvents = events;
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

    public List<ScheduleModel> getUserEventsModel() {
        return userEventsModel;
    }

    public void setUserEventsModel(List<ScheduleModel> userEventsModel) {
        this.userEventsModel = userEventsModel;
    }

    public List<Calendars> getUserCalendars() {
        return userCalendars;
    }

    public void setUserCalendars(List<Calendars> userCalendars) {
        this.userCalendars = userCalendars;
    }

    public List<UserScheduleEvent> getAllEvents() {
        return allEvents;
    }

    public void setAllEvents(List<UserScheduleEvent> allEvents) {
        this.allEvents = allEvents;
    }

    public List<DefaultScheduleModel> getUserCalendarModel() {
        return userCalendarModel;
    }

    public void setUserCalendarModel(List<DefaultScheduleModel> userCalendarModel) {
        this.userCalendarModel = userCalendarModel;
    }

    public DefaultScheduleModel getAllEventModel() {
        return allEventModel;
    }

    public void setAllEventModel(DefaultScheduleModel allEventModel) {
        this.allEventModel = allEventModel;
    }

    public void onViewChange(SelectEvent selectEvent) {
   // String viewName = selectEvent.getObject().toString();
   FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Event moved", "Day delta");
        
    FacesContext.getCurrentInstance().addMessage(null, message);
    }
    
    
}

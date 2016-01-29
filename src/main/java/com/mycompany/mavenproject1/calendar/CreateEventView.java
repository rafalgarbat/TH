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
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;

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
    
    
    private double lat;     
    private double lng;
    private MapModel emptyModel;
    
    
    @PostConstruct
    public void init() {
        czyCykliczne=false;
        newEvent = new Events();
        emptyModel = new DefaultMapModel();
    }

     public void addMarker() {
        Marker marker = new Marker(new LatLng(lat, lng), "xxxx");
        emptyModel.addOverlay(marker);          
     
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

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public MapModel getEmptyModel() {
        return emptyModel;
    }

    public void setEmptyModel(MapModel emptyModel) {
        this.emptyModel = emptyModel;
    }
    
    
    
}

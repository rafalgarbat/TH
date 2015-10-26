/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Named;

 
import org.primefaces.event.ScheduleEntryMoveEvent;
import org.primefaces.event.ScheduleEntryResizeEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.ScheduleModel;
 
@ManagedBean
@Named("userScheduleBean")
@ViewScoped
public class UserScheduleBean implements Serializable {
 
    private ScheduleModel eventModel;
    private UserScheduleEvent event = new UserScheduleEvent();
 
    @EJB
    private KlientFacade klientFacade;
    
    private List<Events> listOfAllEvents = new ArrayList<>();
    
    @PostConstruct
    public void init() {
        eventModel = new DefaultScheduleModel();   
        listOfAllEvents = getFacade().getEntityManager().createNamedQuery("Events.findAll").getResultList();
        for (Events eve : listOfAllEvents) {
            UserScheduleEvent def=new UserScheduleEvent(eve.getTytul(), eve.getDataod() ,eve.getDatado(), eve);   
            
            //def.setStyleClass("public-event");
            eventModel.addEvent(def);            
        }
    }
     
   public KlientFacade getFacade() {
        return klientFacade;
    }

     
    public Date getInitialDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), Calendar.FEBRUARY, calendar.get(Calendar.DATE), 0, 0, 0);
         
        return calendar.getTime();
    }
     
    public ScheduleModel getEventModel() {
        return eventModel;
    }
       
     
    public UserScheduleEvent getEvent() {
        return event;
    }
 
    public void setEvent(UserScheduleEvent event) {
        this.event = event;
    }
    
    public void zapiszModel(ActionEvent actionEvent){
        getFacade().saveScheduleModel(getEventModel());
    }
    
    public void addEvent(ActionEvent actionEvent) {
        if(event.getId() == null)
            eventModel.addEvent(event);
        else
            eventModel.updateEvent(event);
         
        event = new UserScheduleEvent();
    }
    
    public void deleteEvent(ActionEvent actionEvent){
        eventModel.deleteEvent(event);
        
    }
    
    public void onEventSelect(SelectEvent selectEvent) {
        event = (UserScheduleEvent) selectEvent.getObject();        
        event.setKeywords(((Events)event.getData()).getKeywords());
        event.setDescription(((Events)event.getData()).getOpis());
    }
    
    public void onAddEvent(SelectEvent selectEvent) {
        event = new UserScheduleEvent("", (Date) today1Pm(), today1Pm());
    }
    
    public void onDateSelect(SelectEvent selectEvent) {
        event = new UserScheduleEvent("", (Date) selectEvent.getObject(), (Date) selectEvent.getObject());
    }
     
    public void onEventMove(ScheduleEntryMoveEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Event moved", "Day delta:" + event.getDayDelta() + ", Minute delta:" + event.getMinuteDelta());         
        addMessage(message);
    }
     
    public void onEventResize(ScheduleEntryResizeEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Event resized", "Day delta:" + event.getDayDelta() + ", Minute delta:" + event.getMinuteDelta());
         
        addMessage(message);
    }
     
    private void addMessage(FacesMessage message) {
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
    
    public String getDataEventId(){
        if (event.getData() != null){
           return ((Events)event.getData()).getEventId();
        }
        return "";
    }
    private Calendar today() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE), 0, 0, 0);
 
        return calendar;
    }
    private Date today1Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.HOUR, 1);
         
        return t.getTime();
    }
    
    public String getDataOpis(){
        if (event.getData() != null){
           return ((Events)event.getData()).getOpis();
        }
        return "opis pusty";
    }
    
    
    public String getDataKeywords(){
        if (event.getData() != null){
           return ((Events)event.getData()).getKeywords();
        }
        return "key pusty";
    }
   
    public String getDataGmapCords(){
        if (event.getData() != null){
           return ((Events)event.getData()).getGmapCords();
        }
        return "gmap pusty";
    }
   
    
}
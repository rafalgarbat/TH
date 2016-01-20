/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.coach;

import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.calendar.ob.Calendars;
import com.mycompany.mavenproject1.common.SimpleView;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.Userevents;
import com.mycompany.mavenproject1.todaytraining.DisplayEventInfo;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.ScheduleModel;

/**
 *
 * @author misiozel
 */
@ManagedBean(name = "coachplayerview")
@ViewScoped
public class CoachPlayerView extends SimpleView{
    
    private String playerId;

    @EJB
    private EventFacade eventFacade;
    
    /*zaznaczony trening osoby*/
    private DisplayEventInfo selectedEventInfo;
    
    /*wyswietlany rezultat treningu*/
    private Userevents rezultatTreningu;
    private Events myEvent;
    
    /*Model treningow playera*/
    private ScheduleModel eventModel;
    
    private String nowyKalendarz="0";
    private Calendars kalendarz;
    
    @PostConstruct
    public void init() {
    
        kalendarz = new Calendars(); //todo: zmienic na pobirany pierwszy z kolekcji 
        eventModel = getEvents();
    }
    
      public ScheduleModel getEvents() {
        Users pPlayer = eventFacade.getUserById(2); //todo - pobranie id z parametru
        ScheduleModel myModel = new DefaultScheduleModel();

        List<Events> pTmp = getEventFacade().getUserEvents(pPlayer.getUname());
        for (Events pU : pTmp) {
            DefaultScheduleEvent pD = new DefaultScheduleEvent(pU.getOpis(), pU.getDataod(), pU.getDataod(), pU);
            pD.setStyleClass("runpublic-event");
            myModel.addEvent(pD);
        }
        return myModel;
    }
    
    public List<DisplayEventInfo> getEventyUzytkownika() {
        Users pPlayer = eventFacade.getUserById(2);//todo - pobranie id z parametru
        return eventFacade.getEventyUzytkownika(pPlayer.getUname());
    }
    
    public List<Calendars> getUserCalendars() {
         Users pPlayer = eventFacade.getUserById(2);//todo - pobranie id z parametru
        return eventFacade.getUserCalendars(pPlayer.getUname());
    }
    
    public void onRowSelect(SelectEvent event) {
        DisplayEventInfo d = (DisplayEventInfo) event.getObject();
        myEvent = (Events) eventFacade.getEntityManager().createNamedQuery("Events.findById").setParameter("id", d.getId()).getResultList().get(0);
        //todo: setParameter("user_id", 2). 
        List pList = eventFacade.getEntityManager().createNativeQuery("select * from userevents ue where ue.user_id = 2 and event_id = ?", Userevents.class).setParameter(1, myEvent.getId()).getResultList();

        if (pList != null) {
            rezultatTreningu = (Userevents) pList.get(0);
        } else {
            rezultatTreningu = new Userevents();
            rezultatTreningu.setEventId(myEvent);
        }
        
    }
    
    
    /**
     Setery i Getery
     */
    public String getPlayerId() {
        return playerId;
    }

    public void setPlayerId(String playerId) {
        this.playerId = playerId;
    }

    public DisplayEventInfo getSelectedEventInfo() {
        return selectedEventInfo;
    }

    public void setSelectedEventInfo(DisplayEventInfo selectedEventInfo) {
        this.selectedEventInfo = selectedEventInfo;
    }

    public Userevents getRezultatTreningu() {
        return rezultatTreningu;
    }

    public void setRezultatTreningu(Userevents rezultatTreningu) {
        this.rezultatTreningu = rezultatTreningu;
    }

    public Events getMyEvent() {
        return myEvent;
    }

    public void setMyEvent(Events myEvent) {
        this.myEvent = myEvent;
    }

    public String getNowyKalendarz() {
        return nowyKalendarz;
    }

    public void setNowyKalendarz(String nowyKalendarz) {
        this.nowyKalendarz = nowyKalendarz;
    }

    public Calendars getKalendarz() {
        return kalendarz;
    }

    public void setKalendarz(Calendars kalendarz) {
        this.kalendarz = kalendarz;
    }

    public ScheduleModel getEventModel() {
        return eventModel;
    }

    public void setEventModel(ScheduleModel eventModel) {
        this.eventModel = eventModel;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }

           
    
}

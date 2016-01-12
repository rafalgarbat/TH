/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.auth.SessionBean;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.calendar.ob.Calendars;
import com.mycompany.mavenproject1.common.SimpleView;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpSession;
import org.primefaces.event.ScheduleEntryMoveEvent;
import org.primefaces.event.ScheduleEntryResizeEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.LazyScheduleModel;
import org.primefaces.model.ScheduleEvent;
import org.primefaces.model.ScheduleModel;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "usercalendar")
@ViewScoped
public class UserCalendarView extends SimpleView{

    private ScheduleModel lazyEventModel;

    private ScheduleEvent event = new DefaultScheduleEvent();

    @EJB
    private EventFacade eventFacade;

    @PostConstruct
    public void init() {
         
        lazyEventModel = new LazyScheduleModel() {

            @Override
            public void loadEvents(Date start, Date end) {

                Date random = getRandomDate(start);
                DefaultScheduleEvent d = new DefaultScheduleEvent("Lazy Event 1", random, random);
                d.setStyleClass("fc-view-container2");
            //    addEvent(d);                

                for (int i = 1; i < 15; i++) {
                    random = getRandomDate(start);
                    //    addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"bikepublic-event"));
                }
                for (int i = 1; i < 10; i++) {
                    random = getRandomDate(start);
                    //      addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"swimpublic-event"));
                }
                /* for(int i=1;i<10;i++){
                    random = getRandomDate(start); 
                    addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"runpublic-event"));
                }
                 */
                List<Events> pTmp = getEventFacade().getUserEvents(FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("username").toString(), start, end);
                for (Events pU : pTmp) {                    
                    DefaultScheduleEvent pD = new DefaultScheduleEvent(pU.getTytul(), pU.getDataod(), pU.getDataod(), pU);
                    pD.setStyleClass("runpublic-event");
                    addEvent(pD);
                }

            }
        };
    }

    public List<Calendars> getUserCalendars(String aUname) {
        return eventFacade.getUserCalendars(aUname);
    }

    public Date getRandomDate(Date base) {
        Calendar date = Calendar.getInstance();
        date.setTime(base);
        date.add(Calendar.DATE, ((int) (Math.random() * 30)) + 1);    //set random day of month

        return date.getTime();
    }

    public ScheduleModel getLazyEventModel() {
        return lazyEventModel;
    }

    
   

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public ScheduleEvent getEvent() {
        return event;
    }

    public void setEvent(ScheduleEvent event) {
        this.event = event;
    }

    public void addEvent(ActionEvent actionEvent) {
        if (event.getId() == null) {
            lazyEventModel.addEvent(event);
        } else {
            lazyEventModel.updateEvent(event);
        }

        eventFacade.zapiszDefaultScheduleEvent(getUserUname(),event);

        event = new DefaultScheduleEvent();
    }

    public void onEventSelect(SelectEvent selectEvent) {
        event = (ScheduleEvent) selectEvent.getObject();
    }

    public void onDateSelect(SelectEvent selectEvent) {
        event = new DefaultScheduleEvent("", (Date) selectEvent.getObject(), (Date) selectEvent.getObject());
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

}

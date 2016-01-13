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
import com.mycompany.mavenproject1.wspolne.SlownikStalych;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import org.primefaces.extensions.event.timeline.TimelineSelectEvent;
import org.primefaces.extensions.model.timeline.TimelineEvent;
import org.primefaces.extensions.model.timeline.TimelineGroup;
import org.primefaces.extensions.model.timeline.TimelineModel;
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
public class UserCalendarView extends SimpleView {

    private ScheduleModel eventModel;
    private String selectedCalendarName;
    private ScheduleEvent event = new DefaultScheduleEvent();

    private TimelineModel model_bieganie;
    private TimelineModel model_plywanie;
    private TimelineModel model_kolarstwo;
    private TimelineModel model_triathlon;

    @EJB
    private EventFacade eventFacade;

    @PostConstruct
    public void init() {
        eventModel = new DefaultScheduleModel();
        model_bieganie = new TimelineModel();
        model_plywanie = new TimelineModel();
        model_kolarstwo = new TimelineModel();
        model_triathlon = new TimelineModel();
        eventModel = getEvents();

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yy");
        Date data1 = new Date();

    }

    public ScheduleModel getEvents() {
        ScheduleModel myModel = new DefaultScheduleModel();

        List<Events> pTmp = getEventFacade().getUserEvents(FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("username").toString());
        for (Events pU : pTmp) {
            DefaultScheduleEvent pD = new DefaultScheduleEvent(pU.getTytul(), pU.getDataod(), pU.getDataod(), pU);
            pD.setStyleClass("runpublic-event");
            myModel.addEvent(pD);

            Calendar cal = Calendar.getInstance();
            cal.setTime(pU.getDataod());

            if (pU.getTyp_wydarzenia() != null && pU.getTyp_wydarzenia().equals(SlownikStalych.EVENT_RUNING)) {
                model_bieganie.add(new TimelineEvent(pU, cal.getTime()));
            }
            if (pU.getTyp_wydarzenia() != null && pU.getTyp_wydarzenia().equals(SlownikStalych.EVENT_SWIMMING)) {
                model_plywanie.add(new TimelineEvent(pU, cal.getTime()));
            }
            if (pU.getTyp_wydarzenia() != null && pU.getTyp_wydarzenia().equals(SlownikStalych.EVENT_BIKE)) {
                model_kolarstwo.add(new TimelineEvent(pU, cal.getTime()));
            }
            if (pU.getTyp_wydarzenia() != null && pU.getTyp_wydarzenia().equals(SlownikStalych.EVENT_TRIATHLON)) {
                model_triathlon.add(new TimelineEvent(pU, cal.getTime()));
            }

        }
        return myModel;
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

    public void setEventModel(ScheduleModel eventModel) {
        this.eventModel = eventModel;
    }

    public ScheduleModel getEventModel() {
        return eventModel;
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
            eventModel.addEvent(event);
        } else {
            eventModel.updateEvent(event);
        }

        eventFacade.zapiszDefaultScheduleEvent(getUserUname(), event, getSelectedCalendarName());

        event = new DefaultScheduleEvent();
    }

    public List<Date> getDates() {
        List dates = new ArrayList<Date>();

        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
        String dateInString;

        return dates;
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

    public String getSelectedCalendarName() {
        return selectedCalendarName;
    }

    public void setSelectedCalendarName(String selectedCalendarName) {
        this.selectedCalendarName = selectedCalendarName;
    }

    public TimelineModel getModel_bieganie() {
        return model_bieganie;
    }

    public TimelineModel getModel_plywanie() {
        return model_plywanie;
    }

    public TimelineModel getModel_kolarstwo() {
        return model_kolarstwo;
    }

    public TimelineModel getModel_triathlon() {
        return model_triathlon;
    }

    public void onSelect(TimelineSelectEvent e) {  
        TimelineEvent timelineEvent = e.getTimelineEvent();  
  
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Selected event:", timelineEvent.getData().toString());  
        FacesContext.getCurrentInstance().addMessage(null, msg);  
    } 
}

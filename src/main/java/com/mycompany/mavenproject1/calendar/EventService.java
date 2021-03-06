/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.calendar.ob.Usercalendars;
import com.mycompany.mavenproject1.calendar.ob.Calendars;
import com.mycompany.mavenproject1.calendar.ob.Calendarevents;
import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import com.mycompany.mavenproject1.event.Userevents;
import com.mycompany.mavenproject1.news.News;
import com.mycompany.mavenproject1.slowniki.Wartosci;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.HashMap;
import javax.ejb.EJB;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Jaroslaw.Skrzydlo eventFacade.getEntityManager().refresh(eve);
 */
@ManagedBean(name = "eventService")
@ApplicationScoped
public class EventService {

    @EJB
    private EventFacade eventFacade;

    @EJB
    private LoginFacade loginFacade;

    private List<UserScheduleEvent> list;
    private List<Events> listOfAllEvents = new ArrayList<>();

    /**
     * Zwraca liste wszystkich eventow z wszystkich kalendarzy danej osoby
     */
    public List<UserScheduleEvent> getUserEvents(String aUname) {
        Users pUser = loginFacade.getUser(aUname);
        list = new ArrayList<>(); //todo: uwaga czy to powinno nadpisywac list?
        for (Usercalendars pUserCal : pUser.getUsercalendarsCollection()) {
            Calendars pCalendar = (Calendars) pUserCal.getCalendarid();
            for (Calendarevents pCalEvent : pCalendar.getCalendareventsCollection()) {
                list.add(createUserScheduleEvent(pCalEvent.getEventid()));
            }
        }
        return list;
    }

    /**
     * Zwraca liste kalendarzy producenta
     */
    public List<Calendars> getUserCalendars(String aUname) {
        List<Calendars> pCalendars = new ArrayList<>();
        Users pUser = loginFacade.getUser(aUname);
        for (Usercalendars pUserCal : pUser.getUsercalendarsCollection()) {
            Calendars pCalendar = (Calendars) pUserCal.getCalendarid();
            pCalendars.add(pCalendar);
        }
        return pCalendars;
    }

    /**
     * Pobiera lista eventow z podanego kalendarza
     */
    public List<UserScheduleEvent> getUserCalendarEvents(String aUname, String aCalendarName) {
        Users pUser = loginFacade.getUser(aUname);
        List<UserScheduleEvent> pSelectedCalendarEvents = new ArrayList();
        for (Usercalendars pUserCal : pUser.getUsercalendarsCollection()) {
            Calendars pCalendar = (Calendars) pUserCal.getCalendarid();
            if (pCalendar.getName().equals(aCalendarName)) {
                for (Calendarevents pCalEvent : pCalendar.getCalendareventsCollection()) {
                    pSelectedCalendarEvents.add(createUserScheduleEvent(pCalEvent.getEventid()));
                }
            }
        }
        return new ArrayList();
    }

    public List<UserScheduleEvent> getEvents() {
        list = new ArrayList<>();
        HashMap pSlownik = new HashMap();
        List<Wartosci> pTmpDystanse = new ArrayList<>();

        pTmpDystanse = getEventFacade().getEntityManager().createNamedQuery("Wartosci.findAll").getResultList();
        for (Wartosci w : pTmpDystanse) {
            pSlownik.put(new Integer(w.getId()).intValue(), w.getNazwa());
        }

        listOfAllEvents = getEventFacade().getEntityManager().createNamedQuery("Events.findAll").getResultList();
        for (Events eve : listOfAllEvents) {
            UserScheduleEvent def = new UserScheduleEvent(eve.getTytul(), eve.getDataod(), eve.getDatado(), eve);
            def.setDbEventId(eve.getId());
            def.setStartDate(eve.getDataod());
            def.setEndDate(eve.getDatado());
            def.setIloscZapisanych(eve.getUsereventsCollection().size());
            def.setAdres(eve.getAdres());
            def.setDescription(eve.getOpis());
            def.setKeywords(eve.getKeywords());
            def.setTypWydarzenia(eve.getTyp_wydarzenia());
            def.setAdreswww(eve.getAdreswww());
            //  def.setAllDay(eve.getCzycalydzien());
            def.setGmap_cords(eve.getGmapCords());
          //  def.setRating(eve.getRating());
            if (eve.getDystans() != null){
                def.setDystans((String)pSlownik.get(Integer.parseInt(eve.getDystans())));
            }
            def.setOrganizator_info(eve.getOrganizator_info());
            def.setRanga(eve.getRanga());
            def.setRejestracja_info(eve.getRejestracja_info());
            def.setZapisani(eve.getUsereventsCollection());
            list.add(def);
        }
        return list;
    }

    public UserScheduleEvent createUserScheduleEvent(Events aEvent) {
        UserScheduleEvent def = new UserScheduleEvent(aEvent.getTytul(), aEvent.getDataod(), aEvent.getDatado(), aEvent);
        return def;
    }

    public int sprawdzCzyZapisany(UserScheduleEvent event, String uname) {
        Iterator pIt = event.getZapisani().iterator();
        while (pIt.hasNext()) {
            Userevents u = (Userevents) pIt.next();
            if (u.getUserId().getUname().equals(uname)) {
                return 1;
            }
        }
        return 0;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    private int getRandomId() {
        return 6;
    }

}

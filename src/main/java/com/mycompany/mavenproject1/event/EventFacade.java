/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.calendar.ob.Calendarevents;
import com.mycompany.mavenproject1.calendar.ob.Calendars;
import com.mycompany.mavenproject1.calendar.EventInfo;
import com.mycompany.mavenproject1.calendar.ob.Usercalendars;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.ScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Stateless
public class EventFacade extends AbstractFacade<Events> {

    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public EventFacade() {
        super(Events.class);
    }

    public void zapiszDefaultScheduleEvent(String aUname, ScheduleEvent aDef) {
        Events ev = new Events();
        ev.setTytul(aDef.getTitle());
        ev.setDataod(aDef.getStartDate());
        ev.setDatado(aDef.getStartDate());
        ev.setEventId(aDef.getId());
        
        
        
       // Calendarevents ca = new Calendarevents();
        //ca.setCalenarid(aDef.getData());
       // ca.setEventid(ev);
        
        em.persist(ev);
        
    }

    public List<Userevents> getEventyUzytkownika(String aUname) {
        Users pUser = (Users) getUser(aUname);
        List<Userevents> pList = new ArrayList<>();
        for (Userevents pUserEvent : pUser.getUsereventsCollection()) {
            pList.add(pUserEvent);
        }
        return pList;
    }
    /*
    Bierzemy dwa rodzaje eventow
    1. Eventy z moich kalendarzy
    2. Utworzone przezemnie eventy
     */

    public List<Events> getUserEvents(String aUname, Date aDateStart, Date aDateEnd) {
        List<Events> pUSE = new ArrayList<>();
        Users pUser = (Users) getUser(aUname);
        for (Usercalendars pUserCal : pUser.getUsercalendarsCollection()) {
            Calendars pCalendar = (Calendars) pUserCal.getCalendarid();
            for (Calendarevents pCalEvent : pCalendar.getCalendareventsCollection()) {
                if (true) {
                    pUSE.add(pCalEvent.getEventid());
                }
            }
        }

        return pUSE;
    }

    /**
     * Zwraca liste kalendarzy użytkownika
     */
    public List<Calendars> getUserCalendars(String aUname) {
        List<Calendars> pUSE = new ArrayList<>();
        Users pUser = (Users) getUser(aUname);
        for (Usercalendars pUserCal : pUser.getUsercalendarsCollection()) {
            pUSE.add(pUserCal.getCalendarid());

        }
        return pUSE;
    }

    public void zapiszUserEvent(Userevents ue) {
        em.persist(ue);
    }

    public void zapiszEvent(Events e) {
        em.persist(e);
    }

    public void obserwujWydarzenie(UserScheduleEvent selectedEvent, String uname) {
        Userevents us = new Userevents();
        Query pQuery = em.createNamedQuery("Users.findByUname").setParameter("uname", uname).setMaxResults(1);
        Users pUser = (Users) pQuery.getResultList().get(0);
        us.setEventId((Events) selectedEvent.getData());
        us.setUserId(pUser);

        em.persist(us);
    }

    public EventInfo podajNajblizsze(String aUname) {
        Users pUser = getUser(aUname);

        Query pQuery = getEntityManager().createNativeQuery("select e.id, e.tytul, to_char(age(e.dataod,now()),'DD') from userevents ue, events e"
                + " where ue.event_id =  e.id"
                + " and ue.user_id = ?"
                + " and e.dataod > now()"
                + " order by e.dataod"
                + " limit 1");
        pQuery.setParameter(1, pUser.getUid());
        EventInfo pei = new EventInfo();
        List<Object[]> results = pQuery.getResultList();
        for (Object[] ob : results) {
            pei.setEventId((int) ob[0]);
            pei.setEventTitle((String) ob[1]);
            pei.setDaysToEvent(new Integer((String) ob[2]));
        }

        return pei;
    }

    public HashMap<String, Long> podajStatystykiWydarzen(String aUname, String aMask, String aTypWydarzenia) {
        HashMap<String, Long> pStats = new HashMap<>();
        String pQuery = "select coalesce(d.data,'-'), d.count from ("
                + "                select to_char(e.dataod,'YYYY-MM') as data,count(*) from events e, userevents ue "
                + "                where ue.event_id =  e.id and e.typ_wydarzenia = '?'"
                + "                 group by to_char(e.dataod,'YYYY-MM') order by 1 "
                + "                )d order by 1";
        List<Object[]> results = getEntityManager().createNativeQuery(pQuery).setParameter(1, aTypWydarzenia).getResultList();
        for (Object[] ob : results) {
            String pKey = (String) ob[0];
            Long pVal = (Long) ob[1];
            pStats.put(pKey, pVal);
        }
        return pStats;

    }

    /**
     * Zwraca mape z iloscią eventow dla danego czasu (maska)
     *
     * @param aUname
     * @param aMask
     * @param aUdzial
     * @return
     */
    public HashMap<String, Long> podajStatystyki(String aUname, String aMask, int aUdzial) {
        HashMap<String, Long> pStats = new HashMap<>();
        String pQuery = "select coalesce(d.data,'-'), d.count from ("
                + "select to_char(e.dataod,'YYYY-MM') as data,count(*) from events e, userevents ue "
                + "where ue.event_id =  e.id and ue.stan = ? "
                + " group by to_char(e.dataod,'YYYY-MM') order by 1 "
                + ")d";

        List<Object[]> results = getEntityManager().createNativeQuery(pQuery).setParameter(1, aUdzial).getResultList();
        for (Object[] ob : results) {
            String pKey = (String) ob[0];
            Long pVal = (Long) ob[1];
            pStats.put(pKey, pVal);
        }
        return pStats;

    }

}

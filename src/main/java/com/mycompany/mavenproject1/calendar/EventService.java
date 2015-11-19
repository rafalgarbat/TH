/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import com.mycompany.mavenproject1.news.News;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "eventService")
@ApplicationScoped
public class EventService {

    @EJB
    private EventFacade eventFacade;

    private List<UserScheduleEvent> list;
    private List<Events> listOfAllEvents = new ArrayList<>();

    public List<UserScheduleEvent> getEvents() {
        list = new ArrayList<UserScheduleEvent>();

        listOfAllEvents = getEventFacade().getEntityManager().createNamedQuery("Events.findAll").getResultList();
        for (Events eve : listOfAllEvents) {
            
            UserScheduleEvent def = new UserScheduleEvent(eve.getTytul(), eve.getDataod(), eve.getDatado(), eve);            
            def.setDbEventId(eve.getId());
            def.setIloscZapisanych(eve.getUsereventsCollection().size());
            list.add(def);
        }

        return list;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    private int getRandomId() {
        return 6;
    }

}

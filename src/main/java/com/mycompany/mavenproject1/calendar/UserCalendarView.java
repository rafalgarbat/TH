/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.LazyScheduleModel;
import org.primefaces.model.ScheduleModel;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "usercalendar")
@ViewScoped
public class UserCalendarView {

    private ScheduleModel lazyEventModel;

    private int jakasWartosc =5;
    
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
                addEvent(d);                
              
                for(int i=1;i<15;i++){
                    random = getRandomDate(start);
                    addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"bikepublic-event"));
                }
                 for(int i=1;i<10;i++){
                    random = getRandomDate(start); 
                    addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"swimpublic-event"));
                } 
               /* for(int i=1;i<10;i++){
                    random = getRandomDate(start); 
                    addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random,"runpublic-event"));
                }
                 */ 
                List<Events> pTmp = getEventFacade().getUserEvents("ala", start, end);
                jakasWartosc= pTmp.size();
                for(Events pU : pTmp){
                    addEvent(new DefaultScheduleEvent("Lazy "+pU.getTytul(), pU.getDataod(), pU.getDataod(),"runpublic-event"));
                }
                  
            }
        };
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
    
    public int wydarzenWMiesiacu(){
    return jakasWartosc;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    
    
    
    
}

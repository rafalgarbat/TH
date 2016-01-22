/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

import com.mycompany.mavenproject1.calendar.ob.Usercalendars;
import com.mycompany.mavenproject1.calendar.ob.Calendars;
import com.mycompany.mavenproject1.calendar.ob.Calendarevents;
import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import com.mycompany.mavenproject1.event.Userevents;
import com.mycompany.mavenproject1.grups.Grups;
import com.mycompany.mavenproject1.grups.GrupsFacade;
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
@ManagedBean(name = "grupService")
@ApplicationScoped
public class GrupService {

    @EJB
    private GrupsFacade grupsFacade;

    @EJB
    private LoginFacade loginFacade;

    private List<Grups> myGrups;
    private List<Grups> allGrups;

    /**
     * Zwraca liste wszystkich grup z danej osoby
     */
    public List<Grups> getUserGrups(String aUname) {
        Users pUser = loginFacade.getUser(aUname);
        myGrups = new ArrayList<>();         
        return myGrups;
    }

 
 
    public List<Grups> getGrups() {
        allGrups = new ArrayList<>();
        HashMap pSlownik = new HashMap();


        allGrups = getGrupsFacade().getEntityManager().createNamedQuery("Grups.findAll").getResultList();
      
        return allGrups;
    }



    public GrupsFacade getGrupsFacade() {
        return grupsFacade;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.ScheduleEvent;
import org.primefaces.model.ScheduleModel;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Stateless
public class KlientFacade extends AbstractFacade<Klient> {

    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public KlientFacade() {
        super(Klient.class);
    }

    public Event readEvent(Object aObject){
        Event pEve = (Event)aObject;
        List<Event> listOfEvents = new ArrayList<>();  
        listOfEvents = em.createNamedQuery("Event.findById").setParameter("id", pEve.getId()).getResultList();
        int x=0;
       return listOfEvents.get(0);
    }
    
    public void saveScheduleModel(ScheduleModel aModel){        
        Event myEvent;
        List<Event> listOfEvents = new ArrayList<Event>();  
        for (ScheduleEvent eve : aModel.getEvents()) {                        
            Event e = (Event)eve.getData();
            if (e ==null){
                //dodanie nowego
                myEvent = new Event();
                myEvent.setEvent_id(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate());
                myEvent.setGmap_cords(((UserScheduleEvent)eve).getGmap_cords());    
                myEvent.setKeywords(((UserScheduleEvent)eve).getKeywords());    
                em.persist(myEvent);  
            }else{
                listOfEvents = em.createNamedQuery("Event.findById").setParameter("id", e.getId()).getResultList();
                myEvent = listOfEvents.get(0);
                myEvent.setEvent_id(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate()); 
                myEvent.setGmap_cords(((UserScheduleEvent)eve).getGmap_cords());
                myEvent.setKeywords(((UserScheduleEvent)eve).getKeywords());    
                getEntityManager().merge(myEvent);
            }
            
            
        }    
    }
    
}

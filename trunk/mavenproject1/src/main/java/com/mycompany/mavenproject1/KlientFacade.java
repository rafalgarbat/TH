/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

    public Event readEvent(String aEventId){
        List<Event> listOfEvents = new ArrayList<>();  
        listOfEvents = em.createNamedQuery("Event.findByEvent_Id").setParameter("event_id", aEventId).getResultList();
        return listOfEvents.get(0);
    }
    
    public void saveScheduleModel(ScheduleModel aModel){        
        Event myEvent;
        List<Event> listOfEvents = new ArrayList<Event>();  
        for (ScheduleEvent eve : aModel.getEvents()) {                        
            
            listOfEvents = em.createNamedQuery("Event.findByEvent_Id").setParameter("event_id", eve.getId()).getResultList();
            if (listOfEvents.size()>0){
                myEvent = listOfEvents.get(0);
                myEvent.setEvent_id(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate()); 
                getEntityManager().merge(myEvent);
            }else{
                myEvent = new Event();
                myEvent.setEvent_id(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate());
                em.persist(myEvent);            
            }            
        }    
    }
    
    public boolean login(String user, String password) {

        /*zmienić to - poki co tylko testowo*/    
        Query pQuery = em.createQuery("select user, pass from userinfo where user= ?1 and pass= ?2 ").setParameter(1, user).setParameter(2, password);

        if (pQuery.getResultList().isEmpty()) {
            return false;
        }

        return true;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.UserScheduleEvent;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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

    public Events readEvent(Object aObject){
        Events pEve = (Events)aObject;
        List<Events> listOfEvents = new ArrayList<>();  
        listOfEvents = em.createNamedQuery("Events.findById").setParameter("id", pEve.getId()).getResultList();
        int x=0;
       return listOfEvents.get(0);
    }
    
    public void saveScheduleModel(ScheduleModel aModel){        
        Events myEvent;
        List<Events> listOfEvents = new ArrayList<>();  
        for (ScheduleEvent eve : aModel.getEvents()) {                        
            Events e = (Events)eve.getData();
            if (e ==null){
                //dodanie nowego
                myEvent = new Events();
                myEvent.setEventId(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate());
                myEvent.setGmapCords(((UserScheduleEvent)eve).getGmap_cords());    
                myEvent.setOpis(((UserScheduleEvent)eve).getDescription());
                myEvent.setTypPrzesuniecia(((UserScheduleEvent)eve).getTypPrzesuniecia());
                myEvent.setKeywords(((UserScheduleEvent)eve).getKeywords());    
                em.persist(myEvent);  
            }else{
                listOfEvents = em.createNamedQuery("Events.findById").setParameter("id", e.getId()).getResultList();
                myEvent = listOfEvents.get(0);
                myEvent.setEventId(eve.getId());
                myEvent.setTytul(eve.getTitle());
                myEvent.setDatado(eve.getEndDate());
                myEvent.setDataod(eve.getStartDate()); 
                myEvent.setGmapCords(((UserScheduleEvent)eve).getGmap_cords());
                myEvent.setOpis(((UserScheduleEvent)eve).getDescription());
                myEvent.setTypPrzesuniecia(((UserScheduleEvent)eve).getTypPrzesuniecia());
                myEvent.setKeywords(((UserScheduleEvent)eve).getKeywords());    
                getEntityManager().merge(myEvent);
            }
            
            
        }    
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.todaytraining;

import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.ob.EventsInvitations;
import com.mycompany.mavenproject1.forum.ForumFacade;
import com.mycompany.mavenproject1.forum.ob.Forum;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "showtrainingcontroller")
@ViewScoped
public class ShowTrainingController implements Serializable {

    @EJB
    private EventFacade eventFacade;
    
    @EJB
    private ForumFacade forumFacade;
    
    private String eventId;

    private String eventId2;

    public List<EventsInvitations> podajListeZaproszonych() {
        return eventFacade.getEntityManager().createNativeQuery("select * from events_invitations where eventid = ? ", EventsInvitations.class).setParameter(1, 61).getResultList();
    }

    public List<Forum> getListaWiadomosci(){
        return forumFacade.getWiadomosciZForum(61);
    }
    
    
    public void attrListener(ActionEvent event) {

        eventId2 = (String) event.getComponent().getAttributes().get("eventId");

    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventId2() {
        return eventId2;
    }

    public void setEventId2(String eventId2) {
        this.eventId2 = eventId2;
    }
    

}

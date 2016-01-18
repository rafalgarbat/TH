/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.coach;

import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.common.SimpleView;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "coachview")
@ViewScoped
public class CoachView extends SimpleView {
    
    private List<Users> player;
    
    @EJB
    private EventFacade eventFacade;
    
    @PostConstruct
    public void init() {
       player = getCoachPlayers();
    }
    
    public List<Users> getCoachPlayers(){    
      return getEventFacade().getCoachPlayers(FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("username").toString());      
    }

    public List<Users> getPlayer() {
        return player;
    }

    public void setPlayer(List<Users> player) {
        this.player = player;
    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }
    
    
    
    
}

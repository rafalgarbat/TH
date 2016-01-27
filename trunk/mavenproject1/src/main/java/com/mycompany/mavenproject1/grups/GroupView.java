/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

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
@ManagedBean(name = "groupview")
@ViewScoped
public class GroupView extends SimpleView {
    
    private List<Grups> player;
    
    @EJB
    private GrupsFacade grupsFacade;
    
    @PostConstruct
    public void init() {
       player = getCoachPlayers();
    }
    
    public List<Grups> getCoachPlayers(){    
      return getEventFacade().getUserGrups(FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("username").toString());      
    }

    public List<Grups> getPlayer() {
        return player;
    }

    public void setPlayer(List<Grups> player) {
        this.player = player;
    }

    public GrupsFacade getEventFacade() {
        return grupsFacade;
    }

    public void setEventFacade(GrupsFacade eventFacade) {
        this.grupsFacade = eventFacade;
    }
    
    
    
    
}

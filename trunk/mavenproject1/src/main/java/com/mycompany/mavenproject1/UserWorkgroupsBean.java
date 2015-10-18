/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
 
import org.primefaces.event.TabChangeEvent;
import org.primefaces.event.TabCloseEvent;

 
@ManagedBean
@Named("userWorkgroupsBean")
@ViewScoped
public class UserWorkgroupsBean {
     
    private List<GrupyTreningowe> cars;
 
    @PostConstruct
    public void init() {
        cars = new ArrayList<GrupyTreningowe>();
       GrupyTreningowe gru  = new GrupyTreningowe();
       gru.setNazwa("nazwa 1");
       GrupyTreningowe gru1  = new GrupyTreningowe();
       gru.setNazwa("nazwa 2");
       GrupyTreningowe gru2  = new GrupyTreningowe();
       gru.setNazwa("nazwa 3");
       GrupyTreningowe gru3  = new GrupyTreningowe();
       gru.setNazwa("nazwa 4");
        cars.add(gru);cars.add(gru1);cars.add(gru2);cars.add(gru3);
       
    }
     
    public List<GrupyTreningowe> getGrupy() {
        return cars;
    }
     
    public void onTabChange(TabChangeEvent event) {
        FacesMessage msg = new FacesMessage("Tab Changed", "Active Tab: " + event.getTab().getTitle());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
         
    public void onTabClose(TabCloseEvent event) {
        FacesMessage msg = new FacesMessage("Tab Closed", "Closed tab: " + event.getTab().getTitle());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
}
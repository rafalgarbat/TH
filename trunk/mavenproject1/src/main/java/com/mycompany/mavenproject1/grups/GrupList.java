/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import org.primefaces.model.DefaultScheduleModel;

/**
 *
 * @author rafal.garbat
 */
@ManagedBean(name = "dtgrupList")
@ViewScoped
public class GrupList implements Serializable {

   
    /**
     * Wszystkie grupy
     */
    private List<Grups> allGrups;
    private Grups selectedGrup;
    @ManagedProperty("#{grupService}")
    private GrupService service;

    @PostConstruct
    public void init() {
        loadGrups();
    }
 
    public List<Grups> getGrups() {
        return allGrups;
    }
    
      public void loadGrups() {
        allGrups = service.getGrups();
    }
      
    public void setService(GrupService service){
        this.service = service;
    }
    
      public void buttonAction(ActionEvent actionEvent) {

        addMessage("Dodano do grupy !!");
    }
     
    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary,  null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
    
}

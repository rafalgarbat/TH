/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.LazyDataModel;
 
@ManagedBean(name="dtLazyView")
@ViewScoped
public class LazyView implements Serializable {
     
    private LazyDataModel<Contact> lazyModel;
     
    private Contact selectedContact;
     
    @ManagedProperty("#{carService}")
    private CarService service;
     
    @PostConstruct
    public void init() {
       // lazyModel = new LazyCarDataModel(service.createContacts(200,"ala"));
    }
 
    public LazyDataModel<Contact> getLazyModel() {
        return lazyModel;
    }
    
    public LazyDataModel<Contact> getLazyModel(String aUname) {
         lazyModel = new LazyCarDataModel(service.createContacts(200,"ala"));
         return lazyModel;
    }
     
    public Contact getSelectedContact() {
        return selectedContact;
    }
 
    public void setSelectedContact(Contact selectedCar) {
        this.selectedContact = selectedCar;
    }
     
    public void setService(CarService service) {
        this.service = service;
    }
     
    public void onRowSelect(SelectEvent event) {
        //FacesMessage msg = new FacesMessage("Car Selected", ((Contact) event.getObject()).getUname());
       // FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    
    public void sendInvitation(String aUname, String aUnameTo){    
       // service.sendInvitation(aUname, aUnameTo); 
     FacesMessage msg = new FacesMessage("Car Selected");
     FacesContext.getCurrentInstance().addMessage(null, msg);
    
    }
    
}
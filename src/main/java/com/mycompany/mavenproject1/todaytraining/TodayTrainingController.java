/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.todaytraining;

import com.mycompany.mavenproject1.calendar.EventService;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.event.Userevents;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.persistence.Query;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.apache.commons.lang3.StringUtils;
import org.primefaces.event.SelectEvent;
import org.primefaces.extensions.model.timeline.TimelineEvent;
import org.primefaces.extensions.model.timeline.TimelineModel;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean
@ViewScoped
public class TodayTrainingController implements Serializable {

    @EJB
    private EventFacade eventFacade;
    private Userevents selectedUserEvent;
    private Userevents myUserEvent;
    private Events myEvent;

    private DisplayEventInfo selectedEventInfo;
    private Userevents rezultatTreningu;

    private Date dateFrom;
    private Date dateTo;
    
    
     private TimelineModel modelFirst; 
    

    public List<DisplayEventInfo> getEventyUzytkownika(String aUname) {
        return eventFacade.getEventyUzytkownika(aUname);
    }

    public String show(String aUrl){
    return aUrl;
    }
    
    public Events getEvent(int aUserEventId) {
        Query pQ = eventFacade.getEntityManager().createNamedQuery("Userevents.findByUid").setParameter("uid", aUserEventId);
        pQ.setParameter("orderBy", "last_update_dt");
        Userevents pTmp = (Userevents) pQ.getSingleResult();
        return pTmp.getEventId();
    }

    // todo: przeniesc do fasady!
    public List<DisplayEventInfo> getEventyWplanie(String aUname) {
        modelFirst = new TimelineModel(); 
        Calendar cal = Calendar.getInstance();
            
        
        List<DisplayEventInfo> pWyniki = eventFacade.getEventyWplanie(aUname);
        for (DisplayEventInfo ob : pWyniki) {            
            cal.setTime(ob.getDataod());
           if (ob.getTypWydarzenia() != null && ob.getTypWydarzenia().equals("1")){
               modelFirst.add(new TimelineEvent(new Task(ob.getEventTitle(), "bike.png", false,"SoftGreenBack"), cal.getTime()));  
           }
           if (ob.getTypWydarzenia() != null && ob.getTypWydarzenia().equals("2")){
               modelFirst.add(new TimelineEvent(new Task(ob.getEventTitle(), "swim.png", false,"SoftRedBack"), cal.getTime()));  
           }
           if (ob.getTypWydarzenia() != null && ob.getTypWydarzenia().equals("3")){
               modelFirst.add(new TimelineEvent(new Task(ob.getEventTitle(), "run.png", false,"SoftOrangeBack"), cal.getTime()));  
           }                        
        }
        return pWyniki;
    }

    public boolean filterByDate(Object value, Object filter, Locale locale) {
        // it fails before calling this method
        String filterText = (filter == null) ? null : filter.toString().trim();
        if (StringUtils.isEmpty(filterText)) {
            return true;
        }
        if (value == null) {
            return false;
        }
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date filterDate;
        try {
            filterDate = df.parse(filterText);
        } catch (ParseException e) {
            return false;
        }
        return filterDate.after(dateFrom) && filterDate.before(dateTo);
    }

    public void oznaczJakoPubliczne() {
        selectedUserEvent.getEventId().setCzycalydzien(Boolean.TRUE);
        eventFacade.zapiszUserEvent(selectedUserEvent);
    }

    public void zapiszZmiany() {

        eventFacade.zapiszUserEvent(rezultatTreningu);

    }

    public void loadEvent(int aUserEventId) {

    }

    public EventFacade getEventFacade() {
        return eventFacade;
    }

    public void setEventFacade(EventFacade eventFacade) {
        this.eventFacade = eventFacade;
    }

    public Userevents getMyUserEvent() {
        return myUserEvent;
    }

    public void setMyUserEvent(Userevents myUserEvent) {
        this.myUserEvent = myUserEvent;
    }

    public Events getMyEvent() {
        return myEvent;
    }

    public void setMyEvent(Events myEvent) {
        this.myEvent = myEvent;
    }

    public Userevents getSelectedUserEvent() {
        return selectedUserEvent;
    }

    public void setSelectedUserEvent(Userevents selectedUserEvent) {
        this.selectedUserEvent = selectedUserEvent;
    }

    public void onRowSelect2(SelectEvent event) {
        DisplayEventInfo d = (DisplayEventInfo) event.getObject();
        myEvent = (Events) eventFacade.getEntityManager().createNamedQuery("Events.findById").setParameter("id", d.getId()).getResultList().get(0);
        //todo: setParameter("user_id", 2). 
        List pWynik = eventFacade.getEntityManager().createNativeQuery("select * from Userevents where user_id= ? and event_id= ?", Userevents.class)
                .setParameter(1, 2)
                .setParameter(2, myEvent.getId()).getResultList();

        if (pWynik.isEmpty()) {
            rezultatTreningu = new Userevents();
            rezultatTreningu.setEventId(myEvent);
        } else {
            rezultatTreningu = (Userevents) pWynik.get(0);
        }

        FacesMessage msg = new FacesMessage("Selected");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public TimelineModel getModelFirst() {
        return modelFirst;
    }

    public void setModelFirst(TimelineModel modelFirst) {
        this.modelFirst = modelFirst;
    }

    public void onRowSelect(SelectEvent event) {
        DisplayEventInfo d = (DisplayEventInfo) event.getObject();
        myEvent = (Events) eventFacade.getEntityManager().createNamedQuery("Events.findById").setParameter("id", d.getId()).getResultList().get(0);
        //todo: setParameter("user_id", 2). 
        List pList = eventFacade.getEntityManager().createNativeQuery("select * from userevents ue where ue.user_id = 2 and event_id = ?", Userevents.class).setParameter(1, myEvent.getId()).getResultList();

        if (pList != null) {
            rezultatTreningu = (Userevents) pList.get(0);
        } else {
            rezultatTreningu = new Userevents();
            rezultatTreningu.setEventId(myEvent);
        }

        FacesMessage msg = new FacesMessage("Selected");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public DisplayEventInfo getSelectedEventInfo() {
        return selectedEventInfo;
    }

    public void setSelectedEventInfo(DisplayEventInfo selectedEventInfo) {
        this.selectedEventInfo = selectedEventInfo;
    }

    public Userevents getRezultatTreningu() {
        return rezultatTreningu;
    }

    public void setRezultatTreningu(Userevents rezultatTreningu) {
        this.rezultatTreningu = rezultatTreningu;
    }

}

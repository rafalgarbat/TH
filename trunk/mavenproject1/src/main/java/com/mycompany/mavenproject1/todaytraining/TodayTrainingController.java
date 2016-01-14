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

    public List<Userevents> getMojeEventy(String aUname) {
        return eventFacade.getEventyUzytkownika(aUname);
    }

    public Events getEvent(int aUserEventId) {
        Query pQ = eventFacade.getEntityManager().createNamedQuery("Userevents.findByUid").setParameter("uid", aUserEventId);
        pQ.setParameter("orderBy", "last_update_dt");
        Userevents pTmp = (Userevents) pQ.getSingleResult();
        return pTmp.getEventId();
    }

    // todo: przeniesc do fasady!
    public List<DisplayEventInfo> getEventyWplanie(String aUname) {
        List<DisplayEventInfo> pWyniki = new ArrayList<DisplayEventInfo>();
        String pQuery = "select c.name, c.ispublic, e.id, e.tytul, e.opis, e.czycalydzien, e.czypubliczne, e.dataod, e.typ_wydarzenia, e.dystans  from usercalendars uc, calendarevents ce, events e, calendars c "
                + "where uc.userid =  ? "
                + "and ce.calenarid = uc.uid "
                + "and ce.eventid =  e.id "
                + "and c.uid = uc.calendarid order by e.dataod ";
        List<Object[]> results = eventFacade.getEntityManager().createNativeQuery(pQuery).setParameter(1, 2).getResultList();
        DisplayEventInfo pD;
        for (Object[] ob : results) {
            pD = new DisplayEventInfo();
            pD.setCalendarname((String) ob[0]);
            pD.setIsCalendarPublic((Boolean) ob[1]);
            pD.setId(Long.parseLong(String.valueOf(ob[2])));
            pD.setEventTitle((String) ob[3]);
            pD.setDataod((Date) ob[7]);
            pD.setTypWydarzenia((String) ob[8]);
            pD.setEventOpis((String) ob[4]);
            pWyniki.add(pD);
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

    public void zapiszZmiany() {
        eventFacade.zapiszUserEvent(selectedUserEvent);
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

    public void onRowSelect(SelectEvent event) {
        DisplayEventInfo d = (DisplayEventInfo) event.getObject();
        myEvent = (Events) eventFacade.getEntityManager().createNamedQuery("Events.findById").setParameter("id", d.getId()).getResultList().get(0);
        //todo: setParameter("user_id", 2). 
        List pList = eventFacade.getEntityManager().createNativeQuery("select * from userevents ue where ue.user_id = 2 and event_id = ?", Userevents.class).setParameter(1, myEvent.getId()).getResultList();
       
        if (pList != null) { 
            rezultatTreningu = (Userevents) pList.get(0);
        }else{
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

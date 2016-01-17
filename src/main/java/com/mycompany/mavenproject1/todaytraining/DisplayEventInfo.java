/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.todaytraining;

import java.util.Date;
import org.primefaces.model.SelectableDataModel;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class DisplayEventInfo {
    
    private Long id;
    private String calendarname;
    private boolean isCalendarPublic;
    private boolean isEventPublic;
    private boolean isAllDay;
    private String eventTitle;
    private String eventOpis;
    private Date dataod;
    private String typWydarzenia;
    private int dystans;    
    
    /*Informacje o zrealizowanym*/
    private String uwagiDoTreningu;
    private String link;
    private String duration;
    private String distance;
    private String kalorie;
    private String stan;
    
    /*Url*/
    private String publicUrl;
    
    public String getCalendarname() {
        return calendarname;
    }

    public void setCalendarname(String calendarname) {
        this.calendarname = calendarname;
    }

    public boolean isIsCalendarPublic() {
        return isCalendarPublic;
    }

    public void setIsCalendarPublic(boolean isCalendarPublic) {
        this.isCalendarPublic = isCalendarPublic;
    }

    public boolean isIsEventPublic() {
        return isEventPublic;
    }

    public void setIsEventPublic(boolean isEventPublic) {
        this.isEventPublic = isEventPublic;
    }

    public boolean isIsAllDay() {
        return isAllDay;
    }

    public void setIsAllDay(boolean isAllDay) {
        this.isAllDay = isAllDay;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventOpis() {
        return eventOpis;
    }

    public void setEventOpis(String eventOpis) {
        this.eventOpis = eventOpis;
    }

    public Date getDataod() {
        return dataod;
    }

    public void setDataod(Date dataod) {
        this.dataod = dataod;
    }

    public String getTypWydarzenia() {
        return typWydarzenia;
    }

    public void setTypWydarzenia(String typWydarzenia) {
        this.typWydarzenia = typWydarzenia;
    }

    public int getDystans() {
        return dystans;
    }

    public void setDystans(int dystans) {
        this.dystans = dystans;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUwagiDoTreningu() {
        return uwagiDoTreningu;
    }

    public void setUwagiDoTreningu(String uwagiDoTreningu) {
        this.uwagiDoTreningu = uwagiDoTreningu;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getKalorie() {
        return kalorie;
    }

    public void setKalorie(String kalorie) {
        this.kalorie = kalorie;
    }

    public String getStan() {
        return stan;
    }

    public void setStan(String stan) {
        this.stan = stan;
    }

    public String getPublicUrl() {
        return publicUrl;
    }

    public void setPublicUrl(String publicUrl) {
        this.publicUrl = publicUrl;
    }

    
            
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

import com.mycompany.mavenproject1.Event;
import java.util.Date;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.ScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class UserScheduleEvent extends DefaultScheduleEvent{
            
    
    private String gmap_cords;
    
    private String keywords;

    public UserScheduleEvent(String tytul, Date dataod, Date datado, Event eve) {
        super(tytul,dataod,datado,eve);
    }

    public UserScheduleEvent() {
        super();
    }

    public UserScheduleEvent(String string, Date date, Date date0) {
        super(string,date,date0);
    }

    public String getGmap_cords() {
        return gmap_cords;
    }

    public void setGmap_cords(String gmap_cords) {
        this.gmap_cords = gmap_cords;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
    
    
    
}

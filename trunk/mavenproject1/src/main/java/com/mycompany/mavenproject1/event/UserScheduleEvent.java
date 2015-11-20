/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

import java.util.Date;
import org.primefaces.model.DefaultScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class UserScheduleEvent extends DefaultScheduleEvent{
            
    //brakuje typu wydarzenia - tri, bieganie, kolarstwo
    //brakuje adresu wydarzenia (poza kordynatami gmaps)
    private String gmap_cords;
    private String keywords;
    private String description;
    private int typPrzesuniecia;
    private String adres;
    private String typWydarzenia;
    private int dbEventId;
    
    private int iloscZapisanych;
    

    public UserScheduleEvent(String tytul, Date dataod, Date datado, Events eve) {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTypPrzesuniecia() {
        return typPrzesuniecia;
    }

    public void setTypPrzesuniecia(int typPrzesuniecia) {
        this.typPrzesuniecia = typPrzesuniecia;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getTypWydarzenia() {
        return typWydarzenia;
    }

    public void setTypWydarzenia(String typWydarzenia) {
        this.typWydarzenia = typWydarzenia;
    }

    public int getDbEventId() {
        return dbEventId;
    }

    public void setDbEventId(int dbEventId) {
        this.dbEventId = dbEventId;
    }

    public int getIloscZapisanych() {
        return iloscZapisanych;
    }

    public void setIloscZapisanych(int iloscZapisanych) {
        this.iloscZapisanych = iloscZapisanych;
    }
        
   
    
}

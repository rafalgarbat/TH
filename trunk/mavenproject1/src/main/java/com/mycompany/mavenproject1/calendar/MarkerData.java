/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class MarkerData {
    private String title;
    private String opis;

    public MarkerData(String aTitle, String aOpis){
        this.title = aTitle;
        this.opis = aOpis;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
    
}

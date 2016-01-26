/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.todaytraining;

import java.io.Serializable;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class Task implements Serializable{
   
    private String title;  
    private String imagePath;      
    private String style;  
    private boolean period;  
  
    public Task(String title, String imagePath, boolean period,String style) {  
        this.title = title;  
        this.imagePath = imagePath;  
        this.period = period;  
        this.style = style;
    }  
  
    public String getTitle() {  
        return title;  
    }  
  
    public String getImagePath() {  
        return imagePath;  
    }  
  
    public boolean isPeriod() {  
        return period;  
    }  

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
    
}

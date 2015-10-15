/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.util.Date;
import org.primefaces.model.DefaultScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class MyEvent extends DefaultScheduleEvent{

private int id;
    
public MyEvent(String string, Date dataod, Date datado) {
       super(string,dataod,datado);
}    

public MyEvent() {
       super();
    }
    
 public void setId(int id) {
   this.id = id;
 } 
 
}

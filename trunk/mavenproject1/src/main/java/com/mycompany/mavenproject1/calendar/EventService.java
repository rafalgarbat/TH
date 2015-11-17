/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.news.News;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class EventService {

    private EventFacade eventFacade;

    private List<Events> list;

    public List getNews() {
        return eventFacade.findAll();
    }

    private int getRandomId() {
        return 5;
    }

}

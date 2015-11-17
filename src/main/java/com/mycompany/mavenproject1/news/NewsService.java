/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.news;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "newsService")
@ApplicationScoped
public class NewsService {

    public List<News> createNews(int size) {
        List<News> list = new ArrayList<News>();
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        
        for(int i = 0 ; i < size ; i++) {
            list.add(new News("tytul: "+getRandomId(),"opis..."+getRandomId(),cal.getTime(),getRandomId()));
        }
         
        return list;
    }
    
     private int getRandomId() {
        return 5;
    }
     
    
}

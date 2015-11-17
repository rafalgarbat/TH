/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.news;

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean(name = "newsView")
@ViewScoped
public class NewsView implements Serializable{
   
  private List<News> news;  
  private News selectedNews;
  
  @ManagedProperty(value="#{newsService}")
  private NewsService service;
      
  @PostConstruct
  public void init() {
        news = service.createNews(90);
  } 

  public List<News> getNews() {
        return news;
  }

  public void setService(NewsService service) {
        this.service = service;
  }

  public News getSelectedNews() {
        return selectedNews;
  }

  public void setSelectedNews(News selectedNews) {
        this.selectedNews = selectedNews;
  }
  
  
}

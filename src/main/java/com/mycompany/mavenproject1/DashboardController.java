/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.primefaces.event.CloseEvent;
import org.primefaces.event.DashboardReorderEvent;
import org.primefaces.event.ToggleEvent;
import org.primefaces.model.DashboardColumn;
import org.primefaces.model.DashboardModel;
import org.primefaces.model.DefaultDashboardColumn;
import org.primefaces.model.DefaultDashboardModel;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean
@ViewScoped
public class DashboardController implements Serializable{
    private DashboardModel model;
    private BarChartModel barModel;
    
    @PostConstruct
    public void init() {
        model = new DefaultDashboardModel();
        DashboardColumn column1 = new DefaultDashboardColumn();
        DashboardColumn column2 = new DefaultDashboardColumn();
        DashboardColumn column3 = new DefaultDashboardColumn();
         
        column1.addWidget("sports");
        column1.addWidget("finance");
         
        column2.addWidget("lifestyle");
        column2.addWidget("weather");
         
        column3.addWidget("politics");
 
        model.addColumn(column1);
        model.addColumn(column2);
        model.addColumn(column3);
        
        createBarModel();
    }
   private BarChartModel initBarModel() {
        BarChartModel model = new BarChartModel();
 
        ChartSeries run = new ChartSeries();
        run.setLabel("Run");
        run.set("2004", 120);
        model.addSeries(run);
        
        ChartSeries bike = new ChartSeries();
        bike.setLabel("Bike");
        bike.set("opis", 100);
        
        model.addSeries(bike);
         
        return model;
    }
    private void createBarModel() {
        barModel = initBarModel();
                 
        barModel.setLegendPosition("ne");
         
        Axis xAxis = barModel.getAxis(AxisType.X);
        xAxis.setLabel("yyy");
         
        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setLabel("xxx");
        yAxis.setMin(0);
        yAxis.setMax(200);
    }
    
    public BarChartModel getBarModel() {
        return barModel;
    }
    
    public void handleReorder(DashboardReorderEvent event) {
        FacesMessage message = new FacesMessage();
        message.setSeverity(FacesMessage.SEVERITY_INFO);
        message.setSummary("Reordered: " + event.getWidgetId());
        message.setDetail("Item index: " + event.getItemIndex() + ", Column index: " + event.getColumnIndex() + ", Sender index: " + event.getSenderColumnIndex());
         
        addMessage(message);
    }
     
    public void handleClose(CloseEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Panel Closed", "Closed panel id:'" + event.getComponent().getId() + "'");
         
        addMessage(message);
    }
     
    public void handleToggle(ToggleEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, event.getComponent().getId() + " toggled", "Status:" + event.getVisibility().name());
         
        addMessage(message);
    }
     
    private void addMessage(FacesMessage message) {
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
     
    public DashboardModel getModel() {
        return model;
    }
}
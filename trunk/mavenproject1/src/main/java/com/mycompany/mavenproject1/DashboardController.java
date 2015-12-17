/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.calendar.EventInfo;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.wspolne.SlownikStalych;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
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
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@ManagedBean
@ViewScoped
public class DashboardController implements Serializable {

    private DashboardModel model;
    private BarChartModel barModel;
    private BarChartModel barAnimatedModel; /*Wydarzenia w tym miesiacu*/

    private EventInfo eventinfo = new EventInfo();

    private HorizontalBarChartModel horizontalBarModel;

    private LineChartModel typyEventowlineModel;

    @EJB
    private EventFacade eventFacade;

    @PostConstruct
    public void init() {
        createEventInfo("ala");
        createTrainingLineModels();
        createHorizontalBarModel();
        createBarAnimatedModels();
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

    public void createEventInfo(String aUname) {
        eventinfo = eventFacade.podajNajblizsze(aUname);
    }

    private void createHorizontalBarModel() {
        ChartSeries myEvents = new ChartSeries();
        ChartSeries myWatched = new ChartSeries();
        myEvents.setLabel("Biore udział");
        myWatched.setLabel("Obserwowane");
        int pMaxLicznosc = 0;
        horizontalBarModel = new HorizontalBarChartModel();

        HashMap pStats = eventFacade.podajStatystyki("ala", "YYYY-MM", SlownikStalych.EVENT_BIORE_UDZIAL);
        Iterator it = pStats.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            myEvents.set(pair.getKey(), ((Long) pair.getValue()).intValue());
            if (pMaxLicznosc < ((Long) pair.getValue()).intValue()) {
                pMaxLicznosc = ((Long) pair.getValue()).intValue();
            }
        }
        pStats = eventFacade.podajStatystyki("ala", "YYYY-MM", SlownikStalych.EVENT_OBSERWOWANY);
        it = pStats.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            myWatched.set(pair.getKey(), ((Long) pair.getValue()).intValue());
            if (pMaxLicznosc < ((Long) pair.getValue()).intValue()) {
                pMaxLicznosc = ((Long) pair.getValue()).intValue();
            }
        }

        horizontalBarModel.addSeries(myEvents);
        horizontalBarModel.addSeries(myWatched);

        horizontalBarModel.setLegendPosition("e");
        horizontalBarModel.setStacked(true);

        Axis xAxis = horizontalBarModel.getAxis(AxisType.X);
        xAxis.setLabel("Ilość");
        xAxis.setMin(0);
        xAxis.setMax(pMaxLicznosc + 5);

        Axis yAxis = horizontalBarModel.getAxis(AxisType.Y);

    }

    public HorizontalBarChartModel podajStatystyki(String aUname, String aMaska) {
        HorizontalBarChartModel pHBM = new HorizontalBarChartModel();

        return pHBM;
    }

    public HorizontalBarChartModel getHorizontalBarModel() {
        return horizontalBarModel;
    }

    public void setHorizontalBarModel(HorizontalBarChartModel horizontalBarModel) {
        this.horizontalBarModel = horizontalBarModel;
    }

    private void createTrainingLineModels() {
        typyEventowlineModel = initLinearModel();
        typyEventowlineModel.setTitle("Typy treningów");
        typyEventowlineModel.setLegendPosition("e");
        Axis yAxis = typyEventowlineModel.getAxis(AxisType.Y);
        yAxis.setMin(0);
        yAxis.setMax(10);

    }

    private void createBarAnimatedModels() {
        barAnimatedModel = initBarAnimatedModel();
        //barAnimatedModel.setTitle("");
        barAnimatedModel.setAnimate(true);
        barAnimatedModel.setLegendPosition("ne");
        Axis yAxis = barAnimatedModel.getAxis(AxisType.Y);
        yAxis.setMin(0);
        yAxis.setMax(150);
    }

    /**
     * Inicjalizuje wykres na stronie glownej z podsumowaniem wydarzen w obecnym
     * miesiacu
     */
    private BarChartModel initBarAnimatedModel() {
        BarChartModel model = new BarChartModel();

        ChartSeries pBike = new ChartSeries();
        pBike.setLabel("Bike");
        pBike.set("2004", 120);

        ChartSeries pSwim = new ChartSeries();
        pSwim.setLabel("Swim");
        pSwim.set("2004", 52);

        ChartSeries pRun = new ChartSeries();
        pRun.setLabel("Run");
        pRun.set("2004", 20);

        ChartSeries pTri = new ChartSeries();
        pTri.setLabel("Tri");
        pTri.set("2004", 72);

        model.addSeries(pBike);
        model.addSeries(pSwim);
        model.addSeries(pRun);
        model.addSeries(pTri);

        return model;
    }

    private LineChartModel initLinearModel() {
        LineChartModel model = new LineChartModel();

        LineChartSeries series1 = new LineChartSeries();
        series1.setLabel("Series 1");

        series1.set(1, 2);
        series1.set(2, 1);
        series1.set(3, 3);
        series1.set(4, 6);
        series1.set(5, 8);

        LineChartSeries series2 = new LineChartSeries();
        series2.setLabel("Series 2");

        series2.set(1, 6);
        series2.set(2, 3);
        series2.set(3, 2);
        series2.set(4, 7);
        series2.set(5, 9);

        model.addSeries(series1);
        model.addSeries(series2);

        return model;
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

    public EventInfo getEventinfo() {
        return eventinfo;
    }

    public void setEventinfo(EventInfo eventinfo) {
        this.eventinfo = eventinfo;
    }

    public LineChartModel getTypyEventowlineModel() {
        return typyEventowlineModel;
    }

    public void setTypyEventowlineModel(LineChartModel typyEventowlineModel) {
        this.typyEventowlineModel = typyEventowlineModel;
    }

    public BarChartModel getBarAnimatedModel() {
        return barAnimatedModel;
    }

    public void setBarAnimatedModel(BarChartModel barAnimatedModel) {
        this.barAnimatedModel = barAnimatedModel;
    }

    
}

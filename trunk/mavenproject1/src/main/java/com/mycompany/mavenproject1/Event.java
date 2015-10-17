/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.primefaces.model.DefaultScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "event")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e"),
    @NamedQuery(name = "Event.findByEvent_Id", query = "SELECT e FROM Event e WHERE e.event_id = :event_id"),    
    @NamedQuery(name = "Event.findById", query = "SELECT e FROM Event e WHERE e.id = :id"),
    @NamedQuery(name = "Event.findByTytul", query = "SELECT e FROM Event e WHERE e.tytul = :tytul"),
    @NamedQuery(name = "Event.findByCzycalydzien", query = "SELECT e FROM Event e WHERE e.czycalydzien = :czycalydzien"),
    @NamedQuery(name = "Event.findByCzypubliczne", query = "SELECT e FROM Event e WHERE e.czypubliczne = :czypubliczne"),
    @NamedQuery(name = "Event.findByDataod", query = "SELECT e FROM Event e WHERE e.dataod = :dataod"),
    @NamedQuery(name = "Event.findByDatado", query = "SELECT e FROM Event e WHERE e.datado = :datado"),
    @NamedQuery(name = "Event.findByPrzesuniecie", query = "SELECT e FROM Event e WHERE e.przesuniecie = :przesuniecie"),
    @NamedQuery(name = "Event.findByTypPrzesuniecia", query = "SELECT e FROM Event e WHERE e.typPrzesuniecia = :typPrzesuniecia"),
    @NamedQuery(name = "Event.findByCdate", query = "SELECT e FROM Event e WHERE e.cdate = :cdate"),
    @NamedQuery(name = "Event.findByMdate", query = "SELECT e FROM Event e WHERE e.mdate = :mdate")})
public class Event{
    private static final long serialVersionUID = 1L;
    @Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="event_id_seq")
	@SequenceGenerator(
		name="event_id_seq",
		sequenceName="event_id_seq",
		allocationSize=1
	)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "tytul")
    private String tytul;    
    @Column(name = "event_id")
    private String event_id;    
    @Column(name = "czycalydzien")
    private Boolean czycalydzien;
    @Column(name = "czypubliczne")
    private Boolean czypubliczne;
    @Column(name = "dataod")
    @Temporal(TemporalType.DATE)
    private Date dataod;
    @Column(name = "datado")
    @Temporal(TemporalType.DATE)
    private Date datado;
    @Size(max = 2147483647)
    @Column(name = "przesuniecie")
    private String przesuniecie;
    @Column(name = "typ_przesuniecia")
    private Integer typPrzesuniecia;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @Column(name = "mdate")
    @Temporal(TemporalType.DATE)
    private Date mdate;
    
    @Column(name = "gmap_cords")
    private String gmap_cords;
    
    
    @Column(name = "keywords")
    private String keywords;
    
    
    @JoinColumn(name = "klient_id", referencedColumnName = "id")
    @ManyToOne
    private Klient klientId;

    public Event() {
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }    
    
    public String getGmap_cords() {
        return gmap_cords;
    }

    public void setGmap_cords(String gmap_cords) {
        this.gmap_cords = gmap_cords;
    }    
    
    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }
        
    public Event(Integer id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public Boolean getCzycalydzien() {
        return czycalydzien;
    }

    public void setCzycalydzien(Boolean czycalydzien) {
        this.czycalydzien = czycalydzien;
    }

    public Boolean getCzypubliczne() {
        return czypubliczne;
    }

    public void setCzypubliczne(Boolean czypubliczne) {
        this.czypubliczne = czypubliczne;
    }

    public Date getDataod() {
        return dataod;
    }

    public void setDataod(Date dataod) {
        this.dataod = dataod;
    }

    public Date getDatado() {
        return datado;
    }

    public void setDatado(Date datado) {
        this.datado = datado;
    }

    public String getPrzesuniecie() {
        return przesuniecie;
    }

    public void setPrzesuniecie(String przesuniecie) {
        this.przesuniecie = przesuniecie;
    }

    public Integer getTypPrzesuniecia() {
        return typPrzesuniecia;
    }

    public void setTypPrzesuniecia(Integer typPrzesuniecia) {
        this.typPrzesuniecia = typPrzesuniecia;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(Date mdate) {
        this.mdate = mdate;
    }

    public Klient getKlientId() {
        return klientId;
    }

    public void setKlientId(Klient klientId) {
        this.klientId = klientId;
    }

    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "com.mycompany.mavenproject1.Event[ id=" + id + " ]";
    }
    
}

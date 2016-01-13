/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar.ob;

import com.mycompany.mavenproject1.event.Events;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "calendarevents")
@Cacheable(false)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Calendarevents.findAll", query = "SELECT c FROM Calendarevents c"),
    @NamedQuery(name = "Calendarevents.findByUid", query = "SELECT c FROM Calendarevents c WHERE c.uid = :uid")})
public class Calendarevents implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @JoinColumn(name = "eventid", referencedColumnName = "id")
    @ManyToOne
    private Events eventid;
    @JoinColumn(name = "calenarid", referencedColumnName = "uid")
    @ManyToOne
    private Calendars calenarid;

    public Calendarevents() {
    }

    public Calendarevents(Integer uid) {
        this.uid = uid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Events getEventid() {
        return eventid;
    }

    public void setEventid(Events eventid) {
        this.eventid = eventid;
    }

    public Calendars getCalenarid() {
        return calenarid;
    }

    public void setCalenarid(Calendars calenarid) {
        this.calenarid = calenarid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (uid != null ? uid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Calendarevents)) {
            return false;
        }
        Calendarevents other = (Calendarevents) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.Calendarevents[ uid=" + uid + " ]";
    }
    
}

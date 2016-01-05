/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar.ob;

import com.mycompany.mavenproject1.calendar.Usercalendars;
import com.mycompany.mavenproject1.calendar.ob.Calendarevents;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "calendars")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Calendars.findAll", query = "SELECT c FROM Calendars c"),
    @NamedQuery(name = "Calendars.findByUid", query = "SELECT c FROM Calendars c WHERE c.uid = :uid"),
    @NamedQuery(name = "Calendars.findByName", query = "SELECT c FROM Calendars c WHERE c.name = :name"),
    @NamedQuery(name = "Calendars.findByIspublic", query = "SELECT c FROM Calendars c WHERE c.ispublic = :ispublic")})
public class Calendars implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @Size(max = 2147483647)
    @Column(name = "name")
    private String name;
    @Column(name = "ispublic")
    private Boolean ispublic;
    @OneToMany(mappedBy = "calenarid")
    private Collection<Calendarevents> calendareventsCollection;
    @OneToMany(mappedBy = "calendarid")
    private Collection<Usercalendars> usercalendarsCollection;

    public Calendars() {
    }

    public Calendars(Integer uid) {
        this.uid = uid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getIspublic() {
        return ispublic;
    }

    public void setIspublic(Boolean ispublic) {
        this.ispublic = ispublic;
    }

    @XmlTransient
    public Collection<Calendarevents> getCalendareventsCollection() {
        return calendareventsCollection;
    }

    public void setCalendareventsCollection(Collection<Calendarevents> calendareventsCollection) {
        this.calendareventsCollection = calendareventsCollection;
    }

    @XmlTransient
    public Collection<Usercalendars> getUsercalendarsCollection() {
        return usercalendarsCollection;
    }

    public void setUsercalendarsCollection(Collection<Usercalendars> usercalendarsCollection) {
        this.usercalendarsCollection = usercalendarsCollection;
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
        if (!(object instanceof Calendars)) {
            return false;
        }
        Calendars other = (Calendars) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.Calendars[ uid=" + uid + " ]";
    }
    
}

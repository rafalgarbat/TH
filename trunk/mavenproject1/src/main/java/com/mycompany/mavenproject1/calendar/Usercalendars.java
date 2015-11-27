/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.calendar;

import com.mycompany.mavenproject1.calendar.Calendars;
import com.mycompany.mavenproject1.auth.Users;
import java.io.Serializable;
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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "usercalendars")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usercalendars.findAll", query = "SELECT u FROM Usercalendars u"),
    @NamedQuery(name = "Usercalendars.findByUid", query = "SELECT u FROM Usercalendars u WHERE u.uid = :uid")})
public class Usercalendars implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @JoinColumn(name = "userid", referencedColumnName = "uid")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "calendarid", referencedColumnName = "uid")
    @ManyToOne
    private Calendars calendarid;

    public Usercalendars() {
    }

    public Usercalendars(Integer uid) {
        this.uid = uid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    public Calendars getCalendarid() {
        return calendarid;
    }

    public void setCalendarid(Calendars calendarid) {
        this.calendarid = calendarid;
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
        if (!(object instanceof Usercalendars)) {
            return false;
        }
        Usercalendars other = (Usercalendars) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.Usercalendars[ uid=" + uid + " ]";
    }
    
}

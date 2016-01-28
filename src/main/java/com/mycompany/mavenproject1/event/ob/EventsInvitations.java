/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event.ob;

import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.event.Events;
import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "events_invitations")
@Cacheable(false)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EventsInvitations.findAll", query = "SELECT e FROM EventsInvitations e"),
    @NamedQuery(name = "EventsInvitations.findById", query = "SELECT e FROM EventsInvitations e WHERE e.id = :id"),
    @NamedQuery(name = "EventsInvitations.findByCdate", query = "SELECT e FROM EventsInvitations e WHERE e.cdate = :cdate")})
public class EventsInvitations implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;    
    @Column(name = "stan")
    private String stan;

    
    @JoinColumn(name = "inviteby", referencedColumnName = "uid")
    @ManyToOne
    private Users inviteby;
    @JoinColumn(name = "userid", referencedColumnName = "uid")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "eventid", referencedColumnName = "id")
    @ManyToOne
    private Events eventid;

    public EventsInvitations() {
    }

    public EventsInvitations(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Users getInviteby() {
        return inviteby;
    }

    public void setInviteby(Users inviteby) {
        this.inviteby = inviteby;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    public Events getEventid() {
        return eventid;
    }

    public void setEventid(Events eventid) {
        this.eventid = eventid;
    }

    public String getStan() {
        return stan;
    }

    public void setStan(String stan) {
        this.stan = stan;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EventsInvitations)) {
            return false;
        }
        EventsInvitations other = (EventsInvitations) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.event.ob.EventsInvitations[ id=" + id + " ]";
    }
    
}

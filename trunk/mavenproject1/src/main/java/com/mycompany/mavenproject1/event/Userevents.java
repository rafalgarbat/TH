/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jaroslaw.Skrzydlo  
 */
@Entity
@Table(name = "userevents")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Userevents.findAll", query = "SELECT u FROM Userevents u"),
    @NamedQuery(name = "Userevents.findByUid", query = "SELECT u FROM Userevents u WHERE u.uid = :uid"),
    @NamedQuery(name = "Userevents.findByStan", query = "SELECT u FROM Userevents u WHERE u.stan = :stan")})
public class Userevents implements Serializable {
    private static final long serialVersionUID = 1L;
        @Id
    	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="userevents_uid_seq")
	@SequenceGenerator(
		name="userevents_uid_seq",
		sequenceName="userevents_uid_seq",
		allocationSize=3
	)    
    @Column(name = "uid")
    private Integer uid;
    @Column(name = "stan")
    private Integer stan;
    @JoinColumn(name = "user_id", referencedColumnName = "uid")
    @ManyToOne
    private Users userId;
    @JoinColumn(name = "event_id", referencedColumnName = "id")
    @ManyToOne
    private Events eventId;

    public Userevents() {
    }

    public Userevents(Integer uid) {
        this.uid = uid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getStan() {
        return stan;
    }

    public void setStan(Integer stan) {
        this.stan = stan;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    public Events getEventId() {
        return eventId;
    }

    public void setEventId(Events eventId) {
        this.eventId = eventId;
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
        if (!(object instanceof Userevents)) {
            return false;
        }
        Userevents other = (Userevents) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.event.Userevents[ uid=" + uid + " ]";
    }
    
}

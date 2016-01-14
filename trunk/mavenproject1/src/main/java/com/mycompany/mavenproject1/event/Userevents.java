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
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userevents_uid_seq")
    @SequenceGenerator(
            name = "userevents_uid_seq",
            sequenceName = "userevents_uid_seq",
            allocationSize = 3
    )
    @Column(name = "uid")
    private Integer uid;
    
    @Column(name = "stan")
    private Integer stan;

    @Column(name = "duration")
    private String duration;
    
    @Column(name = "distance")
    private String distance;
    
    @Column(name = "kalorie")
    private String kalorie;
    
    @Column(name = "uwagi")
    private String uwagi;
    
    @Column(name = "link")
    private String link;
    
    @Column(name = "completed")
    private boolean completed;

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

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getKalorie() {
        return kalorie;
    }

    public void setKalorie(String kalorie) {
        this.kalorie = kalorie;
    }

    public String getUwagi() {
        return uwagi;
    }

    public void setUwagi(String uwagi) {
        this.uwagi = uwagi;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
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

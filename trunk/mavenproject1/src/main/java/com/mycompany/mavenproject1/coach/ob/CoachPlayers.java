/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.coach.ob;

import com.mycompany.mavenproject1.auth.Users;
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
@Table(name = "coach_players")
@Cacheable(false)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CoachPlayers.findAll", query = "SELECT c FROM CoachPlayers c"),
    @NamedQuery(name = "CoachPlayers.findByUid", query = "SELECT c FROM CoachPlayers c WHERE c.uid = :uid"),
    @NamedQuery(name = "CoachPlayers.findByStan", query = "SELECT c FROM CoachPlayers c WHERE c.stan = :stan"),
    @NamedQuery(name = "CoachPlayers.findByCdate", query = "SELECT c FROM CoachPlayers c WHERE c.cdate = :cdate")})
public class CoachPlayers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @Column(name = "stan")
    private Integer stan;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @JoinColumn(name = "userid", referencedColumnName = "uid")
    @ManyToOne
    private Users userid;
    @JoinColumn(name = "coachid", referencedColumnName = "uid")
    @ManyToOne
    private Users coachid;

    public CoachPlayers() {
    }

    public CoachPlayers(Integer uid) {
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

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    public Users getCoachid() {
        return coachid;
    }

    public void setCoachid(Users coachid) {
        this.coachid = coachid;
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
        if (!(object instanceof CoachPlayers)) {
            return false;
        }
        CoachPlayers other = (CoachPlayers) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.coach.CoachPlayers[ uid=" + uid + " ]";
    }
    
}

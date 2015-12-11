/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.news;

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
@Table(name = "msg")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Msg.findAll", query = "SELECT m FROM Msg m"),
    @NamedQuery(name = "Msg.findByUid", query = "SELECT m FROM Msg m WHERE m.uid = :uid"),
    @NamedQuery(name = "Msg.findByStan", query = "SELECT m FROM Msg m WHERE m.stan = :stan")})
public class Msg implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @Column(name = "stan")
    private Integer stan;
    @JoinColumn(name = "to_user_id", referencedColumnName = "uid")
    @ManyToOne
    private Users toUserId;
    @JoinColumn(name = "from_user_id", referencedColumnName = "uid")
    @ManyToOne
    private Users fromUserId;

    public Msg() {
    }

    public Msg(Integer uid) {
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

    public Users getToUserId() {
        return toUserId;
    }

    public void setToUserId(Users toUserId) {
        this.toUserId = toUserId;
    }

    public Users getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(Users fromUserId) {
        this.fromUserId = fromUserId;
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
        if (!(object instanceof Msg)) {
            return false;
        }
        Msg other = (Msg) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.news.Msg[ uid=" + uid + " ]";
    }
    
}

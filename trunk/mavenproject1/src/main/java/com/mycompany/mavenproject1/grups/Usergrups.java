/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author rafal.garbat
 */
@Entity
@Table(name = "usergrups")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usergrups.findAll", query = "SELECT u FROM Usergrups u"),
    @NamedQuery(name = "Usergrups.findByUid", query = "SELECT u FROM Usergrups u WHERE u.uid = :uid"),
    @NamedQuery(name = "Usergrups.findByName", query = "SELECT u FROM Usergrups u WHERE u.name = :name")})
public class Usergrups implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @Size(max = 2147483647)
    @Column(name = "name")
    private String name;
    @JoinColumn(name = "user_id", referencedColumnName = "uid")
    @ManyToOne
    private Users userId;
    @JoinColumn(name = "grup_id", referencedColumnName = "id")
    @ManyToOne
    private Grups grupId;

    public Usergrups() {
    }

    public Usergrups(Integer uid) {
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

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    public Grups getGrupId() {
        return grupId;
    }

    public void setGrupId(Grups grupId) {
        this.grupId = grupId;
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
        if (!(object instanceof Usergrups)) {
            return false;
        }
        Usergrups other = (Usergrups) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.grups.Usergrups[ uid=" + uid + " ]";
    }
    
}

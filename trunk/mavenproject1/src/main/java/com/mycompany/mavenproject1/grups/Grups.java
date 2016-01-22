/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rafal.garbat
 */
@Entity
@Table(name = "grups")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Grups.findAll", query = "SELECT g FROM Grups g"),
    @NamedQuery(name = "Grups.findById", query = "SELECT g FROM Grups g WHERE g.id = :id"),
    @NamedQuery(name = "Grups.findByTytul", query = "SELECT g FROM Grups g WHERE g.tytul = :tytul"),
    @NamedQuery(name = "Grups.findByOpis", query = "SELECT g FROM Grups g WHERE g.opis = :opis"),
    @NamedQuery(name = "Grups.findByKeywords", query = "SELECT g FROM Grups g WHERE g.keywords = :keywords"),
    @NamedQuery(name = "Grups.findByCdate", query = "SELECT g FROM Grups g WHERE g.cdate = :cdate"),
    @NamedQuery(name = "Grups.findByMdate", query = "SELECT g FROM Grups g WHERE g.mdate = :mdate")})
public class Grups implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "tytul")
    private String tytul;
    @Size(max = 2147483647)
    @Column(name = "opis")
    private String opis;
    @Size(max = 2147483647)
    @Column(name = "keywords")
    private String keywords;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @Column(name = "mdate")
    @Temporal(TemporalType.DATE)
    private Date mdate;
    @OneToMany(mappedBy = "grupId")
    private Collection<Usergrups> usergrupsCollection;

    public Grups() {
    }

    public Grups(Integer id) {
        this.id = id;
    }

    public Integer getId() {
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

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
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

    @XmlTransient
    public Collection<Usergrups> getUsergrupsCollection() {
        return usergrupsCollection;
    }

    public void setUsergrupsCollection(Collection<Usergrups> usergrupsCollection) {
        this.usergrupsCollection = usergrupsCollection;
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
        if (!(object instanceof Grups)) {
            return false;
        }
        Grups other = (Grups) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.grups.Grups[ id=" + id + " ]";
    }
    
}

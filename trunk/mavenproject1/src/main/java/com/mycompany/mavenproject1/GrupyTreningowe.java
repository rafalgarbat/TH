/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "grupy_treningowe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GrupyTreningowe.findAll", query = "SELECT g FROM GrupyTreningowe g"),
    @NamedQuery(name = "GrupyTreningowe.findById", query = "SELECT g FROM GrupyTreningowe g WHERE g.id = :id"),
    @NamedQuery(name = "GrupyTreningowe.findByNazwa", query = "SELECT g FROM GrupyTreningowe g WHERE g.nazwa = :nazwa"),
    @NamedQuery(name = "GrupyTreningowe.findByCdate", query = "SELECT g FROM GrupyTreningowe g WHERE g.cdate = :cdate")})
public class GrupyTreningowe implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "nazwa")
    private String nazwa;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @JoinColumn(name = "owner_id", referencedColumnName = "id")
    @ManyToOne
    private Klient ownerId;

    public GrupyTreningowe() {
    }

    public GrupyTreningowe(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Klient getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Klient ownerId) {
        this.ownerId = ownerId;
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
        if (!(object instanceof GrupyTreningowe)) {
            return false;
        }
        GrupyTreningowe other = (GrupyTreningowe) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.GrupyTreningowe[ id=" + id + " ]";
    }
    
}

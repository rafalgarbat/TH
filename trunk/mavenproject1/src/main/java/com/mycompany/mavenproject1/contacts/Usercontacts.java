/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

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
@Table(name = "usercontacts")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usercontacts.findAll", query = "SELECT u FROM Usercontacts u"),
    @NamedQuery(name = "Usercontacts.findByUid", query = "SELECT u FROM Usercontacts u WHERE u.uid = :uid")})
public class Usercontacts implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "uid")
    private Integer uid;
    @JoinColumn(name = "contact_id", referencedColumnName = "uid")
    @ManyToOne
    private Users contactId;
    @JoinColumn(name = "user_id", referencedColumnName = "uid")
    @ManyToOne
    private Users userId;

    public Usercontacts() {
    }

    public Usercontacts(Integer uid) {
        this.uid = uid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Users getContactId() {
        return contactId;
    }

    public void setContactId(Users contactId) {
        this.contactId = contactId;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
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
        if (!(object instanceof Usercontacts)) {
            return false;
        }
        Usercontacts other = (Usercontacts) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.contacts.Usercontacts[ uid=" + uid + " ]";
    }
    
}

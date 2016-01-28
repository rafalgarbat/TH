/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.forum.ob;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "forum")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Forum.findAll", query = "SELECT f FROM Forum f"),
    @NamedQuery(name = "Forum.findById", query = "SELECT f FROM Forum f WHERE f.id = :id"),
    @NamedQuery(name = "Forum.findByEventId", query = "SELECT f FROM Forum f WHERE f.eventId = :eventId"),
    @NamedQuery(name = "Forum.findByCommenterid", query = "SELECT f FROM Forum f WHERE f.commenterid = :commenterid"),
    @NamedQuery(name = "Forum.findByMsgTitle", query = "SELECT f FROM Forum f WHERE f.msgTitle = :msgTitle"),
    @NamedQuery(name = "Forum.findByMsg", query = "SELECT f FROM Forum f WHERE f.msg = :msg"),
    @NamedQuery(name = "Forum.findByCdate", query = "SELECT f FROM Forum f WHERE f.cdate = :cdate")})
public class Forum implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "event_id")
    private Integer eventId;
    @Column(name = "commenterid")
    private Integer commenterid;
    @Size(max = 2147483647)
    @Column(name = "msg_title")
    private String msgTitle;
    @Size(max = 2147483647)
    @Column(name = "msg")
    private String msg;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;

    public Forum() {
    }

    public Forum(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public Integer getCommenterid() {
        return commenterid;
    }

    public void setCommenterid(Integer commenterid) {
        this.commenterid = commenterid;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
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
        if (!(object instanceof Forum)) {
            return false;
        }
        Forum other = (Forum) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.forum.Forum[ id=" + id + " ]";
    }
    
}

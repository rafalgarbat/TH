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
@Table(name = "workouts")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Workouts.findAll", query = "SELECT w FROM Workouts w"),
    @NamedQuery(name = "Workouts.findById", query = "SELECT w FROM Workouts w WHERE w.id = :id"),
    @NamedQuery(name = "Workouts.findByTitle", query = "SELECT w FROM Workouts w WHERE w.title = :title"),
    @NamedQuery(name = "Workouts.findByDateFrom", query = "SELECT w FROM Workouts w WHERE w.dateFrom = :dateFrom"),
    @NamedQuery(name = "Workouts.findByDateTo", query = "SELECT w FROM Workouts w WHERE w.dateTo = :dateTo"),
    @NamedQuery(name = "Workouts.findByDateShift", query = "SELECT w FROM Workouts w WHERE w.dateShift = :dateShift"),
    @NamedQuery(name = "Workouts.findByShitType", query = "SELECT w FROM Workouts w WHERE w.shitType = :shitType"),
    @NamedQuery(name = "Workouts.findByGmapCords", query = "SELECT w FROM Workouts w WHERE w.gmapCords = :gmapCords"),
    @NamedQuery(name = "Workouts.findByIsAllday", query = "SELECT w FROM Workouts w WHERE w.isAllday = :isAllday"),
    @NamedQuery(name = "Workouts.findByIsPublic", query = "SELECT w FROM Workouts w WHERE w.isPublic = :isPublic"),
    @NamedQuery(name = "Workouts.findByKeywords", query = "SELECT w FROM Workouts w WHERE w.keywords = :keywords"),
    @NamedQuery(name = "Workouts.findByIsToremind", query = "SELECT w FROM Workouts w WHERE w.isToremind = :isToremind"),
    @NamedQuery(name = "Workouts.findByCuser", query = "SELECT w FROM Workouts w WHERE w.cuser = :cuser"),
    @NamedQuery(name = "Workouts.findByCdate", query = "SELECT w FROM Workouts w WHERE w.cdate = :cdate"),
    @NamedQuery(name = "Workouts.findByMdate", query = "SELECT w FROM Workouts w WHERE w.mdate = :mdate")})
public class Workouts implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "title", length = 2147483647)
    private String title;
    @Column(name = "date_from")
    @Temporal(TemporalType.DATE)
    private Date dateFrom;
    @Column(name = "date_to")
    @Temporal(TemporalType.DATE)
    private Date dateTo;
    @Size(max = 2147483647)
    @Column(name = "date_shift", length = 2147483647)
    private String dateShift;
    @Size(max = 2147483647)
    @Column(name = "shit_type", length = 2147483647)
    private String shitType;
    @Size(max = 2147483647)
    @Column(name = "gmap_cords", length = 2147483647)
    private String gmapCords;
    @Column(name = "is_allday")
    private Boolean isAllday;
    @Column(name = "is_public")
    private Boolean isPublic;
    @Size(max = 2147483647)
    @Column(name = "keywords", length = 2147483647)
    private String keywords;
    @Column(name = "is_toremind")
    private Boolean isToremind;
    @Column(name = "cuser")
    private Integer cuser;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @Column(name = "mdate")
    @Temporal(TemporalType.DATE)
    private Date mdate;

    public Workouts() {
    }

    public Workouts(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public String getDateShift() {
        return dateShift;
    }

    public void setDateShift(String dateShift) {
        this.dateShift = dateShift;
    }

    public String getShitType() {
        return shitType;
    }

    public void setShitType(String shitType) {
        this.shitType = shitType;
    }

    public String getGmapCords() {
        return gmapCords;
    }

    public void setGmapCords(String gmapCords) {
        this.gmapCords = gmapCords;
    }

    public Boolean getIsAllday() {
        return isAllday;
    }

    public void setIsAllday(Boolean isAllday) {
        this.isAllday = isAllday;
    }

    public Boolean getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(Boolean isPublic) {
        this.isPublic = isPublic;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Boolean getIsToremind() {
        return isToremind;
    }

    public void setIsToremind(Boolean isToremind) {
        this.isToremind = isToremind;
    }

    public Integer getCuser() {
        return cuser;
    }

    public void setCuser(Integer cuser) {
        this.cuser = cuser;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Workouts)) {
            return false;
        }
        Workouts other = (Workouts) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.Workouts[ id=" + id + " ]";
    }
    
}

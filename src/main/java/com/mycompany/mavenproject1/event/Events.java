/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

import com.mycompany.mavenproject1.Klient;
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
import javax.persistence.SequenceGenerator;
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
@Table(name = "events")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Events.findAll", query = "SELECT e FROM Events e"),
    @NamedQuery(name = "Events.findById", query = "SELECT e FROM Events e WHERE e.id = :id"),
    @NamedQuery(name = "Events.findByTytul", query = "SELECT e FROM Events e WHERE e.tytul = :tytul"),
    @NamedQuery(name = "Events.findByOpis", query = "SELECT e FROM Events e WHERE e.opis = :opis"),
    @NamedQuery(name = "Events.findByCzycalydzien", query = "SELECT e FROM Events e WHERE e.czycalydzien = :czycalydzien"),
    @NamedQuery(name = "Events.findByCzypubliczne", query = "SELECT e FROM Events e WHERE e.czypubliczne = :czypubliczne"),
    @NamedQuery(name = "Events.findByDataod", query = "SELECT e FROM Events e WHERE e.dataod = :dataod"),
    @NamedQuery(name = "Events.findByDatado", query = "SELECT e FROM Events e WHERE e.datado = :datado"),
    @NamedQuery(name = "Events.findByPrzesuniecie", query = "SELECT e FROM Events e WHERE e.przesuniecie = :przesuniecie"),
    @NamedQuery(name = "Events.findByTypPrzesuniecia", query = "SELECT e FROM Events e WHERE e.typPrzesuniecia = :typPrzesuniecia"),
    @NamedQuery(name = "Events.findByGmapCords", query = "SELECT e FROM Events e WHERE e.gmapCords = :gmapCords"),
    @NamedQuery(name = "Events.findByKeywords", query = "SELECT e FROM Events e WHERE e.keywords = :keywords"),
    @NamedQuery(name = "Events.findByEventId", query = "SELECT e FROM Events e WHERE e.eventId = :eventId"),
    @NamedQuery(name = "Events.findByCdate", query = "SELECT e FROM Events e WHERE e.cdate = :cdate"),
    @NamedQuery(name = "Events.findByMdate", query = "SELECT e FROM Events e WHERE e.mdate = :mdate")})
public class Events implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="events_id_seq")
	@SequenceGenerator(
		name="events_id_seq",
		sequenceName="events_id_seq",
		allocationSize=1
	)  
    @Column(name = "id")
    private Integer id;
 
    @Size(max = 2147483647)
    @Column(name = "tytul")
    private String tytul;
    @Size(max = 2147483647)
    @Column(name = "opis")
    private String opis;
    @Column(name = "czycalydzien")
    private Boolean czycalydzien;
    @Column(name = "czypubliczne")
    private Boolean czypubliczne;
    @Column(name = "dataod")
    @Temporal(TemporalType.DATE)
    private Date dataod;
    @Column(name = "datado")
    @Temporal(TemporalType.DATE)
    private Date datado;
    @Size(max = 2147483647)
    @Column(name = "przesuniecie")
    private String przesuniecie;
    @Column(name = "typ_przesuniecia")
    private Integer typPrzesuniecia;
    @Size(max = 2147483647)
    @Column(name = "gmap_cords")
    private String gmapCords;
    @Size(max = 2147483647)
    @Column(name = "keywords")
    private String keywords;
    @Size(max = 2147483647)
    @Column(name = "event_id")
    private String eventId;
    @Column(name = "cdate")
    @Temporal(TemporalType.DATE)
    private Date cdate;
    @Column(name = "mdate")
    @Temporal(TemporalType.DATE)
    private Date mdate;
    @JoinColumn(name = "klient_id", referencedColumnName = "id")
    @ManyToOne
    private Klient klientId;

    public Events() {
    }

    public Events(Integer id) {
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

    public Boolean getCzycalydzien() {
        return czycalydzien;
    }

    public void setCzycalydzien(Boolean czycalydzien) {
        this.czycalydzien = czycalydzien;
    }

    public Boolean getCzypubliczne() {
        return czypubliczne;
    }

    public void setCzypubliczne(Boolean czypubliczne) {
        this.czypubliczne = czypubliczne;
    }

    public Date getDataod() {
        return dataod;
    }

    public void setDataod(Date dataod) {
        this.dataod = dataod;
    }

    public Date getDatado() {
        return datado;
    }

    public void setDatado(Date datado) {
        this.datado = datado;
    }

    public String getPrzesuniecie() {
        return przesuniecie;
    }

    public void setPrzesuniecie(String przesuniecie) {
        this.przesuniecie = przesuniecie;
    }

    public Integer getTypPrzesuniecia() {
        return typPrzesuniecia;
    }

    public void setTypPrzesuniecia(Integer typPrzesuniecia) {
        this.typPrzesuniecia = typPrzesuniecia;
    }

    public String getGmapCords() {
        return gmapCords;
    }

    public void setGmapCords(String gmapCords) {
        this.gmapCords = gmapCords;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
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

    public Klient getKlientId() {
        return klientId;
    }

    public void setKlientId(Klient klientId) {
        this.klientId = klientId;
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
        if (!(object instanceof Events)) {
            return false;
        }
        Events other = (Events) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.event.Events[ id=" + id + " ]";
    }
    
}

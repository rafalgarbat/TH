/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

import com.mycompany.mavenproject1.calendar.ob.Calendarevents;
import com.mycompany.mavenproject1.Klient;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.event.ob.EventsInvitations;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.eclipse.persistence.annotations.Cache;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "events")
@Cacheable(false)
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
    @NamedQuery(name = "Events.findByOwnerId", query = "SELECT e FROM Events e WHERE e.owner_id = :owner_id"),  
    @NamedQuery(name = "Events.findByCdate", query = "SELECT e FROM Events e WHERE e.cdate = :cdate"),
    @NamedQuery(name = "Events.findByMdate", query = "SELECT e FROM Events e WHERE e.mdate = :mdate")})
public class Events implements Serializable {
   
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "rating")
    private BigDecimal rating;
    @Size(max = 2147483647)
    @Column(name = "rodzaj_wydarzenia")
    private String rodzajWydarzenia;
    @OneToMany(mappedBy = "eventid")
    private Collection<EventsInvitations> eventsInvitationsCollection;
    @OneToMany(mappedBy = "eventid")
    private Collection<Calendarevents> calendareventsCollection;   
    @OneToMany(mappedBy = "eventId")
    private Collection<Userevents> usereventsCollection;
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
    @Column(name = "adres")
    private String adres;
    @Column(name = "typ_wydarzenia")
    private String typ_wydarzenia;
    
    @Column(name = "dystans")
    private String  dystans;
    
    @Column(name = "ranga")
    private String  ranga;
    
    @Column(name = "organizator_info")
    private String  organizator_info;
    
    @Column(name = "rejestracja_info")
    private String  rejestracja_info;

    
    @Column(name = "adreswww")
    private String adreswww;
    
    @Column(name = "rejestracja_date")
    @Temporal(TemporalType.DATE)
    private Date rejestracja_date;
    
    
    @JoinColumn(name = "owner_id", referencedColumnName = "uid")
    @ManyToOne
    private Users owner_id;
    
    
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

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getTyp_wydarzenia() {
        return typ_wydarzenia;
    }

    public void setTyp_wydarzenia(String typ_wydarzenia) {
        this.typ_wydarzenia = typ_wydarzenia;
    }


    public String getAdreswww() {
        return adreswww;
    }

    public void setAdreswww(String adreswww) {
        this.adreswww = adreswww;
    }

    public Date getRejestracja_date() {
        return rejestracja_date;
    }

    public void setRejestracja_date(Date rejestracja_date) {
        this.rejestracja_date = rejestracja_date;
    }

    public Users getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(Users owner_id) {
        this.owner_id = owner_id;
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

    @XmlTransient
    public Collection<Userevents> getUsereventsCollection() {
        return usereventsCollection;
    }

    public void setUsereventsCollection(Collection<Userevents> usereventsCollection) {
        this.usereventsCollection = usereventsCollection;
    }


    @XmlTransient
    public Collection<Calendarevents> getCalendareventsCollection() {
        return calendareventsCollection;
    }

    public void setCalendareventsCollection(Collection<Calendarevents> calendareventsCollection) {
        this.calendareventsCollection = calendareventsCollection;
    }

    public String getDystans() {
        return dystans;
    }

    public void setDystans(String dystans) {
        this.dystans = dystans;
    }

    public String getRanga() {
        return ranga;
    }

    public void setRanga(String ranga) {
        this.ranga = ranga;
    }

    public String getOrganizator_info() {
        return organizator_info;
    }

    public void setOrganizator_info(String organizator_info) {
        this.organizator_info = organizator_info;
    }

    public String getRejestracja_info() {
        return rejestracja_info;
    }

    public void setRejestracja_info(String rejestracja_info) {
        this.rejestracja_info = rejestracja_info;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getRodzajWydarzenia() {
        return rodzajWydarzenia;
    }

    public void setRodzajWydarzenia(String rodzajWydarzenia) {
        this.rodzajWydarzenia = rodzajWydarzenia;
    }

    @XmlTransient
    public Collection<EventsInvitations> getEventsInvitationsCollection() {
        return eventsInvitationsCollection;
    }

    public void setEventsInvitationsCollection(Collection<EventsInvitations> eventsInvitationsCollection) {
        this.eventsInvitationsCollection = eventsInvitationsCollection;
    }
    
}

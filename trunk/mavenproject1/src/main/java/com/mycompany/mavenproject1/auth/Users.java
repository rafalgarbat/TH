/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.auth;

import com.mycompany.mavenproject1.calendar.ob.Usercalendars;
import com.mycompany.mavenproject1.coach.ob.CoachPlayers;
import com.mycompany.mavenproject1.contacts.Contact;
import com.mycompany.mavenproject1.contacts.ob.Usercontacts;
import com.mycompany.mavenproject1.event.Userevents;
import com.mycompany.mavenproject1.grups.Usergrups;
import com.mycompany.mavenproject1.news.Msg;
import com.mycompany.mavenproject1.photos.ob.Photos;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Entity
@Table(name = "users")
@Cacheable(false)
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findByUid", query = "SELECT u FROM Users u WHERE u.uid = :uid"),
    @NamedQuery(name = "Users.findByUname", query = "SELECT u FROM Users u WHERE u.uname = :uname"),
    @NamedQuery(name = "Users.findByNameAndPassword", query = "SELECT u FROM Users u WHERE u.uname = :uname and u.password = :password"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password")})
public class Users implements Serializable {
   
    /**
     * Referencje coach-player
     */
    @OneToMany(mappedBy = "userid")
    private Collection<CoachPlayers> coachPlayersCollection;
    @OneToMany(mappedBy = "coachid")
    private Collection<CoachPlayers> coachPlayersCollection1;
    
    @OneToMany(mappedBy = "userid")
    private Collection<Photos> photosCollection;
    
    @OneToMany(mappedBy = "toUserId")
    private Collection<Msg> msgCollection;
    @OneToMany(mappedBy = "fromUserId")
    private Collection<Msg> msgCollection1;
    
    /**
     * Lista kontaktow danego uzytkownika
     */
    @OneToMany(mappedBy = "contactId")
    private Collection<Usercontacts> usercontactsCollection;
    
    @OneToMany(mappedBy = "userId")
    private Collection<Usercontacts> usercontactsCollection1;
    
    @OneToMany(mappedBy = "userid")
    private Collection<Usercalendars> usercalendarsCollection;
    
    @OneToMany(mappedBy = "userId")
    private Collection<Usergrups> userGrupsCollection;
    
    @Size(max = 2147483647)
    @Column(name = "hashcode")
    private String hashCode;
    @OneToMany(mappedBy = "userId")
    private Collection<Userevents> usereventsCollection;
    private static final long serialVersionUID = 1L;
    @Id
    	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="users_uid_seq")
	@SequenceGenerator(
		name="users_uid_seq",
		sequenceName="users_uid_seq",
		allocationSize=1
	)    
    @Column(name = "uid")
    private Integer uid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "uname")
    private String uname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "password")
    private String password;

    @Size(min = 3, max = 100)
    @Column(name = "email")
    private String email;        
        
    @Column(name = "user_type_id")    
    private Integer user_type_id;
    
    @Column(name = "r_val")    
    private Integer r_val;
    
    @Column(name = "b_val")    
    private Integer b_val;
    
    @Column(name = "s_val")
    private Integer s_val;
    
    @Column(name = "t_val")
    private Integer t_val;
    
    @Column(name = "state")    
    private String state;
    
    @Column(name = "city")
    private String city;
    
    
    
    public Users() {
    }

    public Users(Integer uid) {
        this.uid = uid;
    }

    public Users(Integer uid, String uname, String password) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHashCode() {
        return hashCode;
    }

    public void setHashCode(String hashCode) {
        this.hashCode = hashCode;
    }

    public Integer getUser_type_id() {
        return user_type_id;
    }

    public void setUser_type_id(Integer user_type_id) {
        this.user_type_id = user_type_id;
    }    
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
   
    public Integer getR_val() {
        return r_val;
    }

    public void setR_val(Integer r_val) {
        this.r_val = r_val;
    }

    public Integer getB_val() {
        return b_val;
    }

    public void setB_val(Integer b_val) {
        this.b_val = b_val;
    }

    public Integer getS_val() {
        return s_val;
    }

    public void setS_val(Integer s_val) {
        this.s_val = s_val;
    }

    public Integer getT_val() {
        return t_val;
    }

    public void setT_val(Integer t_val) {
        this.t_val = t_val;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
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
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.uid == null && other.uid != null) || (this.uid != null && !this.uid.equals(other.uid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.auth.Users[ uid=" + uid + " ]";
    }


    @XmlTransient
    public Collection<Userevents> getUsereventsCollection() {
        return usereventsCollection;
    }

    public void setUsereventsCollection(Collection<Userevents> usereventsCollection) {
        this.usereventsCollection = usereventsCollection;
    }

    @XmlTransient
    public Collection<Usercalendars> getUsercalendarsCollection() {
        return usercalendarsCollection;
    }

    public void setUsercalendarsCollection(Collection<Usercalendars> usercalendarsCollection) {
        this.usercalendarsCollection = usercalendarsCollection;
    }
    
    @XmlTransient
    public Collection<Usergrups> getUserGrupsCollection() {
        return userGrupsCollection;
    }

    public void setUserGrupsCollection(Collection<Usergrups> userGrupsCollection) {
        this.userGrupsCollection = userGrupsCollection;
    }

    @XmlTransient
    public Collection<Usercontacts> getUsercontactsCollection() {
        return usercontactsCollection;
    }

    public void setUsercontactsCollection(Collection<Usercontacts> usercontactsCollection) {
        this.usercontactsCollection = usercontactsCollection;
    }

    @XmlTransient
    public Collection<Usercontacts> getUsercontactsCollection1() {
        return usercontactsCollection1;
    }

    public void setUsercontactsCollection1(Collection<Usercontacts> usercontactsCollection1) {
        this.usercontactsCollection1 = usercontactsCollection1;
    }
   
    public Contact getContact(){
        Contact pCont = new Contact();
        pCont.setUname(getUname());
        pCont.setCity(getCity());
        pCont.setState(getState());
        pCont.setPersonalInfo("opis todo");
        return pCont;
    }

    @XmlTransient
    public Collection<Msg> getMsgCollection() {
        return msgCollection;
    }

    public void setMsgCollection(Collection<Msg> msgCollection) {
        this.msgCollection = msgCollection;
    }

    @XmlTransient
    public Collection<Msg> getMsgCollection1() {
        return msgCollection1;
    }

    public void setMsgCollection1(Collection<Msg> msgCollection1) {
        this.msgCollection1 = msgCollection1;
    }

    @XmlTransient
    public Collection<Photos> getPhotosCollection() {
        return photosCollection;
    }

    public void setPhotosCollection(Collection<Photos> photosCollection) {
        this.photosCollection = photosCollection;
    }

    @XmlTransient
    public Collection<CoachPlayers> getCoachPlayersCollection() {
        return coachPlayersCollection;
    }

    public void setCoachPlayersCollection(Collection<CoachPlayers> coachPlayersCollection) {
        this.coachPlayersCollection = coachPlayersCollection;
    }

    @XmlTransient
    public Collection<CoachPlayers> getCoachPlayersCollection1() {
        return coachPlayersCollection1;
    }

    public void setCoachPlayersCollection1(Collection<CoachPlayers> coachPlayersCollection1) {
        this.coachPlayersCollection1 = coachPlayersCollection1;
    }
    
}

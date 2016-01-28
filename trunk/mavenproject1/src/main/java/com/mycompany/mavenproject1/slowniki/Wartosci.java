
package com.mycompany.mavenproject1.slowniki;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author misiozel
 */
@Entity
@Table(name = "wartosci")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Wartosci.findAll", query = "SELECT u FROM Wartosci u")})
public class Wartosci implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;    

    @Column(name = "nazwa")
    private String nazwa;
    
    @Column(name = "slownik_id")
    private Integer slownik_id;    

    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }       

    public Integer getSlownik_id() {
        return slownik_id;
    }

    public void setSlownik_id(Integer slownik_id) {
        this.slownik_id = slownik_id;
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
        if (!(object instanceof Wartosci)) {
            return false;
        }
        Wartosci other = (Wartosci) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    @Override
    public String toString() {
        return "com.mycompany.mavenproject1.slowniki.Wartosci[ id=" + id + " ]";
    }
    
}

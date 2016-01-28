/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.slowniki;

import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.grups.Grups;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author misiozel
 */
@Stateless
public class WartosciFacade extends AbstractFacade<Wartosci> {
    
    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public WartosciFacade() {
        super(Wartosci.class);
    }

    public List<Wartosci> getWartosciSlownikowe(int aIdSlownika) {        
        String pQuery = "select * from wartosci where slownik_id = ?";
        List<Wartosci> results = getEntityManager().createNativeQuery(pQuery, Wartosci.class).setParameter(1, aIdSlownika).getResultList();        
        return results;
    }
    
    public Wartosci getWartosclownikowa(int aIdSlownika, int aIdWartosci) {        
        String pQuery = "select * from wartosci where slownik_id = ? and id = ?";
        return (Wartosci)getEntityManager().createNativeQuery(pQuery, Wartosci.class).setParameter(1, aIdSlownika).setParameter(2, aIdWartosci).getResultList().get(0);        
        
    }
}

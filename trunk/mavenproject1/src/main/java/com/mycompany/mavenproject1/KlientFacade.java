/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

import java.sql.PreparedStatement;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Stateless
public class KlientFacade extends AbstractFacade<Klient> {

    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public KlientFacade() {
        super(Klient.class);
    }

    public boolean login(String user, String password) {

        /*zmienić to - poki co tylko testowo*/    
        Query pQuery = em.createQuery("select user, pass from userinfo where user= ?1 and pass= ?2 ").setParameter(1, user).setParameter(2, password);

        if (pQuery.getResultList().isEmpty()) {
            return false;
        }

        return true;
    }
}

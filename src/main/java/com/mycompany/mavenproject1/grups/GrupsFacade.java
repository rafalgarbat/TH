/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.grups;

import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.auth.Users;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


/**
 *
 * @author Rafal.Garbat
 */
@Stateless
public class GrupsFacade extends AbstractFacade<Grups> {

    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public GrupsFacade() {
        super(Grups.class);
    }

    public List<Grups> getUserGrups(String aUname) {
        Users pUser = (Users) getUser(aUname);
        List<Grups> pWyniki = new ArrayList<Grups>();
        String pQuery ="SELECT " +
"  grups.tytul, " +
"  grups.opis " +
"  FROM " +
"  public.usergrups, " +
"  public.grups " +
"  WHERE " +
"  grups.id = usergrups.grup_id AND " +
"  usergrups.user_id = ? ";
        List<Object[]> results = getEntityManager().createNativeQuery(pQuery).setParameter(1, pUser.getUid()).getResultList();
        Grups pD;
        for (Object[] ob : results) {
            pD = new Grups();
            pD.setTytul((String) ob[0]);
            pD.setOpis((String) ob[1]);
            
            //pD.setStan((Integer) ob[15]);
            pWyniki.add(pD);
        }                
        return pWyniki;
    }
    

    
    public List<Usergrups> getGrupyUzytkownika(String aUname) {
        Users pUser = (Users) getUser(aUname);
        List<Usergrups> pList = new ArrayList<>();
        for (Usergrups pUserGrup : pUser.getUserGrupsCollection()) {
            pList.add(pUserGrup);
        }
        return pList;
    }
 




    public void zapiszUserGrup(Usergrups ue) {
        em.persist(ue);
    }

    public void zapiszGrup(Grups e) {
        em.persist(e);
    }





  

}

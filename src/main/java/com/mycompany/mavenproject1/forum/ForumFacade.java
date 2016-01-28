/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.forum;


import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.auth.Users;
import com.mycompany.mavenproject1.forum.ob.Forum;
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
public class ForumFacade extends AbstractFacade<Forum> {
    
    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public ForumFacade() {
        super(Forum.class);
    }

    public List<Forum> getWiadomosciZForum(int eventId) {        
        String pQuery = "select * from forum where event_id = ?";
        List<Forum> results = getEntityManager().createNativeQuery(pQuery, Forum.class).setParameter(1, eventId).getResultList();        
        return results;
    }
    

}

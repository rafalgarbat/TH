/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.photos;

import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.event.Events;
import com.mycompany.mavenproject1.photos.ob.Photos;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Stateless
public class PhotosFacade  extends AbstractFacade<Photos>{
  @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public PhotosFacade() {
        super(Photos.class);
    }   
    
    
}

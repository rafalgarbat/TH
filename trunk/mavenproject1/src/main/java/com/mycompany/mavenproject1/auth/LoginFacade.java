/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.auth;

import com.mycompany.mavenproject1.AbstractFacade;
import com.mycompany.mavenproject1.mail.SendMailTLS;
import java.util.List;
import javax.ejb.Stateless;
import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
@Stateless
public class LoginFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "com.mycompany_mavenproject1_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public LoginFacade() {
        super(Users.class);
    }

    public boolean validate(String uname, String password) {
        Query pQuery = em.createNamedQuery("Users.findByNameAndPassword").setParameter("uname", uname).setParameter("password", password).setMaxResults(1);
        return !pQuery.getResultList().isEmpty();
    }

    public int getUserId(String uname) {
        Query pQuery = em.createNamedQuery("Users.findByUname").setParameter("uname", uname).setMaxResults(1);
        Users pUser = (Users) pQuery.getResultList().get(0);
        return pUser.getUid();
    }

    public Users getUser(String uname) {
        Query pQuery = em.createNamedQuery("Users.findByUname").setParameter("uname", uname).setMaxResults(1);
        Users pUser = (Users) pQuery.getResultList().get(0);
        return pUser;
    }

    public List<Users> getUsers(String uname){
        Query pQuery = em.createNamedQuery("Users.findByUname").setParameter("uname", '%'+uname+'%');
        return pQuery.getResultList();         
    }
    
    public boolean createUser(String aLogin, String aEmail, String aPassword, int aUserType, String aCity, String aState, int aR, int aT, int aS, int aB) {
        Users pNewUser = new Users();
        pNewUser.setPassword(aPassword);
        pNewUser.setUname(aLogin);
        pNewUser.setEmail(aEmail);
        pNewUser.setUser_type_id(aUserType);
        pNewUser.setState(aEmail);
        pNewUser.setCity(aEmail);
        pNewUser.setR_val(aUserType);
        pNewUser.setT_val(aUserType);
        pNewUser.setS_val(aUserType);
        pNewUser.setB_val(aUserType);
        //pNewUser.setHashCode("xxxx");
        create(pNewUser);
        /* todo: wysylanie maila aktywacyjnego i aktywacja konta, poki co wsystko aktywne z defaultu
        try{
            SendMailTLS.send(aEmail, "Zalozenie konta", "tresc z linkiem aktywacyjnym");            
        }catch (MessagingException e){
         //nie udalo sie wyslac wiadomosci
        }
         */
        return true;
    }
}

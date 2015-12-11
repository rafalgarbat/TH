/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.auth.Users;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import javax.ejb.EJB;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.persistence.Query;
 
@ManagedBean(name = "carService")
@ApplicationScoped
public class CarService {
    
    @EJB
    private LoginFacade loginFacade;

    public List<Contact> createContacts(int size, String aUname) {
        List<Contact> list = new ArrayList<Contact>();
        
         Query pQuery = loginFacade.getEntityManager().createNamedQuery("Users.findAll").setMaxResults(size);
         List<Users> pResults = pQuery.getResultList();
         for(Users pU : pResults){
            Contact pTmp = pU.getContact();
            pTmp.setCzyZnajomy(czyZnajomy(aUname,pU.getUsercontactsCollection()));
            list.add(pTmp);
         }
                 
        return list;
    }
    /*
    todo: przeniesc to do odczytu z bazy w postaci left joina - bedzie szybciej
    */
    public boolean czyZnajomy(String aUname, Collection<Usercontacts> aCol){
        for(Usercontacts aCo  : aCol){
            if (aCo.getContactId().getUname().equals(aUname)){
            return true; //todo: chyba źle dziala, sprawdzić
            }
        }
        return false;
    }
    
    public void sendInvitation(String aUnameFrom, String aUnameTo){
    
    
    }
    
    public LoginFacade getLoginFacade() {
        return loginFacade;
    }

    public void setLoginFacade(LoginFacade loginFacade) {
        this.loginFacade = loginFacade;
    }
    
    
    
}
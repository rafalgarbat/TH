/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.auth;


import java.io.IOException;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

 
@ManagedBean
@Named("login")
@SessionScoped
public class Login implements Serializable {
 
    private static final long serialVersionUID = 1094801825228386363L;
    
    @EJB
    private LoginFacade loginFacade;
    
    private String pwd;
    private String msg;
    private String user;
    private String regURL;
    private String imieinazwisko;
    private String email;
        
 
    public String getPwd() {
        return pwd;
    }
 
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
 
    public String getMsg() {
        return msg;
    }
 
    public void setMsg(String msg) {
        this.msg = msg;
    }
 
    public String getUser() {
        return user;
    }
 
    public void setUser(String user) {
        this.user = user;
    }
 
     private LoginFacade getFacade() {
        return loginFacade;
    }

    public String getRegURL() {
        return regURL;
    }

    public void setRegURL(String regURL) {
        this.regURL = regURL;
    }

    public String getImieinazwisko() {
        return imieinazwisko;
    }

    public void setImieinazwisko(String imieinazwisko) {
        this.imieinazwisko = imieinazwisko;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

     
     
    public String  validateRegistrationURL(){
        FacesContext facesContext = FacesContext.getCurrentInstance();
        String parameter_value = (String) facesContext.getExternalContext().getRequestParameterMap().get("regURL");

        if (parameter_value != null && parameter_value.equalsIgnoreCase("regURL")) {
            return "index";
        } else {
            return "index";
        }
    } 
    
    public String createUser(){
        boolean valid =getFacade().createUser(imieinazwisko, user, email, pwd);
        if (valid){
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", user);
            return SlownikAdresow.STRONA_PO_ZALOGOWANIU;
        }else{
             FacesContext.getCurrentInstance().addMessage(
                    null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Blad podczas tworzenia uzytkownika",
                            "Blad podczas tworzenia uzytkownika"));
            return "login";
        }
    }
    
    //validate login
    public String validateUsernamePassword() {
        boolean valid = getFacade().validate(user, pwd);
        if (valid) {
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", user);
            return SlownikAdresow.STRONA_PO_ZALOGOWANIU;
        } else {
            FacesContext.getCurrentInstance().addMessage(
                    null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Incorrect Username and Passowrd",
                            "Please enter correct username and Password"));
            return "login";
        }
    }
 
    //logout event, invalidate session
    public String logout() {
        HttpSession session = SessionBean.getSession();
        session.invalidate();
        return "login";
    }
}
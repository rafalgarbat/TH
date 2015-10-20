/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.auth;


import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

 
@ManagedBean
@SessionScoped
public class Login implements Serializable {
 
    private static final long serialVersionUID = 1094801825228386363L;
    
    @EJB
    private LoginFacade loginFacade;
    
    private String pwd;
    private String msg;
    private String user;
 
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

    
    //validate login
    public String validateUsernamePassword() {
        boolean valid = getFacade().validate(user, pwd);
        if (valid) {
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", user);
            return "/klient/List";
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
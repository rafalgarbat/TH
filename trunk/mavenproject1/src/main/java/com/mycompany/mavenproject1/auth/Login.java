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
import javax.inject.Named;
import javax.servlet.http.HttpSession;

 
@ManagedBean
@Named("login")
@SessionScoped
public class Login implements Serializable {
 
    private static final long serialVersionUID = 1094801825228386363L;
    
    @EJB
    private LoginFacade loginFacade;
        
    private String uname;
    private String pwd;
    private String email;
    private int userType;
    private String city;
    private String state;
    private int r_val;
    private int s_val;
    private int b_val;
    private int t_val;
    private String hashcode;
    private String msg;

    public LoginFacade getLoginFacade() {
        return loginFacade;
    }

    public void setLoginFacade(LoginFacade loginFacade) {
        this.loginFacade = loginFacade;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getR_val() {
        return r_val;
    }

    public void setR_val(int r_val) {
        this.r_val = r_val;
    }

    public int getS_val() {
        return s_val;
    }

    public void setS_val(int s_val) {
        this.s_val = s_val;
    }

    public int getB_val() {
        return b_val;
    }

    public void setB_val(int b_val) {
        this.b_val = b_val;
    }

    public int getT_val() {
        return t_val;
    }

    public void setT_val(int t_val) {
        this.t_val = t_val;
    }

    public String getHashcode() {
        return hashcode;
    }

    public void setHashcode(String hashcode) {
        this.hashcode = hashcode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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
        boolean valid =getLoginFacade().createUser(uname, email, pwd, userType);
        if (valid){
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", uname);
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
        boolean valid = getLoginFacade().validate(uname, pwd);
        if (valid) {
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", uname);
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
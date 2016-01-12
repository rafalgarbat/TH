/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.common;

import javax.faces.context.FacesContext;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class SimpleView {

    public String getUserUname() {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("username").toString();
    }

}

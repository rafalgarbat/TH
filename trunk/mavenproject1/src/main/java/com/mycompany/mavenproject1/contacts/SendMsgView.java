/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

import java.util.HashMap;
import java.util.Map;
import javax.faces.bean.ManagedBean;
import org.primefaces.context.RequestContext;

/**
 *
 * @author misiozel
 */
@ManagedBean(name = "sendmsgview")
public class SendMsgView {
    
     public void viewMsgPanel() {
        Map<String,Object> options = new HashMap<String, Object>();
        options.put("resizable", false);
        options.put("modal", true);
        options.put("width", 640);
        options.put("height", 340);
        RequestContext.getCurrentInstance().openDialog("sendmsg", options, null);
    }
     
    
}

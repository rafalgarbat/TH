/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.slowniki;

import com.mycompany.mavenproject1.common.SimpleView;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author misiozel
 */
@ManagedBean(name = "wartosciview")
@ViewScoped
public class WartosciView extends SimpleView {

    @EJB
    private WartosciFacade wartosciFacade;

    public List<Wartosci> getWartosciSlownikowe(int aIdSlownika) {
        return getWartosciFacade().getWartosciSlownikowe(aIdSlownika);
    }

    public String getWartoscSlownikowa(int aIdSlownika, int aIdWartosci) {
         Wartosci w = (Wartosci)getWartosciFacade().getWartosclownikowa(aIdSlownika,aIdWartosci);
         return w.getNazwa();
    }

    
    public WartosciFacade getWartosciFacade() {
        return wartosciFacade;
    }

    public void setWartosciFacade(WartosciFacade wartosciFacade) {
        this.wartosciFacade = wartosciFacade;
    }

    
}

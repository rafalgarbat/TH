/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.news;

import java.util.Date;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class News {

    private String title;
    private String body;
    private Date cdate;
    private int ownerId;

    public News(String aTitle, String aBody, Date aCdate, int aOwner) {
        this.title = aTitle;
        this.body = aBody;
        this.cdate = aCdate;
        this.ownerId = aOwner;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

}

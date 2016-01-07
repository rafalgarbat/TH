/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.photos;

import static com.mycompany.mavenproject1.auth.Login.destination;
import com.mycompany.mavenproject1.auth.LoginFacade;
import com.mycompany.mavenproject1.event.EventFacade;
import com.mycompany.mavenproject1.photos.ob.Photos;
import com.mycompany.mavenproject1.util.ImageUtil;
import java.io.IOException;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;


@ManagedBean(name="uploadPlikow")
public class FileUploadView {

    private UploadedFile file;

    @EJB
    private PhotosFacade facade;

    @EJB
    private LoginFacade loginFacade;
    
    private String uname;

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public void upload() {
        if (file != null) {
            FacesMessage message = new FacesMessage("Succesful", file.getFileName() + " is uploaded.");
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void handleFileUpload(FileUploadEvent event) {
       
        try {
            ImageUtil.copyFile(event.getFile().getFileName(), event.getFile().getInputstream());
            //ImageUtil.imageResize(destination + "ala_avatar.jpg", destination + "ala_small_avatar.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        Photos photo = new Photos();
        photo.setUrl(event.getFile().getFileName());
        photo.setVisible(1);
        photo.setUserid(getLoginFacade().getUser("ala"));
        getFacade().create(photo);

        FacesMessage msg = new FacesMessage("Succesful", event.getFile().getFileName() + " is uploaded.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public PhotosFacade getFacade() {
        return facade;
    }

    public void setFacade(PhotosFacade facade) {
        this.facade = facade;
    }

    public LoginFacade getLoginFacade() {
        return loginFacade;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    
}

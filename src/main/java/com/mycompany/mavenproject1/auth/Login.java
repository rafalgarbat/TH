/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.auth;

import com.mycompany.mavenproject1.util.ImageUtil;
import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.inject.Named;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

@ManagedBean
@Named("login")
@SessionScoped
public class Login implements Serializable {

    private static final long serialVersionUID = 1094801825228386363L;

    @EJB
    private LoginFacade loginFacade;

    private Users currentUser;

    public static String destination = "E:\\roboczy\\traininglib\\mavenproject1\\src\\main\\webapp\\resources\\images\\";

    private String paramEventId;

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
    private String localeCode;

    private static Map<String, Object> countries;

    static {
        countries = new LinkedHashMap<String, Object>();
        countries.put("English", Locale.ENGLISH); //label, value                
        countries.put("Polish", new Locale.Builder().setLanguage("pl").setRegion("PL").build());
    }

    public Map<String, Object> getCountriesInMap() {
        return countries;
    }

    public String getLocaleCode() {
        return localeCode;
    }

    public void setLocaleCode(String localeCode) {
        this.localeCode = localeCode;
    }

    //value change event listener
    public void countryLocaleCodeChanged(ValueChangeEvent e) {

        String newLocaleValue = e.getNewValue().toString();

        //loop country map to compare the locale code
        for (Map.Entry<String, Object> entry : countries.entrySet()) {

            if (entry.getValue().toString().equals(newLocaleValue)) {

                FacesContext.getCurrentInstance()
                        .getViewRoot().setLocale((Locale) entry.getValue());

            }
        }
    }

    public LoginFacade getLoginFacade() {
        return loginFacade;
    }

    public void setLoginFacade(LoginFacade loginFacade) {
        this.loginFacade = loginFacade;
    }

    public StreamedContent getImage(String aName) throws IOException {
        StreamedContent content;
        //Image img = ImageIO.read(new File("strawberry.jpg"));
        String path = destination + "ala_avatar.jpg";
        // String contentType = FacesContext.getCurrentInstance().getExternalContext().getMimeType(path); 

        return new DefaultStreamedContent(new FileInputStream(path));
    }

    public void handleFileUpload(FileUploadEvent event) {
        FacesMessage message = new FacesMessage("Succesful", event.getFile().getFileName() + " is uploaded.");
        ServletContext pCont = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();

        try {
            copyFile(getUname() + "_avatar.jpg", event.getFile().getInputstream());
            ImageUtil.imageResize(destination + "ala_avatar.jpg", destination + "ala_small_avatar.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public void copyFile(String fileName, InputStream in) {
        try {
            File pCurrentFile = new File(destination + fileName);
            pCurrentFile.delete();

            OutputStream out = new FileOutputStream(new File(destination + fileName));

            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = in.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

            in.close();
            out.flush();
            out.close();

            System.out.println("New file created!");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
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

    public void viewQuizCustomized() {
        Map<String, Object> options = new HashMap<>();
        options.put("modal", true);
        options.put("width", 640);
        options.put("height", 340);
        options.put("contentWidth", "100%");
        options.put("contentHeight", "100%");
        options.put("headerElement", "customheader");

        RequestContext.getCurrentInstance().openDialog("quiz.xhtml", options, null);
    }

    public String onChange() {
        return "lalala";
        //    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "You have selected: " + value, null));  
    }

    public String validateRegistrationURL() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        String parameter_value = (String) facesContext.getExternalContext().getRequestParameterMap().get("regURL");

        if (parameter_value != null && parameter_value.equalsIgnoreCase("regURL")) {
            return "index";
        } else {
            return "index";
        }
    }

    public String createUser() {
        boolean valid = getLoginFacade().createUser(uname, email, pwd, userType, city, state, r_val, t_val, s_val, b_val);
        if (valid) {
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", uname);
            return SlownikAdresow.STRONA_PO_ZALOGOWANIU;
        } else {
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
            int pUserId = getLoginFacade().getUserId(uname);
            currentUser = getLoginFacade().getUser(uname);
            HttpSession session = SessionBean.getSession();
            session.setAttribute("username", uname);
            session.setAttribute("userId", pUserId);
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

    public Users getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(Users currentUser) {
        this.currentUser = currentUser;
    }

    public String getName(String aObjName) {
        return "";
    }

    public String getParamEventId() {

        Map<String, String> paramMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
        return paramMap.get("paramEventId");
    }

}

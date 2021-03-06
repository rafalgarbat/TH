/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.event;

//import com.sun.xml.internal.ws.util.StringUtils;
import java.util.Collection;
import java.util.Date;
import org.primefaces.model.DefaultScheduleEvent;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
public class UserScheduleEvent extends DefaultScheduleEvent {

    //brakuje typu wydarzenia - tri, bieganie, kolarstwo
    //brakuje adresu wydarzenia (poza kordynatami gmaps)
    private String gmap_cords;
    private String keywords;
    private String description;
    private int typPrzesuniecia;
    private String adres;
    private String typWydarzenia;
    private int dbEventId;
    private Integer rating;
    private String dystans;
    private String ranga;
    private String organizator_info;
    private String rejestracja_info;
    private String adreswww;
    private String rodzaj_wydarzenia;

    private int iloscZapisanych; //do wywalenia
    private int czyJestemZapisany;

    /**
     * Kolekcja zapisanych do wydarzenia
     */
    private Collection<Userevents> zapisani;

    public UserScheduleEvent(String tytul, Date dataod, Date datado, Events eve) {
        super(tytul, dataod, datado, eve);
    }

    public UserScheduleEvent() {
        super();
    }

    public UserScheduleEvent(String string, Date date, Date date0) {
        super(string, date, date0);
    }

    public String getGmap_cords() {
        return gmap_cords;
    }

    public void setGmap_cords(String gmap_cords) {
        this.gmap_cords = gmap_cords;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTypPrzesuniecia() {
        return typPrzesuniecia;
    }

    public void setTypPrzesuniecia(int typPrzesuniecia) {
        this.typPrzesuniecia = typPrzesuniecia;
    }

    public String getAdres() {
        return adres;
    }

    public String getCapitalizedAdres() {
        return adres; //StringUtils.capitalize(adres);
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getTypWydarzenia() {
        return typWydarzenia;
    }

    public void setTypWydarzenia(String typWydarzenia) {
        this.typWydarzenia = typWydarzenia;
    }

    public int getDbEventId() {
        return dbEventId;
    }

    public void setDbEventId(int dbEventId) {
        this.dbEventId = dbEventId;
    }

    public int getIloscZapisanych() {
        return iloscZapisanych;
    }

    public void setIloscZapisanych(int iloscZapisanych) {
        this.iloscZapisanych = iloscZapisanych;
    }

    public int getCzyJestemZapisany() {
        return czyJestemZapisany;
    }

    public void setCzyJestemZapisany(int czyJestemZapisany) {
        this.czyJestemZapisany = czyJestemZapisany;
    }

    public Collection<Userevents> getZapisani() {
        return zapisani;
    }

    public void setZapisani(Collection<Userevents> zapisani) {
        this.zapisani = zapisani;
    }

    public String getCapitalizedTitle() {
        return this.getTitle();//StringUtils.capitalize();
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getDystans() {
        return dystans;
    }

    public void setDystans(String dystans) {
        this.dystans = dystans;
    }

    public String getRanga() {
        return ranga;
    }

    public void setRanga(String ranga) {
        this.ranga = ranga;
    }

    public String getOrganizator_info() {
        return organizator_info;
    }

    public void setOrganizator_info(String organizator_info) {
        this.organizator_info = organizator_info;
    }

    public String getRejestracja_info() {
        return rejestracja_info;
    }

    public void setRejestracja_info(String rejestracja_info) {
        this.rejestracja_info = rejestracja_info;
    }

    public String getAdreswww() {
        return adreswww;
    }

    public void setAdreswww(String adreswww) {
        this.adreswww = adreswww;
    }

    public String getRodzaj_wydarzenia() {
        return rodzaj_wydarzenia;
    }

    public void setRodzaj_wydarzenia(String rodzaj_wydarzenia) {
        this.rodzaj_wydarzenia = rodzaj_wydarzenia;
    }

}

package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.Klient;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-10-17T11:27:02")
@StaticMetamodel(Event.class)
public class Event_ { 

    public static volatile SingularAttribute<Event, Integer> id;
    public static volatile SingularAttribute<Event, Date> mdate;
    public static volatile SingularAttribute<Event, Boolean> czycalydzien;
    public static volatile SingularAttribute<Event, String> tytul;
    public static volatile SingularAttribute<Event, Date> datado;
    public static volatile SingularAttribute<Event, String> przesuniecie;
    public static volatile SingularAttribute<Event, Integer> typPrzesuniecia;
    public static volatile SingularAttribute<Event, String> event_id;
    public static volatile SingularAttribute<Event, Boolean> czypubliczne;
    public static volatile SingularAttribute<Event, Date> cdate;
    public static volatile SingularAttribute<Event, Klient> klientId;
    public static volatile SingularAttribute<Event, Date> dataod;

}
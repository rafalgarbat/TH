package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.GrupyTreningowe;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-09-28T15:20:33")
@StaticMetamodel(Klient.class)
public class Klient_ { 

    public static volatile SingularAttribute<Klient, Integer> id;
    public static volatile CollectionAttribute<Klient, GrupyTreningowe> grupyTreningoweCollection;
    public static volatile SingularAttribute<Klient, String> imie;
    public static volatile SingularAttribute<Klient, String> email;
    public static volatile SingularAttribute<Klient, String> login;
    public static volatile SingularAttribute<Klient, String> nazwisko;
    public static volatile SingularAttribute<Klient, Date> cdate;

}
package com.mycompany.mavenproject1;

import com.mycompany.mavenproject1.Klient;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-10-15T20:33:40")
@StaticMetamodel(GrupyTreningowe.class)
public class GrupyTreningowe_ { 

    public static volatile SingularAttribute<GrupyTreningowe, Integer> id;
    public static volatile SingularAttribute<GrupyTreningowe, Klient> ownerId;
    public static volatile SingularAttribute<GrupyTreningowe, String> nazwa;
    public static volatile SingularAttribute<GrupyTreningowe, Date> cdate;

}
PGDMP         ;                 t            postgres    9.0.22    9.0.22 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     )   SET standard_conforming_strings = 'off';
                       false            �           1262    11826    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish, Poland' LC_CTYPE = 'Polish, Poland';
    DROP DATABASE postgres;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            1           2612    11574    plpgsql    PROCEDURAL LANGUAGE     /   CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;
 "   DROP PROCEDURAL LANGUAGE plpgsql;
             postgres    false            �            1255    24748    totalrecords()    FUNCTION     3  CREATE FUNCTION totalrecords() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	total integer;
	str text;
BEGIN

  FOR i IN 1..15 LOOP
    str:= str||'insert into users(uname, password, email,user_type_id, state, city)
values('||'''ala';
END LOOP;	

EXECUTE IMMEDIATE stR;
   

   RETURN 1;
END;
$$;
 %   DROP FUNCTION public.totalrecords();
       public       postgres    false    561    5            �            1259    24714    calendarevents    TABLE     f   CREATE TABLE calendarevents (
    uid integer NOT NULL,
    calenarid integer,
    eventid integer
);
 "   DROP TABLE public.calendarevents;
       public         postgres    false    5            �            1259    24712    calendarevents_uid_seq    SEQUENCE     x   CREATE SEQUENCE calendarevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.calendarevents_uid_seq;
       public       postgres    false    159    5            �           0    0    calendarevents_uid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE calendarevents_uid_seq OWNED BY calendarevents.uid;
            public       postgres    false    158            �           0    0    calendarevents_uid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('calendarevents_uid_seq', 96, true);
            public       postgres    false    158            �            1259    24650 	   calendars    TABLE     g   CREATE TABLE calendars (
    uid integer NOT NULL,
    name text,
    ispublic boolean DEFAULT true
);
    DROP TABLE public.calendars;
       public         postgres    false    1919    5            �            1259    24648    calendars_uid_seq    SEQUENCE     s   CREATE SEQUENCE calendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.calendars_uid_seq;
       public       postgres    false    5    155            �           0    0    calendars_uid_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE calendars_uid_seq OWNED BY calendars.uid;
            public       postgres    false    154            �           0    0    calendars_uid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('calendars_uid_seq', 3, true);
            public       postgres    false    154            �            1259    24869    coach_groups    TABLE     �   CREATE TABLE coach_groups (
    uid integer NOT NULL,
    coachid integer,
    groupname text,
    stan integer DEFAULT 0,
    cdate date DEFAULT now()
);
     DROP TABLE public.coach_groups;
       public         postgres    false    1932    1933    5            �            1259    24867    coach_groups_uid_seq    SEQUENCE     v   CREATE SEQUENCE coach_groups_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.coach_groups_uid_seq;
       public       postgres    false    5    171            �           0    0    coach_groups_uid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE coach_groups_uid_seq OWNED BY coach_groups.uid;
            public       postgres    false    170            �           0    0    coach_groups_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('coach_groups_uid_seq', 1, false);
            public       postgres    false    170            �            1259    24847    coach_players    TABLE     �   CREATE TABLE coach_players (
    uid integer NOT NULL,
    coachid integer,
    userid integer,
    stan integer DEFAULT 0,
    cdate date DEFAULT now()
);
 !   DROP TABLE public.coach_players;
       public         postgres    false    1929    1930    5            �            1259    24845    coach_players_uid_seq    SEQUENCE     w   CREATE SEQUENCE coach_players_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.coach_players_uid_seq;
       public       postgres    false    169    5            �           0    0    coach_players_uid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE coach_players_uid_seq OWNED BY coach_players.uid;
            public       postgres    false    168            �           0    0    coach_players_uid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('coach_players_uid_seq', 20, true);
            public       postgres    false    168            �            1259    24581    events    TABLE     �  CREATE TABLE events (
    id integer NOT NULL,
    klient_id integer,
    tytul text,
    opis text,
    czycalydzien boolean DEFAULT false,
    czypubliczne boolean DEFAULT true,
    dataod timestamp with time zone,
    datado timestamp with time zone,
    przesuniecie text,
    typ_przesuniecia integer,
    gmap_cords text,
    keywords text,
    event_id text,
    cdate date DEFAULT now(),
    mdate date DEFAULT now(),
    adres text,
    typ_wydarzenia text,
    rating numeric(5,2),
    adreswww text,
    rodzaj_wydarzenia text,
    rejestracja_info text,
    ranga text,
    dystans text,
    organizator_info text,
    rejestracja_date date,
    owner_id integer
);
    DROP TABLE public.events;
       public         postgres    false    1906    1907    1908    1909    5            �            1259    24579    events_id_seq    SEQUENCE     o   CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public       postgres    false    149    5            �           0    0    events_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE events_id_seq OWNED BY events.id;
            public       postgres    false    148            �           0    0    events_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('events_id_seq', 103, true);
            public       postgres    false    148            �            1259    24887    events_invitations    TABLE     �   CREATE TABLE events_invitations (
    id integer NOT NULL,
    eventid integer,
    userid integer,
    inviteby integer,
    cdate date DEFAULT now(),
    stan integer DEFAULT 1002
);
 &   DROP TABLE public.events_invitations;
       public         postgres    false    1935    1936    5            �            1259    24885    events_invitations_id_seq    SEQUENCE     {   CREATE SEQUENCE events_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.events_invitations_id_seq;
       public       postgres    false    5    173            �           0    0    events_invitations_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE events_invitations_id_seq OWNED BY events_invitations.id;
            public       postgres    false    172            �           0    0    events_invitations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('events_invitations_id_seq', 15, true);
            public       postgres    false    172            �            1259    24930    forum    TABLE     �   CREATE TABLE forum (
    id integer NOT NULL,
    event_id integer,
    commenterid integer,
    msg_title text,
    msg text,
    cdate date DEFAULT now()
);
    DROP TABLE public.forum;
       public         postgres    false    1939    5            �            1259    24928    forum_id_seq    SEQUENCE     n   CREATE SEQUENCE forum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.forum_id_seq;
       public       postgres    false    177    5            �           0    0    forum_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE forum_id_seq OWNED BY forum.id;
            public       postgres    false    176            �           0    0    forum_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('forum_id_seq', 1, false);
            public       postgres    false    176            �            1259    16424    grupy_treningowe    TABLE        CREATE TABLE grupy_treningowe (
    id integer NOT NULL,
    owner_id integer,
    nazwa text,
    cdate date DEFAULT now()
);
 $   DROP TABLE public.grupy_treningowe;
       public         postgres    false    1898    5            �            1259    16422    grupy_treningowe_id_seq    SEQUENCE     y   CREATE SEQUENCE grupy_treningowe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.grupy_treningowe_id_seq;
       public       postgres    false    145    5            �           0    0    grupy_treningowe_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE grupy_treningowe_id_seq OWNED BY grupy_treningowe.id;
            public       postgres    false    144            �           0    0    grupy_treningowe_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('grupy_treningowe_id_seq', 1, true);
            public       postgres    false    144            �            1259    16412    klient    TABLE     �   CREATE TABLE klient (
    id integer NOT NULL,
    imie text,
    nazwisko text,
    email text,
    login text,
    cdate date DEFAULT now(),
    password text
);
    DROP TABLE public.klient;
       public         postgres    false    1896    5            �            1259    16410    klient_id_seq    SEQUENCE     o   CREATE SEQUENCE klient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.klient_id_seq;
       public       postgres    false    5    143            �           0    0    klient_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE klient_id_seq OWNED BY klient.id;
            public       postgres    false    142            �           0    0    klient_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('klient_id_seq', 3, true);
            public       postgres    false    142            �            1259    24751    msg    TABLE     }   CREATE TABLE msg (
    uid integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    stan integer DEFAULT 0
);
    DROP TABLE public.msg;
       public         postgres    false    1924    5            �            1259    24749    msg_uid_seq    SEQUENCE     m   CREATE SEQUENCE msg_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.msg_uid_seq;
       public       postgres    false    163    5            �           0    0    msg_uid_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE msg_uid_seq OWNED BY msg.uid;
            public       postgres    false    162            �           0    0    msg_uid_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('msg_uid_seq', 1, false);
            public       postgres    false    162            �            1259    24810    photos    TABLE     �   CREATE TABLE photos (
    id integer NOT NULL,
    userid integer,
    url text,
    visible integer,
    cdate timestamp with time zone DEFAULT now()
);
    DROP TABLE public.photos;
       public         postgres    false    1927    5            �            1259    24808    photos_id_seq    SEQUENCE     o   CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.photos_id_seq;
       public       postgres    false    167    5            �           0    0    photos_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE photos_id_seq OWNED BY photos.id;
            public       postgres    false    166            �           0    0    photos_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('photos_id_seq', 2, true);
            public       postgres    false    166            �            1259    24913    slowniki    TABLE     C   CREATE TABLE slowniki (
    id integer NOT NULL,
    nazwa text
);
    DROP TABLE public.slowniki;
       public         postgres    false    5            �            1259    24911    slowniki_id_seq    SEQUENCE     t   CREATE SEQUENCE slowniki_id_seq
    START WITH 1
    INCREMENT BY 1000
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.slowniki_id_seq;
       public       postgres    false    5    175            �           0    0    slowniki_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE slowniki_id_seq OWNED BY slowniki.id;
            public       postgres    false    174            �           0    0    slowniki_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('slowniki_id_seq', 1000, true);
            public       postgres    false    174            �            1259    24690    usercalendars    TABLE     {   CREATE TABLE usercalendars (
    uid integer NOT NULL,
    userid integer,
    calendarid integer,
    owner_id integer
);
 !   DROP TABLE public.usercalendars;
       public         postgres    false    5            �            1259    24688    usercalendars_uid_seq    SEQUENCE     w   CREATE SEQUENCE usercalendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usercalendars_uid_seq;
       public       postgres    false    157    5            �           0    0    usercalendars_uid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE usercalendars_uid_seq OWNED BY usercalendars.uid;
            public       postgres    false    156            �           0    0    usercalendars_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('usercalendars_uid_seq', 3, true);
            public       postgres    false    156            �            1259    24732    usercontacts    TABLE     e   CREATE TABLE usercontacts (
    uid integer NOT NULL,
    user_id integer,
    contact_id integer
);
     DROP TABLE public.usercontacts;
       public         postgres    false    5            �            1259    24730    usercontacts_uid_seq    SEQUENCE     v   CREATE SEQUENCE usercontacts_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.usercontacts_uid_seq;
       public       postgres    false    5    161            �           0    0    usercontacts_uid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE usercontacts_uid_seq OWNED BY usercontacts.uid;
            public       postgres    false    160                        0    0    usercontacts_uid_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('usercontacts_uid_seq', 2, true);
            public       postgres    false    160            �            1259    24616 
   userevents    TABLE     �   CREATE TABLE userevents (
    uid integer NOT NULL,
    user_id integer,
    event_id integer,
    stan integer DEFAULT 0,
    duration text,
    distance text,
    kalorie text,
    uwagi text,
    link text,
    completed boolean DEFAULT false
);
    DROP TABLE public.userevents;
       public         postgres    false    1916    1917    5            �            1259    24614    userevents_uid_seq    SEQUENCE     t   CREATE SEQUENCE userevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.userevents_uid_seq;
       public       postgres    false    153    5                       0    0    userevents_uid_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE userevents_uid_seq OWNED BY userevents.uid;
            public       postgres    false    152                       0    0    userevents_uid_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('userevents_uid_seq', 88, true);
            public       postgres    false    152            �            1259    24601    users    TABLE     X  CREATE TABLE users (
    uid integer NOT NULL,
    uname character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    email text,
    user_type_id integer,
    hashcode text,
    state text,
    city text,
    r_val integer DEFAULT 0,
    b_val integer DEFAULT 0,
    s_val integer DEFAULT 0,
    t_val integer DEFAULT 0
);
    DROP TABLE public.users;
       public         postgres    false    1911    1912    1913    1914    5            �            1259    24599    users_uid_seq    SEQUENCE     o   CREATE SEQUENCE users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users_uid_seq;
       public       postgres    false    5    151                       0    0    users_uid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE users_uid_seq OWNED BY users.uid;
            public       postgres    false    150                       0    0    users_uid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('users_uid_seq', 50, true);
            public       postgres    false    150            �            1259    24782    wartosci    TABLE     [   CREATE TABLE wartosci (
    id integer NOT NULL,
    nazwa text,
    slownik_id integer
);
    DROP TABLE public.wartosci;
       public         postgres    false    5            �            1259    24780    wartosci_id_seq    SEQUENCE     q   CREATE SEQUENCE wartosci_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.wartosci_id_seq;
       public       postgres    false    5    165                       0    0    wartosci_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE wartosci_id_seq OWNED BY wartosci.id;
            public       postgres    false    164                       0    0    wartosci_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('wartosci_id_seq', 1, true);
            public       postgres    false    164            �            1259    16470    workouts    TABLE     z  CREATE TABLE workouts (
    id integer NOT NULL,
    title text,
    date_from date,
    date_to date,
    date_shift text,
    shit_type text,
    gmap_cords text,
    is_allday boolean DEFAULT false,
    is_public boolean DEFAULT false,
    keywords text,
    is_toremind boolean DEFAULT false,
    cuser integer,
    cdate date DEFAULT now(),
    mdate date DEFAULT now()
);
    DROP TABLE public.workouts;
       public         postgres    false    1900    1901    1902    1903    1904    5            �            1259    16468    workouts_id_seq    SEQUENCE     q   CREATE SEQUENCE workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.workouts_id_seq;
       public       postgres    false    147    5                       0    0    workouts_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;
            public       postgres    false    146                       0    0    workouts_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('workouts_id_seq', 1, false);
            public       postgres    false    146            �           2604    24717    uid    DEFAULT     j   ALTER TABLE ONLY calendarevents ALTER COLUMN uid SET DEFAULT nextval('calendarevents_uid_seq'::regclass);
 A   ALTER TABLE public.calendarevents ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    159    158    159            ~           2604    24653    uid    DEFAULT     `   ALTER TABLE ONLY calendars ALTER COLUMN uid SET DEFAULT nextval('calendars_uid_seq'::regclass);
 <   ALTER TABLE public.calendars ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    155    154    155            �           2604    24872    uid    DEFAULT     f   ALTER TABLE ONLY coach_groups ALTER COLUMN uid SET DEFAULT nextval('coach_groups_uid_seq'::regclass);
 ?   ALTER TABLE public.coach_groups ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    171    170    171            �           2604    24850    uid    DEFAULT     h   ALTER TABLE ONLY coach_players ALTER COLUMN uid SET DEFAULT nextval('coach_players_uid_seq'::regclass);
 @   ALTER TABLE public.coach_players ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    169    168    169            q           2604    24584    id    DEFAULT     X   ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    148    149    149            �           2604    24890    id    DEFAULT     p   ALTER TABLE ONLY events_invitations ALTER COLUMN id SET DEFAULT nextval('events_invitations_id_seq'::regclass);
 D   ALTER TABLE public.events_invitations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172    173            �           2604    24933    id    DEFAULT     V   ALTER TABLE ONLY forum ALTER COLUMN id SET DEFAULT nextval('forum_id_seq'::regclass);
 7   ALTER TABLE public.forum ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    177    176    177            i           2604    16427    id    DEFAULT     l   ALTER TABLE ONLY grupy_treningowe ALTER COLUMN id SET DEFAULT nextval('grupy_treningowe_id_seq'::regclass);
 B   ALTER TABLE public.grupy_treningowe ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    145    144    145            g           2604    16415    id    DEFAULT     X   ALTER TABLE ONLY klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);
 8   ALTER TABLE public.klient ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    142    143    143            �           2604    24754    uid    DEFAULT     T   ALTER TABLE ONLY msg ALTER COLUMN uid SET DEFAULT nextval('msg_uid_seq'::regclass);
 6   ALTER TABLE public.msg ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    163    162    163            �           2604    24813    id    DEFAULT     X   ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);
 8   ALTER TABLE public.photos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    166    167    167            �           2604    24916    id    DEFAULT     \   ALTER TABLE ONLY slowniki ALTER COLUMN id SET DEFAULT nextval('slowniki_id_seq'::regclass);
 :   ALTER TABLE public.slowniki ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    174    175            �           2604    24693    uid    DEFAULT     h   ALTER TABLE ONLY usercalendars ALTER COLUMN uid SET DEFAULT nextval('usercalendars_uid_seq'::regclass);
 @   ALTER TABLE public.usercalendars ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    156    157    157            �           2604    24735    uid    DEFAULT     f   ALTER TABLE ONLY usercontacts ALTER COLUMN uid SET DEFAULT nextval('usercontacts_uid_seq'::regclass);
 ?   ALTER TABLE public.usercontacts ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    161    160    161            {           2604    24619    uid    DEFAULT     b   ALTER TABLE ONLY userevents ALTER COLUMN uid SET DEFAULT nextval('userevents_uid_seq'::regclass);
 =   ALTER TABLE public.userevents ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    152    153    153            v           2604    24604    uid    DEFAULT     X   ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);
 8   ALTER TABLE public.users ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    150    151    151            �           2604    24785    id    DEFAULT     \   ALTER TABLE ONLY wartosci ALTER COLUMN id SET DEFAULT nextval('wartosci_id_seq'::regclass);
 :   ALTER TABLE public.wartosci ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    164    165    165            k           2604    16473    id    DEFAULT     \   ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);
 :   ALTER TABLE public.workouts ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    147    146    147            �          0    24714    calendarevents 
   TABLE DATA                     public       postgres    false    159   �       �          0    24650 	   calendars 
   TABLE DATA                     public       postgres    false    155   r�       �          0    24869    coach_groups 
   TABLE DATA                     public       postgres    false    171   ��       �          0    24847    coach_players 
   TABLE DATA                     public       postgres    false    169   �       �          0    24581    events 
   TABLE DATA                     public       postgres    false    149   ��       �          0    24887    events_invitations 
   TABLE DATA                     public       postgres    false    173   ��       �          0    24930    forum 
   TABLE DATA                     public       postgres    false    177   ܽ       �          0    16424    grupy_treningowe 
   TABLE DATA                     public       postgres    false    145   ��       �          0    16412    klient 
   TABLE DATA                     public       postgres    false    143   ~�       �          0    24751    msg 
   TABLE DATA                     public       postgres    false    163   *�       �          0    24810    photos 
   TABLE DATA                     public       postgres    false    167   D�       �          0    24913    slowniki 
   TABLE DATA                     public       postgres    false    175   ҿ       �          0    24690    usercalendars 
   TABLE DATA                     public       postgres    false    157   /�       �          0    24732    usercontacts 
   TABLE DATA                     public       postgres    false    161   ��       �          0    24616 
   userevents 
   TABLE DATA                     public       postgres    false    153   ��       �          0    24601    users 
   TABLE DATA                     public       postgres    false    151   ��       �          0    24782    wartosci 
   TABLE DATA                     public       postgres    false    165   u�       �          0    16470    workouts 
   TABLE DATA                     public       postgres    false    147   �       �           2606    24719    calendarevents_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_pkey PRIMARY KEY (uid);
 L   ALTER TABLE ONLY public.calendarevents DROP CONSTRAINT calendarevents_pkey;
       public         postgres    false    159    159            �           2606    24659    calendars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (uid);
 B   ALTER TABLE ONLY public.calendars DROP CONSTRAINT calendars_pkey;
       public         postgres    false    155    155            �           2606    24884    coach_groups_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY coach_groups
    ADD CONSTRAINT coach_groups_pkey PRIMARY KEY (uid);
 H   ALTER TABLE ONLY public.coach_groups DROP CONSTRAINT coach_groups_pkey;
       public         postgres    false    171    171            �           2606    24864    coach_players_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_pkey PRIMARY KEY (uid);
 J   ALTER TABLE ONLY public.coach_players DROP CONSTRAINT coach_players_pkey;
       public         postgres    false    169    169            �           2606    24593 
   event_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.events DROP CONSTRAINT event_pkey;
       public         postgres    false    149    149            �           2606    24893    events_invitations_id_key 
   CONSTRAINT     ^   ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_id_key UNIQUE (id);
 V   ALTER TABLE ONLY public.events_invitations DROP CONSTRAINT events_invitations_id_key;
       public         postgres    false    173    173            �           2606    24910    events_invitations_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.events_invitations DROP CONSTRAINT events_invitations_pkey;
       public         postgres    false    173    173            �           2606    24939 
   forum_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.forum DROP CONSTRAINT forum_pkey;
       public         postgres    false    177    177            �           2606    16433    grupy_treningowe_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.grupy_treningowe DROP CONSTRAINT grupy_treningowe_pkey;
       public         postgres    false    145    145            �           2606    16421    klient_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.klient DROP CONSTRAINT klient_pkey;
       public         postgres    false    143    143            �           2606    24757    msg_pkey 
   CONSTRAINT     D   ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (uid);
 6   ALTER TABLE ONLY public.msg DROP CONSTRAINT msg_pkey;
       public         postgres    false    163    163            �           2606    24819 
   photospkey 
   CONSTRAINT     H   ALTER TABLE ONLY photos
    ADD CONSTRAINT photospkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.photos DROP CONSTRAINT photospkey;
       public         postgres    false    167    167            �           2606    24921    slowniki_id_key 
   CONSTRAINT     J   ALTER TABLE ONLY slowniki
    ADD CONSTRAINT slowniki_id_key UNIQUE (id);
 B   ALTER TABLE ONLY public.slowniki DROP CONSTRAINT slowniki_id_key;
       public         postgres    false    175    175            �           2606    24695    usercalendars_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_pkey PRIMARY KEY (uid);
 J   ALTER TABLE ONLY public.usercalendars DROP CONSTRAINT usercalendars_pkey;
       public         postgres    false    157    157            �           2606    24737    usercontacts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_pkey PRIMARY KEY (uid);
 H   ALTER TABLE ONLY public.usercontacts DROP CONSTRAINT usercontacts_pkey;
       public         postgres    false    161    161            �           2606    24622    userevents_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_pkey PRIMARY KEY (uid);
 D   ALTER TABLE ONLY public.userevents DROP CONSTRAINT userevents_pkey;
       public         postgres    false    153    153            �           2606    24613 
   users_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    151    151            �           2606    24790    wartosci_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY wartosci
    ADD CONSTRAINT wartosci_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.wartosci DROP CONSTRAINT wartosci_pkey;
       public         postgres    false    165    165            �           2606    16483    workouts_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.workouts DROP CONSTRAINT workouts_pkey;
       public         postgres    false    147    147            �           2606    24720    calendarevents_calenarid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_calenarid_fkey FOREIGN KEY (calenarid) REFERENCES calendars(uid);
 V   ALTER TABLE ONLY public.calendarevents DROP CONSTRAINT calendarevents_calenarid_fkey;
       public       postgres    false    159    1952    155            �           2606    24725    calendarevents_eventid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);
 T   ALTER TABLE ONLY public.calendarevents DROP CONSTRAINT calendarevents_eventid_fkey;
       public       postgres    false    159    1946    149            �           2606    24878    coach_groups_coachid_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY coach_groups
    ADD CONSTRAINT coach_groups_coachid_fkey FOREIGN KEY (coachid) REFERENCES users(uid);
 P   ALTER TABLE ONLY public.coach_groups DROP CONSTRAINT coach_groups_coachid_fkey;
       public       postgres    false    1948    151    171            �           2606    24853    coach_players_coachid_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_coachid_fkey FOREIGN KEY (coachid) REFERENCES users(uid);
 R   ALTER TABLE ONLY public.coach_players DROP CONSTRAINT coach_players_coachid_fkey;
       public       postgres    false    1948    169    151            �           2606    24858    coach_players_userid_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);
 Q   ALTER TABLE ONLY public.coach_players DROP CONSTRAINT coach_players_userid_fkey;
       public       postgres    false    1948    169    151            �           2606    24594    eventklient_id_fkey    FK CONSTRAINT     n   ALTER TABLE ONLY events
    ADD CONSTRAINT eventklient_id_fkey FOREIGN KEY (klient_id) REFERENCES klient(id);
 D   ALTER TABLE ONLY public.events DROP CONSTRAINT eventklient_id_fkey;
       public       postgres    false    1940    143    149            �           2606    24894    events_invitations_eventid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);
 \   ALTER TABLE ONLY public.events_invitations DROP CONSTRAINT events_invitations_eventid_fkey;
       public       postgres    false    1946    149    173            �           2606    24904     events_invitations_inviteby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_inviteby_fkey FOREIGN KEY (inviteby) REFERENCES users(uid);
 ]   ALTER TABLE ONLY public.events_invitations DROP CONSTRAINT events_invitations_inviteby_fkey;
       public       postgres    false    1948    173    151            �           2606    24899    events_invitations_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);
 [   ALTER TABLE ONLY public.events_invitations DROP CONSTRAINT events_invitations_userid_fkey;
       public       postgres    false    151    1948    173            �           2606    24825    events_owner_id_fkey    FK CONSTRAINT     n   ALTER TABLE ONLY events
    ADD CONSTRAINT events_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(uid);
 E   ALTER TABLE ONLY public.events DROP CONSTRAINT events_owner_id_fkey;
       public       postgres    false    151    1948    149            �           2606    16434    grupy_treningowe_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES klient(id);
 Y   ALTER TABLE ONLY public.grupy_treningowe DROP CONSTRAINT grupy_treningowe_owner_id_fkey;
       public       postgres    false    145    143    1940            �           2606    24758    msg_from_user_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(uid);
 C   ALTER TABLE ONLY public.msg DROP CONSTRAINT msg_from_user_id_fkey;
       public       postgres    false    163    1948    151            �           2606    24763    msg_to_user_id_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(uid);
 A   ALTER TABLE ONLY public.msg DROP CONSTRAINT msg_to_user_id_fkey;
       public       postgres    false    151    1948    163            �           2606    24820    photos_userid_fkey    FK CONSTRAINT     j   ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);
 C   ALTER TABLE ONLY public.photos DROP CONSTRAINT photos_userid_fkey;
       public       postgres    false    1948    167    151            �           2606    24701    usercalendars_calendarid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_calendarid_fkey FOREIGN KEY (calendarid) REFERENCES calendars(uid);
 U   ALTER TABLE ONLY public.usercalendars DROP CONSTRAINT usercalendars_calendarid_fkey;
       public       postgres    false    155    1952    157            �           2606    24696    usercalendars_userid_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);
 Q   ALTER TABLE ONLY public.usercalendars DROP CONSTRAINT usercalendars_userid_fkey;
       public       postgres    false    1948    157    151            �           2606    24743    usercontacts_contact_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES users(uid);
 S   ALTER TABLE ONLY public.usercontacts DROP CONSTRAINT usercontacts_contact_id_fkey;
       public       postgres    false    161    1948    151            �           2606    24738    usercontacts_user_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);
 P   ALTER TABLE ONLY public.usercontacts DROP CONSTRAINT usercontacts_user_id_fkey;
       public       postgres    false    161    151    1948            �           2606    24628    userevents_event_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);
 M   ALTER TABLE ONLY public.userevents DROP CONSTRAINT userevents_event_id_fkey;
       public       postgres    false    149    1946    153            �           2606    24623    userevents_user_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);
 L   ALTER TABLE ONLY public.userevents DROP CONSTRAINT userevents_user_id_fkey;
       public       postgres    false    1948    153    151            �   K  x����n1E{}�Jp�$��A�.;�H�������ȼ�P!lq��9���===?~{9��^��]�.����۟�ǻ���=<��]�_/����||>޵���7�?ND�/��2c���%�:�q�8�	�L��K�7�3�cT���T�m�p�B;Θ�&�&�	遙n��0��F���p�6�&�ۣ�k��h�q��� �D]\;vZ߃;��EQ�B�����*5����i�.����:p�R����&!��7	�t}	u��Cy|E���+�)$q�vb��=�E�\]l�!�;����kd"{���x/2%���6%����$���BB8�,%�o "۱�Md;&�E�c�]d&�Ev`�}h��B&!l�a�c��N#[�SB�">%�-ⵄ�H�=�5�I[$�2l�ن��m��َ����َ����ف�N���Tf'�Z*�w-uIܵ�k����]���}";q���N#)����9��95��FSd5� ��{u�,L���x�u�,^l�F
'��ȯp�fم-R����م�4iF��/4f��o4������A���>LT�      �   u   x���v
Q���WHN�I�KI,*V�(�L�Q�K�M�Q�,.(M��L�Ts�	uV�0�QP���RȆ��R�Q()*Mմ��$�8#�qQ���)���c4ǽ�� Q!)35=�<a �G�      �   
   x���          �   �   x��ӽ
�`��W��
�Г�Zqrp(H��RjAAT�3x��/��gJ��B�ɋ�f_J^�;��U}=��ջi;	����m\��i�����{�T}3��z{�$�u2w9�h�ta�l2]�_�	/�@��}`�$>���,y�� �2+�WXZAy��?c"&&�3��a�A$3"j�jY�\�&D�0�J�íD�0�Jԭ�[��~�*u      �      x��Koǖ����ӽ��F�:��Y��.����6h6��G2$e���OU�1�"K7��	�MȒꐒ���}N}��?��?�l������L�;�>>4y�}����M������o���}�ܽ{��?�6o�~���G�~ټ}3~��^5��q��>���{ռ��0=�r�f�L�e����g�W�럇w?�w����?M��zo�.�/<��O���a{?=<���߶C|���"������߿?s��0�x(4�8=<���onww�i���������6�������͇����w�Ϟ��ܽ������Ϳ�����_��j���w߽jn���7��5��W�8��kƻ��������������}��n_�Ҽ������.�F��Ǉ����м�{�~nҧ㋥O����&�/��U���׍w ��օƹ~~����s'O�?~{3��ĭ��[���9��xk�ð3z��_����?���2x�Ɵ~v��!=V�иH!)�O��M;�DZ�ͮ�Ѱ��b���|��+�?��~VAO�-@���3�:6�s����k�O���w��a~�a�L�y�޵�m����[���Io�c�\�qU�����1��:v9~����a�xtQ�5`}|8�X������? �<&{��M��g�Q�oe�`o�����u�LJA00�*8x��C����s�=Q� K�G��_���x��ym=�<�CD��)�*<z8�c���h��'K�Q0���g*�W�c���fX�_��X1�O����\:Mm���@H�Fo�<:�`��V��%��?>Zli���� )�utRDk�m6���m��1��6�l"_6��-n���W���>��˻a1Y������� DS|���$��qh��6�`��m������7�)}�p[e��l��O"!�#�I�vcB�mQ�b㰩l}]l��J��宖�wǍ��g��8�9�%�In�&7*T/���Y<)<��-�_\k������g� ��z�1|5��y���Ĉ����2̈��Q���i����$J��Yz�N���@��*f׊��3v��9Diq��T�f�X�G{�@i�U�YY�bv���f�������F��7��,,i�*�S��G�=���BvP(��$.`�fa�Ε틤�u�FB�9��)
�b|��As:����A�1>uSk��q�>Ln�/�~��?�@�w�|T�j!�S@�M�%c�LG�G��>b��E��s���@U��	dȀ��F�$����:uR>�GU!��q���3w �EteY��x�8J�G�!�]1����\�G)����K�~>�f���9�<'S�<^%���kT�ބ<z�2_ģ�u"D�~�Q:��$�`Jg���x6���v��P��u�,숈OY��`��v�{]<�8^%��/E�����m�aqd���;.?�bN�7�>)bdAS�����d2���F.�ض"a��_b�'�w��d�^�茚���-B�g�{�0p��(�,p7�r��I�(�����r,�cv��`��;HΙ�C��|�L��*f׊��� �%E��k�d#��ON2 1,�1 �!K8�*f׊��VӃ��ǨC�dy���f��&Uʰ'�b�����E����K`��������u`������d���z:b�y�JA�bv��Yn4�"].��<�B�̉
�~����A�k��+d�
��wL��)8q�h�.���wO��>��9��W��s����~A�zf׊�Yt�} v�	�c�'=��"B��(�{r�C��Y8��{w)�r��<Ň7v��E`�3��{���.x3�Y�$P1�V�(��ԣgS��jq����X��`3D�#t��(���JٵRn���v��{�J'�}n�X����:�v�o[[�ݶ�8Z�r���xz�Ҳ���yv$����:2�zO��S~�r�f�}�9�yVP��7K	(*�g��|ύ+��X�J� tr�ρ�́Eč�kC�[]<�4^%��O��������F/���bH~R�g���m[��ӦMm�h�´EPىm�s�V��g�cE��+
^^���`,͓��" 1z��Y���E�W��%�i>k��� l��gM�4=2�&���;V���e+T̮3p���0,_~G�f���8]xtR$(L$~k��i�S�P�z�sT� 㮶K~eha� �&���d1:]g\K��4G���Y(�Sd�̤���uu��E�C� AdR�oHt��� Z���>t�Q�q6�U��U�h{���u�u�p2�Q�� �I�5'�E�Vzu�J��°�VF71<R����³Mr��h>X�l�������KO|i��� ������J�q]d��̵ �bP��J
_���9e$��Z�k���ƫ��y���GC�f�� ,U4x�w=��aR~��X�<^%�>�<�:"T`�*|Ʈ�B[h�:��M�+=I�!jb�Ò��E�y��P{y�Y�T!Zb |�BYX�(e��LC���;�Q�N��*f׊�^ �UH��sO��iri��g���s��p�x^ӃWI#��81c ��\.˥[�d^.���^;G}�%���u����?]�}�L3[��|#SD�0�-�!���e �]�Bqm��҂�R�$�Ν���e8>�tM��Ӎ���`A�*ë�ܾ��ݐ~�Va\^�7������I��q�[���CK�(�mx��90ǎm�G[����.C����~�XV�K�n�g&?)�ńN'�v������v��<`�L:V��.��(�g�V¡*�w���+���c}��G��V�,�\��5�����w��#'B)�&�-��5�L��S�%�����
�k�L�攂PJ���2)�~��{�N�0@>Y��]+f��,%K�O`@io�Ӏ��O �@/��Z�8�H:Ӡ)�Aשuy��ȉ�9���K���-x���h>W	I��#�T��8w,G�"]-���j�EZH�i�tuqz����֟p�1l���M���BK#oZS�v��p���9}�Q����m)y��;���DWo�&)�L�x�u"��9uy�TY�"�`�����h�D�W��Kk1���Ŵ4�F�a���*�W�c�;�?��O��4�h���壓"k�n�������!��AH[�d�n�M5�_��t�ټx{y�(� �)K��l��dc��>O#�^ͥ0"��QW;��c����n��Qt�Z�D�t���;h�
1��y��7��������Q3ը�Qs�kv�^�\|H:c�3W|S��wұ!P���/W�^">J5����/���J)���K�d/���!"��j��k�l�D�:�D)�}�3�{��]�4�d�_�\8�m6������G_hz���Ҿ6�]��3Ҟ$�tB���/�z_�#UP�y�����SH+�����E4d���zo�{�f�m0+��8y)��{�ڔCgi<ןQ�j��*y�#��p����1��\pi{A
�Sd��Yf�Kg�Xx/���Gތ!%�c���ΐ���G���d�]'��!dþ%�j����}�i
gθ��ؒ����g��$�3�A�\8
Q4��S^PT(�E�\�r��wn�����#�,�\��5�h�S3 .�ْҝ��c�A�C�V~?#pw�b���]C���8pdA�皡�Yڀ��(z�/�N����/��U�^���+��Ϸw��N&0콤<��B�I8�i7r���Z"����6i�4�ߺ��U��O�� ����u���j,�O���ۡ`t���4��w��"L���2�51������r=�_�����M�@�5��Mil���4:[U�q�5�V��B�>Gk9X�V^���AZf[��&]�2E�5���8��Kn��`�D���G1�+f!��U5+m��9ɦ}|8�@���)���E�jA�N��4*��@ƀa��y9I�S	B�N)��%����FQ�H��xv�K^� ��!�l����J8_z���� <�"/T�G;�pQf����馷��e�`����� Qeg��@��*y�|�̉cI�&��uf��dO��s����g���X���U���[��� �  E[M�Ŗ'd|������gk�� ��&߀V�c5f~	�0��y�h����3=��Ӷ�����4�o���i���f��3K���f����֟%e��t
�ciJ|��
�kŌ�PS�B L-�>��ߖJ}�01`Hs�5�� �,P����1�$
RZZ��]���r0�q�?q3a��]�<^%��� Q�b`!�������dP>.$��/�~D���?�ele���U�(y�� #9�h�ã��� m.u�;�;6Q�.	T��G8�x����z0[')�W)��ӽ] �������<�9��$�x&ZkgA��w�я���*�S2�g�賕W��J�uҘG3���x/���uh,D3�gl����F� �S�<^%����aA�ZG7�yZ���Pa���^r�vٳ�����惒�E<T|	���#�b�����J*��A$)-/M$�ab������ٵr�y).DX�0� �)�B�ׅ�Z���{d]Z�!����*eWKY^���)V��vކ�w�6�IWw�R>IY��]+fr�,��W����Hi9$���zp���\�L,/�*g��q&P���FvƝ1%��|�U���`y3�\�.hV�^"��ǚ.���5�A����h����ܴɶ'��`T��_�\��]-gy��!���͋��7������E~��X������U>��
ٵB�y���p����3,�}�y[���p��Z�YI���}���i�!      �   �   x���=�0��_q�
)�b�J�B�Pm�bk�j*�߷�X�)G<䎗kڮ��д�Ԣ���^&3��gH���{[|f���{�_�q0��l���x��$��D9��r�q'ʘr.�C�l�f^��j�ՒV�^�h�ҫ��lXA��o:wO�� q~�?�[�!BH��0ޕ��Fjh�J��R��bN�ZϹ�v�,�F��%�      �   
   x���          �   x   x���v
Q���WH/*-��/)J���K�/OU��L�Q�/�K-�����u�SKR5�}B]�4u�H�����X�0204�5��54S״���|#��9����@��d (�8�      �   �   x���v
Q���W���L�+Q��L�Q���L�Q�K�*�,���QH�M���Q��O���QHNI,J$���h*�9���+h�(�����c�A����������!����i��I]W�II,NQG��(�#,h�c�5�`�c�P�n3 �n�      �   
   x���          �   ~   x��A�0 ��~Ż�����{�N<� �����g��"��m[�;�mw��1os�4�������	1�G����gp96}�B�~RR2��3yn���ּgE�Xi��$v��s�'�`���B�/�� �      �   M   x���v
Q���W(��/����T��L�Q�K�*O�Ts�	uV�0400�QP.I̫T�J,(�/�J�S״��� ���      �   ]   x���v
Q���W(-N-JN�I�KI,*V�(�L���h�8��_��Z���������a��`�� "5��<�b��H#ji6�b$ pL�      �   L   x���v
Q���W(-N-J��+IL.)V�(�L�ŃPq [S!��'�5XA�PG��4��<)0�l�)�.. ��+5      �   �  x��[�k#g�篘�w�k�������!���b6�b��ű�����&N˧[�=y�@�����$�����_�v׷_�NO�a�g������rz���azwzz:nv���t����i;��mXv���a{~8���s�����e�m��ߏ�q���������/݇��`�Ѳ�ݢ_������?����ܜ��B��a76]~����i������7Lq�%ʲ�-t�F诿;N�9M���%X��V�K�!�:_.��"m��q�)n��?�`����	�2�����?N�hH/-�x)"�k,�9��6�d z���S��%�c�®� &���������h���(�T��bR���1�3Ӕ)v�Bmg=9ZG˵�ʗ3`�#�&G̿�z��N�	��� >��;��v0z�i�m�CzD��.�P�h��&c���,��AH>��F;�hէ]�h��̜R�Ҏ}`�S��/A���)��
���i���ǗŻ���wbg'=��@��q��>��� B�"��.����"���fr� ��ȋ� &��I��#�E�:�\9��u!P�v��d�Bh*}�o�~�\�B͠���{�v�@���G4����ԮTL�0�ѣ�͕� ���G�*=�9����ѮbR�#�����^�JMa����� 2�L����F�P)�#�G�u,m�P
~$Sa���KS�02�$?\�`aJ�L���#��2�06~$?\�`eJ)���d�;=x��d؄{���b�36�a��(X�q
�aS2�KN�d�H��ӣ`��HFLȰwz�c8��sz��0I��Ĕ�x�G�.IR(1���(�I�2�k0� d��Q�ӣ`&)�QMɈwz��$��Q#H�N��Q�d H5���q�}�"L��;=&a���T�z����TS�05�T��8�i�Ta�K_� ª�z���$LS�c5V�>R��uM�ªd�.U�QX�@��DX�.U��ޚA�Y�/�k&��-F������Pɠ�/g������bĢ�&��e s��$W�AeR��$��K1(NJQ�<��bP���B��.��R�3�)�.�`dXJ��=g�b���a)�뜂en�����K*ɠ\����L�b$��ܒ�q&�%�B몵%�m����Ж�ڒ�������hK�ڒ������fhK��R�mI�m{Mі�ĺ��u�o��+�f�����aq�����զ$      �   q  x�ݚ�n�0��y���J��P�n��X)���7�%^�$����^i�0�����9R$�#Χc��_O��"O_����W;��.���0&O�d,�&,֬��V�`ճ0��4rM&27�U���!���r0��p|N�G����ASl��E4/���o�m7n����d�ވ�Ms%ׯJº\hcE�i�����⮨�"���K���ȝ���@���y&e��y��ME��sE�H[�Rg�$�@7��~����
!N����[�$�@��v��0mW@��Q=%Jzg�A���Jm޺~��ޏ�(b�긪>�D�_�H�����̵C�TI��*�
�b�No�D�TݢH-�mWize��wt�����W�f��Si���>�
�������hf�k2B���a$b�s�9F�K%�[Ti��-<D����Q�H�a�'��T0�c�s���&c$�0Kc�6[i
נtz�K���
��Gm�S��Ճ���O3����\�E+�bmjA�PJ���t1N1�b]ZI�QK��Ť��)%]l@+��-JIo�J�x�j�����szI�RL�x�V��o�&]�O)���IW�E0�
᡺�ٺ��Fp*W�+���Qh�d      �   �   x���v
Q���W(O,*�/N�T��L�Q�K�*O�Q(��/��̎�L�Ts�	uV�0�QP8��hSnbQbI~������5�'Yf���J,(�/�J��LU�JL�NN-(�/O�K�m``@��Fh��'W�f�fiMF2�� �%T�      �   
   x���         
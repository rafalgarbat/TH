--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.22
-- Dumped by pg_dump version 9.0.22
-- Started on 2015-12-18 13:46:43

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 518 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 176 (class 1255 OID 24748)
-- Dependencies: 518 5
-- Name: totalrecords(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION totalrecords() RETURNS integer
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


ALTER FUNCTION public.totalrecords() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 142 (class 1259 OID 16392)
-- Dependencies: 5
-- Name: a; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE a (
);


ALTER TABLE public.a OWNER TO postgres;

--
-- TOC entry 160 (class 1259 OID 24714)
-- Dependencies: 5
-- Name: calendarevents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calendarevents (
    uid integer NOT NULL,
    calenarid integer,
    eventid integer
);


ALTER TABLE public.calendarevents OWNER TO postgres;

--
-- TOC entry 159 (class 1259 OID 24712)
-- Dependencies: 5 160
-- Name: calendarevents_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE calendarevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendarevents_uid_seq OWNER TO postgres;

--
-- TOC entry 1933 (class 0 OID 0)
-- Dependencies: 159
-- Name: calendarevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendarevents_uid_seq OWNED BY calendarevents.uid;


--
-- TOC entry 1934 (class 0 OID 0)
-- Dependencies: 159
-- Name: calendarevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendarevents_uid_seq', 1, false);


--
-- TOC entry 156 (class 1259 OID 24650)
-- Dependencies: 1876 5
-- Name: calendars; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calendars (
    uid integer NOT NULL,
    name text,
    ispublic boolean DEFAULT true
);


ALTER TABLE public.calendars OWNER TO postgres;

--
-- TOC entry 155 (class 1259 OID 24648)
-- Dependencies: 5 156
-- Name: calendars_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE calendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendars_uid_seq OWNER TO postgres;

--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 155
-- Name: calendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendars_uid_seq OWNED BY calendars.uid;


--
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 155
-- Name: calendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendars_uid_seq', 3, true);


--
-- TOC entry 150 (class 1259 OID 24581)
-- Dependencies: 1863 1864 1865 1866 5
-- Name: events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events (
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
    rating numeric(5,2)
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 149 (class 1259 OID 24579)
-- Dependencies: 150 5
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 149
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 149
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 83, true);


--
-- TOC entry 146 (class 1259 OID 16424)
-- Dependencies: 1855 5
-- Name: grupy_treningowe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupy_treningowe (
    id integer NOT NULL,
    owner_id integer,
    nazwa text,
    cdate date DEFAULT now()
);


ALTER TABLE public.grupy_treningowe OWNER TO postgres;

--
-- TOC entry 145 (class 1259 OID 16422)
-- Dependencies: 146 5
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupy_treningowe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupy_treningowe_id_seq OWNER TO postgres;

--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 145
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupy_treningowe_id_seq OWNED BY grupy_treningowe.id;


--
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 145
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupy_treningowe_id_seq', 1, true);


--
-- TOC entry 144 (class 1259 OID 16412)
-- Dependencies: 1853 5
-- Name: klient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE klient (
    id integer NOT NULL,
    imie text,
    nazwisko text,
    email text,
    login text,
    cdate date DEFAULT now(),
    password text
);


ALTER TABLE public.klient OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 16410)
-- Dependencies: 5 144
-- Name: klient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE klient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klient_id_seq OWNER TO postgres;

--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 143
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE klient_id_seq OWNED BY klient.id;


--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 143
-- Name: klient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('klient_id_seq', 3, true);


--
-- TOC entry 164 (class 1259 OID 24751)
-- Dependencies: 1881 5
-- Name: msg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE msg (
    uid integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    stan integer DEFAULT 0
);


ALTER TABLE public.msg OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 24749)
-- Dependencies: 164 5
-- Name: msg_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE msg_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msg_uid_seq OWNER TO postgres;

--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 163
-- Name: msg_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE msg_uid_seq OWNED BY msg.uid;


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 163
-- Name: msg_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('msg_uid_seq', 1, false);


--
-- TOC entry 158 (class 1259 OID 24690)
-- Dependencies: 5
-- Name: usercalendars; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usercalendars (
    uid integer NOT NULL,
    userid integer,
    calendarid integer
);


ALTER TABLE public.usercalendars OWNER TO postgres;

--
-- TOC entry 157 (class 1259 OID 24688)
-- Dependencies: 5 158
-- Name: usercalendars_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usercalendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usercalendars_uid_seq OWNER TO postgres;

--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 157
-- Name: usercalendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercalendars_uid_seq OWNED BY usercalendars.uid;


--
-- TOC entry 1946 (class 0 OID 0)
-- Dependencies: 157
-- Name: usercalendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usercalendars_uid_seq', 3, true);


--
-- TOC entry 162 (class 1259 OID 24732)
-- Dependencies: 5
-- Name: usercontacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usercontacts (
    uid integer NOT NULL,
    user_id integer,
    contact_id integer
);


ALTER TABLE public.usercontacts OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 24730)
-- Dependencies: 162 5
-- Name: usercontacts_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usercontacts_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usercontacts_uid_seq OWNER TO postgres;

--
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 161
-- Name: usercontacts_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercontacts_uid_seq OWNED BY usercontacts.uid;


--
-- TOC entry 1948 (class 0 OID 0)
-- Dependencies: 161
-- Name: usercontacts_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usercontacts_uid_seq', 2, true);


--
-- TOC entry 154 (class 1259 OID 24616)
-- Dependencies: 1873 1874 5
-- Name: userevents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE userevents (
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


ALTER TABLE public.userevents OWNER TO postgres;

--
-- TOC entry 153 (class 1259 OID 24614)
-- Dependencies: 5 154
-- Name: userevents_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userevents_uid_seq OWNER TO postgres;

--
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 153
-- Name: userevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userevents_uid_seq OWNED BY userevents.uid;


--
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 153
-- Name: userevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userevents_uid_seq', 85, true);


--
-- TOC entry 152 (class 1259 OID 24601)
-- Dependencies: 1868 1869 1870 1871 5
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
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


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 151 (class 1259 OID 24599)
-- Dependencies: 152 5
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO postgres;

--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 151
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- TOC entry 1952 (class 0 OID 0)
-- Dependencies: 151
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_uid_seq', 50, true);


--
-- TOC entry 148 (class 1259 OID 16470)
-- Dependencies: 1857 1858 1859 1860 1861 5
-- Name: workouts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE workouts (
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


ALTER TABLE public.workouts OWNER TO postgres;

--
-- TOC entry 147 (class 1259 OID 16468)
-- Dependencies: 5 148
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workouts_id_seq OWNER TO postgres;

--
-- TOC entry 1953 (class 0 OID 0)
-- Dependencies: 147
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;


--
-- TOC entry 1954 (class 0 OID 0)
-- Dependencies: 147
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workouts_id_seq', 1, false);


--
-- TOC entry 1878 (class 2604 OID 24717)
-- Dependencies: 160 159 160
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents ALTER COLUMN uid SET DEFAULT nextval('calendarevents_uid_seq'::regclass);


--
-- TOC entry 1875 (class 2604 OID 24653)
-- Dependencies: 156 155 156
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendars ALTER COLUMN uid SET DEFAULT nextval('calendars_uid_seq'::regclass);


--
-- TOC entry 1862 (class 2604 OID 24584)
-- Dependencies: 150 149 150
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 1854 (class 2604 OID 16427)
-- Dependencies: 145 146 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe ALTER COLUMN id SET DEFAULT nextval('grupy_treningowe_id_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 16415)
-- Dependencies: 143 144 144
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);


--
-- TOC entry 1880 (class 2604 OID 24754)
-- Dependencies: 163 164 164
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg ALTER COLUMN uid SET DEFAULT nextval('msg_uid_seq'::regclass);


--
-- TOC entry 1877 (class 2604 OID 24693)
-- Dependencies: 158 157 158
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars ALTER COLUMN uid SET DEFAULT nextval('usercalendars_uid_seq'::regclass);


--
-- TOC entry 1879 (class 2604 OID 24735)
-- Dependencies: 161 162 162
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts ALTER COLUMN uid SET DEFAULT nextval('usercontacts_uid_seq'::regclass);


--
-- TOC entry 1872 (class 2604 OID 24619)
-- Dependencies: 153 154 154
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents ALTER COLUMN uid SET DEFAULT nextval('userevents_uid_seq'::regclass);


--
-- TOC entry 1867 (class 2604 OID 24604)
-- Dependencies: 151 152 152
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 16473)
-- Dependencies: 148 147 148
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- TOC entry 1916 (class 0 OID 16392)
-- Dependencies: 142
-- Data for Name: a; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1925 (class 0 OID 24714)
-- Dependencies: 160
-- Data for Name: calendarevents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1923 (class 0 OID 24650)
-- Dependencies: 156
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO calendars (uid, name, ispublic) VALUES (1, 'Moj kalendarz', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (2, 'Zawody', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (3, 'Grupa biegowa', true);


--
-- TOC entry 1920 (class 0 OID 24581)
-- Dependencies: 150
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (3, NULL, 'jarek', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', NULL, NULL, '2015-10-13 00:00:00+02', '2015-10-13 00:00:00+02', NULL, 0, NULL, 'slowaas', '2c39b754-8285-4a5f-b63d-b3f7cd7f97d8', NULL, NULL, NULL, '1', 3.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (6, NULL, 'test1', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 1.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (9, NULL, 'test4', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 4.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (12, NULL, 'xxx-0.659255299251527', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-19 14:00:44.400252+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (15, NULL, 'xxx-0.535474963951856', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-27 03:36:22.75007+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (18, NULL, 'xxx-0.445188404992223', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-08 17:54:09.107818+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (21, NULL, 'xxx-0.580333274323493', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-17 20:55:27.389214+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (24, NULL, 'xxx-0.509583400096744', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-28 17:24:45.465073+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (27, NULL, 'xxx-0.2027323609218', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-21 03:32:08.822261+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (30, NULL, 'xxx-0.329291505273432', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-08 23:13:38.08129+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (33, NULL, 'xxx-0.960837166756392', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-20 00:10:47.87537+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (36, NULL, 'xxx-0.314244242850691', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-29 04:27:10.681227+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (39, NULL, 'xxx-0.2296202480793', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-01 22:05:04.91502+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (42, NULL, 'xxx-0.72325876634568', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-26 03:33:20.320801+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (4, NULL, '88234234', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', NULL, NULL, '2015-10-06 00:00:00+02', '2015-10-06 00:00:00+02', NULL, 0, '36.883707, 30.689216', NULL, '2f5367d2-19b3-47ae-95f1-d71389e9821c', NULL, NULL, 'tarnow', '2', 4.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (45, NULL, 'xxx-0.940193557646126', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-13 16:20:36.344889+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (48, NULL, 'xxx-0.685025437735021', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-07 05:22:14.388809+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (51, NULL, 'xxx-0.336068851407617', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-09 00:49:48.576478+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (54, NULL, 'xxx-0.640664588660002', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-28 19:07:25.991723+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (5, NULL, 'test', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '3', 0.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (57, NULL, 'xxx-0.310446752700955', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-28 06:43:17.924817+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (60, NULL, 'xxx-0.807492117397487', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-14 08:33:24.242045+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (10, NULL, 'test5', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, '6.879703, 30.706707', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 0.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (7, NULL, 'test2', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, '36.885233, 30.702323', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 2.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (8, NULL, 'test3', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-15 11:06:48.48+01', NULL, NULL, NULL, '36.879466, 30.667648', NULL, NULL, '2015-11-19', '2015-11-19', 'Poznan', '3', 3.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (11, NULL, 'xxx-0.24620196223259', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-11 09:40:00.609224+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (63, NULL, 'xxx-0.288677988573909', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-16 11:55:54.938183+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (66, NULL, 'xxx-0.783641666173935', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-28 18:17:59.416358+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (13, NULL, 'xxx-0.226665798574686', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-12 00:15:09.953768+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (16, NULL, 'xxx-0.305849601048976', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-10 19:22:38.606257+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (19, NULL, 'xxx-0.368662232998759', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-29 10:23:07.873794+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (22, NULL, 'xxx-0.386244779452682', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-15 06:57:20.94173+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (69, NULL, 'xxx-0.737796194851398', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-18 19:29:10.040199+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (72, NULL, 'xxx-0.284212389029562', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-13 03:02:26.578696+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (75, NULL, 'xxx-0.42068531177938', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-14 09:52:55.864323+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (78, NULL, 'xxx-0.820278588216752', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-31 00:04:49.4248+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (81, NULL, 'xxx-0.275586196221411', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-08 03:43:11.094009+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (67, NULL, 'xxx-0.338298373389989', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-01 08:50:32.800558+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (25, NULL, 'xxx-0.261144478339702', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-21 22:35:51.581118+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (28, NULL, 'xxx-0.670443715527654', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-17 03:19:40.38818+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (31, NULL, 'xxx-0.428170236758888', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-03 14:58:00.168225+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (34, NULL, 'xxx-0.674771611113101', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-27 16:14:51.793913+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (37, NULL, 'xxx-0.180605698376894', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-22 16:22:49.21838+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (40, NULL, 'xxx-0.563191657420248', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-05 12:03:54.41725+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (43, NULL, 'xxx-0.872099430300295', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-01-17 01:16:35.130638+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (46, NULL, 'xxx-0.0231418418698013', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-17 08:08:05.790656+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (49, NULL, 'xxx-0.934490186627954', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-19 19:47:43.561954+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (52, NULL, 'xxx-0.97491561435163', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-05 03:34:56.08732+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (55, NULL, 'xxx-0.363838663790375', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-20 22:52:40.154964+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (58, NULL, 'xxx-0.941158581059426', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-30 05:32:09.673554+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (61, NULL, 'xxx-0.196761534083635', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-15 23:36:55.146411+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (64, NULL, 'xxx-0.0189477275125682', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-12 19:57:58.958928+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (14, NULL, 'xxx-0.0679361037909985', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-23 12:50:10.63535+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (17, NULL, 'xxx-0.254051659721881', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-14 03:18:03.296713+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (20, NULL, 'xxx-0.0946216778829694', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-25 13:09:26.492609+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (23, NULL, 'xxx-0.383089780807495', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-21 22:32:16.764322+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (26, NULL, 'xxx-0.219180395826697', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-25 20:30:40.341413+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (29, NULL, 'xxx-0.248506226576865', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-21 02:29:43.79925+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (32, NULL, 'xxx-0.00489101931452751', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-01 13:01:00.052245+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (35, NULL, 'xxx-0.851083796471357', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-10 10:38:30.781337+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (38, NULL, 'xxx-0.466950819361955', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-20 09:31:11.655023+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (41, NULL, 'xxx-0.645742905791849', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-14 03:31:07.838524+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (44, NULL, 'xxx-0.893281699158251', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-02 22:01:48.745829+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (47, NULL, 'xxx-0.0939085995778441', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-19 21:01:10.919769+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (50, NULL, 'xxx-0.0754857268184423', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-16 10:02:50.06791+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (53, NULL, 'xxx-0.0789930713362992', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-23 03:04:12.918775+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (56, NULL, 'xxx-0.171362498775125', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-22 00:42:43.302324+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (59, NULL, 'xxx-0.49985284358263', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-02 08:10:24.52501+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (62, NULL, 'xxx-0.941751613747329', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-06-10 01:36:54.671921+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (65, NULL, 'xxx-0.215436223894358', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-22 22:33:18.998354+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (70, NULL, 'xxx-0.216366234235466', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-06 03:43:08.303396+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (73, NULL, 'xxx-0.374228642322123', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-16 11:19:02.578692+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (76, NULL, 'xxx-0.958993563894182', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-16 13:45:20.056976+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (79, NULL, 'xxx-0.0790220373310149', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-02 05:15:56.592411+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (82, NULL, 'xxx-0.344180000014603', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-03 16:20:27.646845+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (68, NULL, 'xxx-0.541280710604042', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-05 13:06:54.486366+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (71, NULL, 'xxx-0.338928994722664', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-09 19:50:18.551914+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (74, NULL, 'xxx-0.0872658058069646', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-05 23:23:41.660357+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (77, NULL, 'xxx-0.824854738544673', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-27 09:37:15.1909+02', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (80, NULL, 'xxx-0.81028389884159', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-28 06:47:51.386531+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (83, NULL, 'xxx-0.870486147236079', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-25 06:58:49.552766+01', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL);


--
-- TOC entry 1918 (class 0 OID 16424)
-- Dependencies: 146
-- Data for Name: grupy_treningowe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (1, 1, '42423', '2015-09-16');
INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (2, 1, 'lalalala', '2015-10-18');


--
-- TOC entry 1917 (class 0 OID 16412)
-- Dependencies: 144
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (1, '5345', '5345', '5345', '534', '2015-09-01', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (2, 'dasd', 'dasd', 'das', 'das', '2015-09-08', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (3, 'aaaaaa', 'aaaaa', '', '', NULL, NULL);


--
-- TOC entry 1927 (class 0 OID 24751)
-- Dependencies: 164
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1924 (class 0 OID 24690)
-- Dependencies: 158
-- Data for Name: usercalendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercalendars (uid, userid, calendarid) VALUES (1, 2, 1);
INSERT INTO usercalendars (uid, userid, calendarid) VALUES (2, 2, 2);
INSERT INTO usercalendars (uid, userid, calendarid) VALUES (3, 2, 3);


--
-- TOC entry 1926 (class 0 OID 24732)
-- Dependencies: 162
-- Data for Name: usercontacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (1, 2, 2);
INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (2, 2, 5);


--
-- TOC entry 1922 (class 0 OID 24616)
-- Dependencies: 154
-- Data for Name: userevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (1, 2, 4, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (2, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (4, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (7, 2, 8, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (8, 2, 3, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (10, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (13, 2, 11, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (14, 2, 12, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (16, 2, 14, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (17, 2, 15, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (19, 2, 17, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (20, 2, 18, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (22, 2, 20, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (23, 2, 21, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (25, 2, 23, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (26, 2, 24, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (28, 2, 26, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (29, 2, 27, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (31, 2, 29, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (32, 2, 30, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (34, 2, 32, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (35, 2, 33, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (37, 2, 35, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (38, 2, 36, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (40, 2, 38, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (41, 2, 39, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (43, 2, 41, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (44, 2, 42, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (46, 2, 44, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (47, 2, 45, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (49, 2, 47, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (50, 2, 48, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (52, 2, 50, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (53, 2, 51, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (55, 2, 53, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (56, 2, 54, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (58, 2, 56, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (59, 2, 57, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (61, 2, 59, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (62, 2, 60, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (64, 2, 62, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (65, 2, 63, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (67, 2, 65, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (68, 2, 66, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (70, 2, 68, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (71, 2, 69, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (73, 2, 71, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (74, 2, 72, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (76, 2, 74, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (77, 2, 75, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (79, 2, 77, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (80, 2, 78, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (82, 2, 80, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (83, 2, 81, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (85, 2, 83, 0, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (3, 2, 6, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (6, 2, 9, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (9, 2, 8, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (12, 2, 7, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (15, 2, 13, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (18, 2, 16, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (21, 2, 19, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (24, 2, 22, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (27, 2, 25, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (30, 2, 28, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (33, 2, 31, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (36, 2, 34, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (39, 2, 37, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (42, 2, 40, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (45, 2, 43, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (48, 2, 46, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (51, 2, 49, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (54, 2, 52, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (57, 2, 55, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (60, 2, 58, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (63, 2, 61, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (66, 2, 64, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (69, 2, 67, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (72, 2, 70, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (75, 2, 73, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (78, 2, 76, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (81, 2, 79, 1, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (84, 2, 82, 1, NULL, NULL, NULL, NULL, NULL, false);


--
-- TOC entry 1921 (class 0 OID 24601)
-- Dependencies: 152
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (2, 'ala', 'ala', 'ala', 1, NULL, 'ala', 'ala', 50, 1, 1, 1);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (3, 'alicja', 'alicja', 'alicja@wp.pl', 1, NULL, 'mazowieckie', 'warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (4, 'Jan', 'pass', 'Jan@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (5, 'Stanisław', 'pass', 'Stanisław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (6, 'Andrzej', 'pass', 'Andrzej@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (7, 'Józef', 'pass', 'Józef@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (8, 'Tadeusz', 'pass', 'Tadeusz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (9, 'Jerzy', 'pass', 'Jerzy@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (10, 'Zbigniew', 'pass', 'Zbigniew@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (11, 'Krzysztof', 'pass', 'Krzysztof@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (12, 'Henryk', 'pass', 'Henryk@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (13, 'Ryszard', 'pass', 'Ryszard@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (14, 'Kazimierz', 'pass', 'Kazimierz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (15, 'Marek', 'pass', 'Marek@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (16, 'Marian', 'pass', 'Marian@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (17, 'Piotr', 'pass', 'Piotr@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (18, 'Janusz', 'pass', 'Janusz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (19, 'Władysław', 'pass', 'Władysław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (20, 'Adam', 'pass', 'Adam@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (21, 'Wiesław', 'pass', 'Wiesław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (22, 'Zdzisław', 'pass', 'Zdzisław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (23, 'Edward', 'pass', 'Edward@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (24, 'Mieczysław', 'pass', 'Mieczysław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (25, 'Roman', 'pass', 'Roman@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (26, 'Mirosław', 'pass', 'Mirosław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (27, 'Grzegorz', 'pass', 'Grzegorz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (28, 'Stanisław', 'pass', 'Stanisław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (29, 'Andrzej', 'pass', 'Andrzej@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (30, 'Józef', 'pass', 'Józef@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (31, 'Tadeusz', 'pass', 'Tadeusz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (32, 'Jerzy', 'pass', 'Jerzy@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (33, 'Zbigniew', 'pass', 'Zbigniew@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (34, 'Krzysztof', 'pass', 'Krzysztof@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (35, 'Henryk', 'pass', 'Henryk@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (36, 'Ryszard', 'pass', 'Ryszard@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (37, 'Kazimierz', 'pass', 'Kazimierz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (38, 'Marek', 'pass', 'Marek@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (39, 'Marian', 'pass', 'Marian@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (40, 'Piotr', 'pass', 'Piotr@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (41, 'Janusz', 'pass', 'Janusz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (42, 'Władysław', 'pass', 'Władysław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (43, 'Adam', 'pass', 'Adam@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (44, 'Wiesław', 'pass', 'Wiesław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (45, 'Zdzisław', 'pass', 'Zdzisław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (46, 'Edward', 'pass', 'Edward@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (47, 'Mieczysław', 'pass', 'Mieczysław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (48, 'Roman', 'pass', 'Roman@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (49, 'Mirosław', 'pass', 'Mirosław@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (50, 'Grzegorz', 'pass', 'Grzegorz@wp.pl', 1, NULL, 'Mazowieckie', 'Warszawa', 0, 0, 0, 0);


--
-- TOC entry 1919 (class 0 OID 16470)
-- Dependencies: 148
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1899 (class 2606 OID 24719)
-- Dependencies: 160 160
-- Name: calendarevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1895 (class 2606 OID 24659)
-- Dependencies: 156 156
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1889 (class 2606 OID 24593)
-- Dependencies: 150 150
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 1885 (class 2606 OID 16433)
-- Dependencies: 146 146
-- Name: grupy_treningowe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_pkey PRIMARY KEY (id);


--
-- TOC entry 1883 (class 2606 OID 16421)
-- Dependencies: 144 144
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- TOC entry 1903 (class 2606 OID 24757)
-- Dependencies: 164 164
-- Name: msg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (uid);


--
-- TOC entry 1897 (class 2606 OID 24695)
-- Dependencies: 158 158
-- Name: usercalendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1901 (class 2606 OID 24737)
-- Dependencies: 162 162
-- Name: usercontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_pkey PRIMARY KEY (uid);


--
-- TOC entry 1893 (class 2606 OID 24622)
-- Dependencies: 154 154
-- Name: userevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1891 (class 2606 OID 24613)
-- Dependencies: 152 152
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 1887 (class 2606 OID 16483)
-- Dependencies: 148 148
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- TOC entry 1910 (class 2606 OID 24720)
-- Dependencies: 160 156 1894
-- Name: calendarevents_calenarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_calenarid_fkey FOREIGN KEY (calenarid) REFERENCES calendars(uid);


--
-- TOC entry 1911 (class 2606 OID 24725)
-- Dependencies: 160 150 1888
-- Name: calendarevents_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);


--
-- TOC entry 1905 (class 2606 OID 24594)
-- Dependencies: 1882 150 144
-- Name: eventklient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT eventklient_id_fkey FOREIGN KEY (klient_id) REFERENCES klient(id);


--
-- TOC entry 1904 (class 2606 OID 16434)
-- Dependencies: 1882 144 146
-- Name: grupy_treningowe_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES klient(id);


--
-- TOC entry 1914 (class 2606 OID 24758)
-- Dependencies: 1890 152 164
-- Name: msg_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(uid);


--
-- TOC entry 1915 (class 2606 OID 24763)
-- Dependencies: 164 152 1890
-- Name: msg_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(uid);


--
-- TOC entry 1909 (class 2606 OID 24701)
-- Dependencies: 156 158 1894
-- Name: usercalendars_calendarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_calendarid_fkey FOREIGN KEY (calendarid) REFERENCES calendars(uid);


--
-- TOC entry 1908 (class 2606 OID 24696)
-- Dependencies: 1890 152 158
-- Name: usercalendars_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1913 (class 2606 OID 24743)
-- Dependencies: 152 162 1890
-- Name: usercontacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES users(uid);


--
-- TOC entry 1912 (class 2606 OID 24738)
-- Dependencies: 152 162 1890
-- Name: usercontacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1907 (class 2606 OID 24628)
-- Dependencies: 1888 154 150
-- Name: userevents_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);


--
-- TOC entry 1906 (class 2606 OID 24623)
-- Dependencies: 154 1890 152
-- Name: userevents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1932 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-12-18 13:46:44

--
-- PostgreSQL database dump complete
--


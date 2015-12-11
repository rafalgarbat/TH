--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.22
-- Dumped by pg_dump version 9.0.22
-- Started on 2015-12-11 12:15:15

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 517 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 176 (class 1255 OID 24748)
-- Dependencies: 5 517
-- Name: totalrecords(); Type: FUNCTION; Schema: public; Owner: -
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


SET default_with_oids = false;

--
-- TOC entry 142 (class 1259 OID 16392)
-- Dependencies: 5
-- Name: a; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE a (
);


--
-- TOC entry 160 (class 1259 OID 24714)
-- Dependencies: 5
-- Name: calendarevents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE calendarevents (
    uid integer NOT NULL,
    calenarid integer,
    eventid integer
);


--
-- TOC entry 159 (class 1259 OID 24712)
-- Dependencies: 5 160
-- Name: calendarevents_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calendarevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1930 (class 0 OID 0)
-- Dependencies: 159
-- Name: calendarevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE calendarevents_uid_seq OWNED BY calendarevents.uid;


--
-- TOC entry 1931 (class 0 OID 0)
-- Dependencies: 159
-- Name: calendarevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('calendarevents_uid_seq', 1, false);


--
-- TOC entry 156 (class 1259 OID 24650)
-- Dependencies: 1874 5
-- Name: calendars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE calendars (
    uid integer NOT NULL,
    name text,
    ispublic boolean DEFAULT true
);


--
-- TOC entry 155 (class 1259 OID 24648)
-- Dependencies: 5 156
-- Name: calendars_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1932 (class 0 OID 0)
-- Dependencies: 155
-- Name: calendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE calendars_uid_seq OWNED BY calendars.uid;


--
-- TOC entry 1933 (class 0 OID 0)
-- Dependencies: 155
-- Name: calendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('calendars_uid_seq', 3, true);


--
-- TOC entry 150 (class 1259 OID 24581)
-- Dependencies: 1862 1863 1864 1865 5
-- Name: events; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 149 (class 1259 OID 24579)
-- Dependencies: 150 5
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1934 (class 0 OID 0)
-- Dependencies: 149
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 149
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_id_seq', 10, true);


--
-- TOC entry 146 (class 1259 OID 16424)
-- Dependencies: 1854 5
-- Name: grupy_treningowe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE grupy_treningowe (
    id integer NOT NULL,
    owner_id integer,
    nazwa text,
    cdate date DEFAULT now()
);


--
-- TOC entry 145 (class 1259 OID 16422)
-- Dependencies: 146 5
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupy_treningowe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 145
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupy_treningowe_id_seq OWNED BY grupy_treningowe.id;


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 145
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('grupy_treningowe_id_seq', 1, true);


--
-- TOC entry 144 (class 1259 OID 16412)
-- Dependencies: 1852 5
-- Name: klient; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 143 (class 1259 OID 16410)
-- Dependencies: 5 144
-- Name: klient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE klient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 143
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE klient_id_seq OWNED BY klient.id;


--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 143
-- Name: klient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('klient_id_seq', 3, true);


--
-- TOC entry 164 (class 1259 OID 24751)
-- Dependencies: 1879 5
-- Name: msg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE msg (
    uid integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    stan integer DEFAULT 0
);


--
-- TOC entry 163 (class 1259 OID 24749)
-- Dependencies: 5 164
-- Name: msg_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE msg_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 163
-- Name: msg_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE msg_uid_seq OWNED BY msg.uid;


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 163
-- Name: msg_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('msg_uid_seq', 1, false);


--
-- TOC entry 158 (class 1259 OID 24690)
-- Dependencies: 5
-- Name: usercalendars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usercalendars (
    uid integer NOT NULL,
    userid integer,
    calendarid integer
);


--
-- TOC entry 157 (class 1259 OID 24688)
-- Dependencies: 158 5
-- Name: usercalendars_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usercalendars_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 157
-- Name: usercalendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usercalendars_uid_seq OWNED BY usercalendars.uid;


--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 157
-- Name: usercalendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usercalendars_uid_seq', 3, true);


--
-- TOC entry 162 (class 1259 OID 24732)
-- Dependencies: 5
-- Name: usercontacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usercontacts (
    uid integer NOT NULL,
    user_id integer,
    contact_id integer
);


--
-- TOC entry 161 (class 1259 OID 24730)
-- Dependencies: 162 5
-- Name: usercontacts_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usercontacts_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 161
-- Name: usercontacts_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usercontacts_uid_seq OWNED BY usercontacts.uid;


--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 161
-- Name: usercontacts_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usercontacts_uid_seq', 1, true);


--
-- TOC entry 154 (class 1259 OID 24616)
-- Dependencies: 1872 5
-- Name: userevents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE userevents (
    uid integer NOT NULL,
    user_id integer,
    event_id integer,
    stan integer DEFAULT 0
);


--
-- TOC entry 153 (class 1259 OID 24614)
-- Dependencies: 154 5
-- Name: userevents_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE userevents_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1946 (class 0 OID 0)
-- Dependencies: 153
-- Name: userevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE userevents_uid_seq OWNED BY userevents.uid;


--
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 153
-- Name: userevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('userevents_uid_seq', 11, true);


--
-- TOC entry 152 (class 1259 OID 24601)
-- Dependencies: 1867 1868 1869 1870 5
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 151 (class 1259 OID 24599)
-- Dependencies: 152 5
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1948 (class 0 OID 0)
-- Dependencies: 151
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 151
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_uid_seq', 50, true);


--
-- TOC entry 148 (class 1259 OID 16470)
-- Dependencies: 1856 1857 1858 1859 1860 5
-- Name: workouts; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 147 (class 1259 OID 16468)
-- Dependencies: 148 5
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 147
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 147
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workouts_id_seq', 1, false);


--
-- TOC entry 1876 (class 2604 OID 24717)
-- Dependencies: 159 160 160
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendarevents ALTER COLUMN uid SET DEFAULT nextval('calendarevents_uid_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 24653)
-- Dependencies: 156 155 156
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendars ALTER COLUMN uid SET DEFAULT nextval('calendars_uid_seq'::regclass);


--
-- TOC entry 1861 (class 2604 OID 24584)
-- Dependencies: 149 150 150
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 1853 (class 2604 OID 16427)
-- Dependencies: 145 146 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupy_treningowe ALTER COLUMN id SET DEFAULT nextval('grupy_treningowe_id_seq'::regclass);


--
-- TOC entry 1851 (class 2604 OID 16415)
-- Dependencies: 144 143 144
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);


--
-- TOC entry 1878 (class 2604 OID 24754)
-- Dependencies: 164 163 164
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY msg ALTER COLUMN uid SET DEFAULT nextval('msg_uid_seq'::regclass);


--
-- TOC entry 1875 (class 2604 OID 24693)
-- Dependencies: 158 157 158
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercalendars ALTER COLUMN uid SET DEFAULT nextval('usercalendars_uid_seq'::regclass);


--
-- TOC entry 1877 (class 2604 OID 24735)
-- Dependencies: 161 162 162
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercontacts ALTER COLUMN uid SET DEFAULT nextval('usercontacts_uid_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 24619)
-- Dependencies: 154 153 154
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY userevents ALTER COLUMN uid SET DEFAULT nextval('userevents_uid_seq'::regclass);


--
-- TOC entry 1866 (class 2604 OID 24604)
-- Dependencies: 151 152 152
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- TOC entry 1855 (class 2604 OID 16473)
-- Dependencies: 147 148 148
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- TOC entry 1914 (class 0 OID 16392)
-- Dependencies: 142
-- Data for Name: a; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1923 (class 0 OID 24714)
-- Dependencies: 160
-- Data for Name: calendarevents; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1921 (class 0 OID 24650)
-- Dependencies: 156
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO calendars (uid, name, ispublic) VALUES (1, 'Moj kalendarz', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (2, 'Zawody', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (3, 'Grupa biegowa', true);


--
-- TOC entry 1918 (class 0 OID 24581)
-- Dependencies: 150
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (3, NULL, 'jarek', 'opissas', NULL, NULL, '2015-10-13 00:00:00+02', '2015-10-13 00:00:00+02', NULL, 0, NULL, 'slowaas', '2c39b754-8285-4a5f-b63d-b3f7cd7f97d8', NULL, NULL, NULL, NULL, 3.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (5, NULL, 'test', NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, NULL, 0.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (6, NULL, 'test1', NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, NULL, 1.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (9, NULL, 'test4', NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, NULL, 4.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (8, NULL, 'test3', NULL, false, true, NULL, NULL, NULL, NULL, '36.879466, 30.667648', NULL, NULL, '2015-11-19', '2015-11-19', 'Poznan', NULL, 3.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (4, NULL, '88234234', NULL, NULL, NULL, '2015-10-06 00:00:00+02', '2015-10-06 00:00:00+02', NULL, 0, '36.883707, 30.689216', NULL, '2f5367d2-19b3-47ae-95f1-d71389e9821c', NULL, NULL, 'tarnow', NULL, 4.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (10, NULL, 'test5', NULL, false, true, NULL, NULL, NULL, NULL, '6.879703, 30.706707', NULL, NULL, '2015-11-19', '2015-11-19', NULL, NULL, 0.00);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating) VALUES (7, NULL, 'test2', 'dasdl;ask asd ddasl;dklk ;dasd adasdas', false, true, NULL, NULL, NULL, NULL, '36.885233, 30.702323', NULL, NULL, '2015-11-19', '2015-11-19', NULL, NULL, 2.00);


--
-- TOC entry 1916 (class 0 OID 16424)
-- Dependencies: 146
-- Data for Name: grupy_treningowe; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (1, 1, '42423', '2015-09-16');
INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (2, 1, 'lalalala', '2015-10-18');


--
-- TOC entry 1915 (class 0 OID 16412)
-- Dependencies: 144
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (1, '5345', '5345', '5345', '534', '2015-09-01', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (2, 'dasd', 'dasd', 'das', 'das', '2015-09-08', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (3, 'aaaaaa', 'aaaaa', '', '', NULL, NULL);


--
-- TOC entry 1925 (class 0 OID 24751)
-- Dependencies: 164
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1922 (class 0 OID 24690)
-- Dependencies: 158
-- Data for Name: usercalendars; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO usercalendars (uid, userid, calendarid) VALUES (1, 2, 1);
INSERT INTO usercalendars (uid, userid, calendarid) VALUES (2, 2, 2);
INSERT INTO usercalendars (uid, userid, calendarid) VALUES (3, 2, 3);


--
-- TOC entry 1924 (class 0 OID 24732)
-- Dependencies: 162
-- Data for Name: usercontacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (1, 2, 2);


--
-- TOC entry 1920 (class 0 OID 24616)
-- Dependencies: 154
-- Data for Name: userevents; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (1, 2, 4, 0);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (2, 2, 5, NULL);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (3, 2, 6, NULL);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (4, 2, 10, NULL);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (6, 2, 9, 0);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (7, 2, 8, 0);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (8, 2, 3, 0);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (9, 2, 8, NULL);
INSERT INTO userevents (uid, user_id, event_id, stan) VALUES (10, 2, 3, NULL);


--
-- TOC entry 1919 (class 0 OID 24601)
-- Dependencies: 152
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
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
-- TOC entry 1917 (class 0 OID 16470)
-- Dependencies: 148
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1897 (class 2606 OID 24719)
-- Dependencies: 160 160
-- Name: calendarevents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1893 (class 2606 OID 24659)
-- Dependencies: 156 156
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1887 (class 2606 OID 24593)
-- Dependencies: 150 150
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 1883 (class 2606 OID 16433)
-- Dependencies: 146 146
-- Name: grupy_treningowe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_pkey PRIMARY KEY (id);


--
-- TOC entry 1881 (class 2606 OID 16421)
-- Dependencies: 144 144
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- TOC entry 1901 (class 2606 OID 24757)
-- Dependencies: 164 164
-- Name: msg_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (uid);


--
-- TOC entry 1895 (class 2606 OID 24695)
-- Dependencies: 158 158
-- Name: usercalendars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1899 (class 2606 OID 24737)
-- Dependencies: 162 162
-- Name: usercontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_pkey PRIMARY KEY (uid);


--
-- TOC entry 1891 (class 2606 OID 24622)
-- Dependencies: 154 154
-- Name: userevents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1889 (class 2606 OID 24613)
-- Dependencies: 152 152
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 1885 (class 2606 OID 16483)
-- Dependencies: 148 148
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- TOC entry 1908 (class 2606 OID 24720)
-- Dependencies: 1892 160 156
-- Name: calendarevents_calenarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_calenarid_fkey FOREIGN KEY (calenarid) REFERENCES calendars(uid);


--
-- TOC entry 1909 (class 2606 OID 24725)
-- Dependencies: 150 160 1886
-- Name: calendarevents_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);


--
-- TOC entry 1903 (class 2606 OID 24594)
-- Dependencies: 150 1880 144
-- Name: eventklient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT eventklient_id_fkey FOREIGN KEY (klient_id) REFERENCES klient(id);


--
-- TOC entry 1902 (class 2606 OID 16434)
-- Dependencies: 144 146 1880
-- Name: grupy_treningowe_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES klient(id);


--
-- TOC entry 1912 (class 2606 OID 24758)
-- Dependencies: 1888 152 164
-- Name: msg_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(uid);


--
-- TOC entry 1913 (class 2606 OID 24763)
-- Dependencies: 164 152 1888
-- Name: msg_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(uid);


--
-- TOC entry 1907 (class 2606 OID 24701)
-- Dependencies: 158 156 1892
-- Name: usercalendars_calendarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_calendarid_fkey FOREIGN KEY (calendarid) REFERENCES calendars(uid);


--
-- TOC entry 1906 (class 2606 OID 24696)
-- Dependencies: 158 152 1888
-- Name: usercalendars_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1911 (class 2606 OID 24743)
-- Dependencies: 152 162 1888
-- Name: usercontacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES users(uid);


--
-- TOC entry 1910 (class 2606 OID 24738)
-- Dependencies: 152 1888 162
-- Name: usercontacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1905 (class 2606 OID 24628)
-- Dependencies: 150 154 1886
-- Name: userevents_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);


--
-- TOC entry 1904 (class 2606 OID 24623)
-- Dependencies: 154 152 1888
-- Name: userevents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


-- Completed on 2015-12-11 12:15:15

--
-- PostgreSQL database dump complete
--


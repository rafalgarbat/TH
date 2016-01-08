--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.22
-- Dumped by pg_dump version 9.0.22
-- Started on 2016-01-08 14:39:30

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 528 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 179 (class 1255 OID 24748)
-- Dependencies: 528 5
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
-- TOC entry 159 (class 1259 OID 24714)
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
-- TOC entry 158 (class 1259 OID 24712)
-- Dependencies: 5 159
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
-- TOC entry 1952 (class 0 OID 0)
-- Dependencies: 158
-- Name: calendarevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendarevents_uid_seq OWNED BY calendarevents.uid;


--
-- TOC entry 1953 (class 0 OID 0)
-- Dependencies: 158
-- Name: calendarevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendarevents_uid_seq', 81, true);


--
-- TOC entry 155 (class 1259 OID 24650)
-- Dependencies: 1886 5
-- Name: calendars; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calendars (
    uid integer NOT NULL,
    name text,
    ispublic boolean DEFAULT true
);


ALTER TABLE public.calendars OWNER TO postgres;

--
-- TOC entry 154 (class 1259 OID 24648)
-- Dependencies: 5 155
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
-- TOC entry 1954 (class 0 OID 0)
-- Dependencies: 154
-- Name: calendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendars_uid_seq OWNED BY calendars.uid;


--
-- TOC entry 1955 (class 0 OID 0)
-- Dependencies: 154
-- Name: calendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendars_uid_seq', 3, true);


--
-- TOC entry 149 (class 1259 OID 24581)
-- Dependencies: 1873 1874 1875 1876 5
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
    rating numeric(5,2),
    adreswww text,
    rodzaj_wydarzenia text,
    rejestracja_info text,
    ranga text,
    dystans text,
    organizator_info text
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 148 (class 1259 OID 24579)
-- Dependencies: 149 5
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
-- TOC entry 1956 (class 0 OID 0)
-- Dependencies: 148
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 1957 (class 0 OID 0)
-- Dependencies: 148
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 83, true);


--
-- TOC entry 145 (class 1259 OID 16424)
-- Dependencies: 1865 5
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
-- TOC entry 144 (class 1259 OID 16422)
-- Dependencies: 5 145
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
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 144
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupy_treningowe_id_seq OWNED BY grupy_treningowe.id;


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 144
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupy_treningowe_id_seq', 1, true);


--
-- TOC entry 143 (class 1259 OID 16412)
-- Dependencies: 1863 5
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
-- TOC entry 142 (class 1259 OID 16410)
-- Dependencies: 143 5
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
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 142
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE klient_id_seq OWNED BY klient.id;


--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 142
-- Name: klient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('klient_id_seq', 3, true);


--
-- TOC entry 163 (class 1259 OID 24751)
-- Dependencies: 1891 5
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
-- TOC entry 162 (class 1259 OID 24749)
-- Dependencies: 5 163
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
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 162
-- Name: msg_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE msg_uid_seq OWNED BY msg.uid;


--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 162
-- Name: msg_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('msg_uid_seq', 1, false);


--
-- TOC entry 167 (class 1259 OID 24810)
-- Dependencies: 1894 5
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    userid integer,
    url text,
    visible integer,
    cdate timestamp with time zone DEFAULT now()
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 24808)
-- Dependencies: 5 167
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 166
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 166
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photos_id_seq', 2, true);


--
-- TOC entry 157 (class 1259 OID 24690)
-- Dependencies: 5
-- Name: usercalendars; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usercalendars (
    uid integer NOT NULL,
    userid integer,
    calendarid integer,
    owner_id integer
);


ALTER TABLE public.usercalendars OWNER TO postgres;

--
-- TOC entry 156 (class 1259 OID 24688)
-- Dependencies: 157 5
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
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 156
-- Name: usercalendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercalendars_uid_seq OWNED BY usercalendars.uid;


--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 156
-- Name: usercalendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usercalendars_uid_seq', 3, true);


--
-- TOC entry 161 (class 1259 OID 24732)
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
-- TOC entry 160 (class 1259 OID 24730)
-- Dependencies: 5 161
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
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 160
-- Name: usercontacts_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercontacts_uid_seq OWNED BY usercontacts.uid;


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 160
-- Name: usercontacts_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usercontacts_uid_seq', 2, true);


--
-- TOC entry 153 (class 1259 OID 24616)
-- Dependencies: 1883 1884 5
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
-- TOC entry 152 (class 1259 OID 24614)
-- Dependencies: 153 5
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
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 152
-- Name: userevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userevents_uid_seq OWNED BY userevents.uid;


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 152
-- Name: userevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userevents_uid_seq', 85, true);


--
-- TOC entry 151 (class 1259 OID 24601)
-- Dependencies: 1878 1879 1880 1881 5
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
-- TOC entry 150 (class 1259 OID 24599)
-- Dependencies: 151 5
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
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 150
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 150
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_uid_seq', 50, true);


--
-- TOC entry 165 (class 1259 OID 24782)
-- Dependencies: 5
-- Name: wartosci; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wartosci (
    id integer NOT NULL,
    nazwa text
);


ALTER TABLE public.wartosci OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 24780)
-- Dependencies: 5 165
-- Name: wartosci_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wartosci_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wartosci_id_seq OWNER TO postgres;

--
-- TOC entry 1974 (class 0 OID 0)
-- Dependencies: 164
-- Name: wartosci_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wartosci_id_seq OWNED BY wartosci.id;


--
-- TOC entry 1975 (class 0 OID 0)
-- Dependencies: 164
-- Name: wartosci_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wartosci_id_seq', 1, false);


--
-- TOC entry 147 (class 1259 OID 16470)
-- Dependencies: 1867 1868 1869 1870 1871 5
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
-- TOC entry 146 (class 1259 OID 16468)
-- Dependencies: 5 147
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
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 146
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 146
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workouts_id_seq', 1, false);


--
-- TOC entry 1888 (class 2604 OID 24717)
-- Dependencies: 159 158 159
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents ALTER COLUMN uid SET DEFAULT nextval('calendarevents_uid_seq'::regclass);


--
-- TOC entry 1885 (class 2604 OID 24653)
-- Dependencies: 154 155 155
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendars ALTER COLUMN uid SET DEFAULT nextval('calendars_uid_seq'::regclass);


--
-- TOC entry 1872 (class 2604 OID 24584)
-- Dependencies: 148 149 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 1864 (class 2604 OID 16427)
-- Dependencies: 144 145 145
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe ALTER COLUMN id SET DEFAULT nextval('grupy_treningowe_id_seq'::regclass);


--
-- TOC entry 1862 (class 2604 OID 16415)
-- Dependencies: 143 142 143
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);


--
-- TOC entry 1890 (class 2604 OID 24754)
-- Dependencies: 163 162 163
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg ALTER COLUMN uid SET DEFAULT nextval('msg_uid_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 24813)
-- Dependencies: 167 166 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- TOC entry 1887 (class 2604 OID 24693)
-- Dependencies: 157 156 157
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars ALTER COLUMN uid SET DEFAULT nextval('usercalendars_uid_seq'::regclass);


--
-- TOC entry 1889 (class 2604 OID 24735)
-- Dependencies: 160 161 161
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts ALTER COLUMN uid SET DEFAULT nextval('usercontacts_uid_seq'::regclass);


--
-- TOC entry 1882 (class 2604 OID 24619)
-- Dependencies: 153 152 153
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents ALTER COLUMN uid SET DEFAULT nextval('userevents_uid_seq'::regclass);


--
-- TOC entry 1877 (class 2604 OID 24604)
-- Dependencies: 151 150 151
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- TOC entry 1892 (class 2604 OID 24785)
-- Dependencies: 164 165 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wartosci ALTER COLUMN id SET DEFAULT nextval('wartosci_id_seq'::regclass);


--
-- TOC entry 1866 (class 2604 OID 16473)
-- Dependencies: 146 147 147
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- TOC entry 1942 (class 0 OID 24714)
-- Dependencies: 159
-- Data for Name: calendarevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (1, 1, 3);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (2, 1, 6);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (3, 1, 9);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (4, 1, 12);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (5, 1, 15);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (6, 1, 18);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (7, 1, 21);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (8, 1, 24);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (9, 1, 27);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (10, 1, 30);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (11, 1, 33);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (12, 1, 36);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (13, 1, 39);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (14, 1, 42);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (15, 2, 4);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (16, 1, 45);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (17, 1, 48);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (18, 1, 51);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (19, 1, 54);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (20, 3, 5);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (21, 1, 57);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (22, 1, 60);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (23, 2, 10);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (24, 2, 7);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (25, 3, 8);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (26, 3, 11);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (27, 1, 63);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (28, 1, 66);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (29, 2, 13);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (30, 2, 16);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (31, 2, 19);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (32, 2, 22);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (33, 1, 69);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (34, 1, 72);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (35, 1, 75);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (36, 1, 78);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (37, 1, 81);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (38, 2, 67);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (39, 2, 25);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (40, 2, 28);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (41, 2, 31);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (42, 2, 34);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (43, 2, 37);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (44, 2, 40);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (45, 2, 43);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (46, 2, 46);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (47, 2, 49);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (48, 2, 52);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (49, 2, 55);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (50, 2, 58);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (51, 2, 61);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (52, 2, 64);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (53, 3, 14);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (54, 3, 17);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (55, 3, 20);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (56, 3, 23);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (57, 3, 26);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (58, 3, 29);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (59, 3, 32);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (60, 3, 35);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (61, 3, 38);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (62, 3, 41);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (63, 3, 44);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (64, 3, 47);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (65, 3, 50);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (66, 3, 53);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (67, 3, 56);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (68, 3, 59);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (69, 3, 62);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (70, 3, 65);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (71, 2, 70);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (72, 2, 73);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (73, 2, 76);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (74, 2, 79);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (75, 2, 82);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (76, 3, 68);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (77, 3, 71);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (78, 3, 74);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (79, 3, 77);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (80, 3, 80);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (81, 3, 83);


--
-- TOC entry 1940 (class 0 OID 24650)
-- Dependencies: 155
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO calendars (uid, name, ispublic) VALUES (1, 'Moj kalendarz', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (2, 'Zawody', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (3, 'Grupa biegowa', true);


--
-- TOC entry 1937 (class 0 OID 24581)
-- Dependencies: 149
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (3, NULL, 'jarek', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', NULL, NULL, '2015-11-10 19:53:21.61587+01', '2015-11-10 19:53:21.61587+01', NULL, 0, NULL, 'slowaas', '2c39b754-8285-4a5f-b63d-b3f7cd7f97d8', NULL, NULL, NULL, '1', 3.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (6, NULL, 'test1', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-05-05 01:16:53.424102+02', '2016-05-05 01:16:53.424102+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 1.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (9, NULL, 'test4', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-14 18:18:01.563406+02', '2015-10-14 18:18:01.563406+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 4.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (12, NULL, 'xxx-0.659255299251527', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-11 13:10:42.588524+02', '2015-09-11 13:10:42.588524+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (15, NULL, 'xxx-0.535474963951856', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-21 14:29:56.052244+01', '2015-11-21 14:29:56.052244+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (18, NULL, 'xxx-0.445188404992223', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-06-09 20:56:15.634655+02', '2016-06-09 20:56:15.634655+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (21, NULL, 'xxx-0.580333274323493', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-05-30 15:48:56.498361+02', '2016-05-30 15:48:56.498361+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (24, NULL, 'xxx-0.509583400096744', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-19 05:38:21.617456+02', '2015-08-19 05:38:21.617456+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (27, NULL, 'xxx-0.2027323609218', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-26 16:57:37.070818+02', '2015-08-26 16:57:37.070818+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (30, NULL, 'xxx-0.329291505273432', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-06-19 13:10:07.406295+02', '2016-06-19 13:10:07.406295+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (33, NULL, 'xxx-0.960837166756392', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-06-09 23:01:37.040039+02', '2015-06-09 23:01:37.040039+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (36, NULL, 'xxx-0.314244242850691', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-02-27 17:44:02.928872+01', '2016-02-27 17:44:02.928872+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (39, NULL, 'xxx-0.2296202480793', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-04-01 07:07:36.073534+02', '2016-04-01 07:07:36.073534+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (42, NULL, 'xxx-0.72325876634568', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-18 17:41:31.663475+02', '2015-08-18 17:41:31.663475+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (4, NULL, '88234234', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', NULL, NULL, '2015-05-03 09:37:48.535529+02', '2015-05-03 09:37:48.535529+02', NULL, 0, '36.883707, 30.689216', NULL, '2f5367d2-19b3-47ae-95f1-d71389e9821c', NULL, NULL, 'tarnow', '2', 4.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (67, NULL, 'xxx-0.338298373389989', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-21 22:19:24.796616+02', '2015-08-21 22:19:24.796616+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (25, NULL, 'xxx-0.261144478339702', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-19 15:05:45.26994+02', '2015-05-19 15:05:45.26994+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (28, NULL, 'xxx-0.670443715527654', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-01 21:31:46.594473+02', '2015-09-01 21:31:46.594473+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (31, NULL, 'xxx-0.428170236758888', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-14 00:59:03.796818+02', '2015-05-14 00:59:03.796818+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (34, NULL, 'xxx-0.674771611113101', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-13 06:20:03.255886+01', '2015-03-13 06:20:03.255886+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (45, NULL, 'xxx-0.940193557646126', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-31 18:55:59.00469+01', '2015-10-31 18:55:59.00469+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (48, NULL, 'xxx-0.685025437735021', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-05 00:57:38.039508+02', '2015-05-05 00:57:38.039508+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (51, NULL, 'xxx-0.336068851407617', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-06-06 00:08:27.867995+02', '2016-06-06 00:08:27.867995+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (54, NULL, 'xxx-0.640664588660002', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-15 18:36:45.019193+01', '2015-03-15 18:36:45.019193+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (5, NULL, 'test', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-06 06:49:56.549954+02', '2015-04-06 06:49:56.549954+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '3', 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (57, NULL, 'xxx-0.310446752700955', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-20 12:02:01.107333+02', '2015-08-20 12:02:01.107333+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (60, NULL, 'xxx-0.807492117397487', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-01 21:03:54.718391+01', '2015-12-01 21:03:54.718391+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (10, NULL, 'test5', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-04-24 05:07:11.032618+02', '2016-04-24 05:07:11.032618+02', NULL, NULL, '6.879703, 30.706707', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (7, NULL, 'test2', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-27 02:34:31.479577+01', '2015-02-27 02:34:31.479577+01', NULL, NULL, '36.885233, 30.702323', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 2.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (8, NULL, 'test3', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-03-13 03:58:59.062514+01', '2016-03-13 03:58:59.062514+01', NULL, NULL, '36.879466, 30.667648', NULL, NULL, '2015-11-19', '2015-11-19', 'Poznan', '3', 3.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (11, NULL, 'xxx-0.24620196223259', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-14 05:48:49.725624+02', '2015-07-14 05:48:49.725624+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (63, NULL, 'xxx-0.288677988573909', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-05-03 09:49:59.869942+02', '2015-05-03 09:49:59.869942+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (66, NULL, 'xxx-0.783641666173935', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-10-01 21:41:23.309587+02', '2015-10-01 21:41:23.309587+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (13, NULL, 'xxx-0.226665798574686', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-10 22:09:34.003008+01', '2015-02-10 22:09:34.003008+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (16, NULL, 'xxx-0.305849601048976', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-05 19:25:26.34673+02', '2015-09-05 19:25:26.34673+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (19, NULL, 'xxx-0.368662232998759', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-05-30 17:17:03.17722+02', '2016-05-30 17:17:03.17722+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (22, NULL, 'xxx-0.386244779452682', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-25 09:18:25.916657+01', '2015-12-25 09:18:25.916657+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (69, NULL, 'xxx-0.737796194851398', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-16 19:51:17.177522+01', '2015-02-16 19:51:17.177522+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (72, NULL, 'xxx-0.284212389029562', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-03-30 02:11:45.295587+02', '2016-03-30 02:11:45.295587+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (75, NULL, 'xxx-0.42068531177938', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-03-11 09:16:22.291433+01', '2015-03-11 09:16:22.291433+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (78, NULL, 'xxx-0.820278588216752', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-22 17:11:48.574192+01', '2015-12-22 17:11:48.574192+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (81, NULL, 'xxx-0.275586196221411', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-03-08 01:00:33.006513+01', '2016-03-08 01:00:33.006513+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (37, NULL, 'xxx-0.180605698376894', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-05-31 05:54:53.631722+02', '2016-05-31 05:54:53.631722+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (40, NULL, 'xxx-0.563191657420248', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-07-21 20:36:57.362824+02', '2015-07-21 20:36:57.362824+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (43, NULL, 'xxx-0.872099430300295', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-01-22 11:33:31.257923+01', '2015-01-22 11:33:31.257923+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (46, NULL, 'xxx-0.0231418418698013', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-07 16:20:30.856842+01', '2015-11-07 16:20:30.856842+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (49, NULL, 'xxx-0.934490186627954', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-27 05:28:21.286524+01', '2015-02-27 05:28:21.286524+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (52, NULL, 'xxx-0.97491561435163', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-19 19:28:48.739067+02', '2015-09-19 19:28:48.739067+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (55, NULL, 'xxx-0.363838663790375', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-05-05 11:02:44.095418+02', '2016-05-05 11:02:44.095418+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (58, NULL, 'xxx-0.941158581059426', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-13 13:20:45.892743+02', '2015-09-13 13:20:45.892743+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (61, NULL, 'xxx-0.196761534083635', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-01-15 03:06:55.586742+01', '2015-01-15 03:06:55.586742+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (64, NULL, 'xxx-0.0189477275125682', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-01-29 14:10:20.400628+01', '2015-01-29 14:10:20.400628+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (14, NULL, 'xxx-0.0679361037909985', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-15 14:12:18.428855+02', '2015-09-15 14:12:18.428855+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (17, NULL, 'xxx-0.254051659721881', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-08 02:59:51.918105+02', '2015-08-08 02:59:51.918105+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (20, NULL, 'xxx-0.0946216778829694', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-04-08 06:06:46.979476+02', '2015-04-08 06:06:46.979476+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (23, NULL, 'xxx-0.383089780807495', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-06-25 08:25:52.98932+02', '2015-06-25 08:25:52.98932+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (26, NULL, 'xxx-0.219180395826697', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-02-20 03:33:08.36024+01', '2016-02-20 03:33:08.36024+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (29, NULL, 'xxx-0.248506226576865', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-23 04:24:40.517363+01', '2015-11-23 04:24:40.517363+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (32, NULL, 'xxx-0.00489101931452751', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-02-06 07:36:15.792638+01', '2016-02-06 07:36:15.792638+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (35, NULL, 'xxx-0.851083796471357', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-30 19:05:40.632619+02', '2015-09-30 19:05:40.632619+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (38, NULL, 'xxx-0.466950819361955', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-04-24 07:10:16.311275+02', '2016-04-24 07:10:16.311275+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (41, NULL, 'xxx-0.645742905791849', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-06-18 13:15:35.72527+02', '2015-06-18 13:15:35.72527+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (44, NULL, 'xxx-0.893281699158251', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-02 09:30:25.572704+01', '2015-02-02 09:30:25.572704+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (47, NULL, 'xxx-0.0939085995778441', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-21 23:17:30.543648+01', '2015-12-21 23:17:30.543648+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (50, NULL, 'xxx-0.0754857268184423', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-01-31 06:52:26.395976+01', '2015-01-31 06:52:26.395976+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (53, NULL, 'xxx-0.0789930713362992', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-24 04:05:33.302296+01', '2015-02-24 04:05:33.302296+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (56, NULL, 'xxx-0.171362498775125', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-01 16:04:39.774232+01', '2015-12-01 16:04:39.774232+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (59, NULL, 'xxx-0.49985284358263', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-03-06 09:24:55.112567+01', '2016-03-06 09:24:55.112567+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (62, NULL, 'xxx-0.941751613747329', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-28 03:12:07.248299+01', '2016-01-28 03:12:07.248299+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (65, NULL, 'xxx-0.215436223894358', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-14 02:00:34.880076+02', '2015-09-14 02:00:34.880076+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (70, NULL, 'xxx-0.216366234235466', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-27 17:33:47.780971+01', '2015-11-27 17:33:47.780971+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (73, NULL, 'xxx-0.374228642322123', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-16 16:23:17.278068+01', '2015-12-16 16:23:17.278068+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (76, NULL, 'xxx-0.958993563894182', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-06-01 05:01:09.451983+02', '2016-06-01 05:01:09.451983+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (79, NULL, 'xxx-0.0790220373310149', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-02-12 05:05:58.32743+01', '2016-02-12 05:05:58.32743+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (82, NULL, 'xxx-0.344180000014603', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-12-12 14:36:53.20819+01', '2015-12-12 14:36:53.20819+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (68, NULL, 'xxx-0.541280710604042', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-11-12 20:07:12.585456+01', '2015-11-12 20:07:12.585456+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (71, NULL, 'xxx-0.338928994722664', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-03-31 23:07:30.770659+02', '2016-03-31 23:07:30.770659+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (74, NULL, 'xxx-0.0872658058069646', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-08-14 19:56:06.58314+02', '2015-08-14 19:56:06.58314+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (77, NULL, 'xxx-0.824854738544673', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-09-07 02:07:29.639115+02', '2015-09-07 02:07:29.639115+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (80, NULL, 'xxx-0.81028389884159', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2016-01-19 21:26:26.279658+01', '2016-01-19 21:26:26.279658+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info) VALUES (83, NULL, 'xxx-0.870486147236079', '
rozgrzewka 600m.
4x150 kraul/delfin/grzbiet/kraul
8*50 cwiczenia techniczne

Zadanie głowne:
4x(100m+200m na progu)

', false, true, '2015-02-01 02:35:34.257173+01', '2015-02-01 02:35:34.257173+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 1935 (class 0 OID 16424)
-- Dependencies: 145
-- Data for Name: grupy_treningowe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (1, 1, '42423', '2015-09-16');
INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (2, 1, 'lalalala', '2015-10-18');


--
-- TOC entry 1934 (class 0 OID 16412)
-- Dependencies: 143
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (1, '5345', '5345', '5345', '534', '2015-09-01', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (2, 'dasd', 'dasd', 'das', 'das', '2015-09-08', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (3, 'aaaaaa', 'aaaaa', '', '', NULL, NULL);


--
-- TOC entry 1944 (class 0 OID 24751)
-- Dependencies: 163
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1946 (class 0 OID 24810)
-- Dependencies: 167
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO photos (id, userid, url, visible, cdate) VALUES (2, 2, '12007154_933945706678721_1726029017_n.jpg', 1, NULL);


--
-- TOC entry 1941 (class 0 OID 24690)
-- Dependencies: 157
-- Data for Name: usercalendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (1, 2, 1, 2);
INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (2, 2, 2, 2);
INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (3, 2, 3, 2);


--
-- TOC entry 1943 (class 0 OID 24732)
-- Dependencies: 161
-- Data for Name: usercontacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (1, 2, 2);
INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (2, 2, 5);


--
-- TOC entry 1939 (class 0 OID 24616)
-- Dependencies: 153
-- Data for Name: userevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (1, 2, 4, 0, '0.5', '3.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (2, 2, 5, NULL, '1.0', '3.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (4, 2, 10, NULL, '2.0', '7.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (7, 2, 8, 0, '1.5', '6.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (8, 2, 3, 0, '-1.0', '2.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (10, 2, 3, NULL, '-2.0', '2.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (13, 2, 11, 0, '1.5', '8.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (14, 2, 12, 0, '2.0', '9.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (16, 2, 14, 0, '0.0', '10.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (17, 2, 15, 0, '0.5', '11.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (19, 2, 17, 0, '1.5', '12.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (20, 2, 18, 0, '2.0', '13.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (22, 2, 20, 0, '0.0', '15.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (23, 2, 21, 0, '0.5', '15.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (25, 2, 23, 0, '1.5', '17.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (26, 2, 24, 0, '2.0', '18.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (28, 2, 26, 0, '0.0', '19.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (29, 2, 27, 0, '0.5', '20.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (31, 2, 29, 0, '1.5', '21.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (32, 2, 30, 0, '2.0', '22.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (34, 2, 32, 0, '0.0', '24.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (35, 2, 33, 0, '0.5', '24.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (37, 2, 35, 0, '1.5', '26.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (38, 2, 36, 0, '2.0', '27.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (40, 2, 38, 0, '0.0', '28.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (41, 2, 39, 0, '0.5', '29.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (43, 2, 41, 0, '1.5', '30.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (44, 2, 42, 0, '2.0', '31.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (46, 2, 44, 0, '0.0', '33.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (47, 2, 45, 0, '0.5', '33.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (49, 2, 47, 0, '1.5', '35.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (50, 2, 48, 0, '2.0', '36.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (52, 2, 50, 0, '0.0', '37.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (53, 2, 51, 0, '0.5', '38.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (55, 2, 53, 0, '1.5', '39.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (56, 2, 54, 0, '2.0', '40.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (58, 2, 56, 0, '0.0', '42.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (59, 2, 57, 0, '0.5', '42.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (61, 2, 59, 0, '1.5', '44.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (62, 2, 60, 0, '2.0', '45.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (64, 2, 62, 0, '0.0', '46.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (65, 2, 63, 0, '0.5', '47.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (67, 2, 65, 0, '1.5', '48.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (68, 2, 66, 0, '2.0', '49.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (70, 2, 68, 0, '0.0', '51.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (71, 2, 69, 0, '0.5', '51.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (73, 2, 71, 0, '1.5', '53.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (74, 2, 72, 0, '2.0', '54.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (76, 2, 74, 0, '0.0', '55.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (77, 2, 75, 0, '0.5', '56.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (79, 2, 77, 0, '1.5', '57.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (80, 2, 78, 0, '2.0', '58.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (82, 2, 80, 0, '0.0', '60.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (83, 2, 81, 0, '0.5', '60.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (85, 2, 83, 0, '1.5', '62.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (3, 2, 6, 1, '1.5', '4.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (6, 2, 9, 1, '0.0', '6.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (9, 2, 8, 1, '0.5', '6.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (12, 2, 7, 1, '1.0', '5.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (15, 2, 13, 1, '2.5', '9.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (18, 2, 16, 1, '1.0', '12.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (21, 2, 19, 1, '2.5', '14.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (24, 2, 22, 1, '1.0', '16.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (27, 2, 25, 1, '2.5', '18.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (30, 2, 28, 1, '1.0', '21.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (33, 2, 31, 1, '2.5', '23.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (36, 2, 34, 1, '1.0', '25.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (39, 2, 37, 1, '2.5', '27.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (42, 2, 40, 1, '1.0', '30.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (45, 2, 43, 1, '2.5', '32.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (48, 2, 46, 1, '1.0', '34.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (51, 2, 49, 1, '2.5', '36.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (54, 2, 52, 1, '1.0', '39.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (57, 2, 55, 1, '2.5', '41.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (60, 2, 58, 1, '1.0', '43.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (63, 2, 61, 1, '2.5', '45.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (66, 2, 64, 1, '1.0', '48.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (69, 2, 67, 1, '2.5', '50.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (72, 2, 70, 1, '1.0', '52.50', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (75, 2, 73, 1, '2.5', '54.75', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (78, 2, 76, 1, '1.0', '57.00', NULL, NULL, NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (81, 2, 79, 1, '2.5', '59.25', NULL, NULL, NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (84, 2, 82, 1, '1.0', '61.50', NULL, NULL, NULL, false);


--
-- TOC entry 1938 (class 0 OID 24601)
-- Dependencies: 151
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
-- TOC entry 1945 (class 0 OID 24782)
-- Dependencies: 165
-- Data for Name: wartosci; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1936 (class 0 OID 16470)
-- Dependencies: 147
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1912 (class 2606 OID 24719)
-- Dependencies: 159 159
-- Name: calendarevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1908 (class 2606 OID 24659)
-- Dependencies: 155 155
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1902 (class 2606 OID 24593)
-- Dependencies: 149 149
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 1898 (class 2606 OID 16433)
-- Dependencies: 145 145
-- Name: grupy_treningowe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_pkey PRIMARY KEY (id);


--
-- TOC entry 1896 (class 2606 OID 16421)
-- Dependencies: 143 143
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 24757)
-- Dependencies: 163 163
-- Name: msg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (uid);


--
-- TOC entry 1920 (class 2606 OID 24819)
-- Dependencies: 167 167
-- Name: photospkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photospkey PRIMARY KEY (id);


--
-- TOC entry 1910 (class 2606 OID 24695)
-- Dependencies: 157 157
-- Name: usercalendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1914 (class 2606 OID 24737)
-- Dependencies: 161 161
-- Name: usercontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_pkey PRIMARY KEY (uid);


--
-- TOC entry 1906 (class 2606 OID 24622)
-- Dependencies: 153 153
-- Name: userevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1904 (class 2606 OID 24613)
-- Dependencies: 151 151
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 1918 (class 2606 OID 24790)
-- Dependencies: 165 165
-- Name: wartosci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wartosci
    ADD CONSTRAINT wartosci_pkey PRIMARY KEY (id);


--
-- TOC entry 1900 (class 2606 OID 16483)
-- Dependencies: 147 147
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- TOC entry 1927 (class 2606 OID 24720)
-- Dependencies: 1907 159 155
-- Name: calendarevents_calenarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_calenarid_fkey FOREIGN KEY (calenarid) REFERENCES calendars(uid);


--
-- TOC entry 1928 (class 2606 OID 24725)
-- Dependencies: 149 1901 159
-- Name: calendarevents_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);


--
-- TOC entry 1922 (class 2606 OID 24594)
-- Dependencies: 143 149 1895
-- Name: eventklient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT eventklient_id_fkey FOREIGN KEY (klient_id) REFERENCES klient(id);


--
-- TOC entry 1921 (class 2606 OID 16434)
-- Dependencies: 1895 145 143
-- Name: grupy_treningowe_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES klient(id);


--
-- TOC entry 1931 (class 2606 OID 24758)
-- Dependencies: 163 151 1903
-- Name: msg_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(uid);


--
-- TOC entry 1932 (class 2606 OID 24763)
-- Dependencies: 151 1903 163
-- Name: msg_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(uid);


--
-- TOC entry 1933 (class 2606 OID 24820)
-- Dependencies: 151 167 1903
-- Name: photos_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1926 (class 2606 OID 24701)
-- Dependencies: 155 1907 157
-- Name: usercalendars_calendarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_calendarid_fkey FOREIGN KEY (calendarid) REFERENCES calendars(uid);


--
-- TOC entry 1925 (class 2606 OID 24696)
-- Dependencies: 1903 151 157
-- Name: usercalendars_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1930 (class 2606 OID 24743)
-- Dependencies: 151 1903 161
-- Name: usercontacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES users(uid);


--
-- TOC entry 1929 (class 2606 OID 24738)
-- Dependencies: 1903 161 151
-- Name: usercontacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1924 (class 2606 OID 24628)
-- Dependencies: 1901 153 149
-- Name: userevents_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);


--
-- TOC entry 1923 (class 2606 OID 24623)
-- Dependencies: 1903 153 151
-- Name: userevents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-01-08 14:39:30

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.22
-- Dumped by pg_dump version 9.0.22
-- Started on 2016-01-29 15:57:49

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 561 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 189 (class 1255 OID 24748)
-- Dependencies: 561 5
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
-- Dependencies: 159 5
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
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 158
-- Name: calendarevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendarevents_uid_seq OWNED BY calendarevents.uid;


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 158
-- Name: calendarevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendarevents_uid_seq', 96, true);


--
-- TOC entry 155 (class 1259 OID 24650)
-- Dependencies: 1919 5
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
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 154
-- Name: calendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE calendars_uid_seq OWNED BY calendars.uid;


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 154
-- Name: calendars_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calendars_uid_seq', 3, true);


--
-- TOC entry 171 (class 1259 OID 24869)
-- Dependencies: 1932 1933 5
-- Name: coach_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE coach_groups (
    uid integer NOT NULL,
    coachid integer,
    groupname text,
    stan integer DEFAULT 0,
    cdate date DEFAULT now()
);


ALTER TABLE public.coach_groups OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 24867)
-- Dependencies: 5 171
-- Name: coach_groups_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE coach_groups_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_groups_uid_seq OWNER TO postgres;

--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 170
-- Name: coach_groups_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE coach_groups_uid_seq OWNED BY coach_groups.uid;


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 170
-- Name: coach_groups_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('coach_groups_uid_seq', 1, false);


--
-- TOC entry 169 (class 1259 OID 24847)
-- Dependencies: 1929 1930 5
-- Name: coach_players; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE coach_players (
    uid integer NOT NULL,
    coachid integer,
    userid integer,
    stan integer DEFAULT 0,
    cdate date DEFAULT now()
);


ALTER TABLE public.coach_players OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 24845)
-- Dependencies: 169 5
-- Name: coach_players_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE coach_players_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_players_uid_seq OWNER TO postgres;

--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 168
-- Name: coach_players_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE coach_players_uid_seq OWNED BY coach_players.uid;


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 168
-- Name: coach_players_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('coach_players_uid_seq', 20, true);


--
-- TOC entry 149 (class 1259 OID 24581)
-- Dependencies: 1906 1907 1908 1909 5
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
    organizator_info text,
    rejestracja_date date,
    owner_id integer
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
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 148
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 148
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 103, true);


--
-- TOC entry 173 (class 1259 OID 24887)
-- Dependencies: 1935 1936 5
-- Name: events_invitations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_invitations (
    id integer NOT NULL,
    eventid integer,
    userid integer,
    inviteby integer,
    cdate date DEFAULT now(),
    stan integer DEFAULT 1002
);


ALTER TABLE public.events_invitations OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24885)
-- Dependencies: 5 173
-- Name: events_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_invitations_id_seq OWNER TO postgres;

--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 172
-- Name: events_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_invitations_id_seq OWNED BY events_invitations.id;


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 172
-- Name: events_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_invitations_id_seq', 15, true);


--
-- TOC entry 177 (class 1259 OID 24930)
-- Dependencies: 1939 5
-- Name: forum; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE forum (
    id integer NOT NULL,
    event_id integer,
    commenterid integer,
    msg_title text,
    msg text,
    cdate date DEFAULT now()
);


ALTER TABLE public.forum OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24928)
-- Dependencies: 177 5
-- Name: forum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE forum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_id_seq OWNER TO postgres;

--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 176
-- Name: forum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE forum_id_seq OWNED BY forum.id;


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 176
-- Name: forum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('forum_id_seq', 1, false);


--
-- TOC entry 145 (class 1259 OID 16424)
-- Dependencies: 1898 5
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
-- Dependencies: 145 5
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
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 144
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupy_treningowe_id_seq OWNED BY grupy_treningowe.id;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 144
-- Name: grupy_treningowe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupy_treningowe_id_seq', 1, true);


--
-- TOC entry 143 (class 1259 OID 16412)
-- Dependencies: 1896 5
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
-- Dependencies: 5 143
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
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 142
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE klient_id_seq OWNED BY klient.id;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 142
-- Name: klient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('klient_id_seq', 3, true);


--
-- TOC entry 163 (class 1259 OID 24751)
-- Dependencies: 1924 5
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
-- Dependencies: 163 5
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
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 162
-- Name: msg_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE msg_uid_seq OWNED BY msg.uid;


--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 162
-- Name: msg_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('msg_uid_seq', 1, false);


--
-- TOC entry 167 (class 1259 OID 24810)
-- Dependencies: 1927 5
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
-- Dependencies: 167 5
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
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 166
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 166
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photos_id_seq', 2, true);


--
-- TOC entry 175 (class 1259 OID 24913)
-- Dependencies: 5
-- Name: slowniki; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE slowniki (
    id integer NOT NULL,
    nazwa text
);


ALTER TABLE public.slowniki OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24911)
-- Dependencies: 5 175
-- Name: slowniki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE slowniki_id_seq
    START WITH 1
    INCREMENT BY 1000
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slowniki_id_seq OWNER TO postgres;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 174
-- Name: slowniki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE slowniki_id_seq OWNED BY slowniki.id;


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 174
-- Name: slowniki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('slowniki_id_seq', 1000, true);


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
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 156
-- Name: usercalendars_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercalendars_uid_seq OWNED BY usercalendars.uid;


--
-- TOC entry 2046 (class 0 OID 0)
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
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 160
-- Name: usercontacts_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usercontacts_uid_seq OWNED BY usercontacts.uid;


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 160
-- Name: usercontacts_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usercontacts_uid_seq', 2, true);


--
-- TOC entry 153 (class 1259 OID 24616)
-- Dependencies: 1916 1917 5
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
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 152
-- Name: userevents_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userevents_uid_seq OWNED BY userevents.uid;


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 152
-- Name: userevents_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userevents_uid_seq', 88, true);


--
-- TOC entry 151 (class 1259 OID 24601)
-- Dependencies: 1911 1912 1913 1914 5
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
-- Dependencies: 5 151
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
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 150
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- TOC entry 2052 (class 0 OID 0)
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
    nazwa text,
    slownik_id integer
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
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 164
-- Name: wartosci_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wartosci_id_seq OWNED BY wartosci.id;


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 164
-- Name: wartosci_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wartosci_id_seq', 1, true);


--
-- TOC entry 147 (class 1259 OID 16470)
-- Dependencies: 1900 1901 1902 1903 1904 5
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
-- Dependencies: 147 5
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
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 146
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 146
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workouts_id_seq', 1, false);


--
-- TOC entry 1921 (class 2604 OID 24717)
-- Dependencies: 159 158 159
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents ALTER COLUMN uid SET DEFAULT nextval('calendarevents_uid_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 24653)
-- Dependencies: 155 154 155
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendars ALTER COLUMN uid SET DEFAULT nextval('calendars_uid_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 24872)
-- Dependencies: 171 170 171
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coach_groups ALTER COLUMN uid SET DEFAULT nextval('coach_groups_uid_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 24850)
-- Dependencies: 169 168 169
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coach_players ALTER COLUMN uid SET DEFAULT nextval('coach_players_uid_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 24584)
-- Dependencies: 148 149 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 24890)
-- Dependencies: 173 172 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_invitations ALTER COLUMN id SET DEFAULT nextval('events_invitations_id_seq'::regclass);


--
-- TOC entry 1938 (class 2604 OID 24933)
-- Dependencies: 177 176 177
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forum ALTER COLUMN id SET DEFAULT nextval('forum_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 16427)
-- Dependencies: 145 144 145
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe ALTER COLUMN id SET DEFAULT nextval('grupy_treningowe_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 16415)
-- Dependencies: 142 143 143
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);


--
-- TOC entry 1923 (class 2604 OID 24754)
-- Dependencies: 163 162 163
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg ALTER COLUMN uid SET DEFAULT nextval('msg_uid_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 24813)
-- Dependencies: 166 167 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 24916)
-- Dependencies: 175 174 175
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY slowniki ALTER COLUMN id SET DEFAULT nextval('slowniki_id_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 24693)
-- Dependencies: 156 157 157
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars ALTER COLUMN uid SET DEFAULT nextval('usercalendars_uid_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 24735)
-- Dependencies: 161 160 161
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts ALTER COLUMN uid SET DEFAULT nextval('usercontacts_uid_seq'::regclass);


--
-- TOC entry 1915 (class 2604 OID 24619)
-- Dependencies: 152 153 153
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents ALTER COLUMN uid SET DEFAULT nextval('userevents_uid_seq'::regclass);


--
-- TOC entry 1910 (class 2604 OID 24604)
-- Dependencies: 150 151 151
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 24785)
-- Dependencies: 164 165 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wartosci ALTER COLUMN id SET DEFAULT nextval('wartosci_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 16473)
-- Dependencies: 147 146 147
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- TOC entry 2006 (class 0 OID 24714)
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
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (82, 1, 84);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (83, 2, 90);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (84, 1, 91);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (85, 1, 92);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (86, 1, 93);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (87, 1, 94);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (88, 1, 95);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (89, 1, 96);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (90, 1, 97);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (91, 1, 98);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (92, 1, 99);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (93, 1, 100);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (94, 1, 101);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (95, 1, 102);
INSERT INTO calendarevents (uid, calenarid, eventid) VALUES (96, 3, 103);


--
-- TOC entry 2004 (class 0 OID 24650)
-- Dependencies: 155
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO calendars (uid, name, ispublic) VALUES (1, 'Moj kalendarz', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (2, 'Zawody', true);
INSERT INTO calendars (uid, name, ispublic) VALUES (3, 'Grupa biegowa', true);


--
-- TOC entry 2012 (class 0 OID 24869)
-- Dependencies: 171
-- Data for Name: coach_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2011 (class 0 OID 24847)
-- Dependencies: 169
-- Data for Name: coach_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (1, 2, 4, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (2, 2, 5, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (3, 2, 6, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (4, 2, 7, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (5, 2, 8, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (6, 2, 9, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (7, 2, 10, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (8, 2, 11, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (9, 2, 12, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (10, 2, 13, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (11, 2, 14, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (12, 2, 15, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (13, 2, 16, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (14, 2, 17, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (15, 2, 18, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (16, 2, 19, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (17, 2, 20, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (18, 2, 21, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (19, 2, 22, 0, '2016-01-18');
INSERT INTO coach_players (uid, coachid, userid, stan, cdate) VALUES (20, 2, 23, 0, '2016-01-18');


--
-- TOC entry 2001 (class 0 OID 24581)
-- Dependencies: 149
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (97, NULL, 'ola77', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 97', NULL, true, '2016-01-09 00:00:00+01', '2016-01-09 00:00:00+01', NULL, NULL, NULL, NULL, 'e378e145-0792-44b4-9559-705d843aaf84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (85, NULL, 'dasdasd', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 85', NULL, true, '2016-01-04 00:00:00+01', '2016-01-04 00:00:00+01', NULL, NULL, NULL, NULL, '58ef6e66-14bf-4c83-a05c-c368c8160c12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (3, NULL, 'jarek', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 3', NULL, true, '2015-11-10 19:53:21.61587+01', '2015-11-10 19:53:21.61587+01', NULL, 0, NULL, 'slowaas', '2c39b754-8285-4a5f-b63d-b3f7cd7f97d8', NULL, NULL, NULL, '1', 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (9, NULL, 'test4', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 9', false, true, '2015-10-14 18:18:01.563406+02', '2015-10-14 18:18:01.563406+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (15, NULL, 'xxx-0.535474963951856', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 15', false, true, '2015-11-21 14:29:56.052244+01', '2015-11-21 14:29:56.052244+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (21, NULL, 'xxx-0.580333274323493', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 21', false, true, '2016-05-30 15:48:56.498361+02', '2016-05-30 15:48:56.498361+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (96, NULL, 'ola1', 'To jest opis tego co mam zrobic na treningu lalaalal 96', NULL, true, '2016-01-08 00:00:00+01', '2016-01-08 00:00:00+01', NULL, NULL, NULL, NULL, '41f27f0c-c04e-4b4d-a434-c9c280421a7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (98, NULL, '45646', 'To jest opis tego co mam zrobic na treningu lalaalal 98', NULL, NULL, '2016-01-16 00:00:00+01', '2016-01-16 00:00:00+01', NULL, NULL, NULL, NULL, 'afbbfdcd-35df-4635-986b-a48e701d3dae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (84, NULL, 'dupa', 'To jest opis tego co mam zrobic na treningu lalaalal 84', NULL, true, '2016-01-04 00:00:00+01', '2016-01-04 00:00:00+01', NULL, NULL, NULL, NULL, 'a644e44e-da86-4a58-8459-9a0bf98dc0b7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (86, NULL, 'dasdsa', 'To jest opis tego co mam zrobic na treningu lalaalal 86', NULL, true, '2016-01-04 00:00:00+01', '2016-01-04 00:00:00+01', NULL, NULL, NULL, NULL, '4d2e6699-c185-4a77-b864-8ba671268cab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (6, NULL, 'test1', 'To jest opis tego co mam zrobic na treningu lalaalal 6', false, true, '2016-05-05 01:16:53.424102+02', '2016-05-05 01:16:53.424102+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '1', 1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (12, NULL, 'xxx-0.659255299251527', 'To jest opis tego co mam zrobic na treningu lalaalal 12', false, true, '2015-09-11 13:10:42.588524+02', '2015-09-11 13:10:42.588524+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (18, NULL, 'xxx-0.445188404992223', 'To jest opis tego co mam zrobic na treningu lalaalal 18', false, true, '2016-06-09 20:56:15.634655+02', '2016-06-09 20:56:15.634655+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (24, NULL, 'xxx-0.509583400096744', 'To jest opis tego co mam zrobic na treningu lalaalal 24', false, true, '2015-08-19 05:38:21.617456+02', '2015-08-19 05:38:21.617456+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (47, NULL, 'xxx-0.0939085995778441', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 47', false, true, '2015-12-21 23:17:30.543648+01', '2015-12-21 23:17:30.543648+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (99, NULL, 'zed', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 99', NULL, NULL, '2016-01-01 00:00:00+01', '2016-01-01 00:00:00+01', NULL, NULL, NULL, NULL, '07ca47be-1a6d-4a0e-8c62-33a229e0a8b5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (53, NULL, 'xxx-0.0789930713362992', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 53', false, true, '2015-02-24 04:05:33.302296+01', '2015-02-24 04:05:33.302296+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (59, NULL, 'xxx-0.49985284358263', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 59', false, true, '2016-03-06 09:24:55.112567+01', '2016-03-06 09:24:55.112567+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (65, NULL, 'xxx-0.215436223894358', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 65', false, true, '2015-09-14 02:00:34.880076+02', '2015-09-14 02:00:34.880076+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (73, NULL, 'xxx-0.374228642322123', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 73', false, true, '2015-12-16 16:23:17.278068+01', '2015-12-16 16:23:17.278068+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (79, NULL, 'xxx-0.0790220373310149', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 79', false, true, '2016-02-12 05:05:58.32743+01', '2016-02-12 05:05:58.32743+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (100, NULL, 'zed is dead', 'To jest opis tego co mam zrobic na treningu lalaalal 100', NULL, NULL, '2015-12-28 00:00:00+01', '2015-12-28 00:00:00+01', NULL, NULL, NULL, NULL, '89673a6d-d2a8-486a-a847-025458d669a7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (50, NULL, 'xxx-0.0754857268184423', 'To jest opis tego co mam zrobic na treningu lalaalal 50', false, true, '2015-01-31 06:52:26.395976+01', '2015-01-31 06:52:26.395976+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (56, NULL, 'xxx-0.171362498775125', 'To jest opis tego co mam zrobic na treningu lalaalal 56', false, true, '2015-12-01 16:04:39.774232+01', '2015-12-01 16:04:39.774232+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (62, NULL, 'xxx-0.941751613747329', 'To jest opis tego co mam zrobic na treningu lalaalal 62', false, true, '2016-01-28 03:12:07.248299+01', '2016-01-28 03:12:07.248299+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (70, NULL, 'xxx-0.216366234235466', 'To jest opis tego co mam zrobic na treningu lalaalal 70', false, true, '2015-11-27 17:33:47.780971+01', '2015-11-27 17:33:47.780971+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (76, NULL, 'xxx-0.958993563894182', 'To jest opis tego co mam zrobic na treningu lalaalal 76', false, true, '2016-06-01 05:01:09.451983+02', '2016-06-01 05:01:09.451983+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (82, NULL, 'xxx-0.344180000014603', 'To jest opis tego co mam zrobic na treningu lalaalal 82', false, true, '2015-12-12 14:36:53.20819+01', '2015-12-12 14:36:53.20819+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (68, NULL, 'xxx-0.541280710604042', 'To jest opis tego co mam zrobic na treningu lalaalal 68', false, true, '2015-11-12 20:07:12.585456+01', '2015-11-12 20:07:12.585456+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (30, NULL, 'xxx-0.329291505273432', 'To jest opis tego co mam zrobic na treningu lalaalal 30', false, true, '2016-06-19 13:10:07.406295+02', '2016-06-19 13:10:07.406295+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (36, NULL, 'xxx-0.314244242850691', 'To jest opis tego co mam zrobic na treningu lalaalal 36', false, true, '2016-02-27 17:44:02.928872+01', '2016-02-27 17:44:02.928872+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (42, NULL, 'xxx-0.72325876634568', 'To jest opis tego co mam zrobic na treningu lalaalal 42', false, true, '2015-08-18 17:41:31.663475+02', '2015-08-18 17:41:31.663475+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (101, NULL, 'nanananan', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 101', NULL, NULL, '2015-12-08 00:00:00+01', '2015-12-08 00:00:00+01', NULL, NULL, NULL, NULL, '7cffdf5d-467c-43fd-b05a-1c887dace538', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (83, NULL, 'xxx-0.870486147236079', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 83', false, true, '2015-02-01 02:35:34.257173+01', '2015-02-01 02:35:34.257173+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (41, NULL, 'xxx-0.645742905791849', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 41', false, true, '2015-06-18 13:15:35.72527+02', '2015-06-18 13:15:35.72527+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (88, NULL, 'gggg', 'To jest opis tego co mam zrobic na treningu lalaalal 88', NULL, true, '2015-12-27 00:00:00+01', '2015-12-27 00:00:00+01', NULL, NULL, NULL, NULL, 'fbe9578d-7205-4c87-884b-1ed3176f68b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (38, NULL, 'xxx-0.466950819361955', 'To jest opis tego co mam zrobic na treningu lalaalal 38', false, true, '2016-04-24 07:10:16.311275+02', '2016-04-24 07:10:16.311275+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (44, NULL, 'xxx-0.893281699158251', 'To jest opis tego co mam zrobic na treningu lalaalal 44', false, true, '2015-02-02 09:30:25.572704+01', '2015-02-02 09:30:25.572704+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (102, NULL, 'aaa', 'To jest opis tego co mam zrobic na treningu lalaalal 102', NULL, NULL, '2016-01-11 00:00:00+01', '2016-01-11 00:00:00+01', NULL, NULL, NULL, NULL, '9e462d84-faeb-4321-8895-242566911cf7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (39, NULL, 'xxx-0.2296202480793', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 39', false, true, '2016-04-01 07:07:36.073534+02', '2016-04-01 07:07:36.073534+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (77, NULL, 'xxx-0.824854738544673', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 77', false, true, '2015-09-07 02:07:29.639115+02', '2015-09-07 02:07:29.639115+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (89, NULL, '555555', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 89', NULL, true, '2016-01-05 00:00:00+01', '2016-01-05 00:00:00+01', NULL, NULL, NULL, NULL, '068d3584-e170-4384-9af1-6c3cb93672b6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (67, NULL, 'xxx-0.338298373389989', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 67', false, true, '2015-08-21 22:19:24.796616+02', '2015-08-21 22:19:24.796616+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (25, NULL, 'xxx-0.261144478339702', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 25', false, true, '2015-05-19 15:05:45.26994+02', '2015-05-19 15:05:45.26994+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (31, NULL, 'xxx-0.428170236758888', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 31', false, true, '2015-05-14 00:59:03.796818+02', '2015-05-14 00:59:03.796818+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (28, NULL, 'xxx-0.670443715527654', 'To jest opis tego co mam zrobic na treningu lalaalal 28', false, true, '2015-09-01 21:31:46.594473+02', '2015-09-01 21:31:46.594473+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (34, NULL, 'xxx-0.674771611113101', 'To jest opis tego co mam zrobic na treningu lalaalal 34', false, true, '2015-03-13 06:20:03.255886+01', '2015-03-13 06:20:03.255886+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (45, NULL, 'xxx-0.940193557646126', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 45', false, true, '2015-10-31 18:55:59.00469+01', '2015-10-31 18:55:59.00469+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (51, NULL, 'xxx-0.336068851407617', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 51', false, true, '2016-06-06 00:08:27.867995+02', '2016-06-06 00:08:27.867995+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (5, NULL, 'test', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 5', false, true, '2015-04-06 06:49:56.549954+02', '2015-04-06 06:49:56.549954+02', NULL, NULL, NULL, NULL, NULL, '2015-11-19', '2015-11-19', NULL, '3', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (57, NULL, 'xxx-0.310446752700955', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 57', false, true, '2015-08-20 12:02:01.107333+02', '2015-08-20 12:02:01.107333+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (103, NULL, 'papapaap', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 103', NULL, NULL, '2015-12-29 00:00:00+01', '2015-12-29 00:00:00+01', NULL, NULL, NULL, NULL, '2cb5d78e-937a-4cc6-8b5f-aa8018050581', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (90, NULL, 'papapapa', 'To jest opis tego co mam zrobic na treningu lalaalal 90', NULL, true, '2016-01-13 00:00:00+01', '2016-01-13 00:00:00+01', NULL, NULL, NULL, NULL, '54307e45-f293-4916-a293-dc771139be7c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (48, NULL, 'xxx-0.685025437735021', 'To jest opis tego co mam zrobic na treningu lalaalal 48', false, true, '2015-05-05 00:57:38.039508+02', '2015-05-05 00:57:38.039508+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (54, NULL, 'xxx-0.640664588660002', 'To jest opis tego co mam zrobic na treningu lalaalal 54', false, true, '2015-03-15 18:36:45.019193+01', '2015-03-15 18:36:45.019193+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (60, NULL, 'xxx-0.807492117397487', 'To jest opis tego co mam zrobic na treningu lalaalal 60', false, true, '2015-12-01 21:03:54.718391+01', '2015-12-01 21:03:54.718391+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (10, NULL, 'test5', 'To jest opis tego co mam zrobic na treningu lalaalal 10', false, true, '2016-04-24 05:07:11.032618+02', '2016-04-24 05:07:11.032618+02', NULL, NULL, '6.879703, 30.706707', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (71, NULL, 'xxx-0.338928994722664', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 71', false, true, '2016-03-31 23:07:30.770659+02', '2016-03-31 23:07:30.770659+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (87, NULL, 'dasdasda', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 87', NULL, true, '2016-01-04 00:00:00+01', '2016-01-04 00:00:00+01', NULL, NULL, NULL, NULL, '1b540b0e-abe9-4c5b-8777-fbe3eece0077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (27, NULL, 'xxx-0.2027323609218', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 27', false, true, '2015-08-26 16:57:37.070818+02', '2015-08-26 16:57:37.070818+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (33, NULL, 'xxx-0.960837166756392', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 33', false, true, '2015-06-09 23:01:37.040039+02', '2015-06-09 23:01:37.040039+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (91, NULL, 'jarek1', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 91', NULL, true, '2016-01-03 00:00:00+01', '2016-01-03 00:00:00+01', NULL, NULL, NULL, NULL, 'afc2ae57-7b33-4ae9-a647-614e6c9cfc8b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (4, NULL, '88234234', 'To jest opis tego co mam zrobic na treningu lalaalal 4', NULL, true, '2015-05-03 09:37:48.535529+02', '2015-05-03 09:37:48.535529+02', NULL, 0, '36.883707, 30.689216', NULL, '2f5367d2-19b3-47ae-95f1-d71389e9821c', NULL, NULL, 'tarnow', '2', 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (74, NULL, 'xxx-0.0872658058069646', 'To jest opis tego co mam zrobic na treningu lalaalal 74', false, true, '2015-08-14 19:56:06.58314+02', '2015-08-14 19:56:06.58314+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (80, NULL, 'xxx-0.81028389884159', 'To jest opis tego co mam zrobic na treningu lalaalal 80', false, true, '2016-01-19 21:26:26.279658+01', '2016-01-19 21:26:26.279658+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (7, NULL, 'test2', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 7', false, true, '2015-02-27 02:34:31.479577+01', '2015-02-27 02:34:31.479577+01', NULL, NULL, '36.885233, 30.702323', NULL, NULL, '2015-11-19', '2015-11-19', NULL, '2', 2.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (11, NULL, 'xxx-0.24620196223259', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 11', false, true, '2015-07-14 05:48:49.725624+02', '2015-07-14 05:48:49.725624+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (63, NULL, 'xxx-0.288677988573909', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 63', false, true, '2015-05-03 09:49:59.869942+02', '2015-05-03 09:49:59.869942+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (13, NULL, 'xxx-0.226665798574686', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 13', false, true, '2015-02-10 22:09:34.003008+01', '2015-02-10 22:09:34.003008+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (35, NULL, 'xxx-0.851083796471357', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 35', false, true, '2015-09-30 19:05:40.632619+02', '2015-09-30 19:05:40.632619+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (8, NULL, 'test3', 'To jest opis tego co mam zrobic na treningu lalaalal 8', false, true, '2016-03-13 03:58:59.062514+01', '2016-03-13 03:58:59.062514+01', NULL, NULL, '36.879466, 30.667648', NULL, NULL, '2015-11-19', '2015-11-19', 'Poznan', '3', 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (66, NULL, 'xxx-0.783641666173935', 'To jest opis tego co mam zrobic na treningu lalaalal 66', false, true, '2015-10-01 21:41:23.309587+02', '2015-10-01 21:41:23.309587+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (16, NULL, 'xxx-0.305849601048976', 'To jest opis tego co mam zrobic na treningu lalaalal 16', false, true, '2015-09-05 19:25:26.34673+02', '2015-09-05 19:25:26.34673+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (93, NULL, 'demnot12', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 93', NULL, true, '2016-01-10 00:00:00+01', '2016-01-10 00:00:00+01', NULL, NULL, NULL, NULL, '5c754fc5-4380-441a-9551-7fb2816182d0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (95, NULL, 'xxxxx', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 95', NULL, true, '2016-01-06 00:00:00+01', '2016-01-06 00:00:00+01', NULL, NULL, NULL, NULL, 'c3ff3633-1de8-4aa0-972f-f89331efb52e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (92, NULL, 'asd12', 'To jest opis tego co mam zrobic na treningu lalaalal 92', NULL, true, '2016-01-05 00:00:00+01', '2016-01-05 00:00:00+01', NULL, NULL, NULL, NULL, '1c0ab9b1-d840-474c-9f18-e7010d7773c2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (94, NULL, 'asd', 'To jest opis tego co mam zrobic na treningu lalaalal 94', NULL, true, '2016-01-05 00:00:00+01', '2016-01-05 00:00:00+01', NULL, NULL, NULL, NULL, '8799a671-553c-4b8b-884e-4acc6fb011f6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (19, NULL, 'xxx-0.368662232998759', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 19', false, true, '2016-05-30 17:17:03.17722+02', '2016-05-30 17:17:03.17722+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (69, NULL, 'xxx-0.737796194851398', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 69', false, true, '2015-02-16 19:51:17.177522+01', '2015-02-16 19:51:17.177522+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (75, NULL, 'xxx-0.42068531177938', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 75', false, true, '2015-03-11 09:16:22.291433+01', '2015-03-11 09:16:22.291433+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (81, NULL, 'xxx-0.275586196221411', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 81', false, true, '2016-03-08 01:00:33.006513+01', '2016-03-08 01:00:33.006513+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (37, NULL, 'xxx-0.180605698376894', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 37', false, true, '2016-05-31 05:54:53.631722+02', '2016-05-31 05:54:53.631722+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (22, NULL, 'xxx-0.386244779452682', 'To jest opis tego co mam zrobic na treningu lalaalal 22', false, true, '2015-12-25 09:18:25.916657+01', '2015-12-25 09:18:25.916657+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (72, NULL, 'xxx-0.284212389029562', 'To jest opis tego co mam zrobic na treningu lalaalal 72', false, true, '2016-03-30 02:11:45.295587+02', '2016-03-30 02:11:45.295587+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (78, NULL, 'xxx-0.820278588216752', 'To jest opis tego co mam zrobic na treningu lalaalal 78', false, true, '2015-12-22 17:11:48.574192+01', '2015-12-22 17:11:48.574192+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (43, NULL, 'xxx-0.872099430300295', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 43', false, true, '2015-01-22 11:33:31.257923+01', '2015-01-22 11:33:31.257923+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (49, NULL, 'xxx-0.934490186627954', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 49', false, true, '2015-02-27 05:28:21.286524+01', '2015-02-27 05:28:21.286524+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (55, NULL, 'xxx-0.363838663790375', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 55', false, true, '2016-05-05 11:02:44.095418+02', '2016-05-05 11:02:44.095418+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (61, NULL, 'xxx-0.196761534083635', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 61', false, true, '2015-01-15 03:06:55.586742+01', '2015-01-15 03:06:55.586742+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (17, NULL, 'xxx-0.254051659721881', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 17', false, true, '2015-08-08 02:59:51.918105+02', '2015-08-08 02:59:51.918105+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (23, NULL, 'xxx-0.383089780807495', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 23', false, true, '2015-06-25 08:25:52.98932+02', '2015-06-25 08:25:52.98932+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (29, NULL, 'xxx-0.248506226576865', 'To jest opis tego co mam zrobic na treningu lalaalal
cos tam ejscze
a potem cos jescze
i jescze
 29', false, true, '2015-11-23 04:24:40.517363+01', '2015-11-23 04:24:40.517363+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (40, NULL, 'xxx-0.563191657420248', 'To jest opis tego co mam zrobic na treningu lalaalal 40', false, true, '2015-07-21 20:36:57.362824+02', '2015-07-21 20:36:57.362824+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (46, NULL, 'xxx-0.0231418418698013', 'To jest opis tego co mam zrobic na treningu lalaalal 46', false, true, '2015-11-07 16:20:30.856842+01', '2015-11-07 16:20:30.856842+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (52, NULL, 'xxx-0.97491561435163', 'To jest opis tego co mam zrobic na treningu lalaalal 52', false, true, '2015-09-19 19:28:48.739067+02', '2015-09-19 19:28:48.739067+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (58, NULL, 'xxx-0.941158581059426', 'To jest opis tego co mam zrobic na treningu lalaalal 58', false, true, '2015-09-13 13:20:45.892743+02', '2015-09-13 13:20:45.892743+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (64, NULL, 'xxx-0.0189477275125682', 'To jest opis tego co mam zrobic na treningu lalaalal 64', false, true, '2015-01-29 14:10:20.400628+01', '2015-01-29 14:10:20.400628+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (14, NULL, 'xxx-0.0679361037909985', 'To jest opis tego co mam zrobic na treningu lalaalal 14', false, true, '2015-09-15 14:12:18.428855+02', '2015-09-15 14:12:18.428855+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (20, NULL, 'xxx-0.0946216778829694', 'To jest opis tego co mam zrobic na treningu lalaalal 20', false, true, '2015-04-08 06:06:46.979476+02', '2015-04-08 06:06:46.979476+02', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (26, NULL, 'xxx-0.219180395826697', 'To jest opis tego co mam zrobic na treningu lalaalal 26', false, true, '2016-02-20 03:33:08.36024+01', '2016-02-20 03:33:08.36024+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) VALUES (32, NULL, 'xxx-0.00489101931452751', 'To jest opis tego co mam zrobic na treningu lalaalal 32', false, true, '2016-02-06 07:36:15.792638+01', '2016-02-06 07:36:15.792638+01', NULL, NULL, NULL, NULL, NULL, '2015-12-15', '2015-12-15', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2013 (class 0 OID 24887)
-- Dependencies: 173
-- Data for Name: events_invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (2, 61, 5, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (3, 61, 6, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (5, 61, 8, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (6, 61, 9, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (8, 61, 11, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (9, 61, 12, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (11, 61, 14, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (12, 61, 15, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (14, 61, 17, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (15, 61, 18, 2, '2016-01-28', 1002);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (1, 61, 4, 2, '2016-01-28', 1001);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (4, 61, 7, 2, '2016-01-28', 1001);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (7, 61, 10, 2, '2016-01-28', 1001);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (10, 61, 13, 2, '2016-01-28', 1001);
INSERT INTO events_invitations (id, eventid, userid, inviteby, cdate, stan) VALUES (13, 61, 16, 2, '2016-01-28', 1001);


--
-- TOC entry 2015 (class 0 OID 24930)
-- Dependencies: 177
-- Data for Name: forum; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1999 (class 0 OID 16424)
-- Dependencies: 145
-- Data for Name: grupy_treningowe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (1, 1, '42423', '2015-09-16');
INSERT INTO grupy_treningowe (id, owner_id, nazwa, cdate) VALUES (2, 1, 'lalalala', '2015-10-18');


--
-- TOC entry 1998 (class 0 OID 16412)
-- Dependencies: 143
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (1, '5345', '5345', '5345', '534', '2015-09-01', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (2, 'dasd', 'dasd', 'das', 'das', '2015-09-08', NULL);
INSERT INTO klient (id, imie, nazwisko, email, login, cdate, password) VALUES (3, 'aaaaaa', 'aaaaa', '', '', NULL, NULL);


--
-- TOC entry 2008 (class 0 OID 24751)
-- Dependencies: 163
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2010 (class 0 OID 24810)
-- Dependencies: 167
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO photos (id, userid, url, visible, cdate) VALUES (2, 2, '12007154_933945706678721_1726029017_n.jpg', 1, NULL);


--
-- TOC entry 2014 (class 0 OID 24913)
-- Dependencies: 175
-- Data for Name: slowniki; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO slowniki (id, nazwa) VALUES (1000, 'Stany zaproszen');


--
-- TOC entry 2005 (class 0 OID 24690)
-- Dependencies: 157
-- Data for Name: usercalendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (1, 2, 1, 2);
INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (2, 2, 2, 2);
INSERT INTO usercalendars (uid, userid, calendarid, owner_id) VALUES (3, 2, 3, 2);


--
-- TOC entry 2007 (class 0 OID 24732)
-- Dependencies: 161
-- Data for Name: usercontacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (1, 2, 2);
INSERT INTO usercontacts (uid, user_id, contact_id) VALUES (2, 2, 5);


--
-- TOC entry 2003 (class 0 OID 24616)
-- Dependencies: 153
-- Data for Name: userevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (1, 2, 4, 0, '0.5', '3.00', NULL, 'Uwagi od trenera 4', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (2, 2, 5, NULL, '1.0', '3.75', NULL, 'Uwagi od trenera 5', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (4, 2, 10, NULL, '2.0', '7.50', NULL, 'Uwagi od trenera 10', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (7, 2, 8, 0, '1.5', '6.00', NULL, 'Uwagi od trenera 8', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (8, 2, 3, 0, '-1.0', '2.25', NULL, 'Uwagi od trenera 3', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (10, 2, 3, NULL, '-2.0', '2.25', NULL, 'Uwagi od trenera 3', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (13, 2, 11, 0, '1.5', '8.25', NULL, 'Uwagi od trenera 11', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (14, 2, 12, 0, '2.0', '9.00', NULL, 'Uwagi od trenera 12', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (16, 2, 14, 0, '0.0', '10.50', NULL, 'Uwagi od trenera 14', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (17, 2, 15, 0, '0.5', '11.25', NULL, 'Uwagi od trenera 15', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (19, 2, 17, 0, '1.5', '12.75', NULL, 'Uwagi od trenera 17', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (20, 2, 18, 0, '2.0', '13.50', NULL, 'Uwagi od trenera 18', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (15, 2, 13, 1, '2.5', '9.75', NULL, 'Uwagi od trenera 13', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (18, 2, 16, 1, '1.0', '12.00', NULL, 'Uwagi od trenera 16', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (21, 2, 19, 1, '2.5', '14.25', NULL, 'Uwagi od trenera 19', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (24, 2, 22, 1, '1.0', '16.50', NULL, 'Uwagi od trenera 22', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (27, 2, 25, 1, '2.5', '18.75', NULL, 'Uwagi od trenera 25', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (30, 2, 28, 1, '1.0', '21.00', NULL, 'Uwagi od trenera 28', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (33, 2, 31, 1, '2.5', '23.25', NULL, 'Uwagi od trenera 31', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (36, 2, 34, 1, '1.0', '25.50', NULL, 'Uwagi od trenera 34', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (39, 2, 37, 1, '2.5', '27.75', NULL, 'Uwagi od trenera 37', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (42, 2, 40, 1, '1.0', '30.00', NULL, 'Uwagi od trenera 40', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (87, NULL, 64, NULL, '15', '0.2', '20', 'xxx', '', false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (52, 2, 50, 0, '0.0', '37.50', '', 'Uwagi od trenera 50', '', false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (22, 2, 20, 0, '0.0', '15.00', NULL, 'Uwagi od trenera 20', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (23, 2, 21, 0, '0.5', '15.75', NULL, 'Uwagi od trenera 21', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (25, 2, 23, 0, '1.5', '17.25', NULL, 'Uwagi od trenera 23', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (26, 2, 24, 0, '2.0', '18.00', NULL, 'Uwagi od trenera 24', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (28, 2, 26, 0, '0.0', '19.50', NULL, 'Uwagi od trenera 26', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (29, 2, 27, 0, '0.5', '20.25', NULL, 'Uwagi od trenera 27', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (31, 2, 29, 0, '1.5', '21.75', NULL, 'Uwagi od trenera 29', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (32, 2, 30, 0, '2.0', '22.50', NULL, 'Uwagi od trenera 30', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (34, 2, 32, 0, '0.0', '24.00', NULL, 'Uwagi od trenera 32', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (35, 2, 33, 0, '0.5', '24.75', NULL, 'Uwagi od trenera 33', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (37, 2, 35, 0, '1.5', '26.25', NULL, 'Uwagi od trenera 35', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (38, 2, 36, 0, '2.0', '27.00', NULL, 'Uwagi od trenera 36', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (40, 2, 38, 0, '0.0', '28.50', NULL, 'Uwagi od trenera 38', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (41, 2, 39, 0, '0.5', '29.25', NULL, 'Uwagi od trenera 39', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (43, 2, 41, 0, '1.5', '30.75', NULL, 'Uwagi od trenera 41', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (44, 2, 42, 0, '2.0', '31.50', NULL, 'Uwagi od trenera 42', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (46, 2, 44, 0, '0.0', '33.00', NULL, 'Uwagi od trenera 44', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (47, 2, 45, 0, '0.5', '33.75', NULL, 'Uwagi od trenera 45', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (49, 2, 47, 0, '1.5', '35.25', NULL, 'Uwagi od trenera 47', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (50, 2, 48, 0, '2.0', '36.00', NULL, 'Uwagi od trenera 48', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (53, 2, 51, 0, '0.5', '38.25', NULL, 'Uwagi od trenera 51', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (55, 2, 53, 0, '1.5', '39.75', NULL, 'Uwagi od trenera 53', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (56, 2, 54, 0, '2.0', '40.50', NULL, 'Uwagi od trenera 54', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (58, 2, 56, 0, '0.0', '42.00', NULL, 'Uwagi od trenera 56', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (59, 2, 57, 0, '0.5', '42.75', NULL, 'Uwagi od trenera 57', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (61, 2, 59, 0, '1.5', '44.25', NULL, 'Uwagi od trenera 59', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (62, 2, 60, 0, '2.0', '45.00', NULL, 'Uwagi od trenera 60', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (64, 2, 62, 0, '0.0', '46.50', NULL, 'Uwagi od trenera 62', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (65, 2, 63, 0, '0.5', '47.25', NULL, 'Uwagi od trenera 63', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (67, 2, 65, 0, '1.5', '48.75', NULL, 'Uwagi od trenera 65', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (68, 2, 66, 0, '2.0', '49.50', NULL, 'Uwagi od trenera 66', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (70, 2, 68, 0, '0.0', '51.00', NULL, 'Uwagi od trenera 68', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (71, 2, 69, 0, '0.5', '51.75', NULL, 'Uwagi od trenera 69', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (73, 2, 71, 0, '1.5', '53.25', NULL, 'Uwagi od trenera 71', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (74, 2, 72, 0, '2.0', '54.00', NULL, 'Uwagi od trenera 72', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (76, 2, 74, 0, '0.0', '55.50', NULL, 'Uwagi od trenera 74', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (77, 2, 75, 0, '0.5', '56.25', NULL, 'Uwagi od trenera 75', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (79, 2, 77, 0, '1.5', '57.75', NULL, 'Uwagi od trenera 77', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (80, 2, 78, 0, '2.0', '58.50', NULL, 'Uwagi od trenera 78', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (82, 2, 80, 0, '0.0', '60.00', NULL, 'Uwagi od trenera 80', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (83, 2, 81, 0, '0.5', '60.75', NULL, 'Uwagi od trenera 81', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (85, 2, 83, 0, '1.5', '62.25', NULL, 'Uwagi od trenera 83', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (3, 2, 6, 1, '1.5', '4.50', NULL, 'Uwagi od trenera 6', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (6, 2, 9, 1, '0.0', '6.75', NULL, 'Uwagi od trenera 9', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (9, 2, 8, 1, '0.5', '6.00', NULL, 'Uwagi od trenera 8', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (12, 2, 7, 1, '1.0', '5.25', NULL, 'Uwagi od trenera 7', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (45, 2, 43, 1, '2.5', '32.25', NULL, 'Uwagi od trenera 43', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (48, 2, 46, 1, '1.0', '34.50', NULL, 'Uwagi od trenera 46', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (51, 2, 49, 1, '2.5', '36.75', NULL, 'Uwagi od trenera 49', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (54, 2, 52, 1, '1.0', '39.00', NULL, 'Uwagi od trenera 52', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (57, 2, 55, 1, '2.5', '41.25', NULL, 'Uwagi od trenera 55', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (60, 2, 58, 1, '1.0', '43.50', NULL, 'Uwagi od trenera 58', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (63, 2, 61, 1, '2.5', '45.75', NULL, 'Uwagi od trenera 61', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (69, 2, 67, 1, '2.5', '50.25', NULL, 'Uwagi od trenera 67', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (72, 2, 70, 1, '1.0', '52.50', NULL, 'Uwagi od trenera 70', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (75, 2, 73, 1, '2.5', '54.75', NULL, 'Uwagi od trenera 73', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (78, 2, 76, 1, '1.0', '57.00', NULL, 'Uwagi od trenera 76', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (81, 2, 79, 1, '2.5', '59.25', NULL, 'Uwagi od trenera 79', NULL, true);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (84, 2, 82, 1, '1.0', '61.50', NULL, 'Uwagi od trenera 82', NULL, false);
INSERT INTO userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) VALUES (66, 2, 64, 1, '1.0', '48.00', '', 'Uwagi od trenera 64', 'onet,ok', true);


--
-- TOC entry 2002 (class 0 OID 24601)
-- Dependencies: 151
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

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
INSERT INTO users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) VALUES (2, 'ala', 'ala', 'ala', 1, NULL, 'ala', 'ala', 1, 1, 1, 1);


--
-- TOC entry 2009 (class 0 OID 24782)
-- Dependencies: 165
-- Data for Name: wartosci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO wartosci (id, nazwa, slownik_id) VALUES (1, 'Półmaraton', 1);
INSERT INTO wartosci (id, nazwa, slownik_id) VALUES (1001, 'Zaproszenie zaakceptowane', 1000);
INSERT INTO wartosci (id, nazwa, slownik_id) VALUES (1002, 'Zaproszenie oczekujące', 1000);


--
-- TOC entry 2000 (class 0 OID 16470)
-- Dependencies: 147
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1957 (class 2606 OID 24719)
-- Dependencies: 159 159
-- Name: calendarevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1953 (class 2606 OID 24659)
-- Dependencies: 155 155
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1969 (class 2606 OID 24884)
-- Dependencies: 171 171
-- Name: coach_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY coach_groups
    ADD CONSTRAINT coach_groups_pkey PRIMARY KEY (uid);


--
-- TOC entry 1967 (class 2606 OID 24864)
-- Dependencies: 169 169
-- Name: coach_players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_pkey PRIMARY KEY (uid);


--
-- TOC entry 1947 (class 2606 OID 24593)
-- Dependencies: 149 149
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 1971 (class 2606 OID 24893)
-- Dependencies: 173 173
-- Name: events_invitations_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_id_key UNIQUE (id);


--
-- TOC entry 1973 (class 2606 OID 24910)
-- Dependencies: 173 173
-- Name: events_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_pkey PRIMARY KEY (id);


--
-- TOC entry 1977 (class 2606 OID 24939)
-- Dependencies: 177 177
-- Name: forum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 16433)
-- Dependencies: 145 145
-- Name: grupy_treningowe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_pkey PRIMARY KEY (id);


--
-- TOC entry 1941 (class 2606 OID 16421)
-- Dependencies: 143 143
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 24757)
-- Dependencies: 163 163
-- Name: msg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (uid);


--
-- TOC entry 1965 (class 2606 OID 24819)
-- Dependencies: 167 167
-- Name: photospkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photospkey PRIMARY KEY (id);


--
-- TOC entry 1975 (class 2606 OID 24921)
-- Dependencies: 175 175
-- Name: slowniki_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slowniki
    ADD CONSTRAINT slowniki_id_key UNIQUE (id);


--
-- TOC entry 1955 (class 2606 OID 24695)
-- Dependencies: 157 157
-- Name: usercalendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_pkey PRIMARY KEY (uid);


--
-- TOC entry 1959 (class 2606 OID 24737)
-- Dependencies: 161 161
-- Name: usercontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_pkey PRIMARY KEY (uid);


--
-- TOC entry 1951 (class 2606 OID 24622)
-- Dependencies: 153 153
-- Name: userevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_pkey PRIMARY KEY (uid);


--
-- TOC entry 1949 (class 2606 OID 24613)
-- Dependencies: 151 151
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 1963 (class 2606 OID 24790)
-- Dependencies: 165 165
-- Name: wartosci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wartosci
    ADD CONSTRAINT wartosci_pkey PRIMARY KEY (id);


--
-- TOC entry 1945 (class 2606 OID 16483)
-- Dependencies: 147 147
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- TOC entry 1985 (class 2606 OID 24720)
-- Dependencies: 159 1952 155
-- Name: calendarevents_calenarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_calenarid_fkey FOREIGN KEY (calenarid) REFERENCES calendars(uid);


--
-- TOC entry 1986 (class 2606 OID 24725)
-- Dependencies: 159 1946 149
-- Name: calendarevents_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY calendarevents
    ADD CONSTRAINT calendarevents_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);


--
-- TOC entry 1994 (class 2606 OID 24878)
-- Dependencies: 1948 151 171
-- Name: coach_groups_coachid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coach_groups
    ADD CONSTRAINT coach_groups_coachid_fkey FOREIGN KEY (coachid) REFERENCES users(uid);


--
-- TOC entry 1992 (class 2606 OID 24853)
-- Dependencies: 1948 169 151
-- Name: coach_players_coachid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_coachid_fkey FOREIGN KEY (coachid) REFERENCES users(uid);


--
-- TOC entry 1993 (class 2606 OID 24858)
-- Dependencies: 1948 169 151
-- Name: coach_players_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coach_players
    ADD CONSTRAINT coach_players_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1979 (class 2606 OID 24594)
-- Dependencies: 1940 143 149
-- Name: eventklient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT eventklient_id_fkey FOREIGN KEY (klient_id) REFERENCES klient(id);


--
-- TOC entry 1995 (class 2606 OID 24894)
-- Dependencies: 1946 149 173
-- Name: events_invitations_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_eventid_fkey FOREIGN KEY (eventid) REFERENCES events(id);


--
-- TOC entry 1997 (class 2606 OID 24904)
-- Dependencies: 1948 173 151
-- Name: events_invitations_inviteby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_inviteby_fkey FOREIGN KEY (inviteby) REFERENCES users(uid);


--
-- TOC entry 1996 (class 2606 OID 24899)
-- Dependencies: 151 1948 173
-- Name: events_invitations_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_invitations
    ADD CONSTRAINT events_invitations_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1980 (class 2606 OID 24825)
-- Dependencies: 151 1948 149
-- Name: events_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(uid);


--
-- TOC entry 1978 (class 2606 OID 16434)
-- Dependencies: 145 143 1940
-- Name: grupy_treningowe_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupy_treningowe
    ADD CONSTRAINT grupy_treningowe_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES klient(id);


--
-- TOC entry 1989 (class 2606 OID 24758)
-- Dependencies: 163 1948 151
-- Name: msg_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(uid);


--
-- TOC entry 1990 (class 2606 OID 24763)
-- Dependencies: 151 1948 163
-- Name: msg_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY msg
    ADD CONSTRAINT msg_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(uid);


--
-- TOC entry 1991 (class 2606 OID 24820)
-- Dependencies: 1948 167 151
-- Name: photos_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1984 (class 2606 OID 24701)
-- Dependencies: 155 1952 157
-- Name: usercalendars_calendarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_calendarid_fkey FOREIGN KEY (calendarid) REFERENCES calendars(uid);


--
-- TOC entry 1983 (class 2606 OID 24696)
-- Dependencies: 1948 157 151
-- Name: usercalendars_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercalendars
    ADD CONSTRAINT usercalendars_userid_fkey FOREIGN KEY (userid) REFERENCES users(uid);


--
-- TOC entry 1988 (class 2606 OID 24743)
-- Dependencies: 161 1948 151
-- Name: usercontacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES users(uid);


--
-- TOC entry 1987 (class 2606 OID 24738)
-- Dependencies: 161 151 1948
-- Name: usercontacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usercontacts
    ADD CONSTRAINT usercontacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 1982 (class 2606 OID 24628)
-- Dependencies: 149 1946 153
-- Name: userevents_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);


--
-- TOC entry 1981 (class 2606 OID 24623)
-- Dependencies: 1948 153 151
-- Name: userevents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevents
    ADD CONSTRAINT userevents_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);


--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-01-29 15:57:49

--
-- PostgreSQL database dump complete
--


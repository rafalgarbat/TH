--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.22
-- Dumped by pg_dump version 9.0.22
-- Started on 2016-01-28 16:14:51

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

COPY calendarevents (uid, calenarid, eventid) FROM stdin;
1	1	3
2	1	6
3	1	9
4	1	12
5	1	15
6	1	18
7	1	21
8	1	24
9	1	27
10	1	30
11	1	33
12	1	36
13	1	39
14	1	42
15	2	4
16	1	45
17	1	48
18	1	51
19	1	54
20	3	5
21	1	57
22	1	60
23	2	10
24	2	7
25	3	8
26	3	11
27	1	63
28	1	66
29	2	13
30	2	16
31	2	19
32	2	22
33	1	69
34	1	72
35	1	75
36	1	78
37	1	81
38	2	67
39	2	25
40	2	28
41	2	31
42	2	34
43	2	37
44	2	40
45	2	43
46	2	46
47	2	49
48	2	52
49	2	55
50	2	58
51	2	61
52	2	64
53	3	14
54	3	17
55	3	20
56	3	23
57	3	26
58	3	29
59	3	32
60	3	35
61	3	38
62	3	41
63	3	44
64	3	47
65	3	50
66	3	53
67	3	56
68	3	59
69	3	62
70	3	65
71	2	70
72	2	73
73	2	76
74	2	79
75	2	82
76	3	68
77	3	71
78	3	74
79	3	77
80	3	80
81	3	83
82	1	84
83	2	90
84	1	91
85	1	92
86	1	93
87	1	94
88	1	95
89	1	96
90	1	97
91	1	98
92	1	99
93	1	100
94	1	101
95	1	102
96	3	103
\.


--
-- TOC entry 2004 (class 0 OID 24650)
-- Dependencies: 155
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY calendars (uid, name, ispublic) FROM stdin;
1	Moj kalendarz	t
2	Zawody	t
3	Grupa biegowa	t
\.


--
-- TOC entry 2012 (class 0 OID 24869)
-- Dependencies: 171
-- Data for Name: coach_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coach_groups (uid, coachid, groupname, stan, cdate) FROM stdin;
\.


--
-- TOC entry 2011 (class 0 OID 24847)
-- Dependencies: 169
-- Data for Name: coach_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coach_players (uid, coachid, userid, stan, cdate) FROM stdin;
1	2	4	0	2016-01-18
2	2	5	0	2016-01-18
3	2	6	0	2016-01-18
4	2	7	0	2016-01-18
5	2	8	0	2016-01-18
6	2	9	0	2016-01-18
7	2	10	0	2016-01-18
8	2	11	0	2016-01-18
9	2	12	0	2016-01-18
10	2	13	0	2016-01-18
11	2	14	0	2016-01-18
12	2	15	0	2016-01-18
13	2	16	0	2016-01-18
14	2	17	0	2016-01-18
15	2	18	0	2016-01-18
16	2	19	0	2016-01-18
17	2	20	0	2016-01-18
18	2	21	0	2016-01-18
19	2	22	0	2016-01-18
20	2	23	0	2016-01-18
\.


--
-- TOC entry 2001 (class 0 OID 24581)
-- Dependencies: 149
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, klient_id, tytul, opis, czycalydzien, czypubliczne, dataod, datado, przesuniecie, typ_przesuniecia, gmap_cords, keywords, event_id, cdate, mdate, adres, typ_wydarzenia, rating, adreswww, rodzaj_wydarzenia, rejestracja_info, ranga, dystans, organizator_info, rejestracja_date, owner_id) FROM stdin;
97	\N	ola77	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 97	\N	t	2016-01-09 00:00:00+01	2016-01-09 00:00:00+01	\N	\N	\N	\N	e378e145-0792-44b4-9559-705d843aaf84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
85	\N	dasdasd	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 85	\N	t	2016-01-04 00:00:00+01	2016-01-04 00:00:00+01	\N	\N	\N	\N	58ef6e66-14bf-4c83-a05c-c368c8160c12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
3	\N	jarek	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 3	\N	t	2015-11-10 19:53:21.61587+01	2015-11-10 19:53:21.61587+01	\N	0	\N	slowaas	2c39b754-8285-4a5f-b63d-b3f7cd7f97d8	\N	\N	\N	1	3.00	\N	\N	\N	\N	\N	\N	\N	2
9	\N	test4	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 9	f	t	2015-10-14 18:18:01.563406+02	2015-10-14 18:18:01.563406+02	\N	\N	\N	\N	\N	2015-11-19	2015-11-19	\N	1	4.00	\N	\N	\N	\N	\N	\N	\N	2
15	\N	xxx-0.535474963951856	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 15	f	t	2015-11-21 14:29:56.052244+01	2015-11-21 14:29:56.052244+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
21	\N	xxx-0.580333274323493	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 21	f	t	2016-05-30 15:48:56.498361+02	2016-05-30 15:48:56.498361+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
96	\N	ola1	To jest opis tego co mam zrobic na treningu lalaalal 96	\N	t	2016-01-08 00:00:00+01	2016-01-08 00:00:00+01	\N	\N	\N	\N	41f27f0c-c04e-4b4d-a434-c9c280421a7e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	\N	45646	To jest opis tego co mam zrobic na treningu lalaalal 98	\N	\N	2016-01-16 00:00:00+01	2016-01-16 00:00:00+01	\N	\N	\N	\N	afbbfdcd-35df-4635-986b-a48e701d3dae	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	\N	dupa	To jest opis tego co mam zrobic na treningu lalaalal 84	\N	t	2016-01-04 00:00:00+01	2016-01-04 00:00:00+01	\N	\N	\N	\N	a644e44e-da86-4a58-8459-9a0bf98dc0b7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	\N	dasdsa	To jest opis tego co mam zrobic na treningu lalaalal 86	\N	t	2016-01-04 00:00:00+01	2016-01-04 00:00:00+01	\N	\N	\N	\N	4d2e6699-c185-4a77-b864-8ba671268cab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	\N	test1	To jest opis tego co mam zrobic na treningu lalaalal 6	f	t	2016-05-05 01:16:53.424102+02	2016-05-05 01:16:53.424102+02	\N	\N	\N	\N	\N	2015-11-19	2015-11-19	\N	1	1.00	\N	\N	\N	\N	\N	\N	\N	\N
12	\N	xxx-0.659255299251527	To jest opis tego co mam zrobic na treningu lalaalal 12	f	t	2015-09-11 13:10:42.588524+02	2015-09-11 13:10:42.588524+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	\N	xxx-0.445188404992223	To jest opis tego co mam zrobic na treningu lalaalal 18	f	t	2016-06-09 20:56:15.634655+02	2016-06-09 20:56:15.634655+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	\N	xxx-0.509583400096744	To jest opis tego co mam zrobic na treningu lalaalal 24	f	t	2015-08-19 05:38:21.617456+02	2015-08-19 05:38:21.617456+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	\N	xxx-0.0939085995778441	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 47	f	t	2015-12-21 23:17:30.543648+01	2015-12-21 23:17:30.543648+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
99	\N	zed	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 99	\N	\N	2016-01-01 00:00:00+01	2016-01-01 00:00:00+01	\N	\N	\N	\N	07ca47be-1a6d-4a0e-8c62-33a229e0a8b5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
53	\N	xxx-0.0789930713362992	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 53	f	t	2015-02-24 04:05:33.302296+01	2015-02-24 04:05:33.302296+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
59	\N	xxx-0.49985284358263	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 59	f	t	2016-03-06 09:24:55.112567+01	2016-03-06 09:24:55.112567+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
65	\N	xxx-0.215436223894358	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 65	f	t	2015-09-14 02:00:34.880076+02	2015-09-14 02:00:34.880076+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
73	\N	xxx-0.374228642322123	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 73	f	t	2015-12-16 16:23:17.278068+01	2015-12-16 16:23:17.278068+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
79	\N	xxx-0.0790220373310149	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 79	f	t	2016-02-12 05:05:58.32743+01	2016-02-12 05:05:58.32743+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
100	\N	zed is dead	To jest opis tego co mam zrobic na treningu lalaalal 100	\N	\N	2015-12-28 00:00:00+01	2015-12-28 00:00:00+01	\N	\N	\N	\N	89673a6d-d2a8-486a-a847-025458d669a7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	\N	xxx-0.0754857268184423	To jest opis tego co mam zrobic na treningu lalaalal 50	f	t	2015-01-31 06:52:26.395976+01	2015-01-31 06:52:26.395976+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	\N	xxx-0.171362498775125	To jest opis tego co mam zrobic na treningu lalaalal 56	f	t	2015-12-01 16:04:39.774232+01	2015-12-01 16:04:39.774232+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	\N	xxx-0.941751613747329	To jest opis tego co mam zrobic na treningu lalaalal 62	f	t	2016-01-28 03:12:07.248299+01	2016-01-28 03:12:07.248299+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	\N	xxx-0.216366234235466	To jest opis tego co mam zrobic na treningu lalaalal 70	f	t	2015-11-27 17:33:47.780971+01	2015-11-27 17:33:47.780971+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	\N	xxx-0.958993563894182	To jest opis tego co mam zrobic na treningu lalaalal 76	f	t	2016-06-01 05:01:09.451983+02	2016-06-01 05:01:09.451983+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	\N	xxx-0.344180000014603	To jest opis tego co mam zrobic na treningu lalaalal 82	f	t	2015-12-12 14:36:53.20819+01	2015-12-12 14:36:53.20819+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	\N	xxx-0.541280710604042	To jest opis tego co mam zrobic na treningu lalaalal 68	f	t	2015-11-12 20:07:12.585456+01	2015-11-12 20:07:12.585456+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	\N	xxx-0.329291505273432	To jest opis tego co mam zrobic na treningu lalaalal 30	f	t	2016-06-19 13:10:07.406295+02	2016-06-19 13:10:07.406295+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	\N	xxx-0.314244242850691	To jest opis tego co mam zrobic na treningu lalaalal 36	f	t	2016-02-27 17:44:02.928872+01	2016-02-27 17:44:02.928872+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	\N	xxx-0.72325876634568	To jest opis tego co mam zrobic na treningu lalaalal 42	f	t	2015-08-18 17:41:31.663475+02	2015-08-18 17:41:31.663475+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	\N	nanananan	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 101	\N	\N	2015-12-08 00:00:00+01	2015-12-08 00:00:00+01	\N	\N	\N	\N	7cffdf5d-467c-43fd-b05a-1c887dace538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
83	\N	xxx-0.870486147236079	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 83	f	t	2015-02-01 02:35:34.257173+01	2015-02-01 02:35:34.257173+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
41	\N	xxx-0.645742905791849	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 41	f	t	2015-06-18 13:15:35.72527+02	2015-06-18 13:15:35.72527+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
88	\N	gggg	To jest opis tego co mam zrobic na treningu lalaalal 88	\N	t	2015-12-27 00:00:00+01	2015-12-27 00:00:00+01	\N	\N	\N	\N	fbe9578d-7205-4c87-884b-1ed3176f68b9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	\N	xxx-0.466950819361955	To jest opis tego co mam zrobic na treningu lalaalal 38	f	t	2016-04-24 07:10:16.311275+02	2016-04-24 07:10:16.311275+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	\N	xxx-0.893281699158251	To jest opis tego co mam zrobic na treningu lalaalal 44	f	t	2015-02-02 09:30:25.572704+01	2015-02-02 09:30:25.572704+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	\N	aaa	To jest opis tego co mam zrobic na treningu lalaalal 102	\N	\N	2016-01-11 00:00:00+01	2016-01-11 00:00:00+01	\N	\N	\N	\N	9e462d84-faeb-4321-8895-242566911cf7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	\N	xxx-0.2296202480793	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 39	f	t	2016-04-01 07:07:36.073534+02	2016-04-01 07:07:36.073534+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
77	\N	xxx-0.824854738544673	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 77	f	t	2015-09-07 02:07:29.639115+02	2015-09-07 02:07:29.639115+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
89	\N	555555	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 89	\N	t	2016-01-05 00:00:00+01	2016-01-05 00:00:00+01	\N	\N	\N	\N	068d3584-e170-4384-9af1-6c3cb93672b6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
67	\N	xxx-0.338298373389989	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 67	f	t	2015-08-21 22:19:24.796616+02	2015-08-21 22:19:24.796616+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
25	\N	xxx-0.261144478339702	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 25	f	t	2015-05-19 15:05:45.26994+02	2015-05-19 15:05:45.26994+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
31	\N	xxx-0.428170236758888	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 31	f	t	2015-05-14 00:59:03.796818+02	2015-05-14 00:59:03.796818+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
28	\N	xxx-0.670443715527654	To jest opis tego co mam zrobic na treningu lalaalal 28	f	t	2015-09-01 21:31:46.594473+02	2015-09-01 21:31:46.594473+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	\N	xxx-0.674771611113101	To jest opis tego co mam zrobic na treningu lalaalal 34	f	t	2015-03-13 06:20:03.255886+01	2015-03-13 06:20:03.255886+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	\N	xxx-0.940193557646126	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 45	f	t	2015-10-31 18:55:59.00469+01	2015-10-31 18:55:59.00469+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
51	\N	xxx-0.336068851407617	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 51	f	t	2016-06-06 00:08:27.867995+02	2016-06-06 00:08:27.867995+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
5	\N	test	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 5	f	t	2015-04-06 06:49:56.549954+02	2015-04-06 06:49:56.549954+02	\N	\N	\N	\N	\N	2015-11-19	2015-11-19	\N	3	0.00	\N	\N	\N	\N	\N	\N	\N	2
57	\N	xxx-0.310446752700955	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 57	f	t	2015-08-20 12:02:01.107333+02	2015-08-20 12:02:01.107333+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
103	\N	papapaap	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 103	\N	\N	2015-12-29 00:00:00+01	2015-12-29 00:00:00+01	\N	\N	\N	\N	2cb5d78e-937a-4cc6-8b5f-aa8018050581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	\N	papapapa	To jest opis tego co mam zrobic na treningu lalaalal 90	\N	t	2016-01-13 00:00:00+01	2016-01-13 00:00:00+01	\N	\N	\N	\N	54307e45-f293-4916-a293-dc771139be7c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	\N	xxx-0.685025437735021	To jest opis tego co mam zrobic na treningu lalaalal 48	f	t	2015-05-05 00:57:38.039508+02	2015-05-05 00:57:38.039508+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	\N	xxx-0.640664588660002	To jest opis tego co mam zrobic na treningu lalaalal 54	f	t	2015-03-15 18:36:45.019193+01	2015-03-15 18:36:45.019193+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	\N	xxx-0.807492117397487	To jest opis tego co mam zrobic na treningu lalaalal 60	f	t	2015-12-01 21:03:54.718391+01	2015-12-01 21:03:54.718391+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	\N	test5	To jest opis tego co mam zrobic na treningu lalaalal 10	f	t	2016-04-24 05:07:11.032618+02	2016-04-24 05:07:11.032618+02	\N	\N	6.879703, 30.706707	\N	\N	2015-11-19	2015-11-19	\N	2	0.00	\N	\N	\N	\N	\N	\N	\N	\N
71	\N	xxx-0.338928994722664	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 71	f	t	2016-03-31 23:07:30.770659+02	2016-03-31 23:07:30.770659+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
87	\N	dasdasda	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 87	\N	t	2016-01-04 00:00:00+01	2016-01-04 00:00:00+01	\N	\N	\N	\N	1b540b0e-abe9-4c5b-8777-fbe3eece0077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
27	\N	xxx-0.2027323609218	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 27	f	t	2015-08-26 16:57:37.070818+02	2015-08-26 16:57:37.070818+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
33	\N	xxx-0.960837166756392	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 33	f	t	2015-06-09 23:01:37.040039+02	2015-06-09 23:01:37.040039+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
91	\N	jarek1	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 91	\N	t	2016-01-03 00:00:00+01	2016-01-03 00:00:00+01	\N	\N	\N	\N	afc2ae57-7b33-4ae9-a647-614e6c9cfc8b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
4	\N	88234234	To jest opis tego co mam zrobic na treningu lalaalal 4	\N	t	2015-05-03 09:37:48.535529+02	2015-05-03 09:37:48.535529+02	\N	0	36.883707, 30.689216	\N	2f5367d2-19b3-47ae-95f1-d71389e9821c	\N	\N	tarnow	2	4.00	\N	\N	\N	\N	\N	\N	\N	\N
74	\N	xxx-0.0872658058069646	To jest opis tego co mam zrobic na treningu lalaalal 74	f	t	2015-08-14 19:56:06.58314+02	2015-08-14 19:56:06.58314+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	\N	xxx-0.81028389884159	To jest opis tego co mam zrobic na treningu lalaalal 80	f	t	2016-01-19 21:26:26.279658+01	2016-01-19 21:26:26.279658+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	\N	test2	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 7	f	t	2015-02-27 02:34:31.479577+01	2015-02-27 02:34:31.479577+01	\N	\N	36.885233, 30.702323	\N	\N	2015-11-19	2015-11-19	\N	2	2.00	\N	\N	\N	\N	\N	\N	\N	2
11	\N	xxx-0.24620196223259	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 11	f	t	2015-07-14 05:48:49.725624+02	2015-07-14 05:48:49.725624+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
63	\N	xxx-0.288677988573909	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 63	f	t	2015-05-03 09:49:59.869942+02	2015-05-03 09:49:59.869942+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
13	\N	xxx-0.226665798574686	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 13	f	t	2015-02-10 22:09:34.003008+01	2015-02-10 22:09:34.003008+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
35	\N	xxx-0.851083796471357	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 35	f	t	2015-09-30 19:05:40.632619+02	2015-09-30 19:05:40.632619+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
8	\N	test3	To jest opis tego co mam zrobic na treningu lalaalal 8	f	t	2016-03-13 03:58:59.062514+01	2016-03-13 03:58:59.062514+01	\N	\N	36.879466, 30.667648	\N	\N	2015-11-19	2015-11-19	Poznan	3	3.00	\N	\N	\N	\N	\N	\N	\N	\N
66	\N	xxx-0.783641666173935	To jest opis tego co mam zrobic na treningu lalaalal 66	f	t	2015-10-01 21:41:23.309587+02	2015-10-01 21:41:23.309587+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	\N	xxx-0.305849601048976	To jest opis tego co mam zrobic na treningu lalaalal 16	f	t	2015-09-05 19:25:26.34673+02	2015-09-05 19:25:26.34673+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	\N	demnot12	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 93	\N	t	2016-01-10 00:00:00+01	2016-01-10 00:00:00+01	\N	\N	\N	\N	5c754fc5-4380-441a-9551-7fb2816182d0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
95	\N	xxxxx	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 95	\N	t	2016-01-06 00:00:00+01	2016-01-06 00:00:00+01	\N	\N	\N	\N	c3ff3633-1de8-4aa0-972f-f89331efb52e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
92	\N	asd12	To jest opis tego co mam zrobic na treningu lalaalal 92	\N	t	2016-01-05 00:00:00+01	2016-01-05 00:00:00+01	\N	\N	\N	\N	1c0ab9b1-d840-474c-9f18-e7010d7773c2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	\N	asd	To jest opis tego co mam zrobic na treningu lalaalal 94	\N	t	2016-01-05 00:00:00+01	2016-01-05 00:00:00+01	\N	\N	\N	\N	8799a671-553c-4b8b-884e-4acc6fb011f6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	\N	xxx-0.368662232998759	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 19	f	t	2016-05-30 17:17:03.17722+02	2016-05-30 17:17:03.17722+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
69	\N	xxx-0.737796194851398	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 69	f	t	2015-02-16 19:51:17.177522+01	2015-02-16 19:51:17.177522+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
75	\N	xxx-0.42068531177938	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 75	f	t	2015-03-11 09:16:22.291433+01	2015-03-11 09:16:22.291433+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
81	\N	xxx-0.275586196221411	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 81	f	t	2016-03-08 01:00:33.006513+01	2016-03-08 01:00:33.006513+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2
37	\N	xxx-0.180605698376894	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 37	f	t	2016-05-31 05:54:53.631722+02	2016-05-31 05:54:53.631722+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
22	\N	xxx-0.386244779452682	To jest opis tego co mam zrobic na treningu lalaalal 22	f	t	2015-12-25 09:18:25.916657+01	2015-12-25 09:18:25.916657+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	\N	xxx-0.284212389029562	To jest opis tego co mam zrobic na treningu lalaalal 72	f	t	2016-03-30 02:11:45.295587+02	2016-03-30 02:11:45.295587+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	\N	xxx-0.820278588216752	To jest opis tego co mam zrobic na treningu lalaalal 78	f	t	2015-12-22 17:11:48.574192+01	2015-12-22 17:11:48.574192+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	\N	xxx-0.872099430300295	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 43	f	t	2015-01-22 11:33:31.257923+01	2015-01-22 11:33:31.257923+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
49	\N	xxx-0.934490186627954	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 49	f	t	2015-02-27 05:28:21.286524+01	2015-02-27 05:28:21.286524+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
55	\N	xxx-0.363838663790375	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 55	f	t	2016-05-05 11:02:44.095418+02	2016-05-05 11:02:44.095418+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
61	\N	xxx-0.196761534083635	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 61	f	t	2015-01-15 03:06:55.586742+01	2015-01-15 03:06:55.586742+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	2
17	\N	xxx-0.254051659721881	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 17	f	t	2015-08-08 02:59:51.918105+02	2015-08-08 02:59:51.918105+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
23	\N	xxx-0.383089780807495	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 23	f	t	2015-06-25 08:25:52.98932+02	2015-06-25 08:25:52.98932+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
29	\N	xxx-0.248506226576865	To jest opis tego co mam zrobic na treningu lalaalal\ncos tam ejscze\na potem cos jescze\ni jescze\n 29	f	t	2015-11-23 04:24:40.517363+01	2015-11-23 04:24:40.517363+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	2
40	\N	xxx-0.563191657420248	To jest opis tego co mam zrobic na treningu lalaalal 40	f	t	2015-07-21 20:36:57.362824+02	2015-07-21 20:36:57.362824+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	\N	xxx-0.0231418418698013	To jest opis tego co mam zrobic na treningu lalaalal 46	f	t	2015-11-07 16:20:30.856842+01	2015-11-07 16:20:30.856842+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	\N	xxx-0.97491561435163	To jest opis tego co mam zrobic na treningu lalaalal 52	f	t	2015-09-19 19:28:48.739067+02	2015-09-19 19:28:48.739067+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	\N	xxx-0.941158581059426	To jest opis tego co mam zrobic na treningu lalaalal 58	f	t	2015-09-13 13:20:45.892743+02	2015-09-13 13:20:45.892743+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	\N	xxx-0.0189477275125682	To jest opis tego co mam zrobic na treningu lalaalal 64	f	t	2015-01-29 14:10:20.400628+01	2015-01-29 14:10:20.400628+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	\N	xxx-0.0679361037909985	To jest opis tego co mam zrobic na treningu lalaalal 14	f	t	2015-09-15 14:12:18.428855+02	2015-09-15 14:12:18.428855+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	\N	xxx-0.0946216778829694	To jest opis tego co mam zrobic na treningu lalaalal 20	f	t	2015-04-08 06:06:46.979476+02	2015-04-08 06:06:46.979476+02	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	\N	xxx-0.219180395826697	To jest opis tego co mam zrobic na treningu lalaalal 26	f	t	2016-02-20 03:33:08.36024+01	2016-02-20 03:33:08.36024+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	\N	xxx-0.00489101931452751	To jest opis tego co mam zrobic na treningu lalaalal 32	f	t	2016-02-06 07:36:15.792638+01	2016-02-06 07:36:15.792638+01	\N	\N	\N	\N	\N	2015-12-15	2015-12-15	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2013 (class 0 OID 24887)
-- Dependencies: 173
-- Data for Name: events_invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_invitations (id, eventid, userid, inviteby, cdate, stan) FROM stdin;
2	61	5	2	2016-01-28	1002
3	61	6	2	2016-01-28	1002
5	61	8	2	2016-01-28	1002
6	61	9	2	2016-01-28	1002
8	61	11	2	2016-01-28	1002
9	61	12	2	2016-01-28	1002
11	61	14	2	2016-01-28	1002
12	61	15	2	2016-01-28	1002
14	61	17	2	2016-01-28	1002
15	61	18	2	2016-01-28	1002
1	61	4	2	2016-01-28	1001
4	61	7	2	2016-01-28	1001
7	61	10	2	2016-01-28	1001
10	61	13	2	2016-01-28	1001
13	61	16	2	2016-01-28	1001
\.


--
-- TOC entry 2015 (class 0 OID 24930)
-- Dependencies: 177
-- Data for Name: forum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY forum (id, event_id, commenterid, msg_title, msg, cdate) FROM stdin;
\.


--
-- TOC entry 1999 (class 0 OID 16424)
-- Dependencies: 145
-- Data for Name: grupy_treningowe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupy_treningowe (id, owner_id, nazwa, cdate) FROM stdin;
1	1	42423	2015-09-16
2	1	lalalala	2015-10-18
\.


--
-- TOC entry 1998 (class 0 OID 16412)
-- Dependencies: 143
-- Data for Name: klient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY klient (id, imie, nazwisko, email, login, cdate, password) FROM stdin;
1	5345	5345	5345	534	2015-09-01	\N
2	dasd	dasd	das	das	2015-09-08	\N
3	aaaaaa	aaaaa			\N	\N
\.


--
-- TOC entry 2008 (class 0 OID 24751)
-- Dependencies: 163
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY msg (uid, from_user_id, to_user_id, stan) FROM stdin;
\.


--
-- TOC entry 2010 (class 0 OID 24810)
-- Dependencies: 167
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photos (id, userid, url, visible, cdate) FROM stdin;
2	2	12007154_933945706678721_1726029017_n.jpg	1	\N
\.


--
-- TOC entry 2014 (class 0 OID 24913)
-- Dependencies: 175
-- Data for Name: slowniki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY slowniki (id, nazwa) FROM stdin;
1000	Stany zaproszen
\.


--
-- TOC entry 2005 (class 0 OID 24690)
-- Dependencies: 157
-- Data for Name: usercalendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usercalendars (uid, userid, calendarid, owner_id) FROM stdin;
1	2	1	2
2	2	2	2
3	2	3	2
\.


--
-- TOC entry 2007 (class 0 OID 24732)
-- Dependencies: 161
-- Data for Name: usercontacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usercontacts (uid, user_id, contact_id) FROM stdin;
1	2	2
2	2	5
\.


--
-- TOC entry 2003 (class 0 OID 24616)
-- Dependencies: 153
-- Data for Name: userevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userevents (uid, user_id, event_id, stan, duration, distance, kalorie, uwagi, link, completed) FROM stdin;
1	2	4	0	0.5	3.00	\N	Uwagi od trenera 4	\N	f
2	2	5	\N	1.0	3.75	\N	Uwagi od trenera 5	\N	t
4	2	10	\N	2.0	7.50	\N	Uwagi od trenera 10	\N	f
7	2	8	0	1.5	6.00	\N	Uwagi od trenera 8	\N	f
8	2	3	0	-1.0	2.25	\N	Uwagi od trenera 3	\N	t
10	2	3	\N	-2.0	2.25	\N	Uwagi od trenera 3	\N	t
13	2	11	0	1.5	8.25	\N	Uwagi od trenera 11	\N	t
14	2	12	0	2.0	9.00	\N	Uwagi od trenera 12	\N	f
16	2	14	0	0.0	10.50	\N	Uwagi od trenera 14	\N	f
17	2	15	0	0.5	11.25	\N	Uwagi od trenera 15	\N	t
19	2	17	0	1.5	12.75	\N	Uwagi od trenera 17	\N	t
20	2	18	0	2.0	13.50	\N	Uwagi od trenera 18	\N	f
15	2	13	1	2.5	9.75	\N	Uwagi od trenera 13	\N	t
18	2	16	1	1.0	12.00	\N	Uwagi od trenera 16	\N	f
21	2	19	1	2.5	14.25	\N	Uwagi od trenera 19	\N	t
24	2	22	1	1.0	16.50	\N	Uwagi od trenera 22	\N	f
27	2	25	1	2.5	18.75	\N	Uwagi od trenera 25	\N	t
30	2	28	1	1.0	21.00	\N	Uwagi od trenera 28	\N	f
33	2	31	1	2.5	23.25	\N	Uwagi od trenera 31	\N	t
36	2	34	1	1.0	25.50	\N	Uwagi od trenera 34	\N	f
39	2	37	1	2.5	27.75	\N	Uwagi od trenera 37	\N	t
42	2	40	1	1.0	30.00	\N	Uwagi od trenera 40	\N	f
87	\N	64	\N	15	0.2	20	xxx		f
52	2	50	0	0.0	37.50		Uwagi od trenera 50		f
22	2	20	0	0.0	15.00	\N	Uwagi od trenera 20	\N	f
23	2	21	0	0.5	15.75	\N	Uwagi od trenera 21	\N	t
25	2	23	0	1.5	17.25	\N	Uwagi od trenera 23	\N	t
26	2	24	0	2.0	18.00	\N	Uwagi od trenera 24	\N	f
28	2	26	0	0.0	19.50	\N	Uwagi od trenera 26	\N	f
29	2	27	0	0.5	20.25	\N	Uwagi od trenera 27	\N	t
31	2	29	0	1.5	21.75	\N	Uwagi od trenera 29	\N	t
32	2	30	0	2.0	22.50	\N	Uwagi od trenera 30	\N	f
34	2	32	0	0.0	24.00	\N	Uwagi od trenera 32	\N	f
35	2	33	0	0.5	24.75	\N	Uwagi od trenera 33	\N	t
37	2	35	0	1.5	26.25	\N	Uwagi od trenera 35	\N	t
38	2	36	0	2.0	27.00	\N	Uwagi od trenera 36	\N	f
40	2	38	0	0.0	28.50	\N	Uwagi od trenera 38	\N	f
41	2	39	0	0.5	29.25	\N	Uwagi od trenera 39	\N	t
43	2	41	0	1.5	30.75	\N	Uwagi od trenera 41	\N	t
44	2	42	0	2.0	31.50	\N	Uwagi od trenera 42	\N	f
46	2	44	0	0.0	33.00	\N	Uwagi od trenera 44	\N	f
47	2	45	0	0.5	33.75	\N	Uwagi od trenera 45	\N	t
49	2	47	0	1.5	35.25	\N	Uwagi od trenera 47	\N	t
50	2	48	0	2.0	36.00	\N	Uwagi od trenera 48	\N	f
53	2	51	0	0.5	38.25	\N	Uwagi od trenera 51	\N	t
55	2	53	0	1.5	39.75	\N	Uwagi od trenera 53	\N	t
56	2	54	0	2.0	40.50	\N	Uwagi od trenera 54	\N	f
58	2	56	0	0.0	42.00	\N	Uwagi od trenera 56	\N	f
59	2	57	0	0.5	42.75	\N	Uwagi od trenera 57	\N	t
61	2	59	0	1.5	44.25	\N	Uwagi od trenera 59	\N	t
62	2	60	0	2.0	45.00	\N	Uwagi od trenera 60	\N	f
64	2	62	0	0.0	46.50	\N	Uwagi od trenera 62	\N	f
65	2	63	0	0.5	47.25	\N	Uwagi od trenera 63	\N	t
67	2	65	0	1.5	48.75	\N	Uwagi od trenera 65	\N	t
68	2	66	0	2.0	49.50	\N	Uwagi od trenera 66	\N	f
70	2	68	0	0.0	51.00	\N	Uwagi od trenera 68	\N	f
71	2	69	0	0.5	51.75	\N	Uwagi od trenera 69	\N	t
73	2	71	0	1.5	53.25	\N	Uwagi od trenera 71	\N	t
74	2	72	0	2.0	54.00	\N	Uwagi od trenera 72	\N	f
76	2	74	0	0.0	55.50	\N	Uwagi od trenera 74	\N	f
77	2	75	0	0.5	56.25	\N	Uwagi od trenera 75	\N	t
79	2	77	0	1.5	57.75	\N	Uwagi od trenera 77	\N	t
80	2	78	0	2.0	58.50	\N	Uwagi od trenera 78	\N	f
82	2	80	0	0.0	60.00	\N	Uwagi od trenera 80	\N	f
83	2	81	0	0.5	60.75	\N	Uwagi od trenera 81	\N	t
85	2	83	0	1.5	62.25	\N	Uwagi od trenera 83	\N	t
3	2	6	1	1.5	4.50	\N	Uwagi od trenera 6	\N	f
6	2	9	1	0.0	6.75	\N	Uwagi od trenera 9	\N	t
9	2	8	1	0.5	6.00	\N	Uwagi od trenera 8	\N	f
12	2	7	1	1.0	5.25	\N	Uwagi od trenera 7	\N	t
45	2	43	1	2.5	32.25	\N	Uwagi od trenera 43	\N	t
48	2	46	1	1.0	34.50	\N	Uwagi od trenera 46	\N	f
51	2	49	1	2.5	36.75	\N	Uwagi od trenera 49	\N	t
54	2	52	1	1.0	39.00	\N	Uwagi od trenera 52	\N	f
57	2	55	1	2.5	41.25	\N	Uwagi od trenera 55	\N	t
60	2	58	1	1.0	43.50	\N	Uwagi od trenera 58	\N	f
63	2	61	1	2.5	45.75	\N	Uwagi od trenera 61	\N	t
69	2	67	1	2.5	50.25	\N	Uwagi od trenera 67	\N	t
72	2	70	1	1.0	52.50	\N	Uwagi od trenera 70	\N	f
75	2	73	1	2.5	54.75	\N	Uwagi od trenera 73	\N	t
78	2	76	1	1.0	57.00	\N	Uwagi od trenera 76	\N	f
81	2	79	1	2.5	59.25	\N	Uwagi od trenera 79	\N	t
84	2	82	1	1.0	61.50	\N	Uwagi od trenera 82	\N	f
66	2	64	1	1.0	48.00		Uwagi od trenera 64	onet,ok	t
\.


--
-- TOC entry 2002 (class 0 OID 24601)
-- Dependencies: 151
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (uid, uname, password, email, user_type_id, hashcode, state, city, r_val, b_val, s_val, t_val) FROM stdin;
3	alicja	alicja	alicja@wp.pl	1	\N	mazowieckie	warszawa	0	0	0	0
4	Jan	pass	Jan@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
5	Stanisław	pass	Stanisław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
6	Andrzej	pass	Andrzej@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
7	Józef	pass	Józef@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
8	Tadeusz	pass	Tadeusz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
9	Jerzy	pass	Jerzy@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
10	Zbigniew	pass	Zbigniew@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
11	Krzysztof	pass	Krzysztof@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
12	Henryk	pass	Henryk@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
13	Ryszard	pass	Ryszard@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
14	Kazimierz	pass	Kazimierz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
15	Marek	pass	Marek@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
16	Marian	pass	Marian@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
17	Piotr	pass	Piotr@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
18	Janusz	pass	Janusz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
19	Władysław	pass	Władysław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
20	Adam	pass	Adam@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
21	Wiesław	pass	Wiesław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
22	Zdzisław	pass	Zdzisław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
23	Edward	pass	Edward@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
24	Mieczysław	pass	Mieczysław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
25	Roman	pass	Roman@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
26	Mirosław	pass	Mirosław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
27	Grzegorz	pass	Grzegorz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
28	Stanisław	pass	Stanisław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
29	Andrzej	pass	Andrzej@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
30	Józef	pass	Józef@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
31	Tadeusz	pass	Tadeusz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
32	Jerzy	pass	Jerzy@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
33	Zbigniew	pass	Zbigniew@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
34	Krzysztof	pass	Krzysztof@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
35	Henryk	pass	Henryk@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
36	Ryszard	pass	Ryszard@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
37	Kazimierz	pass	Kazimierz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
38	Marek	pass	Marek@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
39	Marian	pass	Marian@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
40	Piotr	pass	Piotr@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
41	Janusz	pass	Janusz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
42	Władysław	pass	Władysław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
43	Adam	pass	Adam@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
44	Wiesław	pass	Wiesław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
45	Zdzisław	pass	Zdzisław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
46	Edward	pass	Edward@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
47	Mieczysław	pass	Mieczysław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
48	Roman	pass	Roman@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
49	Mirosław	pass	Mirosław@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
50	Grzegorz	pass	Grzegorz@wp.pl	1	\N	Mazowieckie	Warszawa	0	0	0	0
2	ala	ala	ala	1	\N	ala	ala	1	1	1	1
\.


--
-- TOC entry 2009 (class 0 OID 24782)
-- Dependencies: 165
-- Data for Name: wartosci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wartosci (id, nazwa, slownik_id) FROM stdin;
1	Półmaraton	1
1001	Zaproszenie zaakceptowane	1000
1002	Zaproszenie oczekujące	1000
\.


--
-- TOC entry 2000 (class 0 OID 16470)
-- Dependencies: 147
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workouts (id, title, date_from, date_to, date_shift, shit_type, gmap_cords, is_allday, is_public, keywords, is_toremind, cuser, cdate, mdate) FROM stdin;
\.


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


-- Completed on 2016-01-28 16:14:51

--
-- PostgreSQL database dump complete
--


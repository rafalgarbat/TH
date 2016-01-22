CREATE TABLE grups (
    id integer NOT NULL,
    tytul text,
    opis text,
    keywords text,
    cdate date DEFAULT now(),
    mdate date DEFAULT now()
  
);


ALTER TABLE public.grups OWNER TO postgres;



CREATE SEQUENCE grups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grups_id_seq OWNER TO postgres;



ALTER SEQUENCE grups_id_seq OWNED BY grups.id;


ALTER TABLE ONLY grups ALTER COLUMN id SET DEFAULT nextval('grups_id_seq'::regclass);

ALTER TABLE ONLY grups
    ADD CONSTRAINT grups_pkey PRIMARY KEY (id);


CREATE OR REPLACE TABLE usergrups (
    uid integer NOT NULL,
	user_id integer  REFERENCES users (uid),
	grups_id integer REFERENCES grups (id),
    name text
);


ALTER TABLE public.usergrups OWNER TO postgres;


CREATE SEQUENCE usergrups_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usergrups_uid_seq OWNER TO postgres;


ALTER SEQUENCE usergrups_uid_seq OWNED BY usergrups.uid;

ALTER TABLE ONLY usergrups ALTER COLUMN uid SET DEFAULT nextval('usergrups_uid_seq'::regclass);

ALTER TABLE ONLY usergrups
    ADD CONSTRAINT usergrups_pkey PRIMARY KEY (uid);

    ALTER TABLE ONLY usergrups
    ADD CONSTRAINT usergrups_grup_id_fkey FOREIGN KEY (grup_id) REFERENCES grups(id);



ALTER TABLE ONLY usergrups
    ADD CONSTRAINT usergrups_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(uid);





--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor_film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor_film (
    actor_id integer DEFAULT 0 NOT NULL,
    film_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.actor_film OWNER TO postgres;

--
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    name character varying(100) DEFAULT 'noname'::character varying NOT NULL,
    date_of_birth date DEFAULT '1970-01-01'::date NOT NULL
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_actor_id_seq OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- Name: director_film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director_film (
    director_id integer DEFAULT 0 NOT NULL,
    film_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.director_film OWNER TO postgres;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    director_id integer NOT NULL,
    name character varying(100) DEFAULT 'noname'::character varying NOT NULL,
    date_of_birth date DEFAULT '1970-01-01'::date NOT NULL
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_director_id_seq OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    genre character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    film_id integer NOT NULL,
    title character varying(200),
    year_of_release integer DEFAULT 0 NOT NULL,
    genre_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_id_seq OWNER TO postgres;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.film_id;


--
-- Name: oscar_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oscar_actor (
    nomination_id integer DEFAULT 0 NOT NULL,
    actor_id integer DEFAULT 0 NOT NULL,
    film_id integer DEFAULT 0 NOT NULL,
    win_or_nominated character varying(10) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.oscar_actor OWNER TO postgres;

--
-- Name: oscar_director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oscar_director (
    nomination_id integer DEFAULT 0 NOT NULL,
    director_id integer DEFAULT 0 NOT NULL,
    film_id integer DEFAULT 0 NOT NULL,
    win_or_nominated character varying(10) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.oscar_director OWNER TO postgres;

--
-- Name: oscar_film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oscar_film (
    nomination_id integer DEFAULT 0 NOT NULL,
    film_id integer DEFAULT 0 NOT NULL,
    win_or_nominated character varying(10) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.oscar_film OWNER TO postgres;

--
-- Name: oscar_nomination; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oscar_nomination (
    id integer NOT NULL,
    nomination character varying(200) DEFAULT 'noname'::character varying NOT NULL
);


ALTER TABLE public.oscar_nomination OWNER TO postgres;

--
-- Name: oscar_nomination_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oscar_nomination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oscar_nomination_id_seq OWNER TO postgres;

--
-- Name: oscar_nomination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oscar_nomination_id_seq OWNED BY public.oscar_nomination.id;


--
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- Name: directors director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: movies film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN film_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- Name: oscar_nomination id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oscar_nomination ALTER COLUMN id SET DEFAULT nextval('public.oscar_nomination_id_seq'::regclass);


--
-- Data for Name: actor_film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor_film (actor_id, film_id) FROM stdin;
1	1
2	2
3	3
4	4
4	2
5	4
5	5
\.


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, name, date_of_birth) FROM stdin;
1	Morgan Freeman	1937-06-01
2	Marlon Brando	1924-04-03
3	Christian Bale	1974-01-30
4	Al Pacino	1940-04-25
5	Robert De Niro	1943-08-17
\.


--
-- Data for Name: director_film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director_film (director_id, film_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (director_id, name, date_of_birth) FROM stdin;
1	Frank Darabont	1959-01-28
3	Christopher Nolan	1970-07-30
4	Quentin Tarantino	1963-03-27
2	Francis Ford Coppola	1939-04-07
5	Martin Scorsese	1942-11-17
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, genre) FROM stdin;
1	horror
2	drama
3	action
4	thriller
5	comedy
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (film_id, title, year_of_release, genre_id) FROM stdin;
1	The Shawshank Redemption	1994	2
3	The Dark Knight	2008	3
4	Heat	1995	4
5	Taxi Driver	1976	2
2	The Godfather	1972	4
\.


--
-- Data for Name: oscar_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oscar_actor (nomination_id, actor_id, film_id, win_or_nominated) FROM stdin;
5	1	1	win
2	2	2	win
5	4	2	win
2	5	5	nominated
2	3	3	nominated
\.


--
-- Data for Name: oscar_director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oscar_director (nomination_id, director_id, film_id, win_or_nominated) FROM stdin;
3	2	2	win
3	1	1	nominated
3	3	3	nominated
3	4	4	nominated
3	5	5	nominated
\.


--
-- Data for Name: oscar_film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oscar_film (nomination_id, film_id, win_or_nominated) FROM stdin;
1	1	win
1	2	win
1	5	win
4	2	win
1	3	nominated
\.


--
-- Data for Name: oscar_nomination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oscar_nomination (id, nomination) FROM stdin;
1	Best film
2	Best actor in a leading role
3	Best director
4	Best screenplay
5	Best actor in a supporting role
\.


--
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 5, true);


--
-- Name: directors_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_director_id_seq', 5, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 5, true);


--
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 5, true);


--
-- Name: oscar_nomination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oscar_nomination_id_seq', 5, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (film_id);


--
-- Name: oscar_nomination oscar_nomination_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oscar_nomination
    ADD CONSTRAINT oscar_nomination_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


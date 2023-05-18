--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
-- Name: user_name; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_name (
    user_id integer NOT NULL,
    name character varying(25) NOT NULL,
    amount_of_games integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.user_name OWNER TO freecodecamp;

--
-- Name: user_name_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_name_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_name_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_name_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_name_user_id_seq OWNED BY public.user_name.user_id;


--
-- Name: user_name user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_name ALTER COLUMN user_id SET DEFAULT nextval('public.user_name_user_id_seq'::regclass);


--
-- Data for Name: user_name; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_name VALUES (102, 'user_1684424438117', 2, 996);
INSERT INTO public.user_name VALUES (101, 'user_1684424438118', 5, 535);
INSERT INTO public.user_name VALUES (104, 'user_1684424456155', 2, 0);
INSERT INTO public.user_name VALUES (103, 'user_1684424456156', 5, 0);
INSERT INTO public.user_name VALUES (106, 'user_1684424612740', 1, 0);
INSERT INTO public.user_name VALUES (105, 'user_1684424612741', 2, 0);
INSERT INTO public.user_name VALUES (107, 's', 1, 0);


--
-- Name: user_name_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_name_user_id_seq', 107, true);


--
-- Name: user_name user_name_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_name
    ADD CONSTRAINT user_name_name_key UNIQUE (name);


--
-- Name: user_name user_name_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_name
    ADD CONSTRAINT user_name_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

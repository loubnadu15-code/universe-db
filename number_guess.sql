--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL,
    secret_number integer NOT NULL,
    played_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 487, 486, '2026-01-03 13:01:50.365406');
INSERT INTO public.games VALUES (2, 1, 794, 793, '2026-01-03 13:01:50.558251');
INSERT INTO public.games VALUES (3, 2, 241, 240, '2026-01-03 13:01:50.718742');
INSERT INTO public.games VALUES (4, 2, 812, 811, '2026-01-03 13:01:50.906238');
INSERT INTO public.games VALUES (5, 1, 227, 224, '2026-01-03 13:01:51.060812');
INSERT INTO public.games VALUES (6, 1, 814, 812, '2026-01-03 13:01:51.251703');
INSERT INTO public.games VALUES (7, 1, 427, 426, '2026-01-03 13:01:51.412369');
INSERT INTO public.games VALUES (8, 3, 13, 824, '2026-01-03 13:03:17.97575');
INSERT INTO public.games VALUES (9, 4, 180, 179, '2026-01-03 13:08:20.658');
INSERT INTO public.games VALUES (10, 4, 349, 348, '2026-01-03 13:08:20.825769');
INSERT INTO public.games VALUES (11, 5, 806, 805, '2026-01-03 13:08:21.112311');
INSERT INTO public.games VALUES (12, 5, 792, 791, '2026-01-03 13:08:21.311339');
INSERT INTO public.games VALUES (13, 4, 402, 399, '2026-01-03 13:08:21.495362');
INSERT INTO public.games VALUES (14, 4, 741, 740, '2026-01-03 13:08:21.677087');
INSERT INTO public.games VALUES (15, 4, 849, 848, '2026-01-03 13:08:21.878704');
INSERT INTO public.games VALUES (16, 6, 566, 565, '2026-01-03 13:18:08.870905');
INSERT INTO public.games VALUES (17, 6, 360, 359, '2026-01-03 13:18:09.045029');
INSERT INTO public.games VALUES (18, 7, 753, 752, '2026-01-03 13:18:09.248627');
INSERT INTO public.games VALUES (19, 7, 277, 276, '2026-01-03 13:18:09.411784');
INSERT INTO public.games VALUES (20, 6, 216, 213, '2026-01-03 13:18:09.590787');
INSERT INTO public.games VALUES (21, 6, 798, 797, '2026-01-03 13:18:09.787446');
INSERT INTO public.games VALUES (22, 6, 213, 212, '2026-01-03 13:18:09.966917');
INSERT INTO public.games VALUES (23, 8, 260, 259, '2026-01-03 13:21:17.278987');
INSERT INTO public.games VALUES (24, 8, 665, 664, '2026-01-03 13:21:17.461734');
INSERT INTO public.games VALUES (25, 9, 581, 580, '2026-01-03 13:21:17.642821');
INSERT INTO public.games VALUES (26, 9, 917, 916, '2026-01-03 13:21:17.839453');
INSERT INTO public.games VALUES (27, 8, 442, 439, '2026-01-03 13:21:18.006722');
INSERT INTO public.games VALUES (28, 8, 818, 817, '2026-01-03 13:21:18.191035');
INSERT INTO public.games VALUES (29, 8, 273, 272, '2026-01-03 13:21:18.382508');
INSERT INTO public.games VALUES (30, 10, 272, 271, '2026-01-03 13:22:12.237534');
INSERT INTO public.games VALUES (31, 10, 583, 582, '2026-01-03 13:22:12.43944');
INSERT INTO public.games VALUES (32, 11, 331, 330, '2026-01-03 13:22:12.615718');
INSERT INTO public.games VALUES (33, 11, 396, 395, '2026-01-03 13:22:12.807474');
INSERT INTO public.games VALUES (34, 10, 754, 751, '2026-01-03 13:22:12.993755');
INSERT INTO public.games VALUES (35, 10, 711, 710, '2026-01-03 13:22:13.18228');
INSERT INTO public.games VALUES (36, 10, 155, 154, '2026-01-03 13:22:13.330306');
INSERT INTO public.games VALUES (37, 12, 938, 937, '2026-01-03 13:27:25.190051');
INSERT INTO public.games VALUES (38, 12, 504, 503, '2026-01-03 13:27:25.365922');
INSERT INTO public.games VALUES (39, 13, 390, 389, '2026-01-03 13:27:25.571201');
INSERT INTO public.games VALUES (40, 13, 363, 362, '2026-01-03 13:27:25.74735');
INSERT INTO public.games VALUES (41, 12, 175, 172, '2026-01-03 13:27:25.929669');
INSERT INTO public.games VALUES (42, 12, 343, 342, '2026-01-03 13:27:26.093872');
INSERT INTO public.games VALUES (43, 12, 519, 518, '2026-01-03 13:27:26.270443');
INSERT INTO public.games VALUES (44, 14, 684, 683, '2026-01-03 13:35:25.950874');
INSERT INTO public.games VALUES (45, 14, 420, 419, '2026-01-03 13:35:26.198193');
INSERT INTO public.games VALUES (46, 15, 116, 115, '2026-01-03 13:35:26.3905');
INSERT INTO public.games VALUES (47, 15, 885, 884, '2026-01-03 13:35:26.584174');
INSERT INTO public.games VALUES (48, 14, 340, 337, '2026-01-03 13:35:26.744038');
INSERT INTO public.games VALUES (49, 14, 385, 384, '2026-01-03 13:35:26.907278');
INSERT INTO public.games VALUES (50, 14, 388, 387, '2026-01-03 13:35:27.075006');
INSERT INTO public.games VALUES (51, 16, 113, 112, '2026-01-03 13:41:37.884821');
INSERT INTO public.games VALUES (52, 16, 281, 280, '2026-01-03 13:41:38.057311');
INSERT INTO public.games VALUES (53, 17, 271, 270, '2026-01-03 13:41:38.215035');
INSERT INTO public.games VALUES (54, 17, 437, 436, '2026-01-03 13:41:38.425285');
INSERT INTO public.games VALUES (55, 16, 531, 528, '2026-01-03 13:41:38.623924');
INSERT INTO public.games VALUES (56, 16, 888, 887, '2026-01-03 13:41:38.824583');
INSERT INTO public.games VALUES (57, 16, 299, 298, '2026-01-03 13:41:39.01007');
INSERT INTO public.games VALUES (58, 18, 868, 867, '2026-01-03 13:44:05.115467');
INSERT INTO public.games VALUES (59, 18, 281, 280, '2026-01-03 13:44:05.286183');
INSERT INTO public.games VALUES (60, 19, 938, 937, '2026-01-03 13:44:05.489409');
INSERT INTO public.games VALUES (61, 19, 564, 563, '2026-01-03 13:44:05.663556');
INSERT INTO public.games VALUES (62, 18, 646, 643, '2026-01-03 13:44:05.844129');
INSERT INTO public.games VALUES (63, 18, 734, 733, '2026-01-03 13:44:06.050998');
INSERT INTO public.games VALUES (64, 18, 561, 560, '2026-01-03 13:44:06.227547');
INSERT INTO public.games VALUES (65, 20, 166, 165, '2026-01-03 13:51:19.727409');
INSERT INTO public.games VALUES (66, 20, 620, 619, '2026-01-03 13:51:19.913059');
INSERT INTO public.games VALUES (67, 21, 53, 52, '2026-01-03 13:51:20.101086');
INSERT INTO public.games VALUES (68, 21, 958, 957, '2026-01-03 13:51:20.306305');
INSERT INTO public.games VALUES (69, 20, 772, 769, '2026-01-03 13:51:20.492535');
INSERT INTO public.games VALUES (70, 20, 917, 916, '2026-01-03 13:51:20.697179');
INSERT INTO public.games VALUES (71, 20, 191, 190, '2026-01-03 13:51:20.853273');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1767463310164');
INSERT INTO public.users VALUES (2, 'user_1767463310163');
INSERT INTO public.users VALUES (3, 'loulouAs');
INSERT INTO public.users VALUES (4, 'user_1767463700482');
INSERT INTO public.users VALUES (5, 'user_1767463700481');
INSERT INTO public.users VALUES (6, 'user_1767464288677');
INSERT INTO public.users VALUES (7, 'user_1767464288676');
INSERT INTO public.users VALUES (8, 'user_1767464477103');
INSERT INTO public.users VALUES (9, 'user_1767464477102');
INSERT INTO public.users VALUES (10, 'user_1767464532055');
INSERT INTO public.users VALUES (11, 'user_1767464532054');
INSERT INTO public.users VALUES (12, 'user_1767464844959');
INSERT INTO public.users VALUES (13, 'user_1767464844958');
INSERT INTO public.users VALUES (14, 'user_1767465325729');
INSERT INTO public.users VALUES (15, 'user_1767465325728');
INSERT INTO public.users VALUES (16, 'user_1767465697724');
INSERT INTO public.users VALUES (17, 'user_1767465697723');
INSERT INTO public.users VALUES (18, 'user_1767465844892');
INSERT INTO public.users VALUES (19, 'user_1767465844891');
INSERT INTO public.users VALUES (20, 'user_1767466279547');
INSERT INTO public.users VALUES (21, 'user_1767466279546');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 71, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


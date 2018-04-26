--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: film; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA film;


ALTER SCHEMA film OWNER TO postgres;

--
-- Name: misc; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA misc;


ALTER SCHEMA misc OWNER TO postgres;

--
-- Name: production; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO postgres;

--
-- Name: staff; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA staff;


ALTER SCHEMA staff OWNER TO postgres;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO postgres;

--
-- Name: zoning; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA zoning;


ALTER SCHEMA zoning OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = film, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: film; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film (
    film_id bigint NOT NULL,
    title character varying(96) NOT NULL,
    running_time smallint,
    budget integer,
    box_office integer,
    release_date date,
    imdb bigint,
    "timestamp" timestamp without time zone DEFAULT now(),
    CONSTRAINT check_positive CHECK ((running_time > 0))
);


ALTER TABLE film OWNER TO postgres;

--
-- Name: film_company; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_company (
    film_id bigint NOT NULL,
    company_id bigint NOT NULL
);


ALTER TABLE film_company OWNER TO postgres;

--
-- Name: film_company_company_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film_company_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film_company_company_id_seq OWNER TO postgres;

--
-- Name: film_company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film_company_company_id_seq OWNED BY film_company.company_id;


--
-- Name: film_country; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_country (
    film_id bigint NOT NULL,
    country_id bigint NOT NULL
);


ALTER TABLE film_country OWNER TO postgres;

--
-- Name: film_country_film_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film_country_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film_country_film_id_seq OWNER TO postgres;

--
-- Name: film_country_film_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film_country_film_id_seq OWNED BY film_country.film_id;


--
-- Name: film_faward; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_faward (
    film_id bigint NOT NULL,
    faward_id bigint NOT NULL
);


ALTER TABLE film_faward OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film_film_id_seq OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film_film_id_seq OWNED BY film.film_id;


--
-- Name: film_genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_genre (
    film_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE film_genre OWNER TO postgres;

--
-- Name: film_human_role; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_human_role (
    film_id bigint NOT NULL,
    human_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE film_human_role OWNER TO postgres;

--
-- Name: film_image; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_image (
    film_id bigint NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE film_image OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE genre (
    genre_id bigint NOT NULL,
    title character varying(64) NOT NULL
);


ALTER TABLE genre OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE genre_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_genre_id_seq OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE genre_genre_id_seq OWNED BY genre.genre_id;


SET search_path = misc, pg_catalog;

--
-- Name: faward; Type: TABLE; Schema: misc; Owner: postgres
--

CREATE TABLE faward (
    faward_id bigint NOT NULL,
    title character varying(32) NOT NULL,
    country bigint
);


ALTER TABLE faward OWNER TO postgres;

--
-- Name: faward_faward_id_seq; Type: SEQUENCE; Schema: misc; Owner: postgres
--

CREATE SEQUENCE faward_faward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE faward_faward_id_seq OWNER TO postgres;

--
-- Name: faward_faward_id_seq; Type: SEQUENCE OWNED BY; Schema: misc; Owner: postgres
--

ALTER SEQUENCE faward_faward_id_seq OWNED BY faward.faward_id;


--
-- Name: haward; Type: TABLE; Schema: misc; Owner: postgres
--

CREATE TABLE haward (
    haward_id bigint NOT NULL,
    title character varying(64) NOT NULL,
    country bigint
);


ALTER TABLE haward OWNER TO postgres;

--
-- Name: haward_haward_id_seq; Type: SEQUENCE; Schema: misc; Owner: postgres
--

CREATE SEQUENCE haward_haward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE haward_haward_id_seq OWNER TO postgres;

--
-- Name: haward_haward_id_seq; Type: SEQUENCE OWNED BY; Schema: misc; Owner: postgres
--

ALTER SEQUENCE haward_haward_id_seq OWNED BY haward.haward_id;


SET search_path = production, pg_catalog;

--
-- Name: company; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE company (
    company_id bigint NOT NULL,
    title character varying(64) NOT NULL,
    description text,
    country bigint,
    headquarters bigint
);


ALTER TABLE company OWNER TO postgres;

--
-- Name: company_company_id_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE company_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company_company_id_seq OWNER TO postgres;

--
-- Name: company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE company_company_id_seq OWNED BY company.company_id;


SET search_path = public, pg_catalog;

--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE image_image_id_seq OWNER TO postgres;

SET search_path = staff, pg_catalog;

--
-- Name: human; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE human (
    human_id bigint NOT NULL,
    name character varying(32) NOT NULL,
    surname character varying(32),
    birthdate date,
    born_country bigint,
    live_country bigint,
    year_active date,
    biography text,
    description text,
    imdb bigint
);


ALTER TABLE human OWNER TO postgres;

--
-- Name: human_haward; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE human_haward (
    human_id bigint NOT NULL,
    haward_id bigint NOT NULL
);


ALTER TABLE human_haward OWNER TO postgres;

--
-- Name: human_human_id_seq; Type: SEQUENCE; Schema: staff; Owner: postgres
--

CREATE SEQUENCE human_human_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE human_human_id_seq OWNER TO postgres;

--
-- Name: human_human_id_seq; Type: SEQUENCE OWNED BY; Schema: staff; Owner: postgres
--

ALTER SEQUENCE human_human_id_seq OWNED BY human.human_id;


--
-- Name: human_image; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE human_image (
    human_id bigint NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE human_image OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE role (
    role_id bigint NOT NULL,
    description character varying(32) NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: staff; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: staff; Owner: postgres
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


SET search_path = storage, pg_catalog;

--
-- Name: image; Type: TABLE; Schema: storage; Owner: postgres
--

CREATE TABLE image (
    image_id bigint DEFAULT nextval('public.image_image_id_seq'::regclass) NOT NULL,
    title character varying(32) NOT NULL,
    description text,
    upload_date timestamp without time zone DEFAULT now() NOT NULL,
    location text NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE image OWNER TO postgres;

--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: storage; Owner: postgres
--

CREATE SEQUENCE image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE image_image_id_seq OWNER TO postgres;

SET search_path = zoning, pg_catalog;

--
-- Name: country; Type: TABLE; Schema: zoning; Owner: postgres
--

CREATE TABLE country (
    country_id bigint NOT NULL,
    title character varying(64) NOT NULL,
    code character varying(2) NOT NULL,
    flag bigint
);


ALTER TABLE country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: zoning; Owner: postgres
--

CREATE SEQUENCE country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: zoning; Owner: postgres
--

ALTER SEQUENCE country_country_id_seq OWNED BY country.country_id;


SET search_path = film, pg_catalog;

--
-- Name: film_id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film ALTER COLUMN film_id SET DEFAULT nextval('film_film_id_seq'::regclass);


--
-- Name: company_id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_company ALTER COLUMN company_id SET DEFAULT nextval('film_company_company_id_seq'::regclass);


--
-- Name: film_id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_country ALTER COLUMN film_id SET DEFAULT nextval('film_country_film_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN genre_id SET DEFAULT nextval('genre_genre_id_seq'::regclass);


SET search_path = misc, pg_catalog;

--
-- Name: faward_id; Type: DEFAULT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY faward ALTER COLUMN faward_id SET DEFAULT nextval('faward_faward_id_seq'::regclass);


--
-- Name: haward_id; Type: DEFAULT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY haward ALTER COLUMN haward_id SET DEFAULT nextval('haward_haward_id_seq'::regclass);


SET search_path = production, pg_catalog;

--
-- Name: company_id; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY company ALTER COLUMN company_id SET DEFAULT nextval('company_company_id_seq'::regclass);


SET search_path = staff, pg_catalog;

--
-- Name: human_id; Type: DEFAULT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human ALTER COLUMN human_id SET DEFAULT nextval('human_human_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


SET search_path = zoning, pg_catalog;

--
-- Name: country_id; Type: DEFAULT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY country ALTER COLUMN country_id SET DEFAULT nextval('country_country_id_seq'::regclass);


SET search_path = film, pg_catalog;

--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film (film_id, title, running_time, budget, box_office, release_date, imdb, "timestamp") FROM stdin;
1	Men in Black	98	90000000	589000000	1997-07-02	119654	2018-04-25 20:22:14.342608
3	Men in Black 2	88	140000000	441800000	2002-07-03	120912	2018-04-25 21:00:47.178714
\.


--
-- Data for Name: film_company; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_company (film_id, company_id) FROM stdin;
1	1
\.


--
-- Name: film_company_company_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film_company_company_id_seq', 1, false);


--
-- Data for Name: film_country; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_country (film_id, country_id) FROM stdin;
1	228
\.


--
-- Name: film_country_film_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film_country_film_id_seq', 1, false);


--
-- Data for Name: film_faward; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_faward (film_id, faward_id) FROM stdin;
1	1
\.


--
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film_film_id_seq', 3, true);


--
-- Data for Name: film_genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_genre (film_id, genre_id) FROM stdin;
1	1
1	2
1	3
\.


--
-- Data for Name: film_human_role; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_human_role (film_id, human_id, role_id) FROM stdin;
1	1	4
1	1	6
\.


--
-- Data for Name: film_image; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_image (film_id, image_id) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY genre (genre_id, title) FROM stdin;
1	Action
2	Comedy
3	Adventure
4	Comedie
5	Crime
6	Drama
7	Historical
8	Horror
\.


--
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('genre_genre_id_seq', 8, true);


SET search_path = misc, pg_catalog;

--
-- Data for Name: faward; Type: TABLE DATA; Schema: misc; Owner: postgres
--

COPY faward (faward_id, title, country) FROM stdin;
1	TEST	228
\.


--
-- Name: faward_faward_id_seq; Type: SEQUENCE SET; Schema: misc; Owner: postgres
--

SELECT pg_catalog.setval('faward_faward_id_seq', 1, true);


--
-- Data for Name: haward; Type: TABLE DATA; Schema: misc; Owner: postgres
--

COPY haward (haward_id, title, country) FROM stdin;
1	Academy Award for Best Supporting Actor	228
2	Golden Globe	228
3	Emmy	228
\.


--
-- Name: haward_haward_id_seq; Type: SEQUENCE SET; Schema: misc; Owner: postgres
--

SELECT pg_catalog.setval('haward_haward_id_seq', 3, true);


SET search_path = production, pg_catalog;

--
-- Data for Name: company; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY company (company_id, title, description, country, headquarters) FROM stdin;
1	Amblin Entertainment	Amblin Entertainment is an American film and television production company founded by director and producer Steven Spielberg, and film producers Kathleen Kennedy and Frank Marshall in 1981. The companys headquarters are located on the backlot of Universal Studios in Universal City, California.	228	228
\.


--
-- Name: company_company_id_seq; Type: SEQUENCE SET; Schema: production; Owner: postgres
--

SELECT pg_catalog.setval('company_company_id_seq', 1, true);


SET search_path = public, pg_catalog;

--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('image_image_id_seq', 1, true);


SET search_path = staff, pg_catalog;

--
-- Data for Name: human; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY human (human_id, name, surname, birthdate, born_country, live_country, year_active, biography, description, imdb) FROM stdin;
1	Tommy	Lee Jones	1946-08-15	228	228	1969-01-01	Jones was born on September 15, 1946,  in San Saba, Texas. His mother, Lucille Marie  (née Scott), was a police officer, school teacher, and beauty shop owner, and his father, Clyde C. Jones, was an oil field worker. The two were married and divorced twice. His family has Cherokee roots. He was raised in Midland, Texas and attended Robert E. Lee High School.	Thomas Lee Jones (born September 15, 1946) is an American actor and filmmaker. He has received four Academy Award nominations, winning Best Supporting Actor for his performance as U.S. Marshal Samuel Gerard in the 1993 thriller film The Fugitive.	2576863
3	Will	Smith	1968-09-25	228	228	1985-01-01	Smith was born on September 25, 1968 in Philadelphia, Pennsylvania, to Caroline (Bright), a Philadelphia school board administrator, and Willard Carroll Smith Sr., U.S. Air Force veteran and refrigeration engineer. He grew up in West Philadelphias Wynnefield neighborhood, and was raised Baptist. He has three siblings, sister Pamela, who is four years older, and twins Harry and Ellen, who are three years younger. Smith attended Our Lady of Lourdes, a private Catholic elementary school in Philadelphia. His parents separated when he was 13, but did not actually divorce until around 2000.	Willard Carroll Smith Jr. (born September 25, 1968) is an American actor, producer, rapper, comedian, and songwriter. In April 2007, Newsweek called him "the most powerful actor in Hollywood". Smith has been nominated for five Golden Globe Awards and two Academy Awards, and has won four Grammy Awards.	226
\.


--
-- Data for Name: human_haward; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY human_haward (human_id, haward_id) FROM stdin;
1	1
1	2
1	3
\.


--
-- Name: human_human_id_seq; Type: SEQUENCE SET; Schema: staff; Owner: postgres
--

SELECT pg_catalog.setval('human_human_id_seq', 3, true);


--
-- Data for Name: human_image; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY human_image (human_id, image_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY role (role_id, description) FROM stdin;
1	Director
2	Producer
3	Screenwriter
4	Actor
5	Composer
6	Singer
7	Songwriter
\.


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: staff; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq', 12, true);


SET search_path = storage, pg_catalog;

--
-- Data for Name: image; Type: TABLE DATA; Schema: storage; Owner: postgres
--

COPY image (image_id, title, description, upload_date, location, type) FROM stdin;
1	simpleimage_test.png	image for some tests	2018-04-25 20:43:46.798837	C:/User/Desktop/	3
\.


--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: storage; Owner: postgres
--

SELECT pg_catalog.setval('image_image_id_seq', 1, false);


SET search_path = zoning, pg_catalog;

--
-- Data for Name: country; Type: TABLE DATA; Schema: zoning; Owner: postgres
--

COPY country (country_id, title, code, flag) FROM stdin;
1	Afghanistan	AF	\N
2	Albania	AL	\N
3	Algeria	DZ	\N
4	American Samoa	AS	\N
5	Andorra	AD	\N
6	Angola	AO	\N
7	Anguilla	AI	\N
8	Antarctica	AQ	\N
9	Antigua And Barbuda	AG	\N
10	Argentina	AR	\N
11	Armenia	AM	\N
12	Aruba	AW	\N
13	Australia	AU	\N
14	Austria	AT	\N
15	Azerbaijan	AZ	\N
16	Bahamas	BS	\N
17	Bahrain	BH	\N
18	Bangladesh	BD	\N
19	Barbados	BB	\N
20	Belarus	BY	\N
21	Belgium	BE	\N
22	Belize	BZ	\N
23	Benin	BJ	\N
24	Bermuda	BM	\N
25	Bhutan	BT	\N
26	Bolivia	BO	\N
27	Bosnia And Herzegovina	BA	\N
28	Botswana	BW	\N
29	Bouvet Island	BV	\N
30	Brazil	BR	\N
31	British Indian Ocean Territory	IO	\N
32	Brunei Darussalam	BN	\N
33	Bulgaria	BG	\N
34	Burkina Faso	BF	\N
35	Burundi	BI	\N
36	Cambodia	KH	\N
37	Cameroon	CM	\N
38	Canada	CA	\N
39	Cape Verde	CV	\N
40	Cayman Islands	KY	\N
41	Central African Republic	CF	\N
42	Chad	TD	\N
43	Chile	CL	\N
44	China	CN	\N
45	Christmas Island	CX	\N
46	Cocos Islands	CC	\N
47	Colombia	CO	\N
48	Comoros	KM	\N
49	Congo	CG	\N
50	Congo The Democratic Republic	CD	\N
51	Cook Islands	CK	\N
52	Costa Rica	CR	\N
53	Cote D'ivoire	CI	\N
54	Croatia	HR	\N
55	Cuba	CU	\N
56	Cyprus	CY	\N
57	Czech Republic	CZ	\N
58	Denmark	DK	\N
59	Djibouti	DJ	\N
60	Dominica	DM	\N
61	Dominican Republic	DO	\N
62	East Timor	TP	\N
63	Ecuador	EC	\N
64	Egypt	EG	\N
65	El Salvador	SV	\N
66	Equatorial Guinea	GQ	\N
67	Eritrea	ER	\N
68	Estonia	EE	\N
69	Ethiopia	ET	\N
70	Falkland Islands	FK	\N
71	Faroe Islands	FO	\N
72	Fiji	FJ	\N
73	Finland	FI	\N
74	France	FR	\N
75	French Guiana	GF	\N
76	French Polynesia	PF	\N
77	French Southern Territories	TF	\N
78	Gabon	GA	\N
79	Gambia	GM	\N
80	Georgia	GE	\N
81	Germany	DE	\N
82	Ghana	GH	\N
83	Gibraltar	GI	\N
84	Greece	GR	\N
85	Greenland	GL	\N
86	Grenada	GD	\N
87	Guadeloupe	GP	\N
88	Guam	GU	\N
89	Guatemala	GT	\N
90	Guinea	GN	\N
91	Guinea-bissau	GW	\N
92	Guyana	GY	\N
93	Haiti	HT	\N
94	Heard Island And Mcdonald Islands	HM	\N
95	Holy See	VA	\N
96	Honduras	HN	\N
97	Hong Kong	HK	\N
98	Hungary	HU	\N
99	Iceland	IS	\N
100	India	IN	\N
101	Indonesia	ID	\N
102	Iran Islamic Republic	IR	\N
103	Iraq	IQ	\N
104	Ireland	IE	\N
105	Israel	IL	\N
106	Italy	IT	\N
107	Jamaica	JM	\N
108	Japan	JP	\N
109	Jordan	JO	\N
110	Kazakstan	KZ	\N
111	Kenya	KE	\N
112	Kiribati	KI	\N
113	Korean Democratic Peoples Republic	KP	\N
114	Korean Republic	KR	\N
115	Kosovo	KV	\N
116	Kuwait	KW	\N
117	Kyrgyzstan	KG	\N
118	Lao Peoples Democratic Republic	LA	\N
119	Latvia	LV	\N
120	Lebanon	LB	\N
121	Lesotho	LS	\N
122	Liberia	LR	\N
123	Libyan Arab Jamahiriya	LY	\N
124	Liechtenstein	LI	\N
125	Lithuania	LT	\N
126	Luxembourg	LU	\N
127	Macau	MO	\N
128	Macedonia	MK	\N
129	Madagascar	MG	\N
130	Malawi	MW	\N
131	Malaysia	MY	\N
132	Maldives	MV	\N
133	Mali	ML	\N
134	Malta	MT	\N
135	Marshall Islands	MH	\N
136	Martinique	MQ	\N
137	Mauritania	MR	\N
138	Mauritius	MU	\N
139	Mayotte	YT	\N
140	Mexico	MX	\N
141	Micronesia Federated States Of	FM	\N
142	Moldova Republic Of	MD	\N
143	Monaco	MC	\N
144	Mongolia	MN	\N
145	Montserrat	MS	\N
146	Montenegro	ME	\N
147	Morocco	MA	\N
148	Mozambique	MZ	\N
149	Myanmar	MM	\N
150	Namibia	NA	\N
151	Nauru	NR	\N
152	Nepal	NP	\N
153	Netherlands	NL	\N
154	Netherlands Antilles	AN	\N
155	New Caledonia	NC	\N
156	New Zealand	NZ	\N
157	Nicaragua	NI	\N
158	Niger	NE	\N
159	Nigeria	NG	\N
160	Niue	NU	\N
161	Norfolk Island	NF	\N
162	Northern Mariana Islands	MP	\N
163	Norway	NO	\N
164	Oman	OM	\N
165	Pakistan	PK	\N
166	Palau	PW	\N
167	Palestinian Territory Occupied	PS	\N
168	Panama	PA	\N
169	Papua New Guinea	PG	\N
170	Paraguay	PY	\N
171	Peru	PE	\N
172	Philippines	PH	\N
173	Pitcairn	PN	\N
174	Poland	PL	\N
175	Portugal	PT	\N
176	Puerto Rico	PR	\N
177	Qatar	QA	\N
178	Reunion	RE	\N
179	Romania	RO	\N
180	Russian Federation	RU	\N
181	Rwanda	RW	\N
182	Saint Helena	SH	\N
183	Saint Kitts	KN	\N
184	Saint Lucia	LC	\N
185	Saint Pierre	PM	\N
186	Saint Vincent	VC	\N
187	Samoa	WS	\N
188	San Marino	SM	\N
189	Sao Tome And Principe	ST	\N
190	Saudi Arabia	SA	\N
191	Senegal	SN	\N
192	Serbia	RS	\N
193	Seychelles	SC	\N
194	Sierra Leone	SL	\N
195	Singapore	SG	\N
196	Slovakia	SK	\N
197	Slovenia	SI	\N
198	Solomon Islands	SB	\N
199	Somalia	SO	\N
200	South Africa	ZA	\N
201	South Georgia	GS	\N
202	Spain	ES	\N
203	Sri Lanka	LK	\N
204	Sudan	SD	\N
205	Suriname	SR	\N
206	Svalbard And Jan Mayen	SJ	\N
207	Swaziland	SZ	\N
208	Sweden	SE	\N
209	Switzerland	CH	\N
210	Syrian Arab Republic	SY	\N
211	Taiwan	TW	\N
212	Tajikistan	TJ	\N
213	Tanzania	TZ	\N
214	Thailand	TH	\N
215	Togo	TG	\N
216	Tokelau	TK	\N
217	Tonga	TO	\N
218	Trinidad And Tobago	TT	\N
219	Tunisia	TN	\N
220	Turkey	TR	\N
221	Turkmenistan	TM	\N
222	Turks And Caicos Islands	TC	\N
223	Tuvalu	TV	\N
224	Uganda	UG	\N
225	Ukraine	UA	\N
226	United Arab Emirates	AE	\N
227	United Kingdom	GB	\N
228	United States	US	\N
229	United States Minor Outlying Islands	UM	\N
230	Uruguay	UY	\N
231	Uzbekistan	UZ	\N
232	Vanuatu	VU	\N
233	Venezuela	VE	\N
234	Viet Nam	VN	\N
235	Virgin Islands	VG	\N
236	Virgin Islands U.S.	VI	\N
237	Wallis And Futuna	WF	\N
238	Western Sahara	EH	\N
239	Yemen	YE	\N
240	Zambia	ZM	\N
241	Zimbabwe	ZW	\N
242	QQQQQ	QQ	\N
\.


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: zoning; Owner: postgres
--

SELECT pg_catalog.setval('country_country_id_seq', 242, true);


SET search_path = film, pg_catalog;

--
-- Name: film_company_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_company
    ADD CONSTRAINT film_company_pkey PRIMARY KEY (film_id, company_id);


--
-- Name: film_country_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_country
    ADD CONSTRAINT film_country_pkey PRIMARY KEY (film_id, country_id);


--
-- Name: film_faward_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_faward
    ADD CONSTRAINT film_faward_pkey PRIMARY KEY (film_id, faward_id);


--
-- Name: film_genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (film_id, genre_id);


--
-- Name: film_human_role_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_human_role
    ADD CONSTRAINT film_human_role_pkey PRIMARY KEY (film_id, human_id, role_id);


--
-- Name: film_image_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_image
    ADD CONSTRAINT film_image_pkey PRIMARY KEY (film_id, image_id);


--
-- Name: film_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


SET search_path = misc, pg_catalog;

--
-- Name: faward_pkey; Type: CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY faward
    ADD CONSTRAINT faward_pkey PRIMARY KEY (faward_id);


--
-- Name: haward_pkey; Type: CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY haward
    ADD CONSTRAINT haward_pkey PRIMARY KEY (haward_id);


SET search_path = production, pg_catalog;

--
-- Name: company_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (company_id);


SET search_path = staff, pg_catalog;

--
-- Name: human_haward_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_haward
    ADD CONSTRAINT human_haward_pkey PRIMARY KEY (human_id, haward_id);


--
-- Name: human_image_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_image
    ADD CONSTRAINT human_image_pkey PRIMARY KEY (human_id, image_id);


--
-- Name: human_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human
    ADD CONSTRAINT human_pkey PRIMARY KEY (human_id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


SET search_path = storage, pg_catalog;

--
-- Name: image_pkey; Type: CONSTRAINT; Schema: storage; Owner: postgres
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (image_id);


SET search_path = zoning, pg_catalog;

--
-- Name: country_pkey; Type: CONSTRAINT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


SET search_path = film, pg_catalog;

--
-- Name: film_company_company_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_company
    ADD CONSTRAINT film_company_company_id_fkey FOREIGN KEY (company_id) REFERENCES production.company(company_id);


--
-- Name: film_company_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_company
    ADD CONSTRAINT film_company_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_country_country_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_country
    ADD CONSTRAINT film_country_country_id_fkey FOREIGN KEY (country_id) REFERENCES zoning.country(country_id);


--
-- Name: film_country_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_country
    ADD CONSTRAINT film_country_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_faward_faward_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_faward
    ADD CONSTRAINT film_faward_faward_id_fkey FOREIGN KEY (faward_id) REFERENCES misc.faward(faward_id);


--
-- Name: film_faward_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_faward
    ADD CONSTRAINT film_faward_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_genre_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genre(genre_id);


--
-- Name: film_human_role_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_human_role
    ADD CONSTRAINT film_human_role_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_human_role_human_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_human_role
    ADD CONSTRAINT film_human_role_human_id_fkey FOREIGN KEY (human_id) REFERENCES staff.human(human_id);


--
-- Name: film_human_role_role_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_human_role
    ADD CONSTRAINT film_human_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES staff.role(role_id);


--
-- Name: film_image_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_image
    ADD CONSTRAINT film_image_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id);


--
-- Name: film_image_image_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_image
    ADD CONSTRAINT film_image_image_id_fkey FOREIGN KEY (image_id) REFERENCES storage.image(image_id);


SET search_path = misc, pg_catalog;

--
-- Name: faward_country_fkey; Type: FK CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY faward
    ADD CONSTRAINT faward_country_fkey FOREIGN KEY (country) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


--
-- Name: haward_country_fkey; Type: FK CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY haward
    ADD CONSTRAINT haward_country_fkey FOREIGN KEY (country) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


SET search_path = production, pg_catalog;

--
-- Name: company_country_fkey; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_country_fkey FOREIGN KEY (country) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


--
-- Name: company_headquarters_fkey; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_headquarters_fkey FOREIGN KEY (headquarters) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


SET search_path = staff, pg_catalog;

--
-- Name: human_born_country_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human
    ADD CONSTRAINT human_born_country_fkey FOREIGN KEY (born_country) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


--
-- Name: human_haward_haward_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_haward
    ADD CONSTRAINT human_haward_haward_id_fkey FOREIGN KEY (haward_id) REFERENCES misc.haward(haward_id);


--
-- Name: human_haward_human_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_haward
    ADD CONSTRAINT human_haward_human_id_fkey FOREIGN KEY (human_id) REFERENCES human(human_id);


--
-- Name: human_image_human_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_image
    ADD CONSTRAINT human_image_human_id_fkey FOREIGN KEY (human_id) REFERENCES human(human_id);


--
-- Name: human_image_image_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human_image
    ADD CONSTRAINT human_image_image_id_fkey FOREIGN KEY (image_id) REFERENCES storage.image(image_id);


--
-- Name: human_live_country_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY human
    ADD CONSTRAINT human_live_country_fkey FOREIGN KEY (live_country) REFERENCES zoning.country(country_id) ON DELETE SET NULL;


SET search_path = zoning, pg_catalog;

--
-- Name: country_flag_fkey; Type: FK CONSTRAINT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_flag_fkey FOREIGN KEY (flag) REFERENCES storage.image(image_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: film; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film (
    id bigint NOT NULL,
    title character varying(96) NOT NULL,
    imdb bigint,
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    running_time smallint,
    release_date smallint
);


ALTER TABLE film.film OWNER TO postgres;

--
-- Name: film_country; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_country (
    film_id bigint NOT NULL,
    country_id bigint NOT NULL
);


ALTER TABLE film.film_country OWNER TO postgres;

--
-- Name: film_genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_genre (
    film_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE film.film_genre OWNER TO postgres;

--
-- Name: film_human; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_human (
    film_id bigint NOT NULL,
    human_id bigint NOT NULL
);


ALTER TABLE film.film_human OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.film_id_seq OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film.film_id_seq OWNED BY film.film.id;


--
-- Name: film_production_company; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_production_company (
    film_id bigint NOT NULL,
    production_company_id bigint NOT NULL
);


ALTER TABLE film.film_production_company OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.genre (
    id bigint NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE film.genre OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.genre_id_seq OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film.genre_id_seq OWNED BY film.genre.id;


--
-- Name: country; Type: TABLE; Schema: zoning; Owner: postgres
--

CREATE TABLE zoning.country (
    id bigint NOT NULL,
    title character varying(96) NOT NULL,
    code character varying(2) NOT NULL
);


ALTER TABLE zoning.country OWNER TO postgres;

--
-- Name: v_film; Type: VIEW; Schema: film; Owner: postgres
--

CREATE VIEW film.v_film AS
 SELECT f.id AS film_id,
    f.title AS film_title,
    f.imdb,
    f.running_time,
    f.release_date AS film_release_date,
    c.title AS country,
    g.title AS genre
   FROM ((((film.film f
     JOIN film.film_country fc ON ((f.id = fc.film_id)))
     JOIN zoning.country c ON ((fc.country_id = c.id)))
     JOIN film.film_genre fg ON ((f.id = fg.film_id)))
     JOIN film.genre g ON ((fg.genre_id = g.id)));


ALTER TABLE film.v_film OWNER TO postgres;

--
-- Name: award; Type: TABLE; Schema: misc; Owner: postgres
--

CREATE TABLE misc.award (
    id bigint NOT NULL,
    title character varying(96) NOT NULL,
    country bigint
);


ALTER TABLE misc.award OWNER TO postgres;

--
-- Name: award_id_seq; Type: SEQUENCE; Schema: misc; Owner: postgres
--

CREATE SEQUENCE misc.award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE misc.award_id_seq OWNER TO postgres;

--
-- Name: award_id_seq; Type: SEQUENCE OWNED BY; Schema: misc; Owner: postgres
--

ALTER SEQUENCE misc.award_id_seq OWNED BY misc.award.id;


--
-- Name: production_company; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.production_company (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    country bigint
);


ALTER TABLE production.production_company OWNER TO postgres;

--
-- Name: production_company_id_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production.production_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.production_company_id_seq OWNER TO postgres;

--
-- Name: production_company_id_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production.production_company_id_seq OWNED BY production.production_company.id;


--
-- Name: v_film; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_film AS
 SELECT f.id,
    f.title,
    f.imdb,
    f.running_time,
    f.release_date
   FROM ((film.film f
     JOIN film.film_country fc ON ((f.id = fc.film_id)))
     JOIN zoning.country c ON ((fc.film_id = c.id)));


ALTER TABLE public.v_film OWNER TO postgres;

--
-- Name: human_award; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE staff.human_award (
    human_id bigint NOT NULL,
    award_id bigint NOT NULL
);


ALTER TABLE staff.human_award OWNER TO postgres;

--
-- Name: human_resources; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE staff.human_resources (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    birthdate date,
    year_active smallint,
    imdb bigint
);


ALTER TABLE staff.human_resources OWNER TO postgres;

--
-- Name: human_resources_countries; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE staff.human_resources_countries (
    human_resources_id bigint NOT NULL,
    born_country bigint,
    live_country bigint,
    citizenship bigint
);


ALTER TABLE staff.human_resources_countries OWNER TO postgres;

--
-- Name: human_resources_countries_human_resources_id_seq; Type: SEQUENCE; Schema: staff; Owner: postgres
--

CREATE SEQUENCE staff.human_resources_countries_human_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staff.human_resources_countries_human_resources_id_seq OWNER TO postgres;

--
-- Name: human_resources_countries_human_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: staff; Owner: postgres
--

ALTER SEQUENCE staff.human_resources_countries_human_resources_id_seq OWNED BY staff.human_resources_countries.human_resources_id;


--
-- Name: human_resources_id_seq; Type: SEQUENCE; Schema: staff; Owner: postgres
--

CREATE SEQUENCE staff.human_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staff.human_resources_id_seq OWNER TO postgres;

--
-- Name: human_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: staff; Owner: postgres
--

ALTER SEQUENCE staff.human_resources_id_seq OWNED BY staff.human_resources.id;


--
-- Name: human_role; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE staff.human_role (
    human_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE staff.human_role OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: staff; Owner: postgres
--

CREATE TABLE staff.role (
    id bigint NOT NULL,
    title character varying(32) NOT NULL
);


ALTER TABLE staff.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: staff; Owner: postgres
--

CREATE SEQUENCE staff.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staff.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: staff; Owner: postgres
--

ALTER SEQUENCE staff.role_id_seq OWNED BY staff.role.id;


--
-- Name: country_id_seq; Type: SEQUENCE; Schema: zoning; Owner: postgres
--

CREATE SEQUENCE zoning.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zoning.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: zoning; Owner: postgres
--

ALTER SEQUENCE zoning.country_id_seq OWNED BY zoning.country.id;


--
-- Name: film id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film ALTER COLUMN id SET DEFAULT nextval('film.film_id_seq'::regclass);


--
-- Name: genre id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.genre ALTER COLUMN id SET DEFAULT nextval('film.genre_id_seq'::regclass);


--
-- Name: award id; Type: DEFAULT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY misc.award ALTER COLUMN id SET DEFAULT nextval('misc.award_id_seq'::regclass);


--
-- Name: production_company id; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_company ALTER COLUMN id SET DEFAULT nextval('production.production_company_id_seq'::regclass);


--
-- Name: human_resources id; Type: DEFAULT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources ALTER COLUMN id SET DEFAULT nextval('staff.human_resources_id_seq'::regclass);


--
-- Name: human_resources_countries human_resources_id; Type: DEFAULT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries ALTER COLUMN human_resources_id SET DEFAULT nextval('staff.human_resources_countries_human_resources_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.role ALTER COLUMN id SET DEFAULT nextval('staff.role_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY zoning.country ALTER COLUMN id SET DEFAULT nextval('zoning.country_id_seq'::regclass);


--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film (id, title, imdb, "timestamp", running_time, release_date) FROM stdin;
1	Men in Black	119654	2018-03-31 17:55:38.993291	98	1997
\.


--
-- Data for Name: film_country; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film_country (film_id, country_id) FROM stdin;
1	201
\.


--
-- Data for Name: film_genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film_genre (film_id, genre_id) FROM stdin;
1	2
1	3
1	15
\.


--
-- Data for Name: film_human; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film_human (film_id, human_id) FROM stdin;
\.


--
-- Data for Name: film_production_company; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film_production_company (film_id, production_company_id) FROM stdin;
1	8
1	9
1	10
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.genre (id, title) FROM stdin;
2	Adventure
4	Crime
5	Drama
6	Detective
7	Historical
8	Horror
9	Musical
10	Sci-fi
11	War
12	Western
13	Biopics
14	Disaster
15	Fantasy
3	Comedy
1	Action
\.


--
-- Data for Name: award; Type: TABLE DATA; Schema: misc; Owner: postgres
--

COPY misc.award (id, title, country) FROM stdin;
7	Emmie Award	173
\.


--
-- Data for Name: production_company; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_company (id, title, country) FROM stdin;
1	Edison's Black Maria	\N
2	Paramount Pictures	\N
3	Viacom 18 Motion Pictures	\N
4	Reliance Big Entertainment	\N
5	UTV Motion Pictures	\N
6	Disneynature	\N
7	Touchstone Pictures	\N
8	Columbia Pictures Corporation	\N
9	Amblin Entertainment	\N
10	Parkes+MacDonald Image Nation	\N
\.


--
-- Data for Name: human_award; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY staff.human_award (human_id, award_id) FROM stdin;
\.


--
-- Data for Name: human_resources; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY staff.human_resources (id, name, birthdate, year_active, imdb) FROM stdin;
\.


--
-- Data for Name: human_resources_countries; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY staff.human_resources_countries (human_resources_id, born_country, live_country, citizenship) FROM stdin;
\.


--
-- Data for Name: human_role; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY staff.human_role (human_id, role_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: staff; Owner: postgres
--

COPY staff.role (id, title) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: zoning; Owner: postgres
--

COPY zoning.country (id, title, code) FROM stdin;
1	Afghanistan	AF
2	Albania	AL
3	Algeria	DZ
4	American Samoa	DS
5	Andorra	AD
6	Angola	AO
7	Anguilla	AI
8	Antarctica	AQ
9	Antigua and Barbuda	AG
10	Argentina	AR
11	Armenia	AM
12	Aruba	AW
13	Australia	AU
14	Austria	AT
15	Azerbaijan	AZ
16	Bahamas	BS
17	Bahrain	BH
18	Bangladesh	BD
19	Barbados	BB
20	Belarus	BY
21	Belgium	BE
22	Belize	BZ
23	Benin	BJ
24	Bermuda	BM
25	Bhutan	BT
26	Bolivia	BO
27	Bosnia and Herzegovina	BA
28	Botswana	BW
29	Bouvet Island	BV
30	Brazil	BR
31	British Indian Ocean Territory	IO
32	Brunei Darussalam	BN
33	Bulgaria	BG
34	Burkina Faso	BF
35	Burundi	BI
36	Cambodia	KH
37	Cameroon	CM
38	Canada	CA
39	Cape Verde	CV
40	Cayman Islands	KY
41	Central African Republic	CF
42	Chad	TD
43	Chile	CL
44	China	CN
45	Christmas Island	CX
46	Cocos (Keeling) Islands	CC
47	Colombia	CO
48	Comoros	KM
49	Congo	CG
50	Cook Islands	CK
51	Costa Rica	CR
52	Croatia (Hrvatska)	HR
53	Cuba	CU
54	Cyprus	CY
55	Czech Republic	CZ
56	Denmark	DK
57	Djibouti	DJ
58	Dominica	DM
59	Dominican Republic	DO
60	East Timor	TP
61	Ecuador	EC
62	Egypt	EG
63	El Salvador	SV
64	Equatorial Guinea	GQ
65	Eritrea	ER
66	Estonia	EE
67	Ethiopia	ET
68	Falkland Islands (Malvinas)	FK
69	Faroe Islands	FO
70	Fiji	FJ
71	Finland	FI
72	France	FR
73	France, Metropolitan	FX
74	French Guiana	GF
75	French Polynesia	PF
76	French Southern Territories	TF
77	Gabon	GA
78	Gambia	GM
79	Georgia	GE
80	Germany	DE
81	Ghana	GH
82	Gibraltar	GI
83	Guernsey	GK
84	Greece	GR
85	Greenland	GL
86	Grenada	GD
87	Guadeloupe	GP
88	Guam	GU
89	Guatemala	GT
90	Guinea	GN
91	Guinea-Bissau	GW
92	Guyana	GY
93	Haiti	HT
94	Heard and Mc Donald Islands	HM
95	Honduras	HN
96	Hong Kong	HK
97	Hungary	HU
98	Iceland	IS
99	India	IN
100	Isle of Man	IM
101	Indonesia	ID
102	Iran (Islamic Republic of)	IR
103	Iraq	IQ
104	Ireland	IE
105	Israel	IL
106	Italy	IT
107	Ivory Coast	CI
108	Jersey	JE
109	Jamaica	JM
110	Japan	JP
111	Jordan	JO
112	Kazakhstan	KZ
113	Kenya	KE
114	Kiribati	KI
115	Korea, Democratic People's Republic of	KP
116	Korea, Republic of	KR
117	Kosovo	XK
118	Kuwait	KW
119	Kyrgyzstan	KG
120	Lao People's Democratic Republic	LA
121	Latvia	LV
122	Lebanon	LB
123	Lesotho	LS
124	Liberia	LR
125	Libyan Arab Jamahiriya	LY
126	Liechtenstein	LI
127	Lithuania	LT
128	Luxembourg	LU
129	Macau	MO
130	Macedonia	MK
131	Madagascar	MG
132	Malawi	MW
133	Malaysia	MY
134	Maldives	MV
135	Mali	ML
136	Malta	MT
137	Marshall Islands	MH
138	Martinique	MQ
139	Mauritania	MR
140	Mauritius	MU
141	Mayotte	TY
142	Mexico	MX
143	Micronesia, Federated States of	FM
144	Moldova, Republic of	MD
145	Monaco	MC
146	Mongolia	MN
147	Montenegro	ME
148	Montserrat	MS
149	Morocco	MA
150	Mozambique	MZ
151	Myanmar	MM
152	Namibia	NA
153	Nauru	NR
154	Nepal	NP
155	Netherlands	NL
156	Netherlands Antilles	AN
157	New Caledonia	NC
158	New Zealand	NZ
159	Nicaragua	NI
160	Niger	NE
161	Nigeria	NG
162	Niue	NU
163	Norfolk Island	NF
164	Northern Mariana Islands	MP
165	Norway	NO
166	Oman	OM
167	Pakistan	PK
168	Palau	PW
169	Palestine	PS
170	Panama	PA
171	Papua New Guinea	PG
172	Paraguay	PY
173	Peru	PE
174	Philippines	PH
175	Pitcairn	PN
176	Poland	PL
177	Portugal	PT
178	Puerto Rico	PR
179	Qatar	QA
180	Reunion	RE
181	Romania	RO
182	Russian Federation	RU
183	Rwanda	RW
184	Saint Kitts and Nevis	KN
185	Saint Lucia	LC
186	Saint Vincent and the Grenadines	VC
187	Samoa	WS
188	San Marino	SM
189	Sao Tome and Principe	ST
190	Saudi Arabia	SA
191	Senegal	SN
192	Serbia	RS
193	Seychelles	SC
194	Sierra Leone	SL
195	Singapore	SG
196	Slovakia	SK
197	Slovenia	SI
198	Solomon Islands	SB
199	Somalia	SO
200	South Africa	ZA
201	South Georgia South Sandwich Islands	GS
202	Spain	ES
203	Sri Lanka	LK
204	St. Helena	SH
205	St. Pierre and Miquelon	PM
206	Sudan	SD
207	Suriname	SR
208	Svalbard and Jan Mayen Islands	SJ
209	Swaziland	SZ
210	Sweden	SE
211	Switzerland	CH
212	Syrian Arab Republic	SY
213	Taiwan	TW
214	Tajikistan	TJ
215	Tanzania, United Republic of	TZ
216	Thailand	TH
217	Togo	TG
218	Tokelau	TK
219	Tonga	TO
220	Trinidad and Tobago	TT
221	Tunisia	TN
222	Turkey	TR
223	Turkmenistan	TM
224	Turks and Caicos Islands	TC
225	Tuvalu	TV
226	Uganda	UG
227	Ukraine	UA
228	United Arab Emirates	AE
229	United Kingdom	GB
230	United States	US
231	Uruguay	UY
232	Uzbekistan	UZ
233	Vanuatu	VU
234	Vatican City State	VA
235	Venezuela	VE
236	Vietnam	VN
237	Virgin Islands (British)	VG
238	Virgin Islands (U.S.)	VI
239	Wallis and Futuna Islands	WF
240	Western Sahara	EH
241	Yemen	YE
242	Zaire	ZR
243	Zambia	ZM
\.


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film.film_id_seq', 1, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film.genre_id_seq', 24, true);


--
-- Name: award_id_seq; Type: SEQUENCE SET; Schema: misc; Owner: postgres
--

SELECT pg_catalog.setval('misc.award_id_seq', 8, true);


--
-- Name: production_company_id_seq; Type: SEQUENCE SET; Schema: production; Owner: postgres
--

SELECT pg_catalog.setval('production.production_company_id_seq', 18, true);


--
-- Name: human_resources_countries_human_resources_id_seq; Type: SEQUENCE SET; Schema: staff; Owner: postgres
--

SELECT pg_catalog.setval('staff.human_resources_countries_human_resources_id_seq', 1, false);


--
-- Name: human_resources_id_seq; Type: SEQUENCE SET; Schema: staff; Owner: postgres
--

SELECT pg_catalog.setval('staff.human_resources_id_seq', 1, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: staff; Owner: postgres
--

SELECT pg_catalog.setval('staff.role_id_seq', 1, false);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: zoning; Owner: postgres
--

SELECT pg_catalog.setval('zoning.country_id_seq', 250, true);


--
-- Name: film_country film_country_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_country
    ADD CONSTRAINT film_country_pkey PRIMARY KEY (film_id, country_id);


--
-- Name: film_genre film_genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (film_id, genre_id);


--
-- Name: film_human film_human_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_human
    ADD CONSTRAINT film_human_pkey PRIMARY KEY (film_id, human_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: film_production_company film_production_company_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_production_company
    ADD CONSTRAINT film_production_company_pkey PRIMARY KEY (film_id, production_company_id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: award award_pkey; Type: CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY misc.award
    ADD CONSTRAINT award_pkey PRIMARY KEY (id);


--
-- Name: production_company production_company_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_company
    ADD CONSTRAINT production_company_pkey PRIMARY KEY (id);


--
-- Name: human_award human_award_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_award
    ADD CONSTRAINT human_award_pkey PRIMARY KEY (human_id, award_id);


--
-- Name: human_resources_countries human_resources_countries_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries
    ADD CONSTRAINT human_resources_countries_pkey PRIMARY KEY (human_resources_id);


--
-- Name: human_resources human_resources_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources
    ADD CONSTRAINT human_resources_pkey PRIMARY KEY (id);


--
-- Name: human_role human_role_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_role
    ADD CONSTRAINT human_role_pkey PRIMARY KEY (human_id, role_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY zoning.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: film_country film_country_country_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_country
    ADD CONSTRAINT film_country_country_id_fkey FOREIGN KEY (country_id) REFERENCES zoning.country(id);


--
-- Name: film_country film_country_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_country
    ADD CONSTRAINT film_country_film_id_fkey FOREIGN KEY (film_id) REFERENCES film.film(id);


--
-- Name: film_genre film_genre_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_genre
    ADD CONSTRAINT film_genre_film_id_fkey FOREIGN KEY (film_id) REFERENCES film.film(id);


--
-- Name: film_genre film_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_genre
    ADD CONSTRAINT film_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES film.genre(id);


--
-- Name: film_human film_human_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_human
    ADD CONSTRAINT film_human_film_id_fkey FOREIGN KEY (film_id) REFERENCES film.film(id);


--
-- Name: film_human film_human_human_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_human
    ADD CONSTRAINT film_human_human_id_fkey FOREIGN KEY (human_id) REFERENCES staff.human_resources(id);


--
-- Name: film_production_company film_production_company_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_production_company
    ADD CONSTRAINT film_production_company_film_id_fkey FOREIGN KEY (film_id) REFERENCES film.film(id);


--
-- Name: film_production_company film_production_company_production_company_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film_production_company
    ADD CONSTRAINT film_production_company_production_company_id_fkey FOREIGN KEY (production_company_id) REFERENCES production.production_company(id);


--
-- Name: award award_country_fkey; Type: FK CONSTRAINT; Schema: misc; Owner: postgres
--

ALTER TABLE ONLY misc.award
    ADD CONSTRAINT award_country_fkey FOREIGN KEY (country) REFERENCES zoning.country(id) ON DELETE SET NULL;


--
-- Name: production_company production_company_country_fkey; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_company
    ADD CONSTRAINT production_company_country_fkey FOREIGN KEY (country) REFERENCES zoning.country(id) ON DELETE SET NULL;


--
-- Name: human_award human_award_award_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_award
    ADD CONSTRAINT human_award_award_id_fkey FOREIGN KEY (award_id) REFERENCES misc.award(id);


--
-- Name: human_award human_award_human_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_award
    ADD CONSTRAINT human_award_human_id_fkey FOREIGN KEY (human_id) REFERENCES staff.human_resources(id);


--
-- Name: human_resources_countries human_resources_countries_born_country_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries
    ADD CONSTRAINT human_resources_countries_born_country_fkey FOREIGN KEY (born_country) REFERENCES zoning.country(id) ON DELETE SET NULL;


--
-- Name: human_resources_countries human_resources_countries_citizenship_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries
    ADD CONSTRAINT human_resources_countries_citizenship_fkey FOREIGN KEY (citizenship) REFERENCES zoning.country(id) ON DELETE SET NULL;


--
-- Name: human_resources_countries human_resources_countries_human_resources_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries
    ADD CONSTRAINT human_resources_countries_human_resources_id_fkey FOREIGN KEY (human_resources_id) REFERENCES staff.human_resources(id) ON DELETE CASCADE;


--
-- Name: human_resources_countries human_resources_countries_live_country_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_resources_countries
    ADD CONSTRAINT human_resources_countries_live_country_fkey FOREIGN KEY (live_country) REFERENCES zoning.country(id) ON DELETE SET NULL;


--
-- Name: human_role human_role_human_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_role
    ADD CONSTRAINT human_role_human_id_fkey FOREIGN KEY (human_id) REFERENCES staff.human_resources(id);


--
-- Name: human_role human_role_role_id_fkey; Type: FK CONSTRAINT; Schema: staff; Owner: postgres
--

ALTER TABLE ONLY staff.human_role
    ADD CONSTRAINT human_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES staff.role(id);


--
-- PostgreSQL database dump complete
--


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
-- Name: production; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO postgres;

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
    id bigint NOT NULL,
    title character varying(96) NOT NULL,
    imdb bigint,
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    running_time smallint,
    release_date smallint
);


ALTER TABLE film OWNER TO postgres;

--
-- Name: film_genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_genre (
    film_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE film_genre OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film_id_seq OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film_id_seq OWNED BY film.id;


--
-- Name: film_production_company; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film_production_company (
    film_id bigint NOT NULL,
    production_company_id bigint NOT NULL
);


ALTER TABLE film_production_company OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE genre (
    id bigint NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE genre OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_id_seq OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


SET search_path = production, pg_catalog;

--
-- Name: production_company; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production_company (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    country bigint
);


ALTER TABLE production_company OWNER TO postgres;

--
-- Name: production_company_id_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production_company_id_seq OWNER TO postgres;

--
-- Name: production_company_id_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production_company_id_seq OWNED BY production_company.id;


SET search_path = zoning, pg_catalog;

--
-- Name: country; Type: TABLE; Schema: zoning; Owner: postgres
--

CREATE TABLE country (
    id bigint NOT NULL,
    title character varying(96) NOT NULL,
    code character varying(2) NOT NULL
);


ALTER TABLE country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: zoning; Owner: postgres
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: zoning; Owner: postgres
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


SET search_path = film, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film ALTER COLUMN id SET DEFAULT nextval('film_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


SET search_path = production, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production_company ALTER COLUMN id SET DEFAULT nextval('production_company_id_seq'::regclass);


SET search_path = zoning, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


SET search_path = film, pg_catalog;

--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film (id, title, imdb, "timestamp", running_time, release_date) FROM stdin;
1	Men in Black	119654	2018-03-31 17:55:38.993291	98	1997
\.


--
-- Data for Name: film_genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_genre (film_id, genre_id) FROM stdin;
1	2
1	3
1	15
\.


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film_id_seq', 1, true);


--
-- Data for Name: film_production_company; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film_production_company (film_id, production_company_id) FROM stdin;
1	8
1	9
1	10
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY genre (id, title) FROM stdin;
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
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('genre_id_seq', 24, true);


SET search_path = production, pg_catalog;

--
-- Data for Name: production_company; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production_company (id, title, country) FROM stdin;
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
-- Name: production_company_id_seq; Type: SEQUENCE SET; Schema: production; Owner: postgres
--

SELECT pg_catalog.setval('production_company_id_seq', 10, true);


SET search_path = zoning, pg_catalog;

--
-- Data for Name: country; Type: TABLE DATA; Schema: zoning; Owner: postgres
--

COPY country (id, title, code) FROM stdin;
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
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: zoning; Owner: postgres
--

SELECT pg_catalog.setval('country_id_seq', 245, true);


SET search_path = film, pg_catalog;

--
-- Name: film_genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (film_id, genre_id);


--
-- Name: film_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: film_production_company_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_production_company
    ADD CONSTRAINT film_production_company_pkey PRIMARY KEY (film_id, production_company_id);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


SET search_path = production, pg_catalog;

--
-- Name: production_company_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production_company
    ADD CONSTRAINT production_company_pkey PRIMARY KEY (id);


SET search_path = zoning, pg_catalog;

--
-- Name: country_pkey; Type: CONSTRAINT; Schema: zoning; Owner: postgres
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


SET search_path = film, pg_catalog;

--
-- Name: film_genre_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(id);


--
-- Name: film_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_genre
    ADD CONSTRAINT film_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genre(id);


--
-- Name: film_production_company_film_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_production_company
    ADD CONSTRAINT film_production_company_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(id);


--
-- Name: film_production_company_production_company_id_fkey; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film_production_company
    ADD CONSTRAINT film_production_company_production_company_id_fkey FOREIGN KEY (production_company_id) REFERENCES production.production_company(id);


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


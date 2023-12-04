--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Homebrew)

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
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO root;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    user_id integer NOT NULL,
    operation character varying(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    amount double precision NOT NULL,
    balance double precision NOT NULL
);


ALTER TABLE public.transaction OWNER TO root;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_seq OWNER TO root;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: transaction_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.transaction_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_user_id_seq OWNER TO root;

--
-- Name: transaction_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.transaction_user_id_seq OWNED BY public.transaction.user_id;


--
-- Name: user_balance; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_balance (
    id integer NOT NULL,
    balance numeric(10,2) NOT NULL
);


ALTER TABLE public.user_balance OWNER TO root;

--
-- Name: user_balance_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_balance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_balance_id_seq OWNER TO root;

--
-- Name: user_balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_balance_id_seq OWNED BY public.user_balance.id;


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: transaction user_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.transaction ALTER COLUMN user_id SET DEFAULT nextval('public.transaction_user_id_seq'::regclass);


--
-- Name: user_balance id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_balance ALTER COLUMN id SET DEFAULT nextval('public.user_balance_id_seq'::regclass);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create user table	SQL	V1__create_user_table.sql	-401003562	root	2023-12-03 22:34:29.913954	11	t
2	2	create transaction table	SQL	V2__create_transaction_table.sql	1565627840	root	2023-12-03 22:34:53.578821	15	t
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.transaction (id, user_id, operation, date, amount, balance) FROM stdin;
1	101	PUT	2023-01-01 08:00:00	100	445.5
2	101	TAKE	2023-01-02 12:30:00	50.5	395
3	102	PUT	2023-01-03 10:15:00	500	12910
4	102	TAKE	2023-01-04 15:45:00	100	12810
5	103	PUT	2023-01-05 09:30:00	200	324.5
6	103	TAKE	2023-01-06 14:00:00	50	274.5
7	104	PUT	2023-01-07 11:45:00	20	38.5
8	104	TAKE	2023-01-08 16:30:00	20	18.5
9	105	PUT	2023-01-09 13:15:00	500	1745.5
10	105	TAKE	2023-01-10 17:45:00	300	1445.5
11	106	PUT	2023-01-11 10:00:00	200	1445.5
12	106	TAKE	2023-01-12 14:30:00	100	1345.5
13	107	PUT	2023-01-13 12:15:00	50	1295.5
14	107	TAKE	2023-01-14 15:45:00	20	1275.5
15	108	PUT	2023-01-15 09:30:00	100	221.5
16	108	TAKE	2023-01-16 14:00:00	100	121.5
17	109	PUT	2023-01-17 11:45:00	10	22.61
18	109	TAKE	2023-01-18 16:30:00	10	12.61
19	110	PUT	2023-01-19 13:15:00	400	1640
20	110	TAKE	2023-01-20 17:45:00	100	1540
21	111	PUT	2023-01-21 10:00:00	80	200
22	111	TAKE	2023-01-22 14:30:00	80	120
23	112	PUT	2023-01-23 12:15:00	50	82.56
24	112	TAKE	2023-01-24 15:45:00	20	62.56
25	101	TRANSFER_IN	2023-02-01 08:30:00	30	415.5
26	101	TRANSFER_IN	2023-02-02 12:45:00	15.5	400
27	102	TRANSFER_IN	2023-02-03 10:30:00	50	12860
28	102	TRANSFER_IN	2023-02-04 15:55:00	10	12850
29	103	TRANSFER_IN	2023-02-05 09:45:00	20	254.5
30	103	TRANSFER_IN	2023-02-06 14:15:00	10	244.5
31	104	TRANSFER_IN	2023-02-07 12:30:00	5	33.5
32	104	TRANSFER_IN	2023-02-08 16:45:00	5	28.5
33	105	TRANSFER_IN	2023-02-09 13:30:00	50	1695.5
34	105	TRANSFER_IN	2023-02-10 18:00:00	30	1665.5
35	106	TRANSFER_IN	2023-02-11 10:15:00	10	1435.5
36	106	TRANSFER_IN	2023-02-12 14:45:00	5	1430.5
37	107	TRANSFER_OUT	2023-02-13 12:45:00	5	1290.5
38	107	TRANSFER_OUT	2023-02-14 16:15:00	2	1288.5
39	108	TRANSFER_OUT	2023-02-15 10:00:00	10	211.5
40	108	TRANSFER_OUT	2023-02-16 14:30:00	5	206.5
41	109	TRANSFER_OUT	2023-02-17 11:30:00	2	20.61
42	109	TRANSFER_OUT	2023-02-18 16:45:00	1	19.61
43	110	TRANSFER_OUT	2023-02-19 13:30:00	20	1620
44	110	TRANSFER_OUT	2023-02-20 18:00:00	10	1610
45	111	TRANSFER_OUT	2023-02-21 10:15:00	8	192
46	111	TRANSFER_OUT	2023-02-22 14:45:00	8	184
47	112	TRANSFER_OUT	2023-02-23 12:45:00	5	77.56
48	112	TRANSFER_OUT	2023-02-24 16:15:00	2	75.56
49	103	PUT	2023-12-03 22:34:54.503267	100	224.5
50	103	TAKE	2023-12-03 22:34:54.535273	100	124.5
51	101	TRANSFER_OUT	2023-12-03 22:52:05.253724	100	245.5
52	102	TRANSFER_IN	2023-12-03 22:52:05.26447	100	12510
53	101	TRANSFER_OUT	2023-12-03 22:52:39.278426	45.5	200
54	102	TRANSFER_IN	2023-12-03 22:52:39.288295	45.5	12555.5
55	101	TRANSFER_OUT	2023-12-03 22:57:46.292233	45.5	154.5
56	102	TRANSFER_IN	2023-12-03 22:57:46.308291	45.5	12601
57	101	TRANSFER_OUT	2023-12-03 23:02:18.190209	45.5	109
58	102	TRANSFER_IN	2023-12-03 23:02:18.201234	45.5	12646.5
59	104	TRANSFER_OUT	2023-12-03 23:02:55.898382	100	-81.5
60	105	TRANSFER_IN	2023-12-03 23:02:55.901163	100	1345.5
61	105	TRANSFER_OUT	2023-12-03 23:03:34.502428	100	1245.5
62	104	TRANSFER_IN	2023-12-03 23:03:34.508472	100	18.5
63	105	TRANSFER_OUT	2023-12-03 23:03:35.961307	100	1145.5
64	104	TRANSFER_IN	2023-12-03 23:03:35.968073	100	118.5
65	105	TRANSFER_OUT	2023-12-03 23:03:37.06727	100	1045.5
66	104	TRANSFER_IN	2023-12-03 23:03:37.074776	100	218.5
67	105	TRANSFER_OUT	2023-12-03 23:03:37.938606	100	945.5
68	104	TRANSFER_IN	2023-12-03 23:03:37.945001	100	318.5
69	105	TRANSFER_OUT	2023-12-03 23:03:38.803893	100	845.5
70	104	TRANSFER_IN	2023-12-03 23:03:38.808792	100	418.5
71	102	TRANSFER_OUT	2023-12-04 14:28:34.772855	100	12546.5
72	101	TRANSFER_IN	2023-12-04 14:28:34.789813	100	209
73	102	TAKE	2023-12-04 14:29:19.752678	100	12446.5
74	101	PUT	2023-12-04 14:30:57.439144	1000	1209
\.


--
-- Data for Name: user_balance; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_balance (id, balance) FROM stdin;
106	1245.50
107	1245.50
108	121.50
109	12.61
110	1240.00
111	120.00
112	32.56
103	124.50
105	845.50
104	418.50
102	12446.50
101	1209.00
\.


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.transaction_id_seq', 74, true);


--
-- Name: transaction_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.transaction_user_id_seq', 1, false);


--
-- Name: user_balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_balance_id_seq', 1, false);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: user_balance user_balance_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_balance
    ADD CONSTRAINT user_balance_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_paymenttypeid_fkey;
ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_loanid_fkey;
ALTER TABLE ONLY public.payment_schedules DROP CONSTRAINT payment_schedules_statusid_fkey;
ALTER TABLE ONLY public.payment_schedules DROP CONSTRAINT payment_schedules_loanid_fkey;
ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_statusid_fkey;
ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_loantypeid_fkey;
ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_customerid_fkey;
ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_positionid_fkey;
ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_customertypeid_fkey;
ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_loanid_fkey;
ALTER TABLE ONLY public.user_logs DROP CONSTRAINT user_logs_pkey;
ALTER TABLE ONLY public.employees DROP CONSTRAINT unique_login;
ALTER TABLE ONLY public.schedule_statuses DROP CONSTRAINT schedule_statuses_pkey;
ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
ALTER TABLE ONLY public.payment_types DROP CONSTRAINT payment_types_pkey;
ALTER TABLE ONLY public.payment_schedules DROP CONSTRAINT payment_schedules_pkey;
ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
ALTER TABLE ONLY public.loan_types DROP CONSTRAINT loan_types_pkey;
ALTER TABLE ONLY public.loan_statuses DROP CONSTRAINT loan_statuses_pkey;
ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
ALTER TABLE ONLY public.customer_types DROP CONSTRAINT customer_types_pkey;
ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_pkey;
ALTER TABLE public.user_logs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.schedule_statuses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.positions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.payments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.payment_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.payment_schedules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.loans ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.loan_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.loan_statuses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.customer_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.contracts ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.user_logs_id_seq;
DROP TABLE public.user_logs;
DROP SEQUENCE public.schedule_statuses_id_seq;
DROP TABLE public.schedule_statuses;
DROP SEQUENCE public.positions_id_seq;
DROP TABLE public.positions;
DROP SEQUENCE public.payments_id_seq;
DROP TABLE public.payments;
DROP SEQUENCE public.payment_types_id_seq;
DROP TABLE public.payment_types;
DROP SEQUENCE public.payment_schedules_id_seq;
DROP TABLE public.payment_schedules;
DROP SEQUENCE public.loans_id_seq;
DROP TABLE public.loans;
DROP SEQUENCE public.loan_types_id_seq;
DROP TABLE public.loan_types;
DROP SEQUENCE public.loan_statuses_id_seq;
DROP TABLE public.loan_statuses;
DROP SEQUENCE public.employees_id_seq;
DROP TABLE public.employees;
DROP SEQUENCE public.customers_id_seq;
DROP TABLE public.customers;
DROP SEQUENCE public.customer_types_id_seq;
DROP TABLE public.customer_types;
DROP SEQUENCE public.contracts_id_seq;
DROP TABLE public.contracts;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    loanid integer,
    contractdate date NOT NULL
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contracts_id_seq OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: customer_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_types (
    id integer NOT NULL,
    typename text NOT NULL
);


ALTER TABLE public.customer_types OWNER TO postgres;

--
-- Name: customer_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_types_id_seq OWNER TO postgres;

--
-- Name: customer_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_types_id_seq OWNED BY public.customer_types.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    dateofbirth date NOT NULL,
    phone text NOT NULL,
    customertypeid integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    name text NOT NULL,
    positionid integer,
    login text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: loan_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_statuses (
    id integer NOT NULL,
    statusname text NOT NULL
);


ALTER TABLE public.loan_statuses OWNER TO postgres;

--
-- Name: loan_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_statuses_id_seq OWNER TO postgres;

--
-- Name: loan_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_statuses_id_seq OWNED BY public.loan_statuses.id;


--
-- Name: loan_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_types (
    id integer NOT NULL,
    typename text NOT NULL
);


ALTER TABLE public.loan_types OWNER TO postgres;

--
-- Name: loan_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_types_id_seq OWNER TO postgres;

--
-- Name: loan_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_types_id_seq OWNED BY public.loan_types.id;


--
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    id integer NOT NULL,
    customerid integer,
    amount numeric(18,2) NOT NULL,
    interestrate numeric(5,2) NOT NULL,
    termmonths integer NOT NULL,
    loantypeid integer,
    statusid integer,
    creationtime date
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_id_seq OWNER TO postgres;

--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loans_id_seq OWNED BY public.loans.id;


--
-- Name: payment_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_schedules (
    id integer NOT NULL,
    loanid integer,
    duedate date NOT NULL,
    amount numeric(18,2) NOT NULL,
    statusid integer
);


ALTER TABLE public.payment_schedules OWNER TO postgres;

--
-- Name: payment_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_schedules_id_seq OWNER TO postgres;

--
-- Name: payment_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_schedules_id_seq OWNED BY public.payment_schedules.id;


--
-- Name: payment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_types (
    id integer NOT NULL,
    typename text NOT NULL
);


ALTER TABLE public.payment_types OWNER TO postgres;

--
-- Name: payment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_types_id_seq OWNER TO postgres;

--
-- Name: payment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_types_id_seq OWNED BY public.payment_types.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    loanid integer,
    paymentdate date NOT NULL,
    amount numeric(18,2) NOT NULL,
    paymenttypeid integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    positionname text NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.positions_id_seq OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- Name: schedule_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule_statuses (
    id integer NOT NULL,
    statusname text NOT NULL
);


ALTER TABLE public.schedule_statuses OWNER TO postgres;

--
-- Name: schedule_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedule_statuses_id_seq OWNER TO postgres;

--
-- Name: schedule_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedule_statuses_id_seq OWNED BY public.schedule_statuses.id;


--
-- Name: user_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_logs (
    id integer NOT NULL,
    user_id text,
    action text NOT NULL,
    table_name text NOT NULL,
    details text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_logs OWNER TO postgres;

--
-- Name: user_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_logs_id_seq OWNER TO postgres;

--
-- Name: user_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_logs_id_seq OWNED BY public.user_logs.id;


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: customer_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_types ALTER COLUMN id SET DEFAULT nextval('public.customer_types_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: loan_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_statuses ALTER COLUMN id SET DEFAULT nextval('public.loan_statuses_id_seq'::regclass);


--
-- Name: loan_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_types ALTER COLUMN id SET DEFAULT nextval('public.loan_types_id_seq'::regclass);


--
-- Name: loans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN id SET DEFAULT nextval('public.loans_id_seq'::regclass);


--
-- Name: payment_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_schedules ALTER COLUMN id SET DEFAULT nextval('public.payment_schedules_id_seq'::regclass);


--
-- Name: payment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_types ALTER COLUMN id SET DEFAULT nextval('public.payment_types_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- Name: schedule_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule_statuses ALTER COLUMN id SET DEFAULT nextval('public.schedule_statuses_id_seq'::regclass);


--
-- Name: user_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_logs ALTER COLUMN id SET DEFAULT nextval('public.user_logs_id_seq'::regclass);


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (id, loanid, contractdate) FROM stdin;
\.


--
-- Data for Name: customer_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_types (id, typename) FROM stdin;
1	Buisness
2	VIP
3	Default
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, dateofbirth, phone, customertypeid) FROM stdin;
8	test	2025-05-03	0672724595	1
9	zhest	2025-04-30	06733333333	2
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, name, positionid, login, password) FROM stdin;
5	test2	2	test2	$2a$11$KxDTcDtUstz6uNBIqIGwOekV4hiCIYvjXKx4Rr5Ka/pexHdp3Yx22
6	test1	1	test1	$2a$11$km4IiSrq75O5xxaePCHN2udLv8tGic8WE.YtD2NC6dB5huEf1UDZC
1	Ivan	1	thespiker	$2a$11$t4Hk511yaelczzcDB91EFu9OYaAHX7fbiXvyg.COfRClaftqtNYfi
\.


--
-- Data for Name: loan_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_statuses (id, statusname) FROM stdin;
1	Paid
2	Closed
3	In the process
\.


--
-- Data for Name: loan_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_types (id, typename) FROM stdin;
1	Installment
2	Loan
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (id, customerid, amount, interestrate, termmonths, loantypeid, statusid, creationtime) FROM stdin;
34	9	10000.00	5.00	12	2	3	2025-05-01
\.


--
-- Data for Name: payment_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_schedules (id, loanid, duedate, amount, statusid) FROM stdin;
25	34	2025-06-01	833.33	1
26	34	2025-07-01	833.33	1
27	34	2025-08-01	833.33	1
28	34	2025-09-01	833.33	1
29	34	2025-10-01	833.33	1
30	34	2025-11-01	833.33	1
31	34	2025-12-01	833.33	1
32	34	2026-01-01	833.33	1
33	34	2026-02-01	833.33	1
34	34	2026-03-01	833.33	1
36	34	2026-05-01	833.33	2
35	34	2026-04-01	833.33	2
\.


--
-- Data for Name: payment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_types (id, typename) FROM stdin;
1	Card
2	Cash
3	Apple pay
4	Google pay
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, loanid, paymentdate, amount, paymenttypeid) FROM stdin;
57	34	2025-05-09	2333.00	3
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (id, positionname) FROM stdin;
1	Super-Admin
2	Admin
3	Manager
\.


--
-- Data for Name: schedule_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule_statuses (id, statusname) FROM stdin;
1	pending
2	paid
\.


--
-- Data for Name: user_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_logs (id, user_id, action, table_name, details, "timestamp") FROM stdin;
1	Anonymous	OPTIONS	/api/CustomerType		2025-05-05 20:03:19.547417
2	Anonymous	OPTIONS	/api/Customer		2025-05-05 20:03:19.547414
3	Anonymous	OPTIONS	/api/Customer		2025-05-05 20:03:19.54742
4	Anonymous	OPTIONS	/api/CustomerType		2025-05-05 20:03:19.547373
6	Anonymous	GET	/api/CustomerType		2025-05-05 20:03:20.734559
5	Anonymous	GET	/api/Customer		2025-05-05 20:03:20.734559
7	Anonymous	GET	/api/CustomerType		2025-05-05 20:03:21.173393
8	Anonymous	GET	/api/Customer		2025-05-05 20:03:21.294769
9	Anonymous	GET	/api/Position		2025-05-05 20:03:21.405897
10	Anonymous	OPTIONS	/api/Employee		2025-05-05 20:03:21.418635
11	Anonymous	OPTIONS	/api/Employee		2025-05-05 20:03:21.45359
12	Anonymous	GET	/api/Employee		2025-05-05 20:03:21.48838
13	Anonymous	GET	/api/Position		2025-05-05 20:03:21.495523
14	Anonymous	GET	/api/Employee		2025-05-05 20:03:21.600138
15	Anonymous	GET	/api/Customer		2025-05-05 20:03:22.7897
16	Anonymous	GET	/api/CustomerType		2025-05-05 20:03:22.7897
17	Anonymous	GET	/api/CustomerType		2025-05-05 20:03:22.834561
18	Anonymous	GET	/api/Customer		2025-05-05 20:03:22.895669
19	Anonymous	OPTIONS	/api/Customer		2025-05-05 20:03:27.767665
20	Anonymous	PUT	/api/Customer	{"name":"zhest","dateofbirth":"2025-04-30","phone":"06733333333","type":"2","id":9}	2025-05-05 20:03:27.773884
21	Anonymous	GET	/api/Customer		2025-05-05 20:03:27.837019
22	Anonymous	GET	/api/Values		2025-05-05 20:18:19.300577
23	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:18:27.39604
24	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:24:46.638018
25	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:24:46.638018
26	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:24:46.803823
27	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:24:46.954894
28	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:29:20.521753
29	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:29:20.521753
30	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:29:20.6291
31	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:29:20.636452
32	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:29:45.560966
33	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:29:45.565704
34	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:29:49.869357
35	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:29:51.496744
36	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:29:51.500806
37	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:39:23.606993
38	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:39:23.606962
39	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:39:23.730093
40	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:39:23.738336
41	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:39:30.492254
42	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:39:30.497483
43	Anonymous	OPTIONS	/api/UserLog/filter		2025-05-05 20:39:33.714846
44	Anonymous	GET	/api/UserLog/filter		2025-05-05 20:39:33.722727
45	Anonymous	OPTIONS	/api/Employee		2025-05-05 20:42:05.121513
46	Anonymous	GET	/api/Position		2025-05-05 20:40:24.00438
47	Anonymous	OPTIONS	/api/Customer		2025-05-05 20:42:06.611837
48	Anonymous	GET	/api/Position		2025-05-05 20:42:06.611817
49	Anonymous	OPTIONS	/api/Customer		2025-05-05 20:42:06.952038
50	Anonymous	OPTIONS	/api/CustomerType		2025-05-05 20:42:07.139659
51	Anonymous	OPTIONS	/api/Employee		2025-05-05 20:42:05.121513
52	Anonymous	OPTIONS	/api/CustomerType		2025-05-05 20:42:06.611852
53	Anonymous	GET	/api/Customer		2025-05-05 20:42:07.983003
54	Anonymous	GET	/api/CustomerType		2025-05-05 20:42:07.983003
55	Anonymous	GET	/api/Employee		2025-05-05 20:42:07.408091
56	Anonymous	GET	/api/CustomerType		2025-05-05 20:42:08.402728
58	Anonymous	GET	/api/Employee		2025-05-05 20:42:08.606182
57	Anonymous	GET	/api/Customer		2025-05-05 20:42:08.76077
59	Anonymous	OPTIONS	/api/backup/list		2025-05-05 20:42:59.646208
60	Anonymous	OPTIONS	/api/backup/list		2025-05-05 20:42:59.646208
61	Anonymous	GET	/api/backup/list		2025-05-05 20:42:59.758169
62	Anonymous	GET	/api/backup/list		2025-05-05 20:42:59.800384
63	Anonymous	GET	/api//Backup/backup_20250501_195152.sql		2025-05-05 20:50:34.423633
64	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-05 20:51:06.417057
65	thespiker	GET	/api/backup/list		2025-05-05 20:51:10.555547
66	thespiker	GET	/api/backup/list		2025-05-05 20:51:10.594854
67	thespiker	POST	/api/backup/create		2025-05-05 20:51:23.113733
\.


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracts_id_seq', 1, false);


--
-- Name: customer_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_types_id_seq', 3, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 9, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 7, true);


--
-- Name: loan_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_statuses_id_seq', 3, true);


--
-- Name: loan_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_types_id_seq', 2, true);


--
-- Name: loans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_id_seq', 34, true);


--
-- Name: payment_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_schedules_id_seq', 36, true);


--
-- Name: payment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_types_id_seq', 4, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 57, true);


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_id_seq', 4, true);


--
-- Name: schedule_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_statuses_id_seq', 2, true);


--
-- Name: user_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_logs_id_seq', 67, true);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: customer_types customer_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_types
    ADD CONSTRAINT customer_types_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: loan_statuses loan_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_statuses
    ADD CONSTRAINT loan_statuses_pkey PRIMARY KEY (id);


--
-- Name: loan_types loan_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_types
    ADD CONSTRAINT loan_types_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: payment_schedules payment_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_schedules
    ADD CONSTRAINT payment_schedules_pkey PRIMARY KEY (id);


--
-- Name: payment_types payment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_types
    ADD CONSTRAINT payment_types_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: schedule_statuses schedule_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule_statuses
    ADD CONSTRAINT schedule_statuses_pkey PRIMARY KEY (id);


--
-- Name: employees unique_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT unique_login UNIQUE (login);


--
-- Name: user_logs user_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_logs
    ADD CONSTRAINT user_logs_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_loanid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_loanid_fkey FOREIGN KEY (loanid) REFERENCES public.loans(id);


--
-- Name: customers customers_customertypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customertypeid_fkey FOREIGN KEY (customertypeid) REFERENCES public.customer_types(id);


--
-- Name: employees employees_positionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_positionid_fkey FOREIGN KEY (positionid) REFERENCES public.positions(id);


--
-- Name: loans loans_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);


--
-- Name: loans loans_loantypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_loantypeid_fkey FOREIGN KEY (loantypeid) REFERENCES public.loan_types(id);


--
-- Name: loans loans_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.loan_statuses(id);


--
-- Name: payment_schedules payment_schedules_loanid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_schedules
    ADD CONSTRAINT payment_schedules_loanid_fkey FOREIGN KEY (loanid) REFERENCES public.loans(id);


--
-- Name: payment_schedules payment_schedules_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_schedules
    ADD CONSTRAINT payment_schedules_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.schedule_statuses(id);


--
-- Name: payments payments_loanid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_loanid_fkey FOREIGN KEY (loanid) REFERENCES public.loans(id);


--
-- Name: payments payments_paymenttypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_paymenttypeid_fkey FOREIGN KEY (paymenttypeid) REFERENCES public.payment_types(id);


--
-- PostgreSQL database dump complete
--


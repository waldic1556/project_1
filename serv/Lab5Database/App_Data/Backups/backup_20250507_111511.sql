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
ALTER TABLE ONLY public.accounting_period DROP CONSTRAINT accounting_period_pkey;
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
ALTER TABLE public.accounting_period ALTER COLUMN id DROP DEFAULT;
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
DROP SEQUENCE public.accounting_period_id_seq;
DROP TABLE public.accounting_period;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounting_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounting_period (
    id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL
);


ALTER TABLE public.accounting_period OWNER TO postgres;

--
-- Name: accounting_period_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounting_period_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounting_period_id_seq OWNER TO postgres;

--
-- Name: accounting_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounting_period_id_seq OWNED BY public.accounting_period.id;


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
-- Name: accounting_period id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounting_period ALTER COLUMN id SET DEFAULT nextval('public.accounting_period_id_seq'::regclass);


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
-- Data for Name: accounting_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounting_period (id, start_date, end_date) FROM stdin;
1	2000-01-01 00:00:00	2026-06-04 00:00:00
\.


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
10	Customer_0	1990-01-01	+380999000000	1
9	zhest	2025-04-30	06733333333	2
8	test	2025-05-03	0672724595	2
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, name, positionid, login, password) FROM stdin;
5	test2	2	test2	$2a$11$KxDTcDtUstz6uNBIqIGwOekV4hiCIYvjXKx4Rr5Ka/pexHdp3Yx22
1	Ivan	1	thespiker	$2a$11$t4Hk511yaelczzcDB91EFu9OYaAHX7fbiXvyg.COfRClaftqtNYfi
8	dfdf	1	fff	$2a$11$oFWak.to08ggzNfzCMZz..c6.25Kt.IW5bBlVHJbuZiH0/iNbSvnS
6	test1	3	test1	$2a$11$AgKXIuWymz4VOCXmGqdDLOhV9beIsLpWn6c/JWazDqtFFYmndu2FK
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
40	10	12233.00	3.00	12	2	3	2025-05-07
\.


--
-- Data for Name: payment_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_schedules (id, loanid, duedate, amount, statusid) FROM stdin;
154	40	2025-08-07	1019.42	1
155	40	2025-09-07	1019.42	1
156	40	2025-10-07	1019.42	1
157	40	2025-11-07	1019.42	1
158	40	2025-12-07	1019.42	1
159	40	2026-01-07	1019.42	1
160	40	2026-02-07	1019.42	1
161	40	2026-03-07	1019.42	1
162	40	2026-04-07	1019.42	1
163	40	2026-05-07	1019.42	1
152	40	2025-06-07	1019.42	1
153	40	2025-07-07	1019.42	1
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
68	thespiker	GET	/api/backup/list		2025-05-05 20:51:24.301223
69	Anonymous	GET	/api/Backup/backup_20250505_205123.sql		2025-05-05 20:51:25.153264
70	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-05 21:42:44.505818
71	thespiker	GET	/api/UserLog/filter		2025-05-05 21:42:48.00331
72	thespiker	GET	/api/UserLog/filter		2025-05-05 21:42:48.102943
73	thespiker	GET	/api/Payment		2025-05-05 21:42:59.308612
74	thespiker	GET	/api/Payment		2025-05-05 21:42:59.418062
75	thespiker	GET	/api/Loan		2025-05-05 21:42:59.429825
76	thespiker	GET	/api/Customer		2025-05-05 21:42:59.313125
77	thespiker	GET	/api/Loan		2025-05-05 21:42:59.477436
78	thespiker	GET	/api/Customer		2025-05-05 21:42:59.586487
79	thespiker	GET	/api/LoanStatus		2025-05-05 21:42:59.594798
80	thespiker	GET	/api/LoanStatus		2025-05-05 21:42:59.642159
81	thespiker	GET	/api/LoanType		2025-05-05 21:42:59.653359
82	thespiker	GET	/api/LoanType		2025-05-05 21:42:59.705534
83	thespiker	GET	/api/PaymentType		2025-05-05 21:42:59.724848
84	thespiker	GET	/api/PaymentType		2025-05-05 21:42:59.756392
85	thespiker	GET	/api/backup/list		2025-05-05 21:43:00.061336
86	thespiker	GET	/api/backup/list		2025-05-05 21:43:00.074365
87	thespiker	GET	/api/Payment		2025-05-05 21:43:19.170433
88	thespiker	GET	/api/Customer		2025-05-05 21:43:19.170433
89	thespiker	GET	/api/Payment		2025-05-05 21:43:19.24049
90	thespiker	GET	/api/Customer		2025-05-05 21:43:19.26856
91	thespiker	GET	/api/LoanStatus		2025-05-05 21:43:19.361607
92	thespiker	GET	/api/Loan		2025-05-05 21:43:19.361608
93	thespiker	GET	/api/LoanStatus		2025-05-05 21:43:19.466957
94	thespiker	GET	/api/LoanType		2025-05-05 21:43:19.469941
96	thespiker	GET	/api/LoanType		2025-05-05 21:43:19.687348
95	thespiker	GET	/api/Loan		2025-05-05 21:43:19.687387
97	thespiker	GET	/api/PaymentType		2025-05-05 21:43:19.778257
98	thespiker	GET	/api/backup/list		2025-05-05 21:43:19.839918
99	thespiker	GET	/api/backup/list		2025-05-05 21:43:19.904444
100	thespiker	GET	/api/PaymentType		2025-05-05 21:43:19.905205
101	thespiker	GET	/api/UserLog/filter		2025-05-05 21:43:21.652142
102	thespiker	GET	/api/UserLog/filter		2025-05-05 21:43:21.661342
103	Anonymous	GET	/api/Settings/period		2025-05-05 21:43:33.343093
104	thespiker	GET	/api/backup/list		2025-05-05 21:50:15.094189
105	thespiker	GET	/api/backup/list		2025-05-05 21:50:16.225708
106	thespiker	GET	/api/backup/list		2025-05-05 21:50:19.438987
107	thespiker	GET	/api/backup/list		2025-05-05 21:50:19.45778
108	thespiker	GET	/api/Customer		2025-05-05 21:50:25.07482
109	thespiker	GET	/api/Payment		2025-05-05 21:50:25.076356
110	thespiker	GET	/api/Payment		2025-05-05 21:50:25.214157
111	thespiker	GET	/api/Loan		2025-05-05 21:50:25.279321
112	thespiker	GET	/api/Loan		2025-05-05 21:50:25.362085
113	thespiker	GET	/api/Customer		2025-05-05 21:50:25.420528
114	thespiker	GET	/api/LoanStatus		2025-05-05 21:50:25.450042
115	thespiker	GET	/api/LoanStatus		2025-05-05 21:50:25.526657
116	thespiker	GET	/api/LoanType		2025-05-05 21:50:25.548652
117	thespiker	GET	/api/LoanType		2025-05-05 21:50:25.575568
118	thespiker	GET	/api/PaymentType		2025-05-05 21:50:25.585136
119	thespiker	GET	/api/PaymentType		2025-05-05 21:50:25.613247
120	thespiker	GET	/api/Loan/customer/8		2025-05-05 21:50:28.17338
121	thespiker	GET	/api/Payment/customer/8		2025-05-05 21:50:28.208637
122	thespiker	GET	/api/Loan/customer/9		2025-05-05 21:50:30.184917
123	thespiker	GET	/api/Payment/customer/9		2025-05-05 21:50:30.196036
124	thespiker	GET	/api/Payment		2025-05-05 21:50:31.819773
125	thespiker	GET	/api/Loan		2025-05-05 21:50:31.830354
126	thespiker	GET	/api/Customer		2025-05-05 21:50:37.530847
127	thespiker	GET	/api/CustomerType		2025-05-05 21:50:37.53645
128	thespiker	GET	/api/Customer		2025-05-05 21:50:37.553582
129	thespiker	GET	/api/CustomerType		2025-05-05 21:50:37.620062
130	thespiker	PUT	/api/Customer	{"name":"test","dateofbirth":"2025-05-03","phone":"0672724595","type":"2","id":8}	2025-05-05 21:50:40.589025
131	thespiker	GET	/api/Customer		2025-05-05 21:50:40.646535
132	thespiker	GET	/api/UserLog/filter		2025-05-05 21:50:42.699638
133	thespiker	GET	/api/UserLog/filter		2025-05-05 21:50:42.74129
134	thespiker	GET	/api/UserLog/filter		2025-05-05 21:53:39.581566
135	thespiker	GET	/api/UserLog/filter		2025-05-05 21:53:39.597115
136	thespiker	GET	/api/backup/list		2025-05-05 21:54:02.765992
137	thespiker	GET	/api/Settings/period		2025-05-05 21:54:02.765992
138	thespiker	GET	/api/backup/list		2025-05-05 21:54:02.830801
139	thespiker	GET	/api/Settings/period		2025-05-05 21:54:17.64524
140	thespiker	GET	/api/Settings/period		2025-05-05 22:00:50.244597
141	thespiker	GET	/api/Settings/period		2025-05-05 22:00:51.550382
142	thespiker	POST	/api/api/settings/period	{"startDate":"2000-01-01","endDate":"2024-01-01"}	2025-05-05 22:05:44.956245
143	thespiker	POST	/api/Settings/period	{"startDate":"2000-01-01","endDate":"2024-01-01"}	2025-05-05 22:06:12.693856
144	thespiker	POST	/api/Settings/period	{"startDate":"2000-01-01","endDate":"2024-01-01"}	2025-05-05 22:10:32.665046
145	thespiker	GET	/api/CustomerType		2025-05-05 22:10:45.532251
146	thespiker	GET	/api/CustomerType		2025-05-05 22:10:45.58998
147	thespiker	GET	/api/Customer		2025-05-05 22:10:45.539635
148	thespiker	GET	/api/Customer		2025-05-05 22:10:45.735709
149	thespiker	GET	/api/Customer		2025-05-05 22:11:02.277239
150	thespiker	GET	/api/CustomerType		2025-05-05 22:11:02.275575
151	thespiker	GET	/api/Customer		2025-05-05 22:11:02.346396
152	thespiker	GET	/api/CustomerType		2025-05-05 22:11:02.437205
153	thespiker	GET	/api/Position		2025-05-05 22:12:57.192806
154	thespiker	GET	/api/Employee		2025-05-05 22:12:57.192805
155	thespiker	GET	/api/Position		2025-05-05 22:12:57.251876
156	thespiker	GET	/api/Employee		2025-05-05 22:12:57.252008
157	thespiker	GET	/api/Settings/period		2025-05-05 22:13:08.088287
158	thespiker	GET	/api/backup/list		2025-05-05 22:13:08.092458
159	thespiker	GET	/api/backup/list		2025-05-05 22:13:08.162675
160	thespiker	GET	/api/Settings/period		2025-05-05 22:13:08.182155
161	thespiker	GET	/api/backup/list		2025-05-05 22:13:12.354179
162	thespiker	GET	/api/Settings/period		2025-05-05 22:13:12.354005
164	thespiker	GET	/api/Settings/period		2025-05-05 22:13:12.416457
163	thespiker	GET	/api/backup/list		2025-05-05 22:13:12.416457
165	thespiker	GET	/api/UserLog/filter		2025-05-05 22:13:36.504574
166	thespiker	GET	/api/UserLog/filter		2025-05-05 22:13:36.511773
167	thespiker	GET	/api/Settings/period		2025-05-05 22:14:03.990226
168	thespiker	GET	/api/backup/list		2025-05-05 22:14:04.051512
169	thespiker	GET	/api/Settings/period		2025-05-05 22:14:04.082894
170	thespiker	GET	/api/backup/list		2025-05-05 22:14:04.085422
171	thespiker	GET	/api/Settings/period		2025-05-05 22:14:14.479744
172	thespiker	GET	/api/Settings/period		2025-05-05 22:14:14.48475
173	thespiker	POST	/api/Settings/period	{"startDate":"2000-01-01","endDate":"2026-06-04"}	2025-05-05 22:14:24.722968
174	thespiker	GET	/api/backup/list		2025-05-05 22:14:26.829191
175	thespiker	GET	/api/UserLog/filter		2025-05-05 22:14:26.832362
176	thespiker	GET	/api/backup/list		2025-05-05 22:14:26.849683
177	thespiker	GET	/api/UserLog/filter		2025-05-05 22:14:26.893797
178	thespiker	GET	/api/Employee		2025-05-05 22:14:30.378278
179	thespiker	GET	/api/Position		2025-05-05 22:14:30.386326
180	thespiker	GET	/api/Position		2025-05-05 22:14:30.449365
181	thespiker	GET	/api/Employee		2025-05-05 22:14:30.500378
182	thespiker	GET	/api/Customer		2025-05-05 22:14:32.592773
183	thespiker	GET	/api/Payment		2025-05-05 22:14:32.596359
184	thespiker	GET	/api/Customer		2025-05-05 22:14:32.667695
185	thespiker	GET	/api/Payment		2025-05-05 22:14:32.672472
186	thespiker	GET	/api/LoanStatus		2025-05-05 22:14:32.703046
187	thespiker	GET	/api/Loan		2025-05-05 22:14:32.764092
188	thespiker	GET	/api/LoanStatus		2025-05-05 22:14:32.876734
189	thespiker	GET	/api/LoanType		2025-05-05 22:14:32.884223
190	thespiker	GET	/api/Loan		2025-05-05 22:14:32.896334
191	thespiker	GET	/api/LoanType		2025-05-05 22:14:32.93905
192	thespiker	GET	/api/PaymentType		2025-05-05 22:14:32.981462
193	thespiker	GET	/api/PaymentType		2025-05-05 22:14:33.001121
194	thespiker	GET	/api/Settings/period		2025-05-05 22:15:24.913142
195	thespiker	GET	/api/Settings/period		2025-05-05 22:15:24.919017
196	thespiker	GET	/api/UserLog/filter		2025-05-05 22:22:04.053668
197	thespiker	GET	/api/backup/list		2025-05-05 22:22:04.053252
198	thespiker	GET	/api/backup/list		2025-05-05 22:22:04.14862
199	thespiker	GET	/api/UserLog/filter		2025-05-05 22:22:04.190492
200	thespiker	GET	/api/Settings/period		2025-05-05 22:22:59.213924
201	thespiker	GET	/api/Settings/period		2025-05-05 22:22:59.218813
202	thespiker	GET	/api/Customer		2025-05-05 22:23:16.999588
203	thespiker	GET	/api/Payment		2025-05-05 22:23:16.9996
204	thespiker	GET	/api/Payment		2025-05-05 22:23:17.126818
205	thespiker	GET	/api/Customer		2025-05-05 22:23:17.159868
206	thespiker	GET	/api/LoanStatus		2025-05-05 22:23:17.186713
207	thespiker	GET	/api/LoanType		2025-05-05 22:23:17.286825
208	thespiker	GET	/api/Loan		2025-05-05 22:23:17.162789
209	thespiker	GET	/api/Loan		2025-05-05 22:23:17.323477
218	test1	GET	/api/Customer		2025-05-05 22:24:14.396798
220	test1	GET	/api/Payment		2025-05-05 22:24:14.412131
221	test1	GET	/api/Customer		2025-05-05 22:24:14.417737
226	test1	GET	/api/backup/list		2025-05-05 22:24:22.375254
227	test1	GET	/api/UserLog/filter		2025-05-05 22:24:22.438184
228	test1	GET	/api/Customer		2025-05-05 22:24:31.352905
236	test1	GET	/api/Employee		2025-05-05 22:24:36.753627
237	test1	GET	/api/Position		2025-05-05 22:24:36.758306
238	test1	GET	/api/Customer		2025-05-05 22:24:41.316074
1972	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013957
1988	thespiker	GET	/api/Customer		2025-05-07 08:59:56.664197
2012	thespiker	GET	/api/Customer		2025-05-07 08:59:55.74668
2042	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713119
2071	thespiker	GET	/api/Customer		2025-05-07 08:59:55.743879
2249	thespiker	GET	/api/Customer		2025-05-07 08:59:57.355789
2253	thespiker	GET	/api/Customer		2025-05-07 08:59:57.3627
2274	thespiker	GET	/api/Customer		2025-05-07 08:59:57.395662
2295	thespiker	GET	/api/Customer		2025-05-07 08:59:57.417521
2311	thespiker	GET	/api/Customer		2025-05-07 08:59:57.451418
2350	thespiker	GET	/api/Customer		2025-05-07 08:59:57.618637
2458	thespiker	GET	/api/Customer		2025-05-07 08:59:57.062509
2470	thespiker	GET	/api/Customer		2025-05-07 08:59:57.828496
2523	thespiker	GET	/api/Customer		2025-05-07 08:59:57.886673
2544	thespiker	GET	/api/Customer		2025-05-07 08:59:57.910224
2582	thespiker	GET	/api/Customer		2025-05-07 08:59:57.955646
2607	thespiker	GET	/api/Customer		2025-05-07 08:59:57.098471
2629	thespiker	GET	/api/Customer		2025-05-07 08:59:58.013564
2649	thespiker	GET	/api/Customer		2025-05-07 08:59:58.025709
2675	thespiker	GET	/api/Customer		2025-05-07 08:59:58.05823
2678	thespiker	GET	/api/Customer		2025-05-07 08:59:58.058984
2688	thespiker	GET	/api/Customer		2025-05-07 08:59:57.096994
2723	thespiker	GET	/api/Customer		2025-05-07 08:59:58.097847
2728	thespiker	GET	/api/Customer		2025-05-07 08:59:58.103713
2738	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106787
2781	thespiker	GET	/api/Customer		2025-05-07 08:59:58.154405
2822	thespiker	GET	/api/Customer		2025-05-07 08:59:58.190107
2835	thespiker	GET	/api/Customer		2025-05-07 08:59:58.192892
2853	thespiker	GET	/api/Customer		2025-05-07 08:59:58.209887
2959	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543736
2969	thespiker	GET	/api/Customer		2025-05-07 09:00:55.00455
2990	thespiker	GET	/api/Customer		2025-05-07 09:00:55.029299
2978	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242829
3012	thespiker	GET	/api/Customer		2025-05-07 09:00:55.067786
3014	thespiker	GET	/api/Customer		2025-05-07 09:00:55.086792
3015	thespiker	GET	/api/Customer		2025-05-07 09:00:55.094386
3016	thespiker	GET	/api/Customer		2025-05-07 09:00:55.094387
3046	thespiker	GET	/api/Customer		2025-05-07 09:00:55.117818
3054	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118638
3070	thespiker	GET	/api/Customer		2025-05-07 09:00:55.152493
3077	thespiker	GET	/api/Customer		2025-05-07 09:00:55.162071
3085	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163938
3123	thespiker	GET	/api/Customer		2025-05-07 09:00:54.246232
3158	thespiker	GET	/api/Customer		2025-05-07 09:00:55.236248
3165	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243789
3184	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263958
3187	thespiker	GET	/api/Customer		2025-05-07 09:00:55.26396
3217	thespiker	GET	/api/Customer		2025-05-07 09:00:55.294757
3222	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244661
3238	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244509
3254	thespiker	GET	/api/Customer		2025-05-07 09:00:55.503723
3257	thespiker	GET	/api/Customer		2025-05-07 09:00:55.509339
3261	thespiker	GET	/api/Customer		2025-05-07 09:00:55.514899
3265	thespiker	GET	/api/Customer		2025-05-07 09:00:55.530808
3268	thespiker	GET	/api/Customer		2025-05-07 09:00:55.536918
3282	thespiker	GET	/api/Customer		2025-05-07 09:00:55.544453
3288	thespiker	GET	/api/Customer		2025-05-07 09:00:55.553637
3295	thespiker	GET	/api/Customer		2025-05-07 09:00:55.57152
3304	thespiker	GET	/api/Customer		2025-05-07 09:00:55.577105
3315	thespiker	GET	/api/Customer		2025-05-07 09:00:55.583501
3320	thespiker	GET	/api/Customer		2025-05-07 09:00:55.584679
3328	thespiker	GET	/api/Customer		2025-05-07 09:00:55.713985
3332	thespiker	GET	/api/Customer		2025-05-07 09:00:55.722369
3335	thespiker	GET	/api/Customer		2025-05-07 09:00:55.725219
3340	thespiker	GET	/api/Customer		2025-05-07 09:00:55.730192
3358	thespiker	GET	/api/Customer		2025-05-07 09:00:55.791581
3366	thespiker	GET	/api/Customer		2025-05-07 09:00:55.797627
3383	thespiker	GET	/api/Customer		2025-05-07 09:00:55.823519
3395	thespiker	GET	/api/Customer		2025-05-07 09:00:55.844258
3400	thespiker	GET	/api/Customer		2025-05-07 09:00:55.862254
3404	thespiker	GET	/api/Customer		2025-05-07 09:00:56.012238
3411	thespiker	GET	/api/Customer		2025-05-07 09:00:56.034794
3414	thespiker	GET	/api/Customer		2025-05-07 09:00:56.051584
3419	thespiker	GET	/api/Customer		2025-05-07 09:00:56.067489
3423	thespiker	GET	/api/Customer		2025-05-07 09:00:56.087627
3468	thespiker	GET	/api/Customer		2025-05-07 09:00:56.215064
3476	thespiker	GET	/api/Customer		2025-05-07 09:00:56.237881
3475	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590316
3487	thespiker	GET	/api/Customer		2025-05-07 09:00:56.255336
3489	thespiker	GET	/api/Customer		2025-05-07 09:00:56.258546
3495	thespiker	GET	/api/Customer		2025-05-07 09:00:56.266628
3500	thespiker	GET	/api/Customer		2025-05-07 09:00:56.276213
3535	thespiker	GET	/api/Customer		2025-05-07 09:00:56.38161
3549	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602494
3575	thespiker	GET	/api/Customer		2025-05-07 09:00:56.449655
3587	thespiker	GET	/api/Customer		2025-05-07 09:00:56.463662
3594	thespiker	GET	/api/Customer		2025-05-07 09:00:56.475057
3606	thespiker	GET	/api/Customer		2025-05-07 09:00:56.491388
3612	thespiker	GET	/api/Customer		2025-05-07 09:00:55.32786
3617	thespiker	GET	/api/Customer		2025-05-07 09:00:56.499232
3620	thespiker	GET	/api/Customer		2025-05-07 09:00:56.499576
3640	thespiker	GET	/api/Customer		2025-05-07 09:00:56.523838
3650	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532607
3656	thespiker	GET	/api/Customer		2025-05-07 09:00:56.533376
3666	thespiker	GET	/api/Customer		2025-05-07 09:00:56.553705
3668	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603481
3685	thespiker	GET	/api/Customer		2025-05-07 09:00:56.591072
3693	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606179
210	thespiker	GET	/api/LoanStatus		2025-05-05 22:23:17.326512
213	thespiker	GET	/api/PaymentType		2025-05-05 22:23:17.596995
214	Anonymous	POST	/login	{"username":"test","password":"Password1-"}	2025-05-05 22:23:57.559817
215	Anonymous	POST	/login	{"username":"test1","password":"Password1-"}	2025-05-05 22:24:01.00557
216	test1	GET	/api/Settings/period		2025-05-05 22:24:13.171598
225	test1	GET	/api/UserLog/filter		2025-05-05 22:24:22.316853
229	test1	GET	/api/Payment		2025-05-05 22:24:31.353684
230	test1	GET	/api/Customer		2025-05-05 22:24:31.398169
235	test1	GET	/api/Position		2025-05-05 22:24:36.719714
240	test1	GET	/api/Customer		2025-05-05 22:24:41.351546
241	test1	GET	/api/CustomerType		2025-05-05 22:24:41.415254
1976	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744458
1992	thespiker	GET	/api/Customer		2025-05-07 08:59:56.667875
2038	thespiker	GET	/api/Customer		2025-05-07 08:59:55.748527
2043	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713075
2074	thespiker	GET	/api/Customer		2025-05-07 08:59:55.745949
2278	thespiker	GET	/api/Customer		2025-05-07 08:59:56.788849
2288	thespiker	GET	/api/Customer		2025-05-07 08:59:57.406552
2302	thespiker	GET	/api/Customer		2025-05-07 08:59:57.424719
2310	thespiker	GET	/api/Customer		2025-05-07 08:59:57.449967
2335	thespiker	GET	/api/Customer		2025-05-07 08:59:57.555817
2347	thespiker	GET	/api/Customer		2025-05-07 08:59:57.611562
2379	thespiker	GET	/api/Customer		2025-05-07 08:59:57.659976
2385	thespiker	GET	/api/Customer		2025-05-07 08:59:57.671647
2396	thespiker	GET	/api/Customer		2025-05-07 08:59:57.692378
2437	thespiker	GET	/api/Customer		2025-05-07 08:59:57.784416
2452	thespiker	GET	/api/Customer		2025-05-07 08:59:57.805375
2478	thespiker	GET	/api/Customer		2025-05-07 08:59:57.833633
2499	thespiker	GET	/api/Customer		2025-05-07 08:59:57.860532
2513	thespiker	GET	/api/Customer		2025-05-07 08:59:57.876158
2552	thespiker	GET	/api/Customer		2025-05-07 08:59:57.919585
2562	thespiker	GET	/api/Customer		2025-05-07 08:59:57.929569
2595	thespiker	GET	/api/Customer		2025-05-07 08:59:57.970035
2610	thespiker	GET	/api/Customer		2025-05-07 08:59:57.983838
2608	thespiker	GET	/api/Customer		2025-05-07 08:59:57.096795
2638	thespiker	GET	/api/Customer		2025-05-07 08:59:58.019574
2654	thespiker	GET	/api/Customer		2025-05-07 08:59:58.027783
2699	thespiker	GET	/api/Customer		2025-05-07 08:59:58.07202
2693	thespiker	GET	/api/Customer		2025-05-07 08:59:57.060656
2708	thespiker	GET	/api/Customer		2025-05-07 08:59:58.073498
2769	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129655
2811	thespiker	GET	/api/Customer		2025-05-07 08:59:58.179004
2854	thespiker	GET	/api/Customer		2025-05-07 08:59:58.210672
2882	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224396
2884	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224921
2902	thespiker	GET	/api/Customer		2025-05-07 08:59:58.24016
2942	thespiker	GET	/api/Customer		2025-05-07 08:59:58.262838
2945	thespiker	GET	/api/Customer		2025-05-07 08:59:58.263929
2960	thespiker	GET	/api/Customer		2025-05-07 09:00:53.54373
2965	thespiker	GET	/api/Customer		2025-05-07 09:00:54.997438
2970	thespiker	GET	/api/Customer		2025-05-07 09:00:55.00455
2987	thespiker	GET	/api/Customer		2025-05-07 09:00:55.028137
3008	thespiker	GET	/api/Customer		2025-05-07 09:00:55.063882
2994	thespiker	GET	/api/Customer		2025-05-07 09:00:54.246335
3017	thespiker	GET	/api/Customer		2025-05-07 09:00:55.095539
3027	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103611
3029	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103612
3100	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165304
3102	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165477
3112	thespiker	GET	/api/Customer		2025-05-07 09:00:55.184479
3113	thespiker	GET	/api/Customer		2025-05-07 09:00:55.184479
3121	thespiker	GET	/api/Customer		2025-05-07 09:00:54.291543
3168	thespiker	GET	/api/Customer		2025-05-07 09:00:54.278492
3221	thespiker	GET	/api/Customer		2025-05-07 09:00:54.277551
3243	thespiker	GET	/api/Customer		2025-05-07 09:00:54.279296
3255	thespiker	GET	/api/Customer		2025-05-07 09:00:55.503627
3258	thespiker	GET	/api/Customer		2025-05-07 09:00:55.509339
3264	thespiker	GET	/api/Customer		2025-05-07 09:00:55.516219
3266	thespiker	GET	/api/Customer		2025-05-07 09:00:55.530808
3272	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54047
3279	thespiker	GET	/api/Customer		2025-05-07 09:00:55.542909
3284	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54886
3286	thespiker	GET	/api/Customer		2025-05-07 09:00:55.552367
3299	thespiker	GET	/api/Customer		2025-05-07 09:00:55.573783
3306	thespiker	GET	/api/Customer		2025-05-07 09:00:55.577105
3314	thespiker	GET	/api/Customer		2025-05-07 09:00:55.583252
3324	thespiker	GET	/api/Customer		2025-05-07 09:00:55.589658
3336	thespiker	GET	/api/Customer		2025-05-07 09:00:55.726873
3344	thespiker	GET	/api/Customer		2025-05-07 09:00:55.736894
3349	thespiker	GET	/api/Customer		2025-05-07 09:00:55.739829
3355	thespiker	GET	/api/Customer		2025-05-07 09:00:55.748286
3360	thespiker	GET	/api/Customer		2025-05-07 09:00:55.792449
3364	thespiker	GET	/api/Customer		2025-05-07 09:00:55.795643
3392	thespiker	GET	/api/Customer		2025-05-07 09:00:55.839964
3416	thespiker	GET	/api/Customer		2025-05-07 09:00:56.05561
3417	thespiker	GET	/api/Customer		2025-05-07 09:00:55.344061
3421	thespiker	GET	/api/Customer		2025-05-07 09:00:56.073062
3437	thespiker	GET	/api/Customer		2025-05-07 09:00:56.13937
3441	thespiker	GET	/api/Customer		2025-05-07 09:00:56.148734
3450	thespiker	GET	/api/Customer		2025-05-07 09:00:56.165254
3461	thespiker	GET	/api/Customer		2025-05-07 09:00:56.19376
3481	thespiker	GET	/api/Customer		2025-05-07 09:00:56.246125
3482	thespiker	GET	/api/Customer		2025-05-07 09:00:56.247447
3520	thespiker	GET	/api/Customer		2025-05-07 09:00:56.332317
3542	thespiker	GET	/api/Customer		2025-05-07 09:00:56.392322
3546	thespiker	GET	/api/Customer		2025-05-07 09:00:56.397567
3552	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590111
3563	thespiker	GET	/api/Customer		2025-05-07 09:00:56.432352
3572	thespiker	GET	/api/Customer		2025-05-07 09:00:56.447688
3576	thespiker	GET	/api/Customer		2025-05-07 09:00:56.451817
3582	thespiker	GET	/api/Customer		2025-05-07 09:00:56.458431
3593	thespiker	GET	/api/Customer		2025-05-07 09:00:56.474065
3595	thespiker	GET	/api/Customer		2025-05-07 09:00:56.475057
3613	thespiker	GET	/api/Customer		2025-05-07 09:00:55.506212
3624	thespiker	GET	/api/Customer		2025-05-07 09:00:56.503594
3630	thespiker	GET	/api/Customer		2025-05-07 09:00:56.506373
3678	thespiker	GET	/api/Customer		2025-05-07 09:00:56.578844
211	thespiker	GET	/api/PaymentType		2025-05-05 22:23:17.443402
212	thespiker	GET	/api/LoanType		2025-05-05 22:23:17.504188
217	test1	GET	/api/Settings/period		2025-05-05 22:24:13.175985
219	test1	GET	/api/Payment		2025-05-05 22:24:14.401245
222	test1	GET	/api/Loan		2025-05-05 22:24:14.482076
223	test1	GET	/api/Loan		2025-05-05 22:24:18.844023
224	test1	GET	/api/backup/list		2025-05-05 22:24:22.314602
231	test1	GET	/api/Payment		2025-05-05 22:24:31.402642
232	test1	GET	/api/Loan		2025-05-05 22:24:32.58545
233	test1	GET	/api/Loan		2025-05-05 22:24:34.240124
234	test1	GET	/api/Employee		2025-05-05 22:24:36.718229
239	test1	GET	/api/CustomerType		2025-05-05 22:24:41.321476
243	test1	GET	/api/backup/list		2025-05-05 22:56:17.940525
242	test1	GET	/api/UserLog/filter		2025-05-05 22:56:17.940525
244	test1	GET	/api/backup/list		2025-05-05 22:56:18.091405
245	test1	GET	/api/UserLog/filter		2025-05-05 22:56:18.126288
246	test1	GET	/api/Payment		2025-05-05 22:56:25.556046
247	test1	GET	/api/Customer		2025-05-05 22:56:25.556104
248	test1	GET	/api/Customer		2025-05-05 22:56:25.586304
249	test1	GET	/api/Payment		2025-05-05 22:56:25.59491
250	test1	GET	/api/Loan		2025-05-05 22:56:27.71468
251	test1	GET	/api/Loan		2025-05-05 22:56:27.736046
252	test1	GET	/api/Customer		2025-05-05 22:56:34.570115
253	test1	GET	/api/Payment		2025-05-05 22:56:34.570459
254	test1	GET	/api/Customer		2025-05-05 22:56:34.603432
255	test1	GET	/api/Payment		2025-05-05 22:56:34.603907
256	test1	GET	/api/Loan		2025-05-05 22:56:38.202924
257	test1	GET	/api/Loan		2025-05-05 22:56:39.23323
258	test1	GET	/api/Customer		2025-05-05 22:56:40.804164
259	test1	GET	/api/CustomerType		2025-05-05 22:56:40.807927
260	test1	GET	/api/Customer		2025-05-05 22:56:40.850246
261	test1	GET	/api/CustomerType		2025-05-05 22:56:40.880491
262	test1	GET	/api/backup/list		2025-05-05 22:57:37.029568
263	test1	GET	/api/UserLog/filter		2025-05-05 22:57:37.036651
264	test1	GET	/api/backup/list		2025-05-05 22:57:37.09701
265	test1	GET	/api/UserLog/filter		2025-05-05 22:57:37.129942
266	test1	GET	/api/Settings/period		2025-05-05 22:57:42.125537
267	test1	GET	/api/Settings/period		2025-05-05 22:57:42.133162
269	Anonymous	GET	/api/Payment		2025-05-05 23:55:23.909696
268	Anonymous	GET	/api/Position		2025-05-05 23:55:24.595316
270	Anonymous	GET	/api/Position		2025-05-05 23:55:25.469217
271	Anonymous	GET	/api/Payment		2025-05-05 23:55:25.496618
272	Anonymous	GET	/api/Payment		2025-05-05 23:55:26.940351
273	Anonymous	GET	/api/Payment		2025-05-05 23:55:26.956425
274	Anonymous	POST	/login	{"username":"test2","password":"Password1-"}	2025-05-05 23:55:44.762506
275	Anonymous	POST	/login	{"username":"test1","password":"Password1-"}	2025-05-05 23:55:48.226149
276	test1	GET	/api/Position		2025-05-05 23:58:17.64584
277	test1	GET	/api/Employee		2025-05-05 23:58:17.64584
278	test1	GET	/api/Position		2025-05-05 23:58:17.775851
279	test1	GET	/api/Employee		2025-05-05 23:58:17.805785
280	test1	GET	/api/Customer		2025-05-05 23:58:27.776837
281	test1	GET	/api/CustomerType		2025-05-05 23:58:27.777168
282	test1	GET	/api/CustomerType		2025-05-05 23:58:27.8911
283	test1	GET	/api/Customer		2025-05-05 23:58:27.941974
284	test1	GET	/api/Customer		2025-05-05 23:58:29.383938
285	test1	GET	/api/Payment		2025-05-05 23:58:29.388161
286	test1	GET	/api/Payment		2025-05-05 23:58:29.452228
287	test1	GET	/api/Customer		2025-05-05 23:58:29.481558
288	test1	GET	/api/LoanStatus		2025-05-05 23:58:29.542693
289	test1	GET	/api/LoanStatus		2025-05-05 23:58:29.72802
290	test1	GET	/api/LoanType		2025-05-05 23:58:29.73518
291	test1	GET	/api/LoanType		2025-05-05 23:58:29.757691
292	test1	GET	/api/PaymentType		2025-05-05 23:58:29.782664
293	test1	GET	/api/PaymentType		2025-05-05 23:58:29.801888
294	test1	GET	/api/Loan		2025-05-05 23:58:29.513845
295	test1	GET	/api/Loan		2025-05-05 23:58:29.853136
296	test1	GET	/api/Settings/period		2025-05-05 23:58:32.184537
297	test1	GET	/api/Settings/period		2025-05-05 23:58:32.189431
299	test1	GET	/api/UserLog/filter		2025-05-05 23:58:35.859734
298	test1	GET	/api/backup/list		2025-05-05 23:58:35.859734
300	test1	GET	/api/backup/list		2025-05-05 23:58:35.924867
301	test1	GET	/api/UserLog/filter		2025-05-05 23:58:35.930741
302	test1	GET	/api/backup/list		2025-05-06 00:01:01.182698
303	test1	GET	/api/UserLog/filter		2025-05-06 00:01:01.182699
305	test1	GET	/api/backup/list		2025-05-06 00:01:02.355898
304	test1	GET	/api/UserLog/filter		2025-05-06 00:01:02.356321
306	test1	GET	/api/backup/list		2025-05-06 00:01:31.508127
307	test1	GET	/api/UserLog/filter		2025-05-06 00:01:31.508127
308	test1	GET	/api/backup/list		2025-05-06 00:01:31.602067
309	test1	GET	/api/UserLog/filter		2025-05-06 00:01:31.602067
310	Anonymous	POST	/login	{"username":"test1","password":"Password1-"}	2025-05-06 00:01:47.53564
311	test1	GET	/api/UserLog/filter		2025-05-06 00:02:01.334151
312	test1	GET	/api/backup/list		2025-05-06 00:02:01.334019
313	test1	GET	/api/backup/list		2025-05-06 00:02:01.439599
314	test1	GET	/api/UserLog/filter		2025-05-06 00:02:01.467294
315	test1	GET	/api/Settings/period		2025-05-06 00:02:07.701666
316	test1	GET	/api/Settings/period		2025-05-06 00:02:07.706382
318	test1	GET	/api/Position		2025-05-06 00:02:11.328575
317	test1	GET	/api/Employee		2025-05-06 00:02:11.328702
319	test1	GET	/api/Employee		2025-05-06 00:02:11.410733
320	test1	GET	/api/Position		2025-05-06 00:02:11.435295
321	Anonymous	POST	/api/customers	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-06 13:06:31.889558
322	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284755
323	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334505
324	Anonymous	GET	/api/customers		2025-05-06 13:06:33.335653
325	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284755
326	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284755
327	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284756
328	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284755
329	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284756
330	Anonymous	GET	/api/customers		2025-05-06 13:06:33.28476
331	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334527
332	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284983
333	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284755
336	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334541
335	Anonymous	GET	/api/customers		2025-05-06 13:06:33.284757
334	Anonymous	GET	/api/customers		2025-05-06 13:06:33.336587
337	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334505
338	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334505
339	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334891
340	Anonymous	GET	/api/customers		2025-05-06 13:06:33.342047
341	Anonymous	GET	/api/customers		2025-05-06 13:06:33.334736
342	Anonymous	POST	/api/%D0%A1ustomer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-06 13:07:50.121347
343	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
344	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.17828
345	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
346	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
347	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
348	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136354
349	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
350	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136354
351	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
352	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
353	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177611
354	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.136353
355	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177634
356	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177651
357	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177611
358	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.17777
359	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177611
360	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177611
361	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.183533
362	Anonymous	GET	/api/%D0%A1ustomer		2025-05-06 13:07:51.177703
363	Anonymous	POST	/api/%D0%A1ustomer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-06 13:09:26.426124
364	Anonymous	POST	/api/%D0%A1ustomer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:30:05.077674
365	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327213
366	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.371086
367	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327178
368	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327203
369	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327166
370	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.369971
371	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.370121
372	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.369976
373	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327207
374	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327166
375	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327183
376	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327195
377	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.37004
378	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327166
379	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.369961
380	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.369961
381	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.370176
382	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.370292
383	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.327188
384	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:30:06.369961
385	Anonymous	POST	/api/%D0%A1ustomer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:31:34.497823
386	Anonymous	POST	/api/%D0%A1ustomer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:32:42.75124
387	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.13425
388	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748079
397	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.13426
390	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748077
392	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134257
391	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134263
393	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748077
396	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134244
394	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134247
389	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134265
395	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748078
398	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748252
400	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748194
399	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748077
401	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134255
402	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134241
404	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748077
405	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.134239
406	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748078
403	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:34:27.748077
411	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510155
410	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510164
409	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510144
407	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135542
408	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135542
412	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135541
417	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510162
416	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.51016
413	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510148
414	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510144
415	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510151
418	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135543
419	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135542
420	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135542
421	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510146
422	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.13554
423	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135542
424	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135541
425	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:01.510167
426	Anonymous	GET	/api/%D0%A1ustomer		2025-05-07 08:35:02.135539
427	Anonymous	POST	/login	{\n  "username": "thespiker",\n  "password": "Password1-"\n}	2025-05-07 08:37:00.486908
428	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:37:23.925814
429	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918277
430	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957981
431	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918277
432	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918274
433	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918277
434	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918277
435	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957975
436	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957975
437	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918276
438	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918274
439	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918277
440	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.963502
441	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.958246
443	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.958246
442	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957989
444	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918276
445	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.918269
446	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957991
447	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957989
448	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:37:24.957989
449	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","customertypeid":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:37:42.00739
450	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","type":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:39:13.781439
451	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","type":1,"dateofbirth":"1990-01-01"}	2025-05-07 08:39:52.331008
452	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:41:07.074193
453	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089156
454	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.134913
455	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089156
456	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128642
457	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089156
458	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089155
459	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128642
460	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128641
461	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089154
462	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089159
463	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089161
464	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128642
465	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128643
466	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089155
467	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089155
468	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128642
469	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.12886
470	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128642
471	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.089154
472	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:41:08.128641
473	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:25.206747
474	thespiker	POST	/api/Customer	{"name":"Customer_1","phone":"\\u002B380999000001","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.576852
475	thespiker	POST	/api/Customer	{"name":"Customer_2","phone":"\\u002B380999000002","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.630042
476	thespiker	POST	/api/Customer	{"name":"Customer_3","phone":"\\u002B380999000003","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.643478
477	thespiker	POST	/api/Customer	{"name":"Customer_4","phone":"\\u002B380999000004","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.64773
478	thespiker	POST	/api/Customer	{"name":"Customer_5","phone":"\\u002B380999000005","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.650739
479	thespiker	POST	/api/Customer	{"name":"Customer_6","phone":"\\u002B380999000006","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.65368
480	thespiker	POST	/api/Customer	{"name":"Customer_7","phone":"\\u002B380999000007","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.65669
481	thespiker	POST	/api/Customer	{"name":"Customer_8","phone":"\\u002B380999000008","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.660197
482	thespiker	POST	/api/Customer	{"name":"Customer_9","phone":"\\u002B380999000009","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:49:26.663506
483	thespiker	DELETE	/api/Customer/11		2025-05-07 08:49:26.66738
484	thespiker	DELETE	/api/Customer/12		2025-05-07 08:49:26.720594
485	thespiker	DELETE	/api/Customer/13		2025-05-07 08:49:26.724962
486	thespiker	DELETE	/api/Customer/14		2025-05-07 08:49:26.728753
487	thespiker	DELETE	/api/Customer/15		2025-05-07 08:49:26.731763
488	thespiker	DELETE	/api/Customer/16		2025-05-07 08:49:26.734702
489	thespiker	DELETE	/api/Customer/17		2025-05-07 08:49:26.737704
490	thespiker	DELETE	/api/Customer/18		2025-05-07 08:49:26.741155
491	thespiker	DELETE	/api/Customer/19		2025-05-07 08:49:26.745334
492	thespiker	DELETE	/api/Customer/20		2025-05-07 08:49:26.748647
493	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192777
501	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192769
494	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.822218
498	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.822218
495	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192763
502	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.852449
499	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192729
500	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192727
496	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192761
497	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192781
503	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192766
504	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.852448
506	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.843587
505	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192779
507	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.192772
508	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.852448
509	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.84278
510	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.843513
511	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.852448
512	thespiker	GET	/api/%D0%A1ustomer		2025-05-07 08:49:32.852448
513	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583787
519	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583771
522	thespiker	GET	/api/Customer		2025-05-07 08:52:31.58378
523	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583792
514	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583769
520	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583782
518	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583777
521	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583789
515	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583775
517	thespiker	GET	/api/Customer		2025-05-07 08:52:31.583794
516	thespiker	GET	/api/Customer		2025-05-07 08:52:32.242121
524	thespiker	GET	/api/Customer		2025-05-07 08:52:32.21502
525	thespiker	GET	/api/Customer		2025-05-07 08:52:32.834555
527	thespiker	GET	/api/Customer		2025-05-07 08:52:32.834674
528	thespiker	GET	/api/Customer		2025-05-07 08:52:32.834553
529	thespiker	GET	/api/Customer		2025-05-07 08:52:32.834549
526	thespiker	GET	/api/Customer		2025-05-07 08:52:32.834549
530	thespiker	GET	/api/Customer		2025-05-07 08:52:32.836145
531	thespiker	GET	/api/Customer		2025-05-07 08:52:32.836145
556	thespiker	GET	/api/Customer		2025-05-07 08:52:32.869282
564	thespiker	GET	/api/Customer		2025-05-07 08:52:32.871963
575	thespiker	GET	/api/Customer		2025-05-07 08:52:32.893591
595	thespiker	GET	/api/Customer		2025-05-07 08:52:32.901955
605	thespiker	GET	/api/Customer		2025-05-07 08:52:32.905213
645	thespiker	GET	/api/Customer		2025-05-07 08:52:32.936499
651	thespiker	GET	/api/Customer		2025-05-07 08:52:32.941208
705	thespiker	GET	/api/Customer		2025-05-07 08:52:32.968133
1979	thespiker	GET	/api/Customer		2025-05-07 08:59:55.715256
1991	thespiker	GET	/api/Customer		2025-05-07 08:59:56.667306
2020	thespiker	GET	/api/Customer		2025-05-07 08:59:55.7504
2027	thespiker	GET	/api/Customer		2025-05-07 08:59:55.651619
2073	thespiker	GET	/api/Customer		2025-05-07 08:59:55.747634
2282	thespiker	GET	/api/Customer		2025-05-07 08:59:56.765662
2348	thespiker	GET	/api/Customer		2025-05-07 08:59:57.615889
2366	thespiker	GET	/api/Customer		2025-05-07 08:59:57.637137
2372	thespiker	GET	/api/Customer		2025-05-07 08:59:57.649555
2488	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84761
2503	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094676
2618	thespiker	GET	/api/Customer		2025-05-07 08:59:57.105172
2696	thespiker	GET	/api/Customer		2025-05-07 08:59:57.095441
2718	thespiker	GET	/api/Customer		2025-05-07 08:59:58.090591
2732	thespiker	GET	/api/Customer		2025-05-07 08:59:58.104925
2746	thespiker	GET	/api/Customer		2025-05-07 08:59:58.124752
2755	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127309
2758	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127425
2766	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129021
2791	thespiker	GET	/api/Customer		2025-05-07 08:59:58.159173
2830	thespiker	GET	/api/Customer		2025-05-07 08:59:58.191838
2845	thespiker	GET	/api/Customer		2025-05-07 08:59:58.20052
2871	thespiker	GET	/api/Customer		2025-05-07 08:59:58.216878
2903	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240255
2923	thespiker	GET	/api/Customer		2025-05-07 08:59:58.256665
2958	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543733
2988	thespiker	GET	/api/Customer		2025-05-07 09:00:55.028895
2997	thespiker	GET	/api/Customer		2025-05-07 09:00:55.061519
2998	thespiker	GET	/api/Customer		2025-05-07 09:00:54.275816
3022	thespiker	GET	/api/Customer		2025-05-07 09:00:55.101854
3034	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103611
3042	thespiker	GET	/api/Customer		2025-05-07 09:00:55.116043
3071	thespiker	GET	/api/Customer		2025-05-07 09:00:55.152493
3078	thespiker	GET	/api/Customer		2025-05-07 09:00:55.162308
3086	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163941
3118	thespiker	GET	/api/Customer		2025-05-07 09:00:55.189883
3137	thespiker	GET	/api/Customer		2025-05-07 09:00:55.214758
3132	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243789
3148	thespiker	GET	/api/Customer		2025-05-07 09:00:55.222721
3189	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263956
3171	thespiker	GET	/api/Customer		2025-05-07 09:00:54.272535
3196	thespiker	GET	/api/Customer		2025-05-07 09:00:55.279208
3211	thespiker	GET	/api/Customer		2025-05-07 09:00:54.245465
3236	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274886
3259	thespiker	GET	/api/Customer		2025-05-07 09:00:55.514195
3271	thespiker	GET	/api/Customer		2025-05-07 09:00:55.539305
3276	thespiker	GET	/api/Customer		2025-05-07 09:00:55.541459
3289	thespiker	GET	/api/Customer		2025-05-07 09:00:55.553498
3308	thespiker	GET	/api/Customer		2025-05-07 09:00:55.577305
3316	thespiker	GET	/api/Customer		2025-05-07 09:00:55.584323
3327	thespiker	GET	/api/Customer		2025-05-07 09:00:55.655416
3357	thespiker	GET	/api/Customer		2025-05-07 09:00:55.791123
3362	thespiker	GET	/api/Customer		2025-05-07 09:00:55.795059
3374	thespiker	GET	/api/Customer		2025-05-07 09:00:55.812595
3382	thespiker	GET	/api/Customer		2025-05-07 09:00:55.822211
3393	thespiker	GET	/api/Customer		2025-05-07 09:00:55.840011
3415	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590753
3429	thespiker	GET	/api/Customer		2025-05-07 09:00:56.120837
3438	thespiker	GET	/api/Customer		2025-05-07 09:00:56.140796
3467	thespiker	GET	/api/Customer		2025-05-07 09:00:56.213778
3493	thespiker	GET	/api/Customer		2025-05-07 09:00:56.263744
3497	thespiker	GET	/api/Customer		2025-05-07 09:00:55.591143
3503	thespiker	GET	/api/Customer		2025-05-07 09:00:56.284179
3505	thespiker	GET	/api/Customer		2025-05-07 09:00:56.285565
3506	thespiker	GET	/api/Customer		2025-05-07 09:00:56.285521
3511	thespiker	GET	/api/Customer		2025-05-07 09:00:56.297024
3519	thespiker	GET	/api/Customer		2025-05-07 09:00:56.308808
3523	thespiker	GET	/api/Customer		2025-05-07 09:00:56.344053
3531	thespiker	GET	/api/Customer		2025-05-07 09:00:56.37693
3536	thespiker	GET	/api/Customer		2025-05-07 09:00:56.385925
3551	thespiker	GET	/api/Customer		2025-05-07 09:00:56.415654
3553	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590947
3564	thespiker	GET	/api/Customer		2025-05-07 09:00:56.433753
3578	thespiker	GET	/api/Customer		2025-05-07 09:00:55.542541
3584	thespiker	GET	/api/Customer		2025-05-07 09:00:56.458437
3585	thespiker	GET	/api/Customer		2025-05-07 09:00:56.459793
3589	thespiker	GET	/api/Customer		2025-05-07 09:00:56.463661
3614	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603775
3627	thespiker	GET	/api/Customer		2025-05-07 09:00:56.505132
3632	thespiker	GET	/api/Customer		2025-05-07 09:00:56.51068
3638	thespiker	GET	/api/Customer		2025-05-07 09:00:56.519522
3649	thespiker	GET	/api/Customer		2025-05-07 09:00:56.529163
3653	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532608
3662	thespiker	GET	/api/Customer		2025-05-07 09:00:56.547062
3677	thespiker	GET	/api/Customer		2025-05-07 09:00:56.578821
3673	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602657
3684	thespiker	GET	/api/Customer		2025-05-07 09:00:56.59051
3694	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606007
3699	thespiker	GET	/api/Customer		2025-05-07 09:00:56.606316
3707	thespiker	GET	/api/Customer		2025-05-07 09:00:56.616079
3715	thespiker	GET	/api/Customer		2025-05-07 09:00:56.617754
3723	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603022
3743	thespiker	GET	/api/Customer		2025-05-07 09:00:56.649185
3725	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606182
3757	thespiker	GET	/api/Customer		2025-05-07 09:00:56.672983
3760	thespiker	GET	/api/Customer		2025-05-07 09:00:56.67519
3763	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675974
3775	thespiker	GET	/api/Customer		2025-05-07 09:00:56.696246
533	thespiker	GET	/api/Customer		2025-05-07 08:52:32.850201
549	thespiker	GET	/api/Customer		2025-05-07 08:52:32.859237
553	thespiker	GET	/api/Customer		2025-05-07 08:52:32.863408
560	thespiker	GET	/api/Customer		2025-05-07 08:52:32.8707
569	thespiker	GET	/api/Customer		2025-05-07 08:52:32.874383
587	thespiker	GET	/api/Customer		2025-05-07 08:52:32.898065
607	thespiker	GET	/api/Customer		2025-05-07 08:52:32.916648
626	thespiker	GET	/api/Customer		2025-05-07 08:52:32.91972
663	thespiker	GET	/api/Customer		2025-05-07 08:52:32.943
675	thespiker	GET	/api/Customer		2025-05-07 08:52:32.955996
692	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963108
703	thespiker	GET	/api/Customer		2025-05-07 08:52:32.968764
710	thespiker	GET	/api/Customer		2025-05-07 08:52:32.973194
1973	thespiker	GET	/api/Customer		2025-05-07 08:59:55.652456
2006	thespiker	GET	/api/Customer		2025-05-07 08:59:55.7166
2010	thespiker	GET	/api/Customer		2025-05-07 08:59:55.711089
2075	thespiker	GET	/api/Customer		2025-05-07 08:59:56.897523
2088	thespiker	GET	/api/Customer		2025-05-07 08:59:56.97538
2098	thespiker	GET	/api/Customer		2025-05-07 08:59:56.97764
2101	thespiker	GET	/api/Customer		2025-05-07 08:59:56.982222
2107	thespiker	GET	/api/Customer		2025-05-07 08:59:57.007287
2110	thespiker	GET	/api/Customer		2025-05-07 08:59:57.012172
2126	thespiker	GET	/api/Customer		2025-05-07 08:59:57.023559
2131	thespiker	GET	/api/Customer		2025-05-07 08:59:57.028202
2132	thespiker	GET	/api/Customer		2025-05-07 08:59:57.03064
2138	thespiker	GET	/api/Customer		2025-05-07 08:59:57.043966
2141	thespiker	GET	/api/Customer		2025-05-07 08:59:57.047992
2144	thespiker	GET	/api/Customer		2025-05-07 08:59:57.052343
2158	thespiker	GET	/api/Customer		2025-05-07 08:59:57.058652
2182	thespiker	GET	/api/Customer		2025-05-07 08:59:57.196793
2210	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2221	thespiker	GET	/api/Customer		2025-05-07 08:59:57.241559
2237	thespiker	GET	/api/Customer		2025-05-07 08:59:57.340765
2290	thespiker	GET	/api/Customer		2025-05-07 08:59:57.406552
2297	thespiker	GET	/api/Customer		2025-05-07 08:59:57.418871
2304	thespiker	GET	/api/Customer		2025-05-07 08:59:57.425151
2307	thespiker	GET	/api/Customer		2025-05-07 08:59:57.446823
2322	thespiker	GET	/api/Customer		2025-05-07 08:59:57.473774
2355	thespiker	GET	/api/Customer		2025-05-07 08:59:57.624777
2360	thespiker	GET	/api/Customer		2025-05-07 08:59:57.63045
2365	thespiker	GET	/api/Customer		2025-05-07 08:59:57.637146
2398	thespiker	GET	/api/Customer		2025-05-07 08:59:57.696454
2404	thespiker	GET	/api/Customer		2025-05-07 08:59:57.714089
2418	thespiker	GET	/api/Customer		2025-05-07 08:59:57.756338
2429	thespiker	GET	/api/Customer		2025-05-07 08:59:57.773695
2469	thespiker	GET	/api/Customer		2025-05-07 08:59:57.827541
2483	thespiker	GET	/api/Customer		2025-05-07 08:59:57.841624
2504	thespiker	GET	/api/Customer		2025-05-07 08:59:57.061679
2540	thespiker	GET	/api/Customer		2025-05-07 08:59:57.907676
2586	thespiker	GET	/api/Customer		2025-05-07 08:59:57.961561
2602	thespiker	GET	/api/Customer		2025-05-07 08:59:57.977861
2615	thespiker	GET	/api/Customer		2025-05-07 08:59:57.998881
2619	thespiker	GET	/api/Customer		2025-05-07 08:59:57.059149
2665	thespiker	GET	/api/Customer		2025-05-07 08:59:58.045419
2666	thespiker	GET	/api/Customer		2025-05-07 08:59:58.031148
2670	thespiker	GET	/api/Customer		2025-05-07 08:59:58.057194
2674	thespiker	GET	/api/Customer		2025-05-07 08:59:58.0579
2692	thespiker	GET	/api/Customer		2025-05-07 08:59:57.108048
2737	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106763
2739	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106853
2762	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128473
2767	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129655
2784	thespiker	GET	/api/Customer		2025-05-07 08:59:58.157916
2786	thespiker	GET	/api/Customer		2025-05-07 08:59:58.15874
2798	thespiker	GET	/api/Customer		2025-05-07 08:59:58.171049
2810	thespiker	GET	/api/Customer		2025-05-07 08:59:58.178279
2821	thespiker	GET	/api/Customer		2025-05-07 08:59:58.190033
2841	thespiker	GET	/api/Customer		2025-05-07 08:59:58.199143
2859	thespiker	GET	/api/Customer		2025-05-07 08:59:58.213918
2862	thespiker	GET	/api/Customer		2025-05-07 08:59:58.214481
2870	thespiker	GET	/api/Customer		2025-05-07 08:59:58.216879
2880	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224096
2892	thespiker	GET	/api/Customer		2025-05-07 08:59:58.230647
2894	thespiker	GET	/api/Customer		2025-05-07 08:59:58.231674
2900	thespiker	GET	/api/Customer		2025-05-07 08:59:58.239852
2938	thespiker	GET	/api/Customer		2025-05-07 08:59:58.261612
2956	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543757
3002	thespiker	GET	/api/Customer		2025-05-07 09:00:54.267298
3013	thespiker	GET	/api/Customer		2025-05-07 09:00:55.06786
3039	thespiker	GET	/api/Customer		2025-05-07 09:00:55.115087
3041	thespiker	GET	/api/Customer		2025-05-07 09:00:55.116043
3066	thespiker	GET	/api/Customer		2025-05-07 09:00:55.138236
3072	thespiker	GET	/api/Customer		2025-05-07 09:00:55.153304
3079	thespiker	GET	/api/Customer		2025-05-07 09:00:55.162849
3091	thespiker	GET	/api/Customer		2025-05-07 09:00:55.16469
3135	thespiker	GET	/api/Customer		2025-05-07 09:00:54.275655
3157	thespiker	GET	/api/Customer		2025-05-07 09:00:55.236215
3185	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263958
3191	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3169	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244665
3200	thespiker	GET	/api/Customer		2025-05-07 09:00:55.27942
3224	thespiker	GET	/api/Customer		2025-05-07 09:00:55.311779
3225	thespiker	GET	/api/Customer		2025-05-07 09:00:55.311798
3233	thespiker	GET	/api/Customer		2025-05-07 09:00:54.245388
3260	thespiker	GET	/api/Customer		2025-05-07 09:00:55.514195
3267	thespiker	GET	/api/Customer		2025-05-07 09:00:55.534648
3277	thespiker	GET	/api/Customer		2025-05-07 09:00:55.541619
3281	thespiker	GET	/api/Customer		2025-05-07 09:00:55.543373
3283	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54886
3287	thespiker	GET	/api/Customer		2025-05-07 09:00:55.55233
3291	thespiker	GET	/api/Customer		2025-05-07 09:00:55.554685
3296	thespiker	GET	/api/Customer		2025-05-07 09:00:55.571396
3302	thespiker	GET	/api/Customer		2025-05-07 09:00:55.576064
3317	thespiker	GET	/api/Customer		2025-05-07 09:00:55.584412
3331	thespiker	GET	/api/Customer		2025-05-07 09:00:55.717795
3334	thespiker	GET	/api/Customer		2025-05-07 09:00:55.723985
3343	thespiker	GET	/api/Customer		2025-05-07 09:00:55.730192
534	thespiker	GET	/api/Customer		2025-05-07 08:52:32.850201
608	thespiker	GET	/api/Customer		2025-05-07 08:52:32.916648
634	thespiker	GET	/api/Customer		2025-05-07 08:52:32.926322
657	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942171
704	thespiker	GET	/api/Customer		2025-05-07 08:52:32.968759
1978	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013966
1989	thespiker	GET	/api/Customer		2025-05-07 08:59:56.666428
1998	thespiker	GET	/api/Customer		2025-05-07 08:59:56.675187
2035	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744468
2041	thespiker	GET	/api/Customer		2025-05-07 08:59:55.710298
2077	thespiker	GET	/api/Customer		2025-05-07 08:59:56.915666
2094	thespiker	GET	/api/Customer		2025-05-07 08:59:56.976541
2102	thespiker	GET	/api/Customer		2025-05-07 08:59:56.999479
2104	thespiker	GET	/api/Customer		2025-05-07 08:59:57.006161
2114	thespiker	GET	/api/Customer		2025-05-07 08:59:57.016752
2119	thespiker	GET	/api/Customer		2025-05-07 08:59:57.01908
2120	thespiker	GET	/api/Customer		2025-05-07 08:59:57.021337
2125	thespiker	GET	/api/Customer		2025-05-07 08:59:57.023556
2135	thespiker	GET	/api/Customer		2025-05-07 08:59:57.03178
2150	thespiker	GET	/api/Customer		2025-05-07 08:59:57.054042
2157	thespiker	GET	/api/Customer		2025-05-07 08:59:57.058105
2164	thespiker	GET	/api/Customer		2025-05-07 08:59:57.147072
2173	thespiker	GET	/api/Customer		2025-05-07 08:59:57.1809
2192	thespiker	GET	/api/Customer		2025-05-07 08:59:57.206297
2214	thespiker	GET	/api/Customer		2025-05-07 08:59:57.225299
2222	thespiker	GET	/api/Customer		2025-05-07 08:59:57.246187
2226	thespiker	GET	/api/Customer		2025-05-07 08:59:57.319168
2230	thespiker	GET	/api/Customer		2025-05-07 08:59:57.324722
2248	thespiker	GET	/api/Customer		2025-05-07 08:59:57.355781
2255	thespiker	GET	/api/Customer		2025-05-07 08:59:57.364782
2287	thespiker	GET	/api/Customer		2025-05-07 08:59:57.406552
2299	thespiker	GET	/api/Customer		2025-05-07 08:59:57.418964
2305	thespiker	GET	/api/Customer		2025-05-07 08:59:57.425228
2316	thespiker	GET	/api/Customer		2025-05-07 08:59:57.4562
2320	thespiker	GET	/api/Customer		2025-05-07 08:59:57.463518
2323	thespiker	GET	/api/Customer		2025-05-07 08:59:57.4764
2327	thespiker	GET	/api/Customer		2025-05-07 08:59:57.496342
2373	thespiker	GET	/api/Customer		2025-05-07 08:59:57.649959
2374	thespiker	GET	/api/Customer		2025-05-07 08:59:57.650035
2378	thespiker	GET	/api/Customer		2025-05-07 08:59:57.65954
2382	thespiker	GET	/api/Customer		2025-05-07 08:59:57.668939
2386	thespiker	GET	/api/Customer		2025-05-07 08:59:57.67154
2448	thespiker	GET	/api/Customer		2025-05-07 08:59:57.796453
2507	thespiker	GET	/api/Customer		2025-05-07 08:59:56.917063
2532	thespiker	GET	/api/Customer		2025-05-07 08:59:57.894353
2541	thespiker	GET	/api/Customer		2025-05-07 08:59:57.909126
2623	thespiker	GET	/api/Customer		2025-05-07 08:59:57.098917
2658	thespiker	GET	/api/Customer		2025-05-07 08:59:58.03037
2676	thespiker	GET	/api/Customer		2025-05-07 08:59:58.058288
2702	thespiker	GET	/api/Customer		2025-05-07 08:59:58.072411
2694	thespiker	GET	/api/Customer		2025-05-07 08:59:57.06169
2721	thespiker	GET	/api/Customer		2025-05-07 08:59:58.096725
2736	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106055
2744	thespiker	GET	/api/Customer		2025-05-07 08:59:58.107957
2801	thespiker	GET	/api/Customer		2025-05-07 08:59:58.173889
2806	thespiker	GET	/api/Customer		2025-05-07 08:59:58.177002
2808	thespiker	GET	/api/Customer		2025-05-07 08:59:58.177733
2837	thespiker	GET	/api/Customer		2025-05-07 08:59:58.192425
2847	thespiker	GET	/api/Customer		2025-05-07 08:59:58.201381
2858	thespiker	GET	/api/Customer		2025-05-07 08:59:58.213258
2865	thespiker	GET	/api/Customer		2025-05-07 08:59:58.215701
2875	thespiker	GET	/api/Customer		2025-05-07 08:59:58.21794
2907	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240797
2954	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543755
2966	thespiker	GET	/api/Customer		2025-05-07 09:00:54.999108
2986	thespiker	GET	/api/Customer		2025-05-07 09:00:55.028138
3007	thespiker	GET	/api/Customer		2025-05-07 09:00:55.064225
3001	thespiker	GET	/api/Customer		2025-05-07 09:00:54.161612
3018	thespiker	GET	/api/Customer		2025-05-07 09:00:55.098011
3038	thespiker	GET	/api/Customer		2025-05-07 09:00:55.115087
3055	thespiker	GET	/api/Customer		2025-05-07 09:00:55.119056
3063	thespiker	GET	/api/Customer		2025-05-07 09:00:55.131327
3065	thespiker	GET	/api/Customer		2025-05-07 09:00:55.138236
3090	thespiker	GET	/api/Customer		2025-05-07 09:00:55.16448
3103	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165544
3119	thespiker	GET	/api/Customer		2025-05-07 09:00:55.192134
3140	thespiker	GET	/api/Customer		2025-05-07 09:00:55.216029
3156	thespiker	GET	/api/Customer		2025-05-07 09:00:55.235296
3192	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3170	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274949
3220	thespiker	GET	/api/Customer		2025-05-07 09:00:55.299062
3223	thespiker	GET	/api/Customer		2025-05-07 09:00:54.276142
3240	thespiker	GET	/api/Customer		2025-05-07 09:00:54.177576
3274	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54047
3285	thespiker	GET	/api/Customer		2025-05-07 09:00:55.550172
3293	thespiker	GET	/api/Customer		2025-05-07 09:00:55.555881
3303	thespiker	GET	/api/Customer		2025-05-07 09:00:55.576018
3322	thespiker	GET	/api/Customer		2025-05-07 09:00:55.588374
3330	thespiker	GET	/api/Customer		2025-05-07 09:00:55.715845
3345	thespiker	GET	/api/Customer		2025-05-07 09:00:55.737049
3351	thespiker	GET	/api/Customer		2025-05-07 09:00:55.741501
3363	thespiker	GET	/api/Customer		2025-05-07 09:00:55.795643
3377	thespiker	GET	/api/Customer		2025-05-07 09:00:55.816549
3380	thespiker	GET	/api/Customer		2025-05-07 09:00:55.82113
3384	thespiker	GET	/api/Customer		2025-05-07 09:00:55.824785
3391	thespiker	GET	/api/Customer		2025-05-07 09:00:55.839632
3396	thespiker	GET	/api/Customer		2025-05-07 09:00:55.846944
3425	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605232
3442	thespiker	GET	/api/Customer		2025-05-07 09:00:56.146128
3445	thespiker	GET	/api/Customer		2025-05-07 09:00:56.155345
3451	thespiker	GET	/api/Customer		2025-05-07 09:00:56.166247
3470	thespiker	GET	/api/Customer		2025-05-07 09:00:56.226757
3471	thespiker	GET	/api/Customer		2025-05-07 09:00:56.228312
3492	thespiker	GET	/api/Customer		2025-05-07 09:00:56.263744
3499	thespiker	GET	/api/Customer		2025-05-07 09:00:56.274693
3512	thespiker	GET	/api/Customer		2025-05-07 09:00:56.301373
3517	thespiker	GET	/api/Customer		2025-05-07 09:00:56.308283
535	thespiker	GET	/api/Customer		2025-05-07 08:52:32.85142
532	thespiker	GET	/api/Customer		2025-05-07 08:52:32.242116
572	thespiker	GET	/api/Customer		2025-05-07 08:52:32.890906
579	thespiker	GET	/api/Customer		2025-05-07 08:52:32.895522
590	thespiker	GET	/api/Customer		2025-05-07 08:52:32.90082
609	thespiker	GET	/api/Customer		2025-05-07 08:52:32.916648
622	thespiker	GET	/api/Customer		2025-05-07 08:52:32.91972
629	thespiker	GET	/api/Customer		2025-05-07 08:52:32.925117
640	thespiker	GET	/api/Customer		2025-05-07 08:52:32.928289
649	thespiker	GET	/api/Customer		2025-05-07 08:52:32.93881
660	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942217
665	thespiker	GET	/api/Customer		2025-05-07 08:52:32.94302
695	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963995
697	thespiker	GET	/api/Customer		2025-05-07 08:52:32.964005
701	thespiker	GET	/api/Customer		2025-05-07 08:52:32.967505
1975	thespiker	GET	/api/Customer		2025-05-07 08:59:55.01396
2037	thespiker	GET	/api/Customer		2025-05-07 08:59:55.636896
2011	thespiker	GET	/api/Customer		2025-05-07 08:59:55.750757
2076	thespiker	GET	/api/Customer		2025-05-07 08:59:56.915666
2096	thespiker	GET	/api/Customer		2025-05-07 08:59:56.976699
2100	thespiker	GET	/api/Customer		2025-05-07 08:59:56.98174
2130	thespiker	GET	/api/Customer		2025-05-07 08:59:57.028202
2139	thespiker	GET	/api/Customer		2025-05-07 08:59:57.043966
2153	thespiker	GET	/api/Customer		2025-05-07 08:59:57.054475
2195	thespiker	GET	/api/Customer		2025-05-07 08:59:57.17894
2216	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2220	thespiker	GET	/api/Customer		2025-05-07 08:59:57.240475
2242	thespiker	GET	/api/Customer		2025-05-07 08:59:57.343315
2245	thespiker	GET	/api/Customer		2025-05-07 08:59:57.353064
2309	thespiker	GET	/api/Customer		2025-05-07 08:59:57.447115
2313	thespiker	GET	/api/Customer		2025-05-07 08:59:57.451418
2330	thespiker	GET	/api/Customer		2025-05-07 08:59:57.514733
2345	thespiker	GET	/api/Customer		2025-05-07 08:59:57.610314
2356	thespiker	GET	/api/Customer		2025-05-07 08:59:57.624785
2361	thespiker	GET	/api/Customer		2025-05-07 08:59:57.631733
2364	thespiker	GET	/api/Customer		2025-05-07 08:59:57.636242
2387	thespiker	GET	/api/Customer		2025-05-07 08:59:57.675062
2389	thespiker	GET	/api/Customer		2025-05-07 08:59:57.676112
2395	thespiker	GET	/api/Customer		2025-05-07 08:59:57.688702
2399	thespiker	GET	/api/Customer		2025-05-07 08:59:57.697482
2415	thespiker	GET	/api/Customer		2025-05-07 08:59:57.747556
2435	thespiker	GET	/api/Customer		2025-05-07 08:59:57.780805
2442	thespiker	GET	/api/Customer		2025-05-07 08:59:57.790244
2449	thespiker	GET	/api/Customer		2025-05-07 08:59:57.80309
2457	thespiker	GET	/api/Customer		2025-05-07 08:59:57.811301
2467	thespiker	GET	/api/Customer		2025-05-07 08:59:57.825109
2476	thespiker	GET	/api/Customer		2025-05-07 08:59:57.833633
2486	thespiker	GET	/api/Customer		2025-05-07 08:59:57.842322
2489	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84802
2495	thespiker	GET	/api/Customer		2025-05-07 08:59:57.852768
2508	thespiker	GET	/api/Customer		2025-05-07 08:59:57.871758
2511	thespiker	GET	/api/Customer		2025-05-07 08:59:57.11067
2524	thespiker	GET	/api/Customer		2025-05-07 08:59:57.886473
2543	thespiker	GET	/api/Customer		2025-05-07 08:59:57.909889
2577	thespiker	GET	/api/Customer		2025-05-07 08:59:57.950274
2579	thespiker	GET	/api/Customer		2025-05-07 08:59:57.950749
2581	thespiker	GET	/api/Customer		2025-05-07 08:59:57.955249
2603	thespiker	GET	/api/Customer		2025-05-07 08:59:57.977861
2613	thespiker	GET	/api/Customer		2025-05-07 08:59:57.991005
2625	thespiker	GET	/api/Customer		2025-05-07 08:59:58.01135
2663	thespiker	GET	/api/Customer		2025-05-07 08:59:58.044116
2691	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094561
2707	thespiker	GET	/api/Customer		2025-05-07 08:59:58.086011
2720	thespiker	GET	/api/Customer		2025-05-07 08:59:58.096787
2722	thespiker	GET	/api/Customer		2025-05-07 08:59:58.097394
2748	thespiker	GET	/api/Customer		2025-05-07 08:59:58.126125
2775	thespiker	GET	/api/Customer		2025-05-07 08:59:58.130801
2812	thespiker	GET	/api/Customer		2025-05-07 08:59:58.178956
2816	thespiker	GET	/api/Customer		2025-05-07 08:59:58.186261
2824	thespiker	GET	/api/Customer		2025-05-07 08:59:58.190399
2846	thespiker	GET	/api/Customer		2025-05-07 08:59:58.200898
2873	thespiker	GET	/api/Customer		2025-05-07 08:59:58.217858
2874	thespiker	GET	/api/Customer		2025-05-07 08:59:58.217947
2910	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241184
2932	thespiker	GET	/api/Customer		2025-05-07 08:59:58.258273
2940	thespiker	GET	/api/Customer		2025-05-07 08:59:58.262626
2943	thespiker	GET	/api/Customer		2025-05-07 08:59:58.263879
2957	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543744
2968	thespiker	GET	/api/Customer		2025-05-07 09:00:54.999227
2971	thespiker	GET	/api/Customer		2025-05-07 09:00:55.006125
3004	thespiker	GET	/api/Customer		2025-05-07 09:00:55.063964
3000	thespiker	GET	/api/Customer		2025-05-07 09:00:54.24455
3036	thespiker	GET	/api/Customer		2025-05-07 09:00:55.113617
3040	thespiker	GET	/api/Customer		2025-05-07 09:00:55.115088
3087	thespiker	GET	/api/Customer		2025-05-07 09:00:55.164431
3108	thespiker	GET	/api/Customer		2025-05-07 09:00:55.166118
3131	thespiker	GET	/api/Customer		2025-05-07 09:00:55.202568
3139	thespiker	GET	/api/Customer		2025-05-07 09:00:55.215915
3133	thespiker	GET	/api/Customer		2025-05-07 09:00:54.277547
3154	thespiker	GET	/api/Customer		2025-05-07 09:00:55.23507
3188	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263956
3194	thespiker	GET	/api/Customer		2025-05-07 09:00:54.272535
3228	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27146
3237	thespiker	GET	/api/Customer		2025-05-07 09:00:54.177238
3278	thespiker	GET	/api/Customer		2025-05-07 09:00:55.541534
3292	thespiker	GET	/api/Customer		2025-05-07 09:00:55.554684
3307	thespiker	GET	/api/Customer		2025-05-07 09:00:55.577025
3313	thespiker	GET	/api/Customer		2025-05-07 09:00:55.583266
3319	thespiker	GET	/api/Customer		2025-05-07 09:00:55.585566
3348	thespiker	GET	/api/Customer		2025-05-07 09:00:55.739829
3368	thespiker	GET	/api/Customer		2025-05-07 09:00:55.798015
3373	thespiker	GET	/api/Customer		2025-05-07 09:00:55.812595
3422	thespiker	GET	/api/Customer		2025-05-07 09:00:56.085852
3426	thespiker	GET	/api/Customer		2025-05-07 09:00:56.113177
3431	thespiker	GET	/api/Customer		2025-05-07 09:00:56.130539
3446	thespiker	GET	/api/Customer		2025-05-07 09:00:56.157309
3477	thespiker	GET	/api/Customer		2025-05-07 09:00:56.239062
536	thespiker	GET	/api/Customer		2025-05-07 08:52:32.85142
550	thespiker	GET	/api/Customer		2025-05-07 08:52:32.859388
565	thespiker	GET	/api/Customer		2025-05-07 08:52:32.873178
586	thespiker	GET	/api/Customer		2025-05-07 08:52:32.898071
592	thespiker	GET	/api/Customer		2025-05-07 08:52:32.901812
616	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918654
630	thespiker	GET	/api/Customer		2025-05-07 08:52:32.925679
641	thespiker	GET	/api/Customer		2025-05-07 08:52:32.928289
662	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942774
676	thespiker	GET	/api/Customer		2025-05-07 08:52:32.949072
682	thespiker	GET	/api/Customer		2025-05-07 08:52:32.958329
699	thespiker	GET	/api/Customer		2025-05-07 08:52:32.962093
1980	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013984
1986	thespiker	GET	/api/Customer		2025-05-07 08:59:56.664197
2003	thespiker	GET	/api/Customer		2025-05-07 08:59:56.701485
2008	thespiker	GET	/api/Customer		2025-05-07 08:59:55.75113
2025	thespiker	GET	/api/Customer		2025-05-07 08:59:55.746776
2078	thespiker	GET	/api/Customer		2025-05-07 08:59:55.749157
2324	thespiker	GET	/api/Customer		2025-05-07 08:59:56.766816
2337	thespiker	GET	/api/Customer		2025-05-07 08:59:57.574927
2403	thespiker	GET	/api/Customer		2025-05-07 08:59:57.709938
2425	thespiker	GET	/api/Customer		2025-05-07 08:59:57.76987
2462	thespiker	GET	/api/Customer		2025-05-07 08:59:57.820892
2512	thespiker	GET	/api/Customer		2025-05-07 08:59:57.060899
2536	thespiker	GET	/api/Customer		2025-05-07 08:59:57.898451
2572	thespiker	GET	/api/Customer		2025-05-07 08:59:57.938448
2583	thespiker	GET	/api/Customer		2025-05-07 08:59:57.955732
2606	thespiker	GET	/api/Customer		2025-05-07 08:59:57.982489
2644	thespiker	GET	/api/Customer		2025-05-07 08:59:58.021245
2624	thespiker	GET	/api/Customer		2025-05-07 08:59:57.097268
2656	thespiker	GET	/api/Customer		2025-05-07 08:59:58.029849
2685	thespiker	GET	/api/Customer		2025-05-07 08:59:58.065782
2689	thespiker	GET	/api/Customer		2025-05-07 08:59:57.062451
2706	thespiker	GET	/api/Customer		2025-05-07 08:59:58.073101
2710	thespiker	GET	/api/Customer		2025-05-07 08:59:58.073491
2770	thespiker	GET	/api/Customer		2025-05-07 08:59:58.12966
2771	thespiker	GET	/api/Customer		2025-05-07 08:59:58.130166
2831	thespiker	GET	/api/Customer		2025-05-07 08:59:58.191286
2864	thespiker	GET	/api/Customer		2025-05-07 08:59:58.215701
2878	thespiker	GET	/api/Customer		2025-05-07 08:59:58.220262
2904	thespiker	GET	/api/Customer		2025-05-07 08:59:58.24034
2913	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241356
2926	thespiker	GET	/api/Customer		2025-05-07 08:59:58.257279
2936	thespiker	GET	/api/Customer		2025-05-07 08:59:58.259098
2953	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543749
2964	thespiker	GET	/api/Customer		2025-05-07 09:00:54.997434
2996	thespiker	GET	/api/Customer		2025-05-07 09:00:55.060252
3003	thespiker	GET	/api/Customer		2025-05-07 09:00:54.177578
3023	thespiker	GET	/api/Customer		2025-05-07 09:00:55.102006
3044	thespiker	GET	/api/Customer		2025-05-07 09:00:55.116975
3052	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118549
3098	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165266
3107	thespiker	GET	/api/Customer		2025-05-07 09:00:55.166064
3138	thespiker	GET	/api/Customer		2025-05-07 09:00:54.164308
3153	thespiker	GET	/api/Customer		2025-05-07 09:00:55.234376
3182	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3195	thespiker	GET	/api/Customer		2025-05-07 09:00:55.279208
3197	thespiker	GET	/api/Customer		2025-05-07 09:00:55.279208
3226	thespiker	GET	/api/Customer		2025-05-07 09:00:54.177648
3235	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27448
3290	thespiker	GET	/api/Customer		2025-05-07 09:00:55.55394
3309	thespiker	GET	/api/Customer		2025-05-07 09:00:55.578275
3312	thespiker	GET	/api/Customer		2025-05-07 09:00:55.581981
3318	thespiker	GET	/api/Customer		2025-05-07 09:00:55.585566
3333	thespiker	GET	/api/Customer		2025-05-07 09:00:55.723501
3337	thespiker	GET	/api/Customer		2025-05-07 09:00:55.728516
3350	thespiker	GET	/api/Customer		2025-05-07 09:00:55.740061
3356	thespiker	GET	/api/Customer		2025-05-07 09:00:55.790805
3361	thespiker	GET	/api/Customer		2025-05-07 09:00:55.793772
3387	thespiker	GET	/api/Customer		2025-05-07 09:00:55.827224
3390	thespiker	GET	/api/Customer		2025-05-07 09:00:55.830112
3406	thespiker	GET	/api/Customer		2025-05-07 09:00:56.01824
3409	thespiker	GET	/api/Customer		2025-05-07 09:00:56.030666
3412	thespiker	GET	/api/Customer		2025-05-07 09:00:56.046442
3427	thespiker	GET	/api/Customer		2025-05-07 09:00:56.114414
3428	thespiker	GET	/api/Customer		2025-05-07 09:00:55.504964
3439	thespiker	GET	/api/Customer		2025-05-07 09:00:56.146096
3448	thespiker	GET	/api/Customer		2025-05-07 09:00:56.158941
3454	thespiker	GET	/api/Customer		2025-05-07 09:00:56.172105
3464	thespiker	GET	/api/Customer		2025-05-07 09:00:56.205283
3469	thespiker	GET	/api/Customer		2025-05-07 09:00:56.222336
3473	thespiker	GET	/api/Customer		2025-05-07 09:00:56.231231
3486	thespiker	GET	/api/Customer		2025-05-07 09:00:56.253914
3507	thespiker	GET	/api/Customer		2025-05-07 09:00:55.504967
3554	thespiker	GET	/api/Customer		2025-05-07 09:00:55.591063
3561	thespiker	GET	/api/Customer		2025-05-07 09:00:56.427255
3570	thespiker	GET	/api/Customer		2025-05-07 09:00:56.445649
3581	thespiker	GET	/api/Customer		2025-05-07 09:00:55.60458
3602	thespiker	GET	/api/Customer		2025-05-07 09:00:56.482867
3609	thespiker	GET	/api/Customer		2025-05-07 09:00:56.49161
3610	thespiker	GET	/api/Customer		2025-05-07 09:00:56.491719
3615	thespiker	GET	/api/Customer		2025-05-07 09:00:55.601745
3619	thespiker	GET	/api/Customer		2025-05-07 09:00:56.499447
3631	thespiker	GET	/api/Customer		2025-05-07 09:00:56.506511
3639	thespiker	GET	/api/Customer		2025-05-07 09:00:56.523507
3642	thespiker	GET	/api/Customer		2025-05-07 09:00:56.52486
3651	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532607
3654	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532883
3660	thespiker	GET	/api/Customer		2025-05-07 09:00:56.546231
3675	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606035
3698	thespiker	GET	/api/Customer		2025-05-07 09:00:56.606316
3703	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606206
3711	thespiker	GET	/api/Customer		2025-05-07 09:00:56.616154
3712	thespiker	GET	/api/Customer		2025-05-07 09:00:56.617512
3713	thespiker	GET	/api/Customer		2025-05-07 09:00:56.617515
3731	thespiker	GET	/api/Customer		2025-05-07 09:00:56.642035
3727	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603585
544	thespiker	GET	/api/Customer		2025-05-07 08:52:32.241652
545	thespiker	GET	/api/Customer		2025-05-07 08:52:32.242114
585	thespiker	GET	/api/Customer		2025-05-07 08:52:32.898002
601	thespiker	GET	/api/Customer		2025-05-07 08:52:32.904089
611	thespiker	GET	/api/Customer		2025-05-07 08:52:32.917451
618	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918706
625	thespiker	GET	/api/Customer		2025-05-07 08:52:32.920938
648	thespiker	GET	/api/Customer		2025-05-07 08:52:32.937547
655	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942091
661	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942452
670	thespiker	GET	/api/Customer		2025-05-07 08:52:32.946181
677	thespiker	GET	/api/Customer		2025-05-07 08:52:32.957236
684	thespiker	GET	/api/Customer		2025-05-07 08:52:32.959356
688	thespiker	GET	/api/Customer		2025-05-07 08:52:32.962093
694	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963995
1042	thespiker	GET	/api/Customer		2025-05-07 08:57:33.55747
1054	thespiker	GET	/api/Customer		2025-05-07 08:57:34.214127
1121	thespiker	GET	/api/Customer		2025-05-07 08:57:34.355322
1166	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555761
1196	thespiker	GET	/api/Customer		2025-05-07 08:57:34.505634
1212	thespiker	GET	/api/Customer		2025-05-07 08:57:34.528921
1267	thespiker	GET	/api/Customer		2025-05-07 08:57:34.6508
1313	thespiker	GET	/api/Customer		2025-05-07 08:57:34.760979
1332	thespiker	GET	/api/Customer		2025-05-07 08:57:34.787123
1335	thespiker	GET	/api/Customer		2025-05-07 08:57:33.735299
1359	thespiker	GET	/api/Customer		2025-05-07 08:57:34.844629
1395	thespiker	GET	/api/Customer		2025-05-07 08:57:34.883609
1486	thespiker	GET	/api/Customer		2025-05-07 08:57:33.752278
1519	thespiker	GET	/api/Customer		2025-05-07 08:57:35.04205
1534	thespiker	GET	/api/Customer		2025-05-07 08:57:35.055155
1539	thespiker	GET	/api/Customer		2025-05-07 08:57:35.057299
1550	thespiker	GET	/api/Customer		2025-05-07 08:57:35.083826
1565	thespiker	GET	/api/Customer		2025-05-07 08:57:35.098081
1618	thespiker	GET	/api/Customer		2025-05-07 08:57:35.153725
1640	thespiker	GET	/api/Customer		2025-05-07 08:57:35.164106
1632	thespiker	GET	/api/Customer		2025-05-07 08:57:35.159202
1605	thespiker	GET	/api/Customer		2025-05-07 08:57:35.141073
1641	thespiker	GET	/api/Customer		2025-05-07 08:57:35.178204
1684	thespiker	GET	/api/Customer		2025-05-07 08:57:35.381356
1694	thespiker	GET	/api/Customer		2025-05-07 08:57:35.394687
1707	thespiker	GET	/api/Customer		2025-05-07 08:57:35.405683
1711	thespiker	GET	/api/Customer		2025-05-07 08:57:35.409666
1718	thespiker	GET	/api/Customer		2025-05-07 08:57:35.426423
1722	thespiker	GET	/api/Customer		2025-05-07 08:57:35.433126
1727	thespiker	GET	/api/Customer		2025-05-07 08:57:35.437963
1737	thespiker	GET	/api/Customer		2025-05-07 08:57:35.446984
1739	thespiker	GET	/api/Customer		2025-05-07 08:57:35.451443
1759	thespiker	GET	/api/Customer		2025-05-07 08:57:35.602611
1766	thespiker	GET	/api/Customer		2025-05-07 08:57:35.645845
1772	thespiker	GET	/api/Customer		2025-05-07 08:57:35.664596
1803	thespiker	GET	/api/Customer		2025-05-07 08:57:35.734593
1816	thespiker	GET	/api/Customer		2025-05-07 08:57:35.754614
1822	thespiker	GET	/api/Customer		2025-05-07 08:57:35.382643
1833	thespiker	GET	/api/Customer		2025-05-07 08:57:35.781022
1854	thespiker	GET	/api/Customer		2025-05-07 08:57:35.80326
1855	thespiker	GET	/api/Customer		2025-05-07 08:57:35.803437
1864	thespiker	GET	/api/Customer		2025-05-07 08:57:35.808895
1871	thespiker	GET	/api/Customer		2025-05-07 08:57:35.820849
1893	thespiker	GET	/api/Customer		2025-05-07 08:57:35.841404
1899	thespiker	GET	/api/Customer		2025-05-07 08:57:35.847858
1907	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619396
1924	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619399
1927	thespiker	GET	/api/Customer		2025-05-07 08:58:21.541306
1948	thespiker	GET	/api/Customer		2025-05-07 08:58:18.725607
1967	thespiker	GET	/api/Customer		2025-05-07 08:58:18.747974
1974	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013982
1990	thespiker	GET	/api/Customer		2025-05-07 08:59:56.666503
2061	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713908
2016	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744343
2079	thespiker	GET	/api/Customer		2025-05-07 08:59:56.93095
2093	thespiker	GET	/api/Customer		2025-05-07 08:59:56.976537
2106	thespiker	GET	/api/Customer		2025-05-07 08:59:57.007427
2115	thespiker	GET	/api/Customer		2025-05-07 08:59:57.017094
2118	thespiker	GET	/api/Customer		2025-05-07 08:59:57.01815
2128	thespiker	GET	/api/Customer		2025-05-07 08:59:57.023858
2137	thespiker	GET	/api/Customer		2025-05-07 08:59:57.043966
2151	thespiker	GET	/api/Customer		2025-05-07 08:59:57.054139
2163	thespiker	GET	/api/Customer		2025-05-07 08:59:57.117112
2168	thespiker	GET	/api/Customer		2025-05-07 08:59:57.177625
2175	thespiker	GET	/api/Customer		2025-05-07 08:59:57.191811
2183	thespiker	GET	/api/Customer		2025-05-07 08:59:57.198118
2196	thespiker	GET	/api/Customer		2025-05-07 08:59:57.20794
2209	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230881
2240	thespiker	GET	/api/Customer		2025-05-07 08:59:57.342037
2247	thespiker	GET	/api/Customer		2025-05-07 08:59:57.35447
2260	thespiker	GET	/api/Customer		2025-05-07 08:59:57.370167
2289	thespiker	GET	/api/Customer		2025-05-07 08:59:57.406552
2296	thespiker	GET	/api/Customer		2025-05-07 08:59:57.417521
2303	thespiker	GET	/api/Customer		2025-05-07 08:59:57.425151
2312	thespiker	GET	/api/Customer		2025-05-07 08:59:57.451102
2319	thespiker	GET	/api/Customer		2025-05-07 08:59:57.464402
2329	thespiker	GET	/api/Customer		2025-05-07 08:59:57.095047
2332	thespiker	GET	/api/Customer		2025-05-07 08:59:57.526725
2336	thespiker	GET	/api/Customer		2025-05-07 08:59:57.566706
2346	thespiker	GET	/api/Customer		2025-05-07 08:59:57.610431
2383	thespiker	GET	/api/Customer		2025-05-07 08:59:57.670949
2394	thespiker	GET	/api/Customer		2025-05-07 08:59:57.688144
2401	thespiker	GET	/api/Customer		2025-05-07 08:59:57.705072
2416	thespiker	GET	/api/Customer		2025-05-07 08:59:57.748472
2420	thespiker	GET	/api/Customer		2025-05-07 08:59:57.757883
2434	thespiker	GET	/api/Customer		2025-05-07 08:59:57.77958
2468	thespiker	GET	/api/Customer		2025-05-07 08:59:57.826335
2497	thespiker	GET	/api/Customer		2025-05-07 08:59:57.85935
2509	thespiker	GET	/api/Customer		2025-05-07 08:59:57.871427
2517	thespiker	GET	/api/Customer		2025-05-07 08:59:57.881331
2520	thespiker	GET	/api/Customer		2025-05-07 08:59:56.767371
2528	thespiker	GET	/api/Customer		2025-05-07 08:59:57.891442
537	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852138
581	thespiker	GET	/api/Customer		2025-05-07 08:52:32.895824
594	thespiker	GET	/api/Customer		2025-05-07 08:52:32.901809
646	thespiker	GET	/api/Customer		2025-05-07 08:52:32.937614
654	thespiker	GET	/api/Customer		2025-05-07 08:52:32.94186
667	thespiker	GET	/api/Customer		2025-05-07 08:52:32.943298
672	thespiker	GET	/api/Customer		2025-05-07 08:52:32.947292
691	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963109
708	thespiker	GET	/api/Customer		2025-05-07 08:52:32.969599
1971	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013974
1987	thespiker	GET	/api/Customer		2025-05-07 08:59:56.664199
2058	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713011
2015	thespiker	GET	/api/Customer		2025-05-07 08:59:55.748146
2081	thespiker	GET	/api/Customer		2025-05-07 08:59:55.746776
2339	thespiker	GET	/api/Customer		2025-05-07 08:59:57.063357
2353	thespiker	GET	/api/Customer		2025-05-07 08:59:57.619991
2390	thespiker	GET	/api/Customer		2025-05-07 08:59:57.681096
2430	thespiker	GET	/api/Customer		2025-05-07 08:59:57.774962
2480	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84098
2491	thespiker	GET	/api/Customer		2025-05-07 08:59:57.848269
2526	thespiker	GET	/api/Customer		2025-05-07 08:59:57.064199
2538	thespiker	GET	/api/Customer		2025-05-07 08:59:57.905368
2545	thespiker	GET	/api/Customer		2025-05-07 08:59:57.911892
2548	thespiker	GET	/api/Customer		2025-05-07 08:59:57.913578
2594	thespiker	GET	/api/Customer		2025-05-07 08:59:57.968863
2611	thespiker	GET	/api/Customer		2025-05-07 08:59:57.986598
2627	thespiker	GET	/api/Customer		2025-05-07 08:59:57.024744
2659	thespiker	GET	/api/Customer		2025-05-07 08:59:58.031735
2677	thespiker	GET	/api/Customer		2025-05-07 08:59:58.058413
2703	thespiker	GET	/api/Customer		2025-05-07 08:59:58.072498
2697	thespiker	GET	/api/Customer		2025-05-07 08:59:57.096074
2705	thespiker	GET	/api/Customer		2025-05-07 08:59:58.073499
2802	thespiker	GET	/api/Customer		2025-05-07 08:59:58.171062
2826	thespiker	GET	/api/Customer		2025-05-07 08:59:58.191286
2851	thespiker	GET	/api/Customer		2025-05-07 08:59:58.202445
2872	thespiker	GET	/api/Customer		2025-05-07 08:59:58.216878
2877	thespiker	GET	/api/Customer		2025-05-07 08:59:58.218972
2925	thespiker	GET	/api/Customer		2025-05-07 08:59:58.256988
2952	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543752
2967	thespiker	GET	/api/Customer		2025-05-07 09:00:54.999108
2991	thespiker	GET	/api/Customer		2025-05-07 09:00:55.029301
3009	thespiker	GET	/api/Customer		2025-05-07 09:00:55.064364
3010	thespiker	GET	/api/Customer		2025-05-07 09:00:54.267508
3024	thespiker	GET	/api/Customer		2025-05-07 09:00:55.102612
3051	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118643
3053	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118647
3088	thespiker	GET	/api/Customer		2025-05-07 09:00:55.164468
3109	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165508
3116	thespiker	GET	/api/Customer		2025-05-07 09:00:55.187366
3141	thespiker	GET	/api/Customer		2025-05-07 09:00:54.277611
3161	thespiker	GET	/api/Customer		2025-05-07 09:00:55.240363
3164	thespiker	GET	/api/Customer		2025-05-07 09:00:55.249122
3179	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3201	thespiker	GET	/api/Customer		2025-05-07 09:00:55.282759
3204	thespiker	GET	/api/Customer		2025-05-07 09:00:55.288355
3227	thespiker	GET	/api/Customer		2025-05-07 09:00:54.271089
3231	thespiker	GET	/api/Customer		2025-05-07 09:00:54.247035
3300	thespiker	GET	/api/Customer		2025-05-07 09:00:55.574866
3325	thespiker	GET	/api/Customer		2025-05-07 09:00:55.589579
3342	thespiker	GET	/api/Customer		2025-05-07 09:00:55.731959
3352	thespiker	GET	/api/Customer		2025-05-07 09:00:55.746305
3403	thespiker	GET	/api/Customer		2025-05-07 09:00:56.010906
3407	thespiker	GET	/api/Customer		2025-05-07 09:00:56.019843
3436	thespiker	GET	/api/Customer		2025-05-07 09:00:56.138125
3440	thespiker	GET	/api/Customer		2025-05-07 09:00:56.147505
3449	thespiker	GET	/api/Customer		2025-05-07 09:00:56.164097
3480	thespiker	GET	/api/Customer		2025-05-07 09:00:56.244763
3502	thespiker	GET	/api/Customer		2025-05-07 09:00:56.279757
3509	thespiker	GET	/api/Customer		2025-05-07 09:00:55.32701
3515	thespiker	GET	/api/Customer		2025-05-07 09:00:56.303931
3528	thespiker	GET	/api/Customer		2025-05-07 09:00:56.365516
3543	thespiker	GET	/api/Customer		2025-05-07 09:00:56.392617
3556	thespiker	GET	/api/Customer		2025-05-07 09:00:55.530859
3559	thespiker	GET	/api/Customer		2025-05-07 09:00:56.426842
3568	thespiker	GET	/api/Customer		2025-05-07 09:00:56.440555
3591	thespiker	GET	/api/Customer		2025-05-07 09:00:56.464375
3597	thespiker	GET	/api/Customer		2025-05-07 09:00:55.604225
3611	thespiker	GET	/api/Customer		2025-05-07 09:00:56.491382
3626	thespiker	GET	/api/Customer		2025-05-07 09:00:56.505131
3625	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606985
3636	thespiker	GET	/api/Customer		2025-05-07 09:00:56.519044
3647	thespiker	GET	/api/Customer		2025-05-07 09:00:56.527634
3655	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532607
3661	thespiker	GET	/api/Customer		2025-05-07 09:00:56.545593
3679	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606879
3688	thespiker	GET	/api/Customer		2025-05-07 09:00:56.591782
3696	thespiker	GET	/api/Customer		2025-05-07 09:00:56.598191
3702	thespiker	GET	/api/Customer		2025-05-07 09:00:56.611157
3704	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607007
3722	thespiker	GET	/api/Customer		2025-05-07 09:00:56.632363
3729	thespiker	GET	/api/Customer		2025-05-07 09:00:56.642036
3734	thespiker	GET	/api/Customer		2025-05-07 09:00:56.643462
3736	thespiker	GET	/api/Customer		2025-05-07 09:00:56.644116
3738	thespiker	GET	/api/Customer		2025-05-07 09:00:56.648139
3739	thespiker	GET	/api/Customer		2025-05-07 09:00:56.647972
3740	thespiker	GET	/api/Customer		2025-05-07 09:00:56.649049
3752	thespiker	GET	/api/Customer		2025-05-07 09:00:56.67031
3755	thespiker	GET	/api/Customer		2025-05-07 09:00:55.604332
3764	thespiker	GET	/api/Customer		2025-05-07 09:00:56.676296
3766	thespiker	GET	/api/Customer		2025-05-07 09:00:56.676255
3773	thespiker	GET	/api/Customer		2025-05-07 09:00:55.32786
3777	thespiker	GET	/api/Customer		2025-05-07 09:00:56.700517
3780	thespiker	GET	/api/Customer		2025-05-07 09:00:56.701077
3781	thespiker	GET	/api/Customer		2025-05-07 09:00:56.70098
3791	thespiker	GET	/api/Customer		2025-05-07 09:00:56.705387
3797	thespiker	GET	/api/Customer		2025-05-07 09:00:56.711184
3799	thespiker	GET	/api/Customer		2025-05-07 09:00:56.712545
546	thespiker	GET	/api/Customer		2025-05-07 08:52:32.857483
576	thespiker	GET	/api/Customer		2025-05-07 08:52:32.893591
591	thespiker	GET	/api/Customer		2025-05-07 08:52:32.900774
606	thespiker	GET	/api/Customer		2025-05-07 08:52:32.905202
619	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918603
636	thespiker	GET	/api/Customer		2025-05-07 08:52:32.927296
644	thespiker	GET	/api/Customer		2025-05-07 08:52:32.936251
652	thespiker	GET	/api/Customer		2025-05-07 08:52:32.941208
669	thespiker	GET	/api/Customer		2025-05-07 08:52:32.946182
678	thespiker	GET	/api/Customer		2025-05-07 08:52:32.957236
689	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963098
706	thespiker	GET	/api/Customer		2025-05-07 08:52:32.96876
1046	thespiker	GET	/api/Customer		2025-05-07 08:57:34.177373
1058	thespiker	GET	/api/Customer		2025-05-07 08:57:34.226349
1080	thespiker	GET	/api/Customer		2025-05-07 08:57:34.2668
1100	thespiker	GET	/api/Customer		2025-05-07 08:57:34.320028
1102	thespiker	GET	/api/Customer		2025-05-07 08:57:34.321728
1141	thespiker	GET	/api/Customer		2025-05-07 08:57:34.382884
1155	thespiker	GET	/api/Customer		2025-05-07 08:57:34.405772
1170	thespiker	GET	/api/Customer		2025-05-07 08:57:33.559996
1182	thespiker	GET	/api/Customer		2025-05-07 08:57:34.491586
1197	thespiker	GET	/api/Customer		2025-05-07 08:57:34.507371
1204	thespiker	GET	/api/Customer		2025-05-07 08:57:34.518698
1209	thespiker	GET	/api/Customer		2025-05-07 08:57:34.52811
1237	thespiker	GET	/api/Customer		2025-05-07 08:57:34.549591
1241	thespiker	GET	/api/Customer		2025-05-07 08:57:34.563621
1247	thespiker	GET	/api/Customer		2025-05-07 08:57:34.5771
1274	thespiker	GET	/api/Customer		2025-05-07 08:57:34.666902
1282	thespiker	GET	/api/Customer		2025-05-07 08:57:34.687585
1290	thespiker	GET	/api/Customer		2025-05-07 08:57:34.721538
1296	thespiker	GET	/api/Customer		2025-05-07 08:57:34.740669
1299	thespiker	GET	/api/Customer		2025-05-07 08:57:34.74366
1315	thespiker	GET	/api/Customer		2025-05-07 08:57:34.762316
1324	thespiker	GET	/api/Customer		2025-05-07 08:57:34.777431
1333	thespiker	GET	/api/Customer		2025-05-07 08:57:34.787536
1354	thespiker	GET	/api/Customer		2025-05-07 08:57:33.664504
1357	thespiker	GET	/api/Customer		2025-05-07 08:57:34.843089
1376	thespiker	GET	/api/Customer		2025-05-07 08:57:34.866702
1463	thespiker	GET	/api/Customer		2025-05-07 08:57:34.947604
1471	thespiker	GET	/api/Customer		2025-05-07 08:57:34.962442
1475	thespiker	GET	/api/Customer		2025-05-07 08:57:34.964874
1487	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558688
1520	thespiker	GET	/api/Customer		2025-05-07 08:57:35.042231
1536	thespiker	GET	/api/Customer		2025-05-07 08:57:35.055324
1541	thespiker	GET	/api/Customer		2025-05-07 08:57:35.061848
1556	thespiker	GET	/api/Customer		2025-05-07 08:57:35.08549
1569	thespiker	GET	/api/Customer		2025-05-07 08:57:35.100161
1616	thespiker	GET	/api/Customer		2025-05-07 08:57:35.152526
1606	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558655
1638	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561268
1686	thespiker	GET	/api/Customer		2025-05-07 08:57:35.381356
1702	thespiker	GET	/api/Customer		2025-05-07 08:57:35.399584
1705	thespiker	GET	/api/Customer		2025-05-07 08:57:35.404047
1710	thespiker	GET	/api/Customer		2025-05-07 08:57:35.408954
1717	thespiker	GET	/api/Customer		2025-05-07 08:57:35.426439
1728	thespiker	GET	/api/Customer		2025-05-07 08:57:35.437964
1735	thespiker	GET	/api/Customer		2025-05-07 08:57:35.445532
1748	thespiker	GET	/api/Customer		2025-05-07 08:57:35.525061
1764	thespiker	GET	/api/Customer		2025-05-07 08:57:35.6361
1804	thespiker	GET	/api/Customer		2025-05-07 08:57:35.734719
1812	thespiker	GET	/api/Customer		2025-05-07 08:57:35.749886
1824	thespiker	GET	/api/Customer		2025-05-07 08:57:35.337559
1834	thespiker	GET	/api/Customer		2025-05-07 08:57:35.785671
1876	thespiker	GET	/api/Customer		2025-05-07 08:57:35.824817
1881	thespiker	GET	/api/Customer		2025-05-07 08:57:35.828555
1886	thespiker	GET	/api/Customer		2025-05-07 08:57:35.832978
1908	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619401
1922	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619404
1940	thespiker	GET	/api/Customer		2025-05-07 08:58:21.771205
1946	thespiker	GET	/api/Customer		2025-05-07 08:58:18.726519
1951	thespiker	GET	/api/Customer		2025-05-07 08:58:23.8592
1968	thespiker	GET	/api/Customer		2025-05-07 08:58:18.727248
1977	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013962
2062	thespiker	GET	/api/Customer		2025-05-07 08:59:55.714232
2017	thespiker	GET	/api/Customer		2025-05-07 08:59:55.750407
2080	thespiker	GET	/api/Customer		2025-05-07 08:59:55.747608
2341	thespiker	GET	/api/Customer		2025-05-07 08:59:57.09381
2392	thespiker	GET	/api/Customer		2025-05-07 08:59:57.683673
2444	thespiker	GET	/api/Customer		2025-05-07 08:59:57.79402
2453	thespiker	GET	/api/Customer		2025-05-07 08:59:57.805955
2461	thespiker	GET	/api/Customer		2025-05-07 08:59:57.820274
2530	thespiker	GET	/api/Customer		2025-05-07 08:59:57.893142
2547	thespiker	GET	/api/Customer		2025-05-07 08:59:57.913958
2633	thespiker	GET	/api/Customer		2025-05-07 08:59:58.015195
2642	thespiker	GET	/api/Customer		2025-05-07 08:59:58.020529
2620	thespiker	GET	/api/Customer		2025-05-07 08:59:57.064224
2664	thespiker	GET	/api/Customer		2025-05-07 08:59:58.044116
2695	thespiker	GET	/api/Customer		2025-05-07 08:59:57.06009
2734	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106056
2741	thespiker	GET	/api/Customer		2025-05-07 08:59:58.107189
2747	thespiker	GET	/api/Customer		2025-05-07 08:59:58.125107
2763	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128473
2780	thespiker	GET	/api/Customer		2025-05-07 08:59:58.139872
2785	thespiker	GET	/api/Customer		2025-05-07 08:59:58.158189
2789	thespiker	GET	/api/Customer		2025-05-07 08:59:58.158874
2829	thespiker	GET	/api/Customer		2025-05-07 08:59:58.19147
2857	thespiker	GET	/api/Customer		2025-05-07 08:59:58.213211
2891	thespiker	GET	/api/Customer		2025-05-07 08:59:58.230678
2922	thespiker	GET	/api/Customer		2025-05-07 08:59:58.243903
2924	thespiker	GET	/api/Customer		2025-05-07 08:59:58.256575
2946	thespiker	GET	/api/Customer		2025-05-07 08:59:58.265264
2961	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543738
2992	thespiker	GET	/api/Customer		2025-05-07 09:00:55.029296
3006	thespiker	GET	/api/Customer		2025-05-07 09:00:55.064083
3011	thespiker	GET	/api/Customer		2025-05-07 09:00:54.164308
3025	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103005
3047	thespiker	GET	/api/Customer		2025-05-07 09:00:55.117806
538	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852138
554	thespiker	GET	/api/Customer		2025-05-07 08:52:32.865592
563	thespiker	GET	/api/Customer		2025-05-07 08:52:32.871962
600	thespiker	GET	/api/Customer		2025-05-07 08:52:32.903237
613	thespiker	GET	/api/Customer		2025-05-07 08:52:32.917679
685	thespiker	GET	/api/Customer		2025-05-07 08:52:32.949109
687	thespiker	GET	/api/Customer		2025-05-07 08:52:32.962093
700	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963328
1982	thespiker	GET	/api/Customer		2025-05-07 08:59:55.636896
1994	thespiker	GET	/api/Customer		2025-05-07 08:59:56.668334
2057	thespiker	GET	/api/Customer		2025-05-07 08:59:55.712937
2018	thespiker	GET	/api/Customer		2025-05-07 08:59:55.634066
2082	thespiker	GET	/api/Customer		2025-05-07 08:59:55.746771
2340	thespiker	GET	/api/Customer		2025-05-07 08:59:56.977641
2370	thespiker	GET	/api/Customer		2025-05-07 08:59:57.645021
2411	thespiker	GET	/api/Customer		2025-05-07 08:59:57.741114
2432	thespiker	GET	/api/Customer		2025-05-07 08:59:57.77954
2502	thespiker	GET	/api/Customer		2025-05-07 08:59:57.865867
2515	thespiker	GET	/api/Customer		2025-05-07 08:59:57.877333
2537	thespiker	GET	/api/Customer		2025-05-07 08:59:57.898457
2564	thespiker	GET	/api/Customer		2025-05-07 08:59:57.931674
2589	thespiker	GET	/api/Customer		2025-05-07 08:59:57.962899
2643	thespiker	GET	/api/Customer		2025-05-07 08:59:58.020131
2622	thespiker	GET	/api/Customer		2025-05-07 08:59:57.10462
2712	thespiker	GET	/api/Customer		2025-05-07 08:59:57.23261
2733	thespiker	GET	/api/Customer		2025-05-07 08:59:58.104984
2759	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127499
2768	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129655
2823	thespiker	GET	/api/Customer		2025-05-07 08:59:58.19021
2843	thespiker	GET	/api/Customer		2025-05-07 08:59:58.199143
2866	thespiker	GET	/api/Customer		2025-05-07 08:59:58.215701
2888	thespiker	GET	/api/Customer		2025-05-07 08:59:58.230655
2893	thespiker	GET	/api/Customer		2025-05-07 08:59:58.231486
2916	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241945
2947	thespiker	GET	/api/Customer		2025-05-07 08:59:58.265264
2972	thespiker	GET	/api/Customer		2025-05-07 09:00:54.246339
2999	thespiker	GET	/api/Customer		2025-05-07 09:00:54.164308
3026	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103611
3062	thespiker	GET	/api/Customer		2025-05-07 09:00:55.12963
3101	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165331
3104	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165723
3111	thespiker	GET	/api/Customer		2025-05-07 09:00:55.17356
3115	thespiker	GET	/api/Customer		2025-05-07 09:00:55.186264
3134	thespiker	GET	/api/Customer		2025-05-07 09:00:54.269678
3180	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3203	thespiker	GET	/api/Customer		2025-05-07 09:00:55.288355
3205	thespiker	GET	/api/Customer		2025-05-07 09:00:54.164308
3229	thespiker	GET	/api/Customer		2025-05-07 09:00:54.177429
3234	thespiker	GET	/api/Customer		2025-05-07 09:00:54.269626
3310	thespiker	GET	/api/Customer		2025-05-07 09:00:55.580991
3326	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590049
3341	thespiker	GET	/api/Customer		2025-05-07 09:00:55.730192
3346	thespiker	GET	/api/Customer		2025-05-07 09:00:55.738257
3353	thespiker	GET	/api/Customer		2025-05-07 09:00:55.746304
3359	thespiker	GET	/api/Customer		2025-05-07 09:00:55.792506
3365	thespiker	GET	/api/Customer		2025-05-07 09:00:55.796377
3371	thespiker	GET	/api/Customer		2025-05-07 09:00:55.811502
3386	thespiker	GET	/api/Customer		2025-05-07 09:00:55.826344
3398	thespiker	GET	/api/Customer		2025-05-07 09:00:55.851969
3420	thespiker	GET	/api/Customer		2025-05-07 09:00:56.072981
3435	thespiker	GET	/api/Customer		2025-05-07 09:00:56.138125
3447	thespiker	GET	/api/Customer		2025-05-07 09:00:55.604545
3453	thespiker	GET	/api/Customer		2025-05-07 09:00:56.172105
3484	thespiker	GET	/api/Customer		2025-05-07 09:00:56.249861
3490	thespiker	GET	/api/Customer		2025-05-07 09:00:56.259693
3513	thespiker	GET	/api/Customer		2025-05-07 09:00:56.302109
3516	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605337
3533	thespiker	GET	/api/Customer		2025-05-07 09:00:56.379751
3548	thespiker	GET	/api/Customer		2025-05-07 09:00:56.403584
3557	thespiker	GET	/api/Customer		2025-05-07 09:00:55.60434
3565	thespiker	GET	/api/Customer		2025-05-07 09:00:56.43375
3598	thespiker	GET	/api/Customer		2025-05-07 09:00:55.604213
3605	thespiker	GET	/api/Customer		2025-05-07 09:00:56.490265
3607	thespiker	GET	/api/Customer		2025-05-07 09:00:56.491382
3623	thespiker	GET	/api/Customer		2025-05-07 09:00:56.501294
3629	thespiker	GET	/api/Customer		2025-05-07 09:00:56.506373
3643	thespiker	GET	/api/Customer		2025-05-07 09:00:56.524805
3667	thespiker	GET	/api/Customer		2025-05-07 09:00:56.553705
3680	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602658
3691	thespiker	GET	/api/Customer		2025-05-07 09:00:56.593378
3692	thespiker	GET	/api/Customer		2025-05-07 09:00:56.596728
3697	thespiker	GET	/api/Customer		2025-05-07 09:00:56.599515
3700	thespiker	GET	/api/Customer		2025-05-07 09:00:56.607654
3708	thespiker	GET	/api/Customer		2025-05-07 09:00:56.616079
3706	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607644
3714	thespiker	GET	/api/Customer		2025-05-07 09:00:56.617714
3732	thespiker	GET	/api/Customer		2025-05-07 09:00:56.642035
3744	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606214
3748	thespiker	GET	/api/Customer		2025-05-07 09:00:56.666138
3758	thespiker	GET	/api/Customer		2025-05-07 09:00:56.67468
3765	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675974
3767	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675975
3772	thespiker	GET	/api/Customer		2025-05-07 09:00:56.693339
3776	thespiker	GET	/api/Customer		2025-05-07 09:00:56.698571
3778	thespiker	GET	/api/Customer		2025-05-07 09:00:56.700951
3783	thespiker	GET	/api/Customer		2025-05-07 09:00:56.702215
3790	thespiker	GET	/api/Customer		2025-05-07 09:00:56.705249
3788	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603784
3794	thespiker	GET	/api/Customer		2025-05-07 09:00:56.711181
3798	thespiker	GET	/api/Customer		2025-05-07 09:00:56.712545
3800	thespiker	GET	/api/Customer		2025-05-07 09:00:56.712545
3804	thespiker	GET	/api/Customer		2025-05-07 09:00:56.729204
3803	thespiker	GET	/api/Customer		2025-05-07 09:00:56.729204
3808	thespiker	GET	/api/Customer		2025-05-07 09:00:56.730564
3809	thespiker	GET	/api/Customer		2025-05-07 09:00:56.730564
3811	thespiker	GET	/api/Customer		2025-05-07 09:00:56.73274
3812	thespiker	GET	/api/Customer		2025-05-07 09:00:56.733119
547	thespiker	GET	/api/Customer		2025-05-07 08:52:32.241652
557	thespiker	GET	/api/Customer		2025-05-07 08:52:32.86963
578	thespiker	GET	/api/Customer		2025-05-07 08:52:32.894762
602	thespiker	GET	/api/Customer		2025-05-07 08:52:32.904089
610	thespiker	GET	/api/Customer		2025-05-07 08:52:32.917679
632	thespiker	GET	/api/Customer		2025-05-07 08:52:32.926098
642	thespiker	GET	/api/Customer		2025-05-07 08:52:32.936251
653	thespiker	GET	/api/Customer		2025-05-07 08:52:32.941386
668	thespiker	GET	/api/Customer		2025-05-07 08:52:32.943622
674	thespiker	GET	/api/Customer		2025-05-07 08:52:32.956209
681	thespiker	GET	/api/Customer		2025-05-07 08:52:32.958387
1050	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555912
1055	thespiker	GET	/api/Customer		2025-05-07 08:57:34.214127
1057	thespiker	GET	/api/Customer		2025-05-07 08:57:34.22134
1069	thespiker	GET	/api/Customer		2025-05-07 08:57:34.244539
1072	thespiker	GET	/api/Customer		2025-05-07 08:57:34.257081
1097	thespiker	GET	/api/Customer		2025-05-07 08:57:34.318769
1167	thespiker	GET	/api/Customer		2025-05-07 08:57:34.447659
1171	thespiker	GET	/api/Customer		2025-05-07 08:57:33.710772
1211	thespiker	GET	/api/Customer		2025-05-07 08:57:34.528921
1217	thespiker	GET	/api/Customer		2025-05-07 08:57:34.53528
1222	thespiker	GET	/api/Customer		2025-05-07 08:57:34.537713
1233	thespiker	GET	/api/Customer		2025-05-07 08:57:34.548624
1236	thespiker	GET	/api/Customer		2025-05-07 08:57:34.549834
1250	thespiker	GET	/api/Customer		2025-05-07 08:57:34.587997
1272	thespiker	GET	/api/Customer		2025-05-07 08:57:34.660947
1293	thespiker	GET	/api/Customer		2025-05-07 08:57:34.727555
1340	thespiker	GET	/api/Customer		2025-05-07 08:57:34.794664
1351	thespiker	GET	/api/Customer		2025-05-07 08:57:34.816381
1355	thespiker	GET	/api/Customer		2025-05-07 08:57:33.578286
1367	thespiker	GET	/api/Customer		2025-05-07 08:57:34.85776
1390	thespiker	GET	/api/Customer		2025-05-07 08:57:34.881893
1415	thespiker	GET	/api/Customer		2025-05-07 08:57:34.905566
1439	thespiker	GET	/api/Customer		2025-05-07 08:57:34.931109
1481	thespiker	GET	/api/Customer		2025-05-07 08:57:34.972365
1482	thespiker	GET	/api/Customer		2025-05-07 08:57:34.972365
1488	thespiker	GET	/api/Customer		2025-05-07 08:57:33.706997
1496	thespiker	GET	/api/Customer		2025-05-07 08:57:35.003062
1521	thespiker	GET	/api/Customer		2025-05-07 08:57:33.734788
1543	thespiker	GET	/api/Customer		2025-05-07 08:57:35.074545
1573	thespiker	GET	/api/Customer		2025-05-07 08:57:33.560029
1613	thespiker	GET	/api/Customer		2025-05-07 08:57:35.150815
1607	thespiker	GET	/api/Customer		2025-05-07 08:57:33.752537
1643	thespiker	GET	/api/Customer		2025-05-07 08:57:35.177859
1654	thespiker	GET	/api/Customer		2025-05-07 08:57:35.201012
1706	thespiker	GET	/api/Customer		2025-05-07 08:57:35.404047
1716	thespiker	GET	/api/Customer		2025-05-07 08:57:35.426314
1721	thespiker	GET	/api/Customer		2025-05-07 08:57:35.433163
1774	thespiker	GET	/api/Customer		2025-05-07 08:57:35.671291
1781	thespiker	GET	/api/Customer		2025-05-07 08:57:35.689452
1807	thespiker	GET	/api/Customer		2025-05-07 08:57:35.742307
1825	thespiker	GET	/api/Customer		2025-05-07 08:57:35.771237
1828	thespiker	GET	/api/Customer		2025-05-07 08:57:35.337322
1839	thespiker	GET	/api/Customer		2025-05-07 08:57:35.789298
1842	thespiker	GET	/api/Customer		2025-05-07 08:57:35.793023
1846	thespiker	GET	/api/Customer		2025-05-07 08:57:35.793646
1898	thespiker	GET	/api/Customer		2025-05-07 08:57:35.847334
1909	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619409
1925	thespiker	GET	/api/Customer		2025-05-07 08:58:18.647146
1932	thespiker	GET	/api/Customer		2025-05-07 08:58:21.573982
1950	thespiker	GET	/api/Customer		2025-05-07 08:58:18.723396
1969	thespiker	GET	/api/Customer		2025-05-07 08:58:18.663916
1984	thespiker	GET	/api/Customer		2025-05-07 08:59:55.709419
1995	thespiker	GET	/api/Customer		2025-05-07 08:59:56.668338
1997	thespiker	GET	/api/Customer		2025-05-07 08:59:56.7001
2053	thespiker	GET	/api/Customer		2025-05-07 08:59:55.749527
2024	thespiker	GET	/api/Customer		2025-05-07 08:59:55.714653
2083	thespiker	GET	/api/Customer		2025-05-07 08:59:55.745147
2343	thespiker	GET	/api/Customer		2025-05-07 08:59:57.06009
2349	thespiker	GET	/api/Customer		2025-05-07 08:59:57.617337
2363	thespiker	GET	/api/Customer		2025-05-07 08:59:57.631733
2376	thespiker	GET	/api/Customer		2025-05-07 08:59:57.651204
2412	thespiker	GET	/api/Customer		2025-05-07 08:59:57.741114
2419	thespiker	GET	/api/Customer		2025-05-07 08:59:57.756821
2439	thespiker	GET	/api/Customer		2025-05-07 08:59:57.78712
2471	thespiker	GET	/api/Customer		2025-05-07 08:59:57.828688
2539	thespiker	GET	/api/Customer		2025-05-07 08:59:57.906522
2584	thespiker	GET	/api/Customer		2025-05-07 08:59:57.957114
2609	thespiker	GET	/api/Customer		2025-05-07 08:59:57.983838
2650	thespiker	GET	/api/Customer		2025-05-07 08:59:58.025925
2630	thespiker	GET	/api/Customer		2025-05-07 08:59:57.064558
2686	thespiker	GET	/api/Customer		2025-05-07 08:59:58.067219
2714	thespiker	GET	/api/Customer		2025-05-07 08:59:57.106205
2735	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106055
2764	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128473
2774	thespiker	GET	/api/Customer		2025-05-07 08:59:58.130802
2787	thespiker	GET	/api/Customer		2025-05-07 08:59:58.15874
2804	thespiker	GET	/api/Customer		2025-05-07 08:59:58.175582
2814	thespiker	GET	/api/Customer		2025-05-07 08:59:58.179487
2834	thespiker	GET	/api/Customer		2025-05-07 08:59:58.192546
2836	thespiker	GET	/api/Customer		2025-05-07 08:59:58.192892
2848	thespiker	GET	/api/Customer		2025-05-07 08:59:58.201384
2889	thespiker	GET	/api/Customer		2025-05-07 08:59:58.230647
2928	thespiker	GET	/api/Customer		2025-05-07 08:59:58.257786
2993	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243813
3030	thespiker	GET	/api/Customer		2025-05-07 09:00:55.114115
3057	thespiker	GET	/api/Customer		2025-05-07 09:00:55.121257
3069	thespiker	GET	/api/Customer		2025-05-07 09:00:55.149763
3076	thespiker	GET	/api/Customer		2025-05-07 09:00:55.161498
3092	thespiker	GET	/api/Customer		2025-05-07 09:00:55.164511
3129	thespiker	GET	/api/Customer		2025-05-07 09:00:55.201377
3136	thespiker	GET	/api/Customer		2025-05-07 09:00:55.214759
3142	thespiker	GET	/api/Customer		2025-05-07 09:00:54.276863
3146	thespiker	GET	/api/Customer		2025-05-07 09:00:55.222445
3166	thespiker	GET	/api/Customer		2025-05-07 09:00:55.249129
3177	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3186	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263958
539	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852138
568	thespiker	GET	/api/Customer		2025-05-07 08:52:32.874383
604	thespiker	GET	/api/Customer		2025-05-07 08:52:32.904089
621	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918837
637	thespiker	GET	/api/Customer		2025-05-07 08:52:32.9273
656	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942171
707	thespiker	GET	/api/Customer		2025-05-07 08:52:32.969332
712	thespiker	GET	/api/Customer		2025-05-07 08:52:32.979299
1985	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713777
1999	thespiker	GET	/api/Customer		2025-05-07 08:59:56.701485
2056	thespiker	GET	/api/Customer		2025-05-07 08:59:55.748119
2007	thespiker	GET	/api/Customer		2025-05-07 08:59:55.747642
2084	thespiker	GET	/api/Customer		2025-05-07 08:59:55.748518
2351	thespiker	GET	/api/Customer		2025-05-07 08:59:57.618809
2381	thespiker	GET	/api/Customer		2025-05-07 08:59:57.660037
2402	thespiker	GET	/api/Customer		2025-05-07 08:59:57.707666
2423	thespiker	GET	/api/Customer		2025-05-07 08:59:57.766911
2436	thespiker	GET	/api/Customer		2025-05-07 08:59:57.784137
2473	thespiker	GET	/api/Customer		2025-05-07 08:59:57.83151
2500	thespiker	GET	/api/Customer		2025-05-07 08:59:57.86067
2518	thespiker	GET	/api/Customer		2025-05-07 08:59:57.881619
2542	thespiker	GET	/api/Customer		2025-05-07 08:59:57.909126
2550	thespiker	GET	/api/Customer		2025-05-07 08:59:57.91522
2573	thespiker	GET	/api/Customer		2025-05-07 08:59:57.939145
2593	thespiker	GET	/api/Customer		2025-05-07 08:59:57.969149
2640	thespiker	GET	/api/Customer		2025-05-07 08:59:58.02013
2653	thespiker	GET	/api/Customer		2025-05-07 08:59:58.026988
2621	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094292
2681	thespiker	GET	/api/Customer		2025-05-07 08:59:58.059256
2713	thespiker	GET	/api/Customer		2025-05-07 08:59:57.093242
2719	thespiker	GET	/api/Customer		2025-05-07 08:59:58.095618
2743	thespiker	GET	/api/Customer		2025-05-07 08:59:58.107868
2745	thespiker	GET	/api/Customer		2025-05-07 08:59:58.107979
2756	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127299
2794	thespiker	GET	/api/Customer		2025-05-07 08:59:58.161659
2815	thespiker	GET	/api/Customer		2025-05-07 08:59:58.179495
2838	thespiker	GET	/api/Customer		2025-05-07 08:59:58.196583
2868	thespiker	GET	/api/Customer		2025-05-07 08:59:58.215701
2906	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240335
2933	thespiker	GET	/api/Customer		2025-05-07 08:59:58.258769
2935	thespiker	GET	/api/Customer		2025-05-07 08:59:58.258901
2950	thespiker	GET	/api/Customer		2025-05-07 08:59:58.268466
2973	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242933
3032	thespiker	GET	/api/Customer		2025-05-07 09:00:55.114115
3058	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27746
3096	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165079
3106	thespiker	GET	/api/Customer		2025-05-07 09:00:55.16602
3130	thespiker	GET	/api/Customer		2025-05-07 09:00:55.201377
3143	thespiker	GET	/api/Customer		2025-05-07 09:00:54.291541
3145	thespiker	GET	/api/Customer		2025-05-07 09:00:55.222455
3199	thespiker	GET	/api/Customer		2025-05-07 09:00:55.279452
3208	thespiker	GET	/api/Customer		2025-05-07 09:00:54.246436
3230	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27567
3246	thespiker	GET	/api/Customer		2025-05-07 09:00:54.275693
3354	thespiker	GET	/api/Customer		2025-05-07 09:00:55.748286
3369	thespiker	GET	/api/Customer		2025-05-07 09:00:55.810378
3375	thespiker	GET	/api/Customer		2025-05-07 09:00:55.813699
3444	thespiker	GET	/api/Customer		2025-05-07 09:00:56.152401
3452	thespiker	GET	/api/Customer		2025-05-07 09:00:56.170682
3456	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605065
3479	thespiker	GET	/api/Customer		2025-05-07 09:00:56.240134
3522	thespiker	GET	/api/Customer		2025-05-07 09:00:55.328921
3524	thespiker	GET	/api/Customer		2025-05-07 09:00:56.349444
3539	thespiker	GET	/api/Customer		2025-05-07 09:00:56.3871
3545	thespiker	GET	/api/Customer		2025-05-07 09:00:56.397567
3558	thespiker	GET	/api/Customer		2025-05-07 09:00:55.507358
3577	thespiker	GET	/api/Customer		2025-05-07 09:00:56.452305
3580	thespiker	GET	/api/Customer		2025-05-07 09:00:56.457134
3599	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590753
3608	thespiker	GET	/api/Customer		2025-05-07 09:00:56.491462
3621	thespiker	GET	/api/Customer		2025-05-07 09:00:56.50118
3633	thespiker	GET	/api/Customer		2025-05-07 09:00:56.518143
3658	thespiker	GET	/api/Customer		2025-05-07 09:00:56.540288
3644	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605405
3669	thespiker	GET	/api/Customer		2025-05-07 09:00:56.560921
3670	thespiker	GET	/api/Customer		2025-05-07 09:00:56.560852
3672	thespiker	GET	/api/Customer		2025-05-07 09:00:56.561628
3681	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607028
3687	thespiker	GET	/api/Customer		2025-05-07 09:00:56.590997
3690	thespiker	GET	/api/Customer		2025-05-07 09:00:56.592525
3695	thespiker	GET	/api/Customer		2025-05-07 09:00:56.598191
3701	thespiker	GET	/api/Customer		2025-05-07 09:00:56.609316
3710	thespiker	GET	/api/Customer		2025-05-07 09:00:56.617211
3716	thespiker	GET	/api/Customer		2025-05-07 09:00:56.618143
3717	thespiker	GET	/api/Customer		2025-05-07 09:00:56.618668
3730	thespiker	GET	/api/Customer		2025-05-07 09:00:56.642035
3735	thespiker	GET	/api/Customer		2025-05-07 09:00:56.643462
3737	thespiker	GET	/api/Customer		2025-05-07 09:00:56.644711
3745	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605162
3749	thespiker	GET	/api/Customer		2025-05-07 09:00:56.669143
3759	thespiker	GET	/api/Customer		2025-05-07 09:00:56.674769
3761	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675154
3768	thespiker	GET	/api/Customer		2025-05-07 09:00:56.691524
3779	thespiker	GET	/api/Customer		2025-05-07 09:00:56.701056
3792	thespiker	GET	/api/Customer		2025-05-07 09:00:56.706089
3793	thespiker	GET	/api/Customer		2025-05-07 09:00:56.71115
3801	thespiker	GET	/api/Customer		2025-05-07 09:00:56.727596
3806	thespiker	GET	/api/Customer		2025-05-07 09:00:56.729204
3805	thespiker	GET	/api/Customer		2025-05-07 09:00:56.729213
3807	thespiker	GET	/api/Customer		2025-05-07 09:00:56.730564
3810	thespiker	GET	/api/Customer		2025-05-07 09:00:56.731533
3813	thespiker	GET	/api/Customer		2025-05-07 09:00:56.712545
3814	thespiker	GET	/api/Customer		2025-05-07 09:00:56.735328
3815	thespiker	GET	/api/Customer		2025-05-07 09:00:56.737806
3816	thespiker	GET	/api/Customer		2025-05-07 09:00:56.737817
3817	thespiker	GET	/api/Customer		2025-05-07 09:00:56.737807
3818	thespiker	GET	/api/Customer		2025-05-07 09:00:56.738175
548	thespiker	GET	/api/Customer		2025-05-07 08:52:32.241929
573	thespiker	GET	/api/Customer		2025-05-07 08:52:32.892326
577	thespiker	GET	/api/Customer		2025-05-07 08:52:32.894762
584	thespiker	GET	/api/Customer		2025-05-07 08:52:32.897175
596	thespiker	GET	/api/Customer		2025-05-07 08:52:32.902945
615	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918669
647	thespiker	GET	/api/Customer		2025-05-07 08:52:32.937546
650	thespiker	GET	/api/Customer		2025-05-07 08:52:32.941209
698	thespiker	GET	/api/Customer		2025-05-07 08:52:32.96402
1065	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558699
1092	thespiker	GET	/api/Customer		2025-05-07 08:57:34.313979
1126	thespiker	GET	/api/Customer		2025-05-07 08:57:34.366718
1134	thespiker	GET	/api/Customer		2025-05-07 08:57:34.375244
1173	thespiker	GET	/api/Customer		2025-05-07 08:57:33.55577
1185	thespiker	GET	/api/Customer		2025-05-07 08:57:34.492611
1202	thespiker	GET	/api/Customer		2025-05-07 08:57:34.518697
1208	thespiker	GET	/api/Customer		2025-05-07 08:57:34.526959
1223	thespiker	GET	/api/Customer		2025-05-07 08:57:34.537712
1253	thespiker	GET	/api/Customer		2025-05-07 08:57:34.594525
1257	thespiker	GET	/api/Customer		2025-05-07 08:57:34.609789
1271	thespiker	GET	/api/Customer		2025-05-07 08:57:34.66019
1278	thespiker	GET	/api/Customer		2025-05-07 08:57:34.680468
1303	thespiker	GET	/api/Customer		2025-05-07 08:57:34.747701
1326	thespiker	GET	/api/Customer		2025-05-07 08:57:34.780977
1330	thespiker	GET	/api/Customer		2025-05-07 08:57:34.783888
1347	thespiker	GET	/api/Customer		2025-05-07 08:57:34.809198
1356	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558699
1378	thespiker	GET	/api/Customer		2025-05-07 08:57:34.868032
1400	thespiker	GET	/api/Customer		2025-05-07 08:57:34.900004
1401	thespiker	GET	/api/Customer		2025-05-07 08:57:34.900005
1409	thespiker	GET	/api/Customer		2025-05-07 08:57:34.908006
1422	thespiker	GET	/api/Customer		2025-05-07 08:57:34.914932
1434	thespiker	GET	/api/Customer		2025-05-07 08:57:34.921425
1443	thespiker	GET	/api/Customer		2025-05-07 08:57:34.935682
1453	thespiker	GET	/api/Customer		2025-05-07 08:57:34.942004
1457	thespiker	GET	/api/Customer		2025-05-07 08:57:34.943036
1467	thespiker	GET	/api/Customer		2025-05-07 08:57:34.950098
1479	thespiker	GET	/api/Customer		2025-05-07 08:57:34.968786
1489	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561257
1503	thespiker	GET	/api/Customer		2025-05-07 08:57:35.015448
1522	thespiker	GET	/api/Customer		2025-05-07 08:57:33.664588
1544	thespiker	GET	/api/Customer		2025-05-07 08:57:35.075804
1574	thespiker	GET	/api/Customer		2025-05-07 08:57:35.107777
1589	thespiker	GET	/api/Customer		2025-05-07 08:57:35.130896
1608	thespiker	GET	/api/Customer		2025-05-07 08:57:35.145671
1611	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558895
1645	thespiker	GET	/api/Customer		2025-05-07 08:57:33.575437
1709	thespiker	GET	/api/Customer		2025-05-07 08:57:35.405532
1730	thespiker	GET	/api/Customer		2025-05-07 08:57:35.438433
1751	thespiker	GET	/api/Customer		2025-05-07 08:57:35.54964
1778	thespiker	GET	/api/Customer		2025-05-07 08:57:35.680256
1793	thespiker	GET	/api/Customer		2025-05-07 08:57:35.714559
1798	thespiker	GET	/api/Customer		2025-05-07 08:57:35.720105
1832	thespiker	GET	/api/Customer		2025-05-07 08:57:35.780716
1831	thespiker	GET	/api/Customer		2025-05-07 08:57:35.382977
1860	thespiker	GET	/api/Customer		2025-05-07 08:57:35.805618
1863	thespiker	GET	/api/Customer		2025-05-07 08:57:35.80692
1910	thespiker	GET	/api/Customer		2025-05-07 08:58:18.726852
1926	thespiker	GET	/api/Customer		2025-05-07 08:58:18.727244
1952	thespiker	GET	/api/Customer		2025-05-07 08:58:18.72516
1960	thespiker	GET	/api/Customer		2025-05-07 08:58:24.193809
1970	thespiker	GET	/api/Customer		2025-05-07 08:58:18.745532
1983	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744933
2052	thespiker	GET	/api/Customer		2025-05-07 08:59:55.7504
2021	thespiker	GET	/api/Customer		2025-05-07 08:59:55.711068
2087	thespiker	GET	/api/Customer		2025-05-07 08:59:55.715256
2368	thespiker	GET	/api/Customer		2025-05-07 08:59:57.093497
2388	thespiker	GET	/api/Customer		2025-05-07 08:59:57.675416
2529	thespiker	GET	/api/Customer		2025-05-07 08:59:57.893142
2551	thespiker	GET	/api/Customer		2025-05-07 08:59:57.06093
2566	thespiker	GET	/api/Customer		2025-05-07 08:59:57.933263
2599	thespiker	GET	/api/Customer		2025-05-07 08:59:57.975237
2646	thespiker	GET	/api/Customer		2025-05-07 08:59:58.024454
2635	thespiker	GET	/api/Customer		2025-05-07 08:59:57.092998
2662	thespiker	GET	/api/Customer		2025-05-07 08:59:58.039524
2682	thespiker	GET	/api/Customer		2025-05-07 08:59:58.059257
2715	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094285
2753	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127299
2772	thespiker	GET	/api/Customer		2025-05-07 08:59:58.130238
2793	thespiker	GET	/api/Customer		2025-05-07 08:59:58.160466
2813	thespiker	GET	/api/Customer		2025-05-07 08:59:58.17942
2819	thespiker	GET	/api/Customer		2025-05-07 08:59:58.172495
2842	thespiker	GET	/api/Customer		2025-05-07 08:59:58.199143
2867	thespiker	GET	/api/Customer		2025-05-07 08:59:58.215701
2890	thespiker	GET	/api/Customer		2025-05-07 08:59:58.230654
2918	thespiker	GET	/api/Customer		2025-05-07 08:59:58.242399
2919	thespiker	GET	/api/Customer		2025-05-07 08:59:58.242398
2944	thespiker	GET	/api/Customer		2025-05-07 08:59:58.263921
2984	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27775
3019	thespiker	GET	/api/Customer		2025-05-07 09:00:55.099488
3033	thespiker	GET	/api/Customer		2025-05-07 09:00:55.114123
3059	thespiker	GET	/api/Customer		2025-05-07 09:00:54.276902
3061	thespiker	GET	/api/Customer		2025-05-07 09:00:55.128723
3093	thespiker	GET	/api/Customer		2025-05-07 09:00:55.16472
3099	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165304
3114	thespiker	GET	/api/Customer		2025-05-07 09:00:55.184479
3144	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244604
3173	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262222
3202	thespiker	GET	/api/Customer		2025-05-07 09:00:55.283669
3209	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274866
3242	thespiker	GET	/api/Customer		2025-05-07 09:00:54.245454
3247	thespiker	GET	/api/Customer		2025-05-07 09:00:54.279046
3370	thespiker	GET	/api/Customer		2025-05-07 09:00:55.810378
3379	thespiker	GET	/api/Customer		2025-05-07 09:00:55.819575
3389	thespiker	GET	/api/Customer		2025-05-07 09:00:55.828528
3413	thespiker	GET	/api/Customer		2025-05-07 09:00:56.047824
3433	thespiker	GET	/api/Customer		2025-05-07 09:00:56.132467
540	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852138
566	thespiker	GET	/api/Customer		2025-05-07 08:52:32.873177
571	thespiker	GET	/api/Customer		2025-05-07 08:52:32.890906
582	thespiker	GET	/api/Customer		2025-05-07 08:52:32.896871
597	thespiker	GET	/api/Customer		2025-05-07 08:52:32.902945
623	thespiker	GET	/api/Customer		2025-05-07 08:52:32.919963
673	thespiker	GET	/api/Customer		2025-05-07 08:52:32.949069
680	thespiker	GET	/api/Customer		2025-05-07 08:52:32.958329
696	thespiker	GET	/api/Customer		2025-05-07 08:52:32.964242
1981	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013979
1993	thespiker	GET	/api/Customer		2025-05-07 08:59:56.668334
2055	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013976
2023	thespiker	GET	/api/Customer		2025-05-07 08:59:55.714595
2085	thespiker	GET	/api/Customer		2025-05-07 08:59:55.651619
2384	thespiker	GET	/api/Customer		2025-05-07 08:59:56.766861
2400	thespiker	GET	/api/Customer		2025-05-07 08:59:57.697482
2405	thespiker	GET	/api/Customer		2025-05-07 08:59:57.712025
2440	thespiker	GET	/api/Customer		2025-05-07 08:59:57.789149
2487	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84706
2553	thespiker	GET	/api/Customer		2025-05-07 08:59:57.919894
2576	thespiker	GET	/api/Customer		2025-05-07 08:59:57.947725
2628	thespiker	GET	/api/Customer		2025-05-07 08:59:58.013473
2645	thespiker	GET	/api/Customer		2025-05-07 08:59:58.021245
2631	thespiker	GET	/api/Customer		2025-05-07 08:59:57.059764
2660	thespiker	GET	/api/Customer		2025-05-07 08:59:58.031735
2673	thespiker	GET	/api/Customer		2025-05-07 08:59:58.058157
2700	thespiker	GET	/api/Customer		2025-05-07 08:59:58.072411
2717	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094126
2820	thespiker	GET	/api/Customer		2025-05-07 08:59:58.190034
2825	thespiker	GET	/api/Customer		2025-05-07 08:59:58.190481
2828	thespiker	GET	/api/Customer		2025-05-07 08:59:58.191431
2860	thespiker	GET	/api/Customer		2025-05-07 08:59:58.214477
2876	thespiker	GET	/api/Customer		2025-05-07 08:59:58.218999
2897	thespiker	GET	/api/Customer		2025-05-07 08:59:58.233414
2975	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274964
3035	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103873
3060	thespiker	GET	/api/Customer		2025-05-07 09:00:54.269993
3080	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163091
3094	thespiker	GET	/api/Customer		2025-05-07 09:00:55.164899
3149	thespiker	GET	/api/Customer		2025-05-07 09:00:55.222688
3175	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262094
3176	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262161
3190	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263956
3213	thespiker	GET	/api/Customer		2025-05-07 09:00:55.293633
3210	thespiker	GET	/api/Customer		2025-05-07 09:00:54.291291
3245	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274441
3248	thespiker	GET	/api/Customer		2025-05-07 09:00:55.480092
3253	thespiker	GET	/api/Customer		2025-05-07 09:00:55.503768
3256	thespiker	GET	/api/Customer		2025-05-07 09:00:55.508587
3263	thespiker	GET	/api/Customer		2025-05-07 09:00:55.51605
3269	thespiker	GET	/api/Customer		2025-05-07 09:00:55.536918
3275	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54146
3297	thespiker	GET	/api/Customer		2025-05-07 09:00:55.572647
3305	thespiker	GET	/api/Customer		2025-05-07 09:00:55.577106
3311	thespiker	GET	/api/Customer		2025-05-07 09:00:55.581981
3323	thespiker	GET	/api/Customer		2025-05-07 09:00:55.588213
3339	thespiker	GET	/api/Customer		2025-05-07 09:00:55.728568
3347	thespiker	GET	/api/Customer		2025-05-07 09:00:55.738458
3367	thespiker	GET	/api/Customer		2025-05-07 09:00:55.79749
3378	thespiker	GET	/api/Customer		2025-05-07 09:00:55.328141
3381	thespiker	GET	/api/Customer		2025-05-07 09:00:55.820931
3385	thespiker	GET	/api/Customer		2025-05-07 09:00:55.825968
3388	thespiker	GET	/api/Customer		2025-05-07 09:00:55.827224
3397	thespiker	GET	/api/Customer		2025-05-07 09:00:55.849176
3424	thespiker	GET	/api/Customer		2025-05-07 09:00:56.095076
3432	thespiker	GET	/api/Customer		2025-05-07 09:00:56.129659
3459	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606256
3465	thespiker	GET	/api/Customer		2025-05-07 09:00:56.212549
3478	thespiker	GET	/api/Customer		2025-05-07 09:00:56.239062
3483	thespiker	GET	/api/Customer		2025-05-07 09:00:56.248691
3485	thespiker	GET	/api/Customer		2025-05-07 09:00:56.251731
3488	thespiker	GET	/api/Customer		2025-05-07 09:00:56.256944
3496	thespiker	GET	/api/Customer		2025-05-07 09:00:56.268172
3510	thespiker	GET	/api/Customer		2025-05-07 09:00:56.295105
3525	thespiker	GET	/api/Customer		2025-05-07 09:00:56.354251
3526	thespiker	GET	/api/Customer		2025-05-07 09:00:56.354181
3530	thespiker	GET	/api/Customer		2025-05-07 09:00:56.372044
3532	thespiker	GET	/api/Customer		2025-05-07 09:00:56.378541
3544	thespiker	GET	/api/Customer		2025-05-07 09:00:56.396197
3547	thespiker	GET	/api/Customer		2025-05-07 09:00:56.403584
3566	thespiker	GET	/api/Customer		2025-05-07 09:00:56.439197
3571	thespiker	GET	/api/Customer		2025-05-07 09:00:56.446411
3579	thespiker	GET	/api/Customer		2025-05-07 09:00:56.457134
3586	thespiker	GET	/api/Customer		2025-05-07 09:00:56.459793
3590	thespiker	GET	/api/Customer		2025-05-07 09:00:56.464044
3600	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603551
3601	thespiker	GET	/api/Customer		2025-05-07 09:00:56.482863
3618	thespiker	GET	/api/Customer		2025-05-07 09:00:56.499457
3622	thespiker	GET	/api/Customer		2025-05-07 09:00:56.500599
3628	thespiker	GET	/api/Customer		2025-05-07 09:00:56.506416
3635	thespiker	GET	/api/Customer		2025-05-07 09:00:56.518143
3641	thespiker	GET	/api/Customer		2025-05-07 09:00:56.52448
3648	thespiker	GET	/api/Customer		2025-05-07 09:00:56.52864
3652	thespiker	GET	/api/Customer		2025-05-07 09:00:56.532607
3663	thespiker	GET	/api/Customer		2025-05-07 09:00:55.578432
3674	thespiker	GET	/api/Customer		2025-05-07 09:00:56.575284
3676	thespiker	GET	/api/Customer		2025-05-07 09:00:56.578821
3682	thespiker	GET	/api/Customer		2025-05-07 09:00:55.606799
3709	thespiker	GET	/api/Customer		2025-05-07 09:00:55.515302
3728	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607009
3746	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602144
3753	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602214
3770	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675974
3769	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607076
3774	thespiker	GET	/api/Customer		2025-05-07 09:00:56.6956
3784	thespiker	GET	/api/Customer		2025-05-07 09:00:56.702637
3786	thespiker	GET	/api/Customer		2025-05-07 09:00:56.703706
551	thespiker	GET	/api/Customer		2025-05-07 08:52:32.241697
561	thespiker	GET	/api/Customer		2025-05-07 08:52:32.871963
580	thespiker	GET	/api/Customer		2025-05-07 08:52:32.895821
588	thespiker	GET	/api/Customer		2025-05-07 08:52:32.899757
612	thespiker	GET	/api/Customer		2025-05-07 08:52:32.917676
624	thespiker	GET	/api/Customer		2025-05-07 08:52:32.916648
628	thespiker	GET	/api/Customer		2025-05-07 08:52:32.924791
643	thespiker	GET	/api/Customer		2025-05-07 08:52:32.936251
690	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963016
709	thespiker	GET	/api/Customer		2025-05-07 08:52:32.968141
1066	thespiker	GET	/api/Customer		2025-05-07 08:57:33.559974
1075	thespiker	GET	/api/Customer		2025-05-07 08:57:34.25949
1099	thespiker	GET	/api/Customer		2025-05-07 08:57:34.320078
1138	thespiker	GET	/api/Customer		2025-05-07 08:57:34.381608
1143	thespiker	GET	/api/Customer		2025-05-07 08:57:34.389322
1177	thespiker	GET	/api/Customer		2025-05-07 08:57:33.698807
1186	thespiker	GET	/api/Customer		2025-05-07 08:57:34.493577
1205	thespiker	GET	/api/Customer		2025-05-07 08:57:34.519298
1224	thespiker	GET	/api/Customer		2025-05-07 08:57:34.54224
1245	thespiker	GET	/api/Customer		2025-05-07 08:57:34.568889
1258	thespiker	GET	/api/Customer		2025-05-07 08:57:34.612757
1302	thespiker	GET	/api/Customer		2025-05-07 08:57:34.747381
1328	thespiker	GET	/api/Customer		2025-05-07 08:57:34.782349
1360	thespiker	GET	/api/Customer		2025-05-07 08:57:34.844629
1365	thespiker	GET	/api/Customer		2025-05-07 08:57:33.556091
1379	thespiker	GET	/api/Customer		2025-05-07 08:57:34.871765
1406	thespiker	GET	/api/Customer		2025-05-07 08:57:34.902812
1423	thespiker	GET	/api/Customer		2025-05-07 08:57:34.91613
1426	thespiker	GET	/api/Customer		2025-05-07 08:57:34.91613
1445	thespiker	GET	/api/Customer		2025-05-07 08:57:34.936706
1492	thespiker	GET	/api/Customer		2025-05-07 08:57:33.582042
1524	thespiker	GET	/api/Customer		2025-05-07 08:57:35.040314
1546	thespiker	GET	/api/Customer		2025-05-07 08:57:35.076521
1578	thespiker	GET	/api/Customer		2025-05-07 08:57:35.110263
1595	thespiker	GET	/api/Customer		2025-05-07 08:57:35.13363
1620	thespiker	GET	/api/Customer		2025-05-07 08:57:35.153874
1624	thespiker	GET	/api/Customer		2025-05-07 08:57:35.153293
1612	thespiker	GET	/api/Customer		2025-05-07 08:57:33.587475
1651	thespiker	GET	/api/Customer		2025-05-07 08:57:35.199589
1741	thespiker	GET	/api/Customer		2025-05-07 08:57:35.335963
1744	thespiker	GET	/api/Customer		2025-05-07 08:57:35.484007
1753	thespiker	GET	/api/Customer		2025-05-07 08:57:35.565218
1760	thespiker	GET	/api/Customer		2025-05-07 08:57:35.611009
1767	thespiker	GET	/api/Customer		2025-05-07 08:57:35.649451
1779	thespiker	GET	/api/Customer		2025-05-07 08:57:35.681238
1783	thespiker	GET	/api/Customer		2025-05-07 08:57:35.695358
1795	thespiker	GET	/api/Customer		2025-05-07 08:57:35.71628
1802	thespiker	GET	/api/Customer		2025-05-07 08:57:35.734819
1819	thespiker	GET	/api/Customer		2025-05-07 08:57:35.758309
1840	thespiker	GET	/api/Customer		2025-05-07 08:57:35.385021
1851	thespiker	GET	/api/Customer		2025-05-07 08:57:35.797736
1879	thespiker	GET	/api/Customer		2025-05-07 08:57:35.827849
1890	thespiker	GET	/api/Customer		2025-05-07 08:57:35.837115
1911	thespiker	GET	/api/Customer		2025-05-07 08:58:18.725469
1933	thespiker	GET	/api/Customer		2025-05-07 08:58:18.724329
1953	thespiker	GET	/api/Customer		2025-05-07 08:58:18.745368
1996	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013968
2050	thespiker	GET	/api/Customer		2025-05-07 08:59:55.712872
2005	thespiker	GET	/api/Customer		2025-05-07 08:59:55.749527
2086	thespiker	GET	/api/Customer		2025-05-07 08:59:55.651619
2393	thespiker	GET	/api/Customer		2025-05-07 08:59:57.685437
2426	thespiker	GET	/api/Customer		2025-05-07 08:59:57.771126
2433	thespiker	GET	/api/Customer		2025-05-07 08:59:57.779648
2464	thespiker	GET	/api/Customer		2025-05-07 08:59:57.822669
2479	thespiker	GET	/api/Customer		2025-05-07 08:59:57.83961
2490	thespiker	GET	/api/Customer		2025-05-07 08:59:57.848276
2510	thespiker	GET	/api/Customer		2025-05-07 08:59:57.874602
2558	thespiker	GET	/api/Customer		2025-05-07 08:59:57.926859
2568	thespiker	GET	/api/Customer		2025-05-07 08:59:57.936156
2569	thespiker	GET	/api/Customer		2025-05-07 08:59:57.937267
2617	thespiker	GET	/api/Customer		2025-05-07 08:59:57.999343
2641	thespiker	GET	/api/Customer		2025-05-07 08:59:58.020154
2636	thespiker	GET	/api/Customer		2025-05-07 08:59:57.096487
2690	thespiker	GET	/api/Customer		2025-05-07 08:59:58.068628
2709	thespiker	GET	/api/Customer		2025-05-07 08:59:58.086011
2716	thespiker	GET	/api/Customer		2025-05-07 08:59:57.095308
2740	thespiker	GET	/api/Customer		2025-05-07 08:59:58.106952
2777	thespiker	GET	/api/Customer		2025-05-07 08:59:58.131094
2779	thespiker	GET	/api/Customer		2025-05-07 08:59:58.135942
2792	thespiker	GET	/api/Customer		2025-05-07 08:59:58.160302
2800	thespiker	GET	/api/Customer		2025-05-07 08:59:58.172495
2849	thespiker	GET	/api/Customer		2025-05-07 08:59:58.202444
2861	thespiker	GET	/api/Customer		2025-05-07 08:59:58.214477
2895	thespiker	GET	/api/Customer		2025-05-07 08:59:58.231613
2939	thespiker	GET	/api/Customer		2025-05-07 08:59:58.262703
2989	thespiker	GET	/api/Customer		2025-05-07 09:00:54.161613
3020	thespiker	GET	/api/Customer		2025-05-07 09:00:55.100603
3045	thespiker	GET	/api/Customer		2025-05-07 09:00:55.117839
3064	thespiker	GET	/api/Customer		2025-05-07 09:00:55.133306
3081	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163156
3083	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163668
3152	thespiker	GET	/api/Customer		2025-05-07 09:00:55.234376
3155	thespiker	GET	/api/Customer		2025-05-07 09:00:55.235247
3167	thespiker	GET	/api/Customer		2025-05-07 09:00:55.250185
3193	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263958
3207	thespiker	GET	/api/Customer		2025-05-07 09:00:55.289551
3216	thespiker	GET	/api/Customer		2025-05-07 09:00:55.294757
3241	thespiker	GET	/api/Customer		2025-05-07 09:00:54.278722
3249	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242828
3399	thespiker	GET	/api/Customer		2025-05-07 09:00:55.855171
3401	thespiker	GET	/api/Customer		2025-05-07 09:00:56.004647
3430	thespiker	GET	/api/Customer		2025-05-07 09:00:56.122412
3443	thespiker	GET	/api/Customer		2025-05-07 09:00:56.152813
3460	thespiker	GET	/api/Customer		2025-05-07 09:00:56.192294
3514	thespiker	GET	/api/Customer		2025-05-07 09:00:56.30254
3527	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54254
3541	thespiker	GET	/api/Customer		2025-05-07 09:00:56.391308
552	thespiker	GET	/api/Customer		2025-05-07 08:52:32.215017
603	thespiker	GET	/api/Customer		2025-05-07 08:52:32.904089
617	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918594
631	thespiker	GET	/api/Customer		2025-05-07 08:52:32.92599
666	thespiker	GET	/api/Customer		2025-05-07 08:52:32.943034
683	thespiker	GET	/api/Customer		2025-05-07 08:52:32.958554
1067	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555881
1076	thespiker	GET	/api/Customer		2025-05-07 08:57:34.265463
1086	thespiker	GET	/api/Customer		2025-05-07 08:57:34.306691
1107	thespiker	GET	/api/Customer		2025-05-07 08:57:34.333739
1130	thespiker	GET	/api/Customer		2025-05-07 08:57:34.371044
1147	thespiker	GET	/api/Customer		2025-05-07 08:57:34.395733
1157	thespiker	GET	/api/Customer		2025-05-07 08:57:34.408866
1191	thespiker	GET	/api/Customer		2025-05-07 08:57:34.501017
1199	thespiker	GET	/api/Customer		2025-05-07 08:57:33.573955
1228	thespiker	GET	/api/Customer		2025-05-07 08:57:34.544301
1230	thespiker	GET	/api/Customer		2025-05-07 08:57:34.544674
1234	thespiker	GET	/api/Customer		2025-05-07 08:57:34.549122
1265	thespiker	GET	/api/Customer		2025-05-07 08:57:34.635316
1327	thespiker	GET	/api/Customer		2025-05-07 08:57:34.781022
1344	thespiker	GET	/api/Customer		2025-05-07 08:57:34.803189
1363	thespiker	GET	/api/Customer		2025-05-07 08:57:34.851758
1368	thespiker	GET	/api/Customer		2025-05-07 08:57:33.576835
1380	thespiker	GET	/api/Customer		2025-05-07 08:57:34.874363
1416	thespiker	GET	/api/Customer		2025-05-07 08:57:34.910511
1429	thespiker	GET	/api/Customer		2025-05-07 08:57:34.917656
1448	thespiker	GET	/api/Customer		2025-05-07 08:57:34.937863
1449	thespiker	GET	/api/Customer		2025-05-07 08:57:34.937852
1508	thespiker	GET	/api/Customer		2025-05-07 08:57:35.017124
1523	thespiker	GET	/api/Customer		2025-05-07 08:57:35.044963
1526	thespiker	GET	/api/Customer		2025-05-07 08:57:35.047046
1545	thespiker	GET	/api/Customer		2025-05-07 08:57:35.076521
1576	thespiker	GET	/api/Customer		2025-05-07 08:57:35.109219
1580	thespiker	GET	/api/Customer		2025-05-07 08:57:35.11163
1604	thespiker	GET	/api/Customer		2025-05-07 08:57:35.139908
1614	thespiker	GET	/api/Customer		2025-05-07 08:57:33.700422
1647	thespiker	GET	/api/Customer		2025-05-07 08:57:35.193232
1653	thespiker	GET	/api/Customer		2025-05-07 08:57:33.706472
1745	thespiker	GET	/api/Customer		2025-05-07 08:57:35.335321
1757	thespiker	GET	/api/Customer		2025-05-07 08:57:35.580764
1791	thespiker	GET	/api/Customer		2025-05-07 08:57:35.708523
1808	thespiker	GET	/api/Customer		2025-05-07 08:57:35.742589
1826	thespiker	GET	/api/Customer		2025-05-07 08:57:35.771397
1836	thespiker	GET	/api/Customer		2025-05-07 08:57:35.786306
1841	thespiker	GET	/api/Customer		2025-05-07 08:57:35.385304
1857	thespiker	GET	/api/Customer		2025-05-07 08:57:35.804462
1861	thespiker	GET	/api/Customer		2025-05-07 08:57:35.805618
1884	thespiker	GET	/api/Customer		2025-05-07 08:57:35.83161
1913	thespiker	GET	/api/Customer		2025-05-07 08:58:18.647115
1934	thespiker	GET	/api/Customer		2025-05-07 08:58:18.725975
1954	thespiker	GET	/api/Customer		2025-05-07 08:58:18.663655
2000	thespiker	GET	/api/Customer		2025-05-07 08:59:55.013971
2063	thespiker	GET	/api/Customer		2025-05-07 08:59:55.751558
2029	thespiker	GET	/api/Customer		2025-05-07 08:59:55.749544
2090	thespiker	GET	/api/Customer		2025-05-07 08:59:56.97538
2111	thespiker	GET	/api/Customer		2025-05-07 08:59:57.013332
2133	thespiker	GET	/api/Customer		2025-05-07 08:59:57.031776
2147	thespiker	GET	/api/Customer		2025-05-07 08:59:57.052981
2155	thespiker	GET	/api/Customer		2025-05-07 08:59:57.055936
2171	thespiker	GET	/api/Customer		2025-05-07 08:59:57.180634
2180	thespiker	GET	/api/Customer		2025-05-07 08:59:57.193469
2197	thespiker	GET	/api/Customer		2025-05-07 08:59:57.20794
2217	thespiker	GET	/api/Customer		2025-05-07 08:59:57.226327
2225	thespiker	GET	/api/Customer		2025-05-07 08:59:57.317646
2227	thespiker	GET	/api/Customer		2025-05-07 08:59:57.323422
2243	thespiker	GET	/api/Customer		2025-05-07 08:59:57.346242
2275	thespiker	GET	/api/Customer		2025-05-07 08:59:57.396964
2306	thespiker	GET	/api/Customer		2025-05-07 08:59:57.443533
2317	thespiker	GET	/api/Customer		2025-05-07 08:59:57.4562
2334	thespiker	GET	/api/Customer		2025-05-07 08:59:57.535577
2344	thespiker	GET	/api/Customer		2025-05-07 08:59:57.609234
2352	thespiker	GET	/api/Customer		2025-05-07 08:59:57.618887
2357	thespiker	GET	/api/Customer		2025-05-07 08:59:57.625458
2407	thespiker	GET	/api/Customer		2025-05-07 08:59:57.063447
2421	thespiker	GET	/api/Customer		2025-05-07 08:59:57.765528
2459	thespiker	GET	/api/Customer		2025-05-07 08:59:57.813335
2519	thespiker	GET	/api/Customer		2025-05-07 08:59:57.881479
2549	thespiker	GET	/api/Customer		2025-05-07 08:59:57.91481
2559	thespiker	GET	/api/Customer		2025-05-07 08:59:57.927093
2561	thespiker	GET	/api/Customer		2025-05-07 08:59:57.060208
2597	thespiker	GET	/api/Customer		2025-05-07 08:59:57.971459
2637	thespiker	GET	/api/Customer		2025-05-07 08:59:57.062315
2701	thespiker	GET	/api/Customer		2025-05-07 08:59:58.072411
2725	thespiker	GET	/api/Customer		2025-05-07 08:59:57.095692
2752	thespiker	GET	/api/Customer		2025-05-07 08:59:58.126483
2757	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127316
2778	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129655
2782	thespiker	GET	/api/Customer		2025-05-07 08:59:58.157562
2803	thespiker	GET	/api/Customer		2025-05-07 08:59:58.160304
2827	thespiker	GET	/api/Customer		2025-05-07 08:59:58.191485
2840	thespiker	GET	/api/Customer		2025-05-07 08:59:58.199239
2855	thespiker	GET	/api/Customer		2025-05-07 08:59:58.210672
2863	thespiker	GET	/api/Customer		2025-05-07 08:59:58.214535
2886	thespiker	GET	/api/Customer		2025-05-07 08:59:58.225081
2905	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240441
2920	thespiker	GET	/api/Customer		2025-05-07 08:59:58.242411
2929	thespiker	GET	/api/Customer		2025-05-07 08:59:58.257808
2934	thespiker	GET	/api/Customer		2025-05-07 08:59:58.258857
2941	thespiker	GET	/api/Customer		2025-05-07 08:59:58.262795
2979	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242828
3048	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118178
3095	thespiker	GET	/api/Customer		2025-05-07 09:00:55.164744
3120	thespiker	GET	/api/Customer		2025-05-07 09:00:54.246361
3159	thespiker	GET	/api/Customer		2025-05-07 09:00:55.236215
3151	thespiker	GET	/api/Customer		2025-05-07 09:00:54.277513
3178	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263097
3206	thespiker	GET	/api/Customer		2025-05-07 09:00:55.288355
713	thespiker	POST	/api/Customer	{"name":"Customer_0","phone":"\\u002B380999000000","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:31.39268
714	thespiker	POST	/api/Customer	{"name":"Customer_1","phone":"\\u002B380999000001","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.666618
715	thespiker	POST	/api/Customer	{"name":"Customer_2","phone":"\\u002B380999000002","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.721165
716	thespiker	POST	/api/Customer	{"name":"Customer_3","phone":"\\u002B380999000003","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.735296
717	thespiker	POST	/api/Customer	{"name":"Customer_4","phone":"\\u002B380999000004","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.73869
718	thespiker	POST	/api/Customer	{"name":"Customer_5","phone":"\\u002B380999000005","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.742568
719	thespiker	POST	/api/Customer	{"name":"Customer_6","phone":"\\u002B380999000006","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.745997
720	thespiker	POST	/api/Customer	{"name":"Customer_7","phone":"\\u002B380999000007","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.749583
721	thespiker	POST	/api/Customer	{"name":"Customer_8","phone":"\\u002B380999000008","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.752825
722	thespiker	POST	/api/Customer	{"name":"Customer_9","phone":"\\u002B380999000009","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.755725
723	thespiker	POST	/api/Customer	{"name":"Customer_10","phone":"\\u002B380999000010","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.759148
724	thespiker	POST	/api/Customer	{"name":"Customer_11","phone":"\\u002B380999000011","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.76189
725	thespiker	POST	/api/Customer	{"name":"Customer_12","phone":"\\u002B380999000012","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.764709
726	thespiker	POST	/api/Customer	{"name":"Customer_13","phone":"\\u002B380999000013","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.767454
727	thespiker	POST	/api/Customer	{"name":"Customer_14","phone":"\\u002B380999000014","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.770214
728	thespiker	POST	/api/Customer	{"name":"Customer_15","phone":"\\u002B380999000015","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.773327
729	thespiker	POST	/api/Customer	{"name":"Customer_16","phone":"\\u002B380999000016","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.776419
730	thespiker	POST	/api/Customer	{"name":"Customer_17","phone":"\\u002B380999000017","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.779239
731	thespiker	POST	/api/Customer	{"name":"Customer_18","phone":"\\u002B380999000018","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.782631
732	thespiker	POST	/api/Customer	{"name":"Customer_19","phone":"\\u002B380999000019","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.78548
733	thespiker	POST	/api/Customer	{"name":"Customer_20","phone":"\\u002B380999000020","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.7882
734	thespiker	POST	/api/Customer	{"name":"Customer_21","phone":"\\u002B380999000021","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.792209
735	thespiker	POST	/api/Customer	{"name":"Customer_22","phone":"\\u002B380999000022","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.795171
736	thespiker	POST	/api/Customer	{"name":"Customer_23","phone":"\\u002B380999000023","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.798052
737	thespiker	POST	/api/Customer	{"name":"Customer_24","phone":"\\u002B380999000024","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.801004
738	thespiker	POST	/api/Customer	{"name":"Customer_25","phone":"\\u002B380999000025","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.80405
739	thespiker	POST	/api/Customer	{"name":"Customer_26","phone":"\\u002B380999000026","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.807848
740	thespiker	POST	/api/Customer	{"name":"Customer_27","phone":"\\u002B380999000027","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.811341
741	thespiker	POST	/api/Customer	{"name":"Customer_28","phone":"\\u002B380999000028","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.81483
742	thespiker	POST	/api/Customer	{"name":"Customer_29","phone":"\\u002B380999000029","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.818178
743	thespiker	POST	/api/Customer	{"name":"Customer_30","phone":"\\u002B380999000030","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.8213
744	thespiker	POST	/api/Customer	{"name":"Customer_31","phone":"\\u002B380999000031","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.825136
745	thespiker	POST	/api/Customer	{"name":"Customer_32","phone":"\\u002B380999000032","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.828344
746	thespiker	POST	/api/Customer	{"name":"Customer_33","phone":"\\u002B380999000033","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.83142
747	thespiker	POST	/api/Customer	{"name":"Customer_34","phone":"\\u002B380999000034","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.834605
748	thespiker	POST	/api/Customer	{"name":"Customer_35","phone":"\\u002B380999000035","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.837874
749	thespiker	POST	/api/Customer	{"name":"Customer_36","phone":"\\u002B380999000036","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.845318
750	thespiker	POST	/api/Customer	{"name":"Customer_37","phone":"\\u002B380999000037","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.84907
751	thespiker	POST	/api/Customer	{"name":"Customer_38","phone":"\\u002B380999000038","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.852357
752	thespiker	POST	/api/Customer	{"name":"Customer_39","phone":"\\u002B380999000039","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.855887
753	thespiker	POST	/api/Customer	{"name":"Customer_40","phone":"\\u002B380999000040","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.859503
754	thespiker	POST	/api/Customer	{"name":"Customer_41","phone":"\\u002B380999000041","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.862624
755	thespiker	POST	/api/Customer	{"name":"Customer_42","phone":"\\u002B380999000042","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.865848
756	thespiker	POST	/api/Customer	{"name":"Customer_43","phone":"\\u002B380999000043","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.868911
757	thespiker	POST	/api/Customer	{"name":"Customer_44","phone":"\\u002B380999000044","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.889029
758	thespiker	POST	/api/Customer	{"name":"Customer_45","phone":"\\u002B380999000045","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.894631
759	thespiker	POST	/api/Customer	{"name":"Customer_46","phone":"\\u002B380999000046","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.898461
760	thespiker	POST	/api/Customer	{"name":"Customer_47","phone":"\\u002B380999000047","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.90331
761	thespiker	POST	/api/Customer	{"name":"Customer_48","phone":"\\u002B380999000048","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.907568
1068	thespiker	GET	/api/Customer		2025-05-07 08:57:33.573955
762	thespiker	POST	/api/Customer	{"name":"Customer_49","phone":"\\u002B380999000049","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.911608
763	thespiker	POST	/api/Customer	{"name":"Customer_50","phone":"\\u002B380999000050","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.915322
764	thespiker	POST	/api/Customer	{"name":"Customer_51","phone":"\\u002B380999000051","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.919252
765	thespiker	POST	/api/Customer	{"name":"Customer_52","phone":"\\u002B380999000052","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.923123
766	thespiker	POST	/api/Customer	{"name":"Customer_53","phone":"\\u002B380999000053","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.927773
767	thespiker	POST	/api/Customer	{"name":"Customer_54","phone":"\\u002B380999000054","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.931666
768	thespiker	POST	/api/Customer	{"name":"Customer_55","phone":"\\u002B380999000055","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.935457
769	thespiker	POST	/api/Customer	{"name":"Customer_56","phone":"\\u002B380999000056","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.939203
770	thespiker	POST	/api/Customer	{"name":"Customer_57","phone":"\\u002B380999000057","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.943261
771	thespiker	POST	/api/Customer	{"name":"Customer_58","phone":"\\u002B380999000058","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.947093
772	thespiker	POST	/api/Customer	{"name":"Customer_59","phone":"\\u002B380999000059","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.951331
773	thespiker	POST	/api/Customer	{"name":"Customer_60","phone":"\\u002B380999000060","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.954884
774	thespiker	POST	/api/Customer	{"name":"Customer_61","phone":"\\u002B380999000061","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.95983
775	thespiker	POST	/api/Customer	{"name":"Customer_62","phone":"\\u002B380999000062","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.966478
776	thespiker	POST	/api/Customer	{"name":"Customer_63","phone":"\\u002B380999000063","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.970731
777	thespiker	POST	/api/Customer	{"name":"Customer_64","phone":"\\u002B380999000064","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.975286
778	thespiker	POST	/api/Customer	{"name":"Customer_65","phone":"\\u002B380999000065","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.978854
779	thespiker	POST	/api/Customer	{"name":"Customer_66","phone":"\\u002B380999000066","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.982707
780	thespiker	POST	/api/Customer	{"name":"Customer_67","phone":"\\u002B380999000067","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.986302
781	thespiker	POST	/api/Customer	{"name":"Customer_68","phone":"\\u002B380999000068","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.990287
782	thespiker	POST	/api/Customer	{"name":"Customer_69","phone":"\\u002B380999000069","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:32.994507
783	thespiker	POST	/api/Customer	{"name":"Customer_70","phone":"\\u002B380999000070","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.002465
784	thespiker	POST	/api/Customer	{"name":"Customer_71","phone":"\\u002B380999000071","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.006157
785	thespiker	POST	/api/Customer	{"name":"Customer_72","phone":"\\u002B380999000072","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.009827
786	thespiker	POST	/api/Customer	{"name":"Customer_73","phone":"\\u002B380999000073","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.013318
787	thespiker	POST	/api/Customer	{"name":"Customer_74","phone":"\\u002B380999000074","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.016994
788	thespiker	POST	/api/Customer	{"name":"Customer_75","phone":"\\u002B380999000075","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.020332
789	thespiker	POST	/api/Customer	{"name":"Customer_76","phone":"\\u002B380999000076","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.038715
790	thespiker	POST	/api/Customer	{"name":"Customer_77","phone":"\\u002B380999000077","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.04485
791	thespiker	POST	/api/Customer	{"name":"Customer_78","phone":"\\u002B380999000078","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.04831
792	thespiker	POST	/api/Customer	{"name":"Customer_79","phone":"\\u002B380999000079","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.051449
793	thespiker	POST	/api/Customer	{"name":"Customer_80","phone":"\\u002B380999000080","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.054625
794	thespiker	POST	/api/Customer	{"name":"Customer_81","phone":"\\u002B380999000081","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.058559
795	thespiker	POST	/api/Customer	{"name":"Customer_82","phone":"\\u002B380999000082","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.061692
796	thespiker	POST	/api/Customer	{"name":"Customer_83","phone":"\\u002B380999000083","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.064985
797	thespiker	POST	/api/Customer	{"name":"Customer_84","phone":"\\u002B380999000084","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.068258
798	thespiker	POST	/api/Customer	{"name":"Customer_85","phone":"\\u002B380999000085","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.071259
799	thespiker	POST	/api/Customer	{"name":"Customer_86","phone":"\\u002B380999000086","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.075028
800	thespiker	POST	/api/Customer	{"name":"Customer_87","phone":"\\u002B380999000087","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.07803
801	thespiker	POST	/api/Customer	{"name":"Customer_88","phone":"\\u002B380999000088","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.081134
802	thespiker	POST	/api/Customer	{"name":"Customer_89","phone":"\\u002B380999000089","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.084046
803	thespiker	POST	/api/Customer	{"name":"Customer_90","phone":"\\u002B380999000090","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.087393
804	thespiker	POST	/api/Customer	{"name":"Customer_91","phone":"\\u002B380999000091","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.091702
805	thespiker	POST	/api/Customer	{"name":"Customer_92","phone":"\\u002B380999000092","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.095085
806	thespiker	POST	/api/Customer	{"name":"Customer_93","phone":"\\u002B380999000093","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.09845
807	thespiker	POST	/api/Customer	{"name":"Customer_94","phone":"\\u002B380999000094","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.101827
808	thespiker	POST	/api/Customer	{"name":"Customer_95","phone":"\\u002B380999000095","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.10577
809	thespiker	POST	/api/Customer	{"name":"Customer_96","phone":"\\u002B380999000096","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.10958
810	thespiker	POST	/api/Customer	{"name":"Customer_97","phone":"\\u002B380999000097","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.113123
1083	thespiker	GET	/api/Customer		2025-05-07 08:57:34.2727
541	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852683
555	thespiker	GET	/api/Customer		2025-05-07 08:52:32.868515
562	thespiker	GET	/api/Customer		2025-05-07 08:52:32.871963
570	thespiker	GET	/api/Customer		2025-05-07 08:52:32.87564
574	thespiker	GET	/api/Customer		2025-05-07 08:52:32.892326
583	thespiker	GET	/api/Customer		2025-05-07 08:52:32.896871
599	thespiker	GET	/api/Customer		2025-05-07 08:52:32.903107
614	thespiker	GET	/api/Customer		2025-05-07 08:52:32.917891
633	thespiker	GET	/api/Customer		2025-05-07 08:52:32.92631
639	thespiker	GET	/api/Customer		2025-05-07 08:52:32.928289
658	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942162
711	thespiker	GET	/api/Customer		2025-05-07 08:52:32.978782
2002	thespiker	GET	/api/Customer		2025-05-07 08:59:55.71368
2060	thespiker	GET	/api/Customer		2025-05-07 08:59:55.749772
2036	thespiker	GET	/api/Customer		2025-05-07 08:59:55.716434
2092	thespiker	GET	/api/Customer		2025-05-07 08:59:56.975735
2116	thespiker	GET	/api/Customer		2025-05-07 08:59:57.017903
2124	thespiker	GET	/api/Customer		2025-05-07 08:59:57.022456
2134	thespiker	GET	/api/Customer		2025-05-07 08:59:57.031776
2149	thespiker	GET	/api/Customer		2025-05-07 08:59:57.053493
2162	thespiker	GET	/api/Customer		2025-05-07 08:59:57.107445
2167	thespiker	GET	/api/Customer		2025-05-07 08:59:57.177357
2191	thespiker	GET	/api/Customer		2025-05-07 08:59:57.206297
2206	thespiker	GET	/api/Customer		2025-05-07 08:59:57.226341
2234	thespiker	GET	/api/Customer		2025-05-07 08:59:57.336691
2267	thespiker	GET	/api/Customer		2025-05-07 08:59:57.372581
2280	thespiker	GET	/api/Customer		2025-05-07 08:59:57.398431
2358	thespiker	GET	/api/Customer		2025-05-07 08:59:57.625823
2375	thespiker	GET	/api/Customer		2025-05-07 08:59:57.651204
2408	thespiker	GET	/api/Customer		2025-05-07 08:59:57.062568
2422	thespiker	GET	/api/Customer		2025-05-07 08:59:57.767234
2431	thespiker	GET	/api/Customer		2025-05-07 08:59:57.776359
2438	thespiker	GET	/api/Customer		2025-05-07 08:59:57.78539
2445	thespiker	GET	/api/Customer		2025-05-07 08:59:57.794768
2454	thespiker	GET	/api/Customer		2025-05-07 08:59:57.807689
2501	thespiker	GET	/api/Customer		2025-05-07 08:59:57.861751
2505	thespiker	GET	/api/Customer		2025-05-07 08:59:57.870569
2560	thespiker	GET	/api/Customer		2025-05-07 08:59:57.92727
2563	thespiker	GET	/api/Customer		2025-05-07 08:59:57.09868
2565	thespiker	GET	/api/Customer		2025-05-07 08:59:57.933237
2571	thespiker	GET	/api/Customer		2025-05-07 08:59:57.937905
2592	thespiker	GET	/api/Customer		2025-05-07 08:59:57.968763
2626	thespiker	GET	/api/Customer		2025-05-07 08:59:58.01135
2632	thespiker	GET	/api/Customer		2025-05-07 08:59:58.015195
2661	thespiker	GET	/api/Customer		2025-05-07 08:59:58.031735
2667	thespiker	GET	/api/Customer		2025-05-07 08:59:57.063281
2730	thespiker	GET	/api/Customer		2025-05-07 08:59:58.10473
2727	thespiker	GET	/api/Customer		2025-05-07 08:59:57.061476
2749	thespiker	GET	/api/Customer		2025-05-07 08:59:58.126191
2750	thespiker	GET	/api/Customer		2025-05-07 08:59:58.126387
2783	thespiker	GET	/api/Customer		2025-05-07 08:59:58.157804
2795	thespiker	GET	/api/Customer		2025-05-07 08:59:58.171049
2805	thespiker	GET	/api/Customer		2025-05-07 08:59:58.157804
2807	thespiker	GET	/api/Customer		2025-05-07 08:59:58.177733
2833	thespiker	GET	/api/Customer		2025-05-07 08:59:58.19254
2869	thespiker	GET	/api/Customer		2025-05-07 08:59:58.216623
2883	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224394
2898	thespiker	GET	/api/Customer		2025-05-07 08:59:58.235861
2901	thespiker	GET	/api/Customer		2025-05-07 08:59:58.239852
2911	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241329
2930	thespiker	GET	/api/Customer		2025-05-07 08:59:58.25784
2983	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244666
3056	thespiker	GET	/api/Customer		2025-05-07 09:00:55.118971
3073	thespiker	GET	/api/Customer		2025-05-07 09:00:55.153704
3110	thespiker	GET	/api/Customer		2025-05-07 09:00:55.167801
3125	thespiker	GET	/api/Customer		2025-05-07 09:00:54.2692
3147	thespiker	GET	/api/Customer		2025-05-07 09:00:55.222742
3160	thespiker	GET	/api/Customer		2025-05-07 09:00:55.237369
3172	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262094
3174	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262094
3198	thespiker	GET	/api/Customer		2025-05-07 09:00:55.27942
3214	thespiker	GET	/api/Customer		2025-05-07 09:00:55.293633
3218	thespiker	GET	/api/Customer		2025-05-07 09:00:55.29627
3244	thespiker	GET	/api/Customer		2025-05-07 09:00:54.27396
3250	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242852
3402	thespiker	GET	/api/Customer		2025-05-07 09:00:55.578275
3408	thespiker	GET	/api/Customer		2025-05-07 09:00:56.021118
3458	thespiker	GET	/api/Customer		2025-05-07 09:00:56.183622
3457	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605048
3463	thespiker	GET	/api/Customer		2025-05-07 09:00:56.205283
3491	thespiker	GET	/api/Customer		2025-05-07 09:00:56.259738
3529	thespiker	GET	/api/Customer		2025-05-07 09:00:56.367637
3534	thespiker	GET	/api/Customer		2025-05-07 09:00:55.516238
3538	thespiker	GET	/api/Customer		2025-05-07 09:00:56.386883
3550	thespiker	GET	/api/Customer		2025-05-07 09:00:56.409422
3555	thespiker	GET	/api/Customer		2025-05-07 09:00:56.417145
3567	thespiker	GET	/api/Customer		2025-05-07 09:00:56.440133
3569	thespiker	GET	/api/Customer		2025-05-07 09:00:56.445649
3573	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603547
3588	thespiker	GET	/api/Customer		2025-05-07 09:00:56.463867
3596	thespiker	GET	/api/Customer		2025-05-07 09:00:56.47697
3603	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602998
3646	thespiker	GET	/api/Customer		2025-05-07 09:00:56.526272
3659	thespiker	GET	/api/Customer		2025-05-07 09:00:56.540702
3665	thespiker	GET	/api/Customer		2025-05-07 09:00:55.604064
3671	thespiker	GET	/api/Customer		2025-05-07 09:00:56.560915
3686	thespiker	GET	/api/Customer		2025-05-07 09:00:56.591028
3683	thespiker	GET	/api/Customer		2025-05-07 09:00:55.504972
3718	thespiker	GET	/api/Customer		2025-05-07 09:00:56.618739
3719	thespiker	GET	/api/Customer		2025-05-07 09:00:55.510475
3720	thespiker	GET	/api/Customer		2025-05-07 09:00:56.63384
3733	thespiker	GET	/api/Customer		2025-05-07 09:00:56.643462
3726	thespiker	GET	/api/Customer		2025-05-07 09:00:55.603421
3742	thespiker	GET	/api/Customer		2025-05-07 09:00:56.649245
3747	thespiker	GET	/api/Customer		2025-05-07 09:00:56.664814
3750	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607974
3756	thespiker	GET	/api/Customer		2025-05-07 09:00:55.590762
811	thespiker	POST	/api/Customer	{"name":"Customer_98","phone":"\\u002B380999000098","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.116822
812	thespiker	POST	/api/Customer	{"name":"Customer_99","phone":"\\u002B380999000099","type":"1","dateofbirth":"1990-01-01"}	2025-05-07 08:57:33.122184
813	thespiker	DELETE	/api/Customer/22		2025-05-07 08:57:33.126536
814	thespiker	DELETE	/api/Customer/23		2025-05-07 08:57:33.181497
815	thespiker	DELETE	/api/Customer/24		2025-05-07 08:57:33.186241
816	thespiker	DELETE	/api/Customer/25		2025-05-07 08:57:33.190314
817	thespiker	DELETE	/api/Customer/26		2025-05-07 08:57:33.194246
818	thespiker	DELETE	/api/Customer/27		2025-05-07 08:57:33.19817
819	thespiker	DELETE	/api/Customer/28		2025-05-07 08:57:33.201653
820	thespiker	DELETE	/api/Customer/29		2025-05-07 08:57:33.205116
821	thespiker	DELETE	/api/Customer/30		2025-05-07 08:57:33.209513
822	thespiker	DELETE	/api/Customer/31		2025-05-07 08:57:33.213348
823	thespiker	DELETE	/api/Customer/32		2025-05-07 08:57:33.217105
824	thespiker	DELETE	/api/Customer/33		2025-05-07 08:57:33.220727
825	thespiker	DELETE	/api/Customer/34		2025-05-07 08:57:33.22534
826	thespiker	DELETE	/api/Customer/35		2025-05-07 08:57:33.2312
827	thespiker	DELETE	/api/Customer/36		2025-05-07 08:57:33.234689
828	thespiker	DELETE	/api/Customer/37		2025-05-07 08:57:33.238461
829	thespiker	DELETE	/api/Customer/38		2025-05-07 08:57:33.242771
830	thespiker	DELETE	/api/Customer/39		2025-05-07 08:57:33.246431
831	thespiker	DELETE	/api/Customer/40		2025-05-07 08:57:33.250069
832	thespiker	DELETE	/api/Customer/41		2025-05-07 08:57:33.253564
833	thespiker	DELETE	/api/Customer/42		2025-05-07 08:57:33.257473
834	thespiker	DELETE	/api/Customer/43		2025-05-07 08:57:33.260732
835	thespiker	DELETE	/api/Customer/44		2025-05-07 08:57:33.263836
836	thespiker	DELETE	/api/Customer/45		2025-05-07 08:57:33.266806
837	thespiker	DELETE	/api/Customer/46		2025-05-07 08:57:33.270071
838	thespiker	DELETE	/api/Customer/47		2025-05-07 08:57:33.273974
839	thespiker	DELETE	/api/Customer/48		2025-05-07 08:57:33.278047
840	thespiker	DELETE	/api/Customer/49		2025-05-07 08:57:33.281339
841	thespiker	DELETE	/api/Customer/50		2025-05-07 08:57:33.284486
842	thespiker	DELETE	/api/Customer/51		2025-05-07 08:57:33.287542
843	thespiker	DELETE	/api/Customer/52		2025-05-07 08:57:33.292216
844	thespiker	DELETE	/api/Customer/53		2025-05-07 08:57:33.295328
845	thespiker	DELETE	/api/Customer/54		2025-05-07 08:57:33.298404
846	thespiker	DELETE	/api/Customer/55		2025-05-07 08:57:33.301356
847	thespiker	DELETE	/api/Customer/56		2025-05-07 08:57:33.304716
848	thespiker	DELETE	/api/Customer/57		2025-05-07 08:57:33.308519
849	thespiker	DELETE	/api/Customer/58		2025-05-07 08:57:33.311541
850	thespiker	DELETE	/api/Customer/59		2025-05-07 08:57:33.314883
851	thespiker	DELETE	/api/Customer/60		2025-05-07 08:57:33.318146
852	thespiker	DELETE	/api/Customer/61		2025-05-07 08:57:33.321892
853	thespiker	DELETE	/api/Customer/62		2025-05-07 08:57:33.326203
854	thespiker	DELETE	/api/Customer/63		2025-05-07 08:57:33.32926
855	thespiker	DELETE	/api/Customer/64		2025-05-07 08:57:33.332281
856	thespiker	DELETE	/api/Customer/65		2025-05-07 08:57:33.335692
857	thespiker	DELETE	/api/Customer/66		2025-05-07 08:57:33.338995
858	thespiker	DELETE	/api/Customer/67		2025-05-07 08:57:33.342957
859	thespiker	DELETE	/api/Customer/68		2025-05-07 08:57:33.346073
860	thespiker	DELETE	/api/Customer/69		2025-05-07 08:57:33.349555
861	thespiker	DELETE	/api/Customer/70		2025-05-07 08:57:33.352853
862	thespiker	DELETE	/api/Customer/71		2025-05-07 08:57:33.356372
863	thespiker	DELETE	/api/Customer/72		2025-05-07 08:57:33.359884
864	thespiker	DELETE	/api/Customer/73		2025-05-07 08:57:33.362951
865	thespiker	DELETE	/api/Customer/74		2025-05-07 08:57:33.366134
866	thespiker	DELETE	/api/Customer/75		2025-05-07 08:57:33.371158
867	thespiker	DELETE	/api/Customer/76		2025-05-07 08:57:33.375366
868	thespiker	DELETE	/api/Customer/77		2025-05-07 08:57:33.379179
869	thespiker	DELETE	/api/Customer/78		2025-05-07 08:57:33.382879
870	thespiker	DELETE	/api/Customer/79		2025-05-07 08:57:33.385958
871	thespiker	DELETE	/api/Customer/80		2025-05-07 08:57:33.389183
872	thespiker	DELETE	/api/Customer/81		2025-05-07 08:57:33.392772
873	thespiker	DELETE	/api/Customer/82		2025-05-07 08:57:33.39595
874	thespiker	DELETE	/api/Customer/83		2025-05-07 08:57:33.399075
875	thespiker	DELETE	/api/Customer/84		2025-05-07 08:57:33.402187
876	thespiker	DELETE	/api/Customer/85		2025-05-07 08:57:33.405237
877	thespiker	DELETE	/api/Customer/86		2025-05-07 08:57:33.409102
878	thespiker	DELETE	/api/Customer/87		2025-05-07 08:57:33.412387
879	thespiker	DELETE	/api/Customer/88		2025-05-07 08:57:33.415731
880	thespiker	DELETE	/api/Customer/89		2025-05-07 08:57:33.418901
881	thespiker	DELETE	/api/Customer/90		2025-05-07 08:57:33.42214
882	thespiker	DELETE	/api/Customer/91		2025-05-07 08:57:33.426068
883	thespiker	DELETE	/api/Customer/92		2025-05-07 08:57:33.429957
884	thespiker	DELETE	/api/Customer/93		2025-05-07 08:57:33.433485
885	thespiker	DELETE	/api/Customer/94		2025-05-07 08:57:33.437152
886	thespiker	DELETE	/api/Customer/95		2025-05-07 08:57:33.441506
887	thespiker	DELETE	/api/Customer/96		2025-05-07 08:57:33.445694
888	thespiker	DELETE	/api/Customer/97		2025-05-07 08:57:33.450027
889	thespiker	DELETE	/api/Customer/98		2025-05-07 08:57:33.454242
890	thespiker	DELETE	/api/Customer/99		2025-05-07 08:57:33.459181
891	thespiker	DELETE	/api/Customer/100		2025-05-07 08:57:33.463232
892	thespiker	DELETE	/api/Customer/101		2025-05-07 08:57:33.467491
893	thespiker	DELETE	/api/Customer/102		2025-05-07 08:57:33.471383
894	thespiker	DELETE	/api/Customer/103		2025-05-07 08:57:33.476654
895	thespiker	DELETE	/api/Customer/104		2025-05-07 08:57:33.480325
896	thespiker	DELETE	/api/Customer/105		2025-05-07 08:57:33.483795
897	thespiker	DELETE	/api/Customer/106		2025-05-07 08:57:33.487252
898	thespiker	DELETE	/api/Customer/107		2025-05-07 08:57:33.491209
899	thespiker	DELETE	/api/Customer/108		2025-05-07 08:57:33.494482
900	thespiker	DELETE	/api/Customer/109		2025-05-07 08:57:33.497768
901	thespiker	DELETE	/api/Customer/110		2025-05-07 08:57:33.500773
902	thespiker	DELETE	/api/Customer/111		2025-05-07 08:57:33.504168
903	thespiker	DELETE	/api/Customer/112		2025-05-07 08:57:33.508189
904	thespiker	DELETE	/api/Customer/113		2025-05-07 08:57:33.511445
905	thespiker	DELETE	/api/Customer/114		2025-05-07 08:57:33.514717
906	thespiker	DELETE	/api/Customer/115		2025-05-07 08:57:33.518967
907	thespiker	DELETE	/api/Customer/116		2025-05-07 08:57:33.522935
908	thespiker	DELETE	/api/Customer/117		2025-05-07 08:57:33.526397
909	thespiker	DELETE	/api/Customer/118		2025-05-07 08:57:33.529468
910	thespiker	DELETE	/api/Customer/119		2025-05-07 08:57:33.532462
911	thespiker	DELETE	/api/Customer/120		2025-05-07 08:57:33.535997
912	thespiker	DELETE	/api/Customer/121		2025-05-07 08:57:33.539475
913	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555766
914	thespiker	GET	/api/Customer		2025-05-07 08:57:33.557368
915	thespiker	GET	/api/Customer		2025-05-07 08:57:33.558835
916	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561268
917	thespiker	GET	/api/Customer		2025-05-07 08:57:33.573955
918	thespiker	GET	/api/Customer		2025-05-07 08:57:33.575721
919	thespiker	GET	/api/Customer		2025-05-07 08:57:33.577324
920	thespiker	GET	/api/Customer		2025-05-07 08:57:33.578644
921	thespiker	GET	/api/Customer		2025-05-07 08:57:33.580356
922	thespiker	GET	/api/Customer		2025-05-07 08:57:33.584908
923	thespiker	GET	/api/Customer		2025-05-07 08:57:33.630568
925	thespiker	GET	/api/Customer		2025-05-07 08:57:33.64373
927	thespiker	GET	/api/Customer		2025-05-07 08:57:33.654206
929	thespiker	GET	/api/Customer		2025-05-07 08:57:33.662918
932	thespiker	GET	/api/Customer		2025-05-07 08:57:33.668401
934	thespiker	GET	/api/Customer		2025-05-07 08:57:33.703569
936	thespiker	GET	/api/Customer		2025-05-07 08:57:33.71184
939	thespiker	GET	/api/Customer		2025-05-07 08:57:33.717401
940	thespiker	GET	/api/Customer		2025-05-07 08:57:33.721133
948	thespiker	GET	/api/Customer		2025-05-07 08:57:33.735186
951	thespiker	GET	/api/Customer		2025-05-07 08:57:33.763323
960	thespiker	GET	/api/Customer		2025-05-07 08:57:33.806071
961	thespiker	GET	/api/Customer		2025-05-07 08:57:33.811284
968	thespiker	GET	/api/Customer		2025-05-07 08:57:33.818693
975	thespiker	GET	/api/Customer		2025-05-07 08:57:33.952787
998	thespiker	GET	/api/Customer		2025-05-07 08:57:34.012574
1000	thespiker	GET	/api/Customer		2025-05-07 08:57:34.02129
1007	thespiker	GET	/api/Customer		2025-05-07 08:57:34.040138
1009	thespiker	GET	/api/Customer		2025-05-07 08:57:34.049893
1012	thespiker	GET	/api/Customer		2025-05-07 08:57:34.057947
1018	thespiker	GET	/api/Customer		2025-05-07 08:57:34.06795
1033	thespiker	GET	/api/Customer		2025-05-07 08:57:34.118721
1036	thespiker	GET	/api/Customer		2025-05-07 08:57:34.134346
1040	thespiker	GET	/api/Customer		2025-05-07 08:57:34.151114
1085	thespiker	GET	/api/Customer		2025-05-07 08:57:33.557382
1090	thespiker	GET	/api/Customer		2025-05-07 08:57:34.311764
1120	thespiker	GET	/api/Customer		2025-05-07 08:57:34.354961
1123	thespiker	GET	/api/Customer		2025-05-07 08:57:34.356611
1129	thespiker	GET	/api/Customer		2025-05-07 08:57:34.370651
1189	thespiker	GET	/api/Customer		2025-05-07 08:57:34.499904
1203	thespiker	GET	/api/Customer		2025-05-07 08:57:34.518698
1206	thespiker	GET	/api/Customer		2025-05-07 08:57:34.519893
1214	thespiker	GET	/api/Customer		2025-05-07 08:57:34.530206
1225	thespiker	GET	/api/Customer		2025-05-07 08:57:34.543029
1246	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555736
1255	thespiker	GET	/api/Customer		2025-05-07 08:57:34.606893
1260	thespiker	GET	/api/Customer		2025-05-07 08:57:34.620111
1262	thespiker	GET	/api/Customer		2025-05-07 08:57:34.630478
1268	thespiker	GET	/api/Customer		2025-05-07 08:57:34.6508
1284	thespiker	GET	/api/Customer		2025-05-07 08:57:34.695501
1307	thespiker	GET	/api/Customer		2025-05-07 08:57:34.754353
1316	thespiker	GET	/api/Customer		2025-05-07 08:57:34.769206
1331	thespiker	GET	/api/Customer		2025-05-07 08:57:34.78731
1334	thespiker	GET	/api/Customer		2025-05-07 08:57:34.788325
1341	thespiker	GET	/api/Customer		2025-05-07 08:57:34.798946
1358	thespiker	GET	/api/Customer		2025-05-07 08:57:34.844673
1369	thespiker	GET	/api/Customer		2025-05-07 08:57:33.560083
1391	thespiker	GET	/api/Customer		2025-05-07 08:57:34.88187
1405	thespiker	GET	/api/Customer		2025-05-07 08:57:34.902584
1408	thespiker	GET	/api/Customer		2025-05-07 08:57:34.908002
1411	thespiker	GET	/api/Customer		2025-05-07 08:57:34.909263
1412	thespiker	GET	/api/Customer		2025-05-07 08:57:34.909263
1420	thespiker	GET	/api/Customer		2025-05-07 08:57:34.914929
1424	thespiker	GET	/api/Customer		2025-05-07 08:57:34.916196
1425	thespiker	GET	/api/Customer		2025-05-07 08:57:34.916134
1436	thespiker	GET	/api/Customer		2025-05-07 08:57:34.931109
1447	thespiker	GET	/api/Customer		2025-05-07 08:57:34.937621
1458	thespiker	GET	/api/Customer		2025-05-07 08:57:34.942613
1464	thespiker	GET	/api/Customer		2025-05-07 08:57:34.948833
1490	thespiker	GET	/api/Customer		2025-05-07 08:57:34.994356
1504	thespiker	GET	/api/Customer		2025-05-07 08:57:35.015448
1509	thespiker	GET	/api/Customer		2025-05-07 08:57:35.016953
1525	thespiker	GET	/api/Customer		2025-05-07 08:57:35.046231
1527	thespiker	GET	/api/Customer		2025-05-07 08:57:35.048083
1547	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561278
1559	thespiker	GET	/api/Customer		2025-05-07 08:57:35.091011
1564	thespiker	GET	/api/Customer		2025-05-07 08:57:35.098122
1581	thespiker	GET	/api/Customer		2025-05-07 08:57:35.11163
1582	thespiker	GET	/api/Customer		2025-05-07 08:57:35.111631
1598	thespiker	GET	/api/Customer		2025-05-07 08:57:35.134865
1617	thespiker	GET	/api/Customer		2025-05-07 08:57:33.723075
1655	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561257
1658	thespiker	GET	/api/Customer		2025-05-07 08:57:35.209588
1756	thespiker	GET	/api/Customer		2025-05-07 08:57:35.578673
1780	thespiker	GET	/api/Customer		2025-05-07 08:57:35.6872
1784	thespiker	GET	/api/Customer		2025-05-07 08:57:35.695385
1810	thespiker	GET	/api/Customer		2025-05-07 08:57:35.749068
1843	thespiker	GET	/api/Customer		2025-05-07 08:57:35.386042
1870	thespiker	GET	/api/Customer		2025-05-07 08:57:35.820364
1895	thespiker	GET	/api/Customer		2025-05-07 08:57:35.842906
1912	thespiker	GET	/api/Customer		2025-05-07 08:58:18.744358
1930	thespiker	GET	/api/Customer		2025-05-07 08:58:21.572259
1935	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619389
1956	thespiker	GET	/api/Customer		2025-05-07 08:58:18.747701
2001	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744922
2059	thespiker	GET	/api/Customer		2025-05-07 08:59:55.71332
2019	thespiker	GET	/api/Customer		2025-05-07 08:59:55.747357
2095	thespiker	GET	/api/Customer		2025-05-07 08:59:56.976544
2105	thespiker	GET	/api/Customer		2025-05-07 08:59:57.00646
2117	thespiker	GET	/api/Customer		2025-05-07 08:59:57.017902
2123	thespiker	GET	/api/Customer		2025-05-07 08:59:57.022455
2129	thespiker	GET	/api/Customer		2025-05-07 08:59:57.024794
2148	thespiker	GET	/api/Customer		2025-05-07 08:59:57.053493
2154	thespiker	GET	/api/Customer		2025-05-07 08:59:57.055532
2165	thespiker	GET	/api/Customer		2025-05-07 08:59:57.176772
2172	thespiker	GET	/api/Customer		2025-05-07 08:59:57.180904
2178	thespiker	GET	/api/Customer		2025-05-07 08:59:57.19287
2181	thespiker	GET	/api/Customer		2025-05-07 08:59:57.19679
2186	thespiker	GET	/api/Customer		2025-05-07 08:59:57.199234
2190	thespiker	GET	/api/Customer		2025-05-07 08:59:57.206419
542	thespiker	GET	/api/Customer		2025-05-07 08:52:32.241918
559	thespiker	GET	/api/Customer		2025-05-07 08:52:32.870515
589	thespiker	GET	/api/Customer		2025-05-07 08:52:32.900774
598	thespiker	GET	/api/Customer		2025-05-07 08:52:32.903107
627	thespiker	GET	/api/Customer		2025-05-07 08:52:32.922923
638	thespiker	GET	/api/Customer		2025-05-07 08:52:32.927255
664	thespiker	GET	/api/Customer		2025-05-07 08:52:32.943
693	thespiker	GET	/api/Customer		2025-05-07 08:52:32.963366
702	thespiker	GET	/api/Customer		2025-05-07 08:52:32.968759
924	thespiker	GET	/api/Customer		2025-05-07 08:57:33.631912
926	thespiker	GET	/api/Customer		2025-05-07 08:57:33.645351
928	thespiker	GET	/api/Customer		2025-05-07 08:57:33.655793
930	thespiker	GET	/api/Customer		2025-05-07 08:57:33.663238
931	thespiker	GET	/api/Customer		2025-05-07 08:57:33.667616
933	thespiker	GET	/api/Customer		2025-05-07 08:57:33.698006
935	thespiker	GET	/api/Customer		2025-05-07 08:57:33.705395
938	thespiker	GET	/api/Customer		2025-05-07 08:57:33.716002
941	thespiker	GET	/api/Customer		2025-05-07 08:57:33.723188
947	thespiker	GET	/api/Customer		2025-05-07 08:57:33.734731
952	thespiker	GET	/api/Customer		2025-05-07 08:57:33.763324
967	thespiker	GET	/api/Customer		2025-05-07 08:57:33.816146
973	thespiker	GET	/api/Customer		2025-05-07 08:57:33.949411
982	thespiker	GET	/api/Customer		2025-05-07 08:57:33.969257
984	thespiker	GET	/api/Customer		2025-05-07 08:57:33.978126
993	thespiker	GET	/api/Customer		2025-05-07 08:57:33.998295
999	thespiker	GET	/api/Customer		2025-05-07 08:57:34.019845
1021	thespiker	GET	/api/Customer		2025-05-07 08:57:34.072459
1032	thespiker	GET	/api/Customer		2025-05-07 08:57:34.109592
1043	thespiker	GET	/api/Customer		2025-05-07 08:57:34.170495
1059	thespiker	GET	/api/Customer		2025-05-07 08:57:34.227979
1091	thespiker	GET	/api/Customer		2025-05-07 08:57:34.31249
1094	thespiker	GET	/api/Customer		2025-05-07 08:57:34.315211
1096	thespiker	GET	/api/Customer		2025-05-07 08:57:34.316601
1101	thespiker	GET	/api/Customer		2025-05-07 08:57:34.320915
1109	thespiker	GET	/api/Customer		2025-05-07 08:57:34.340816
1119	thespiker	GET	/api/Customer		2025-05-07 08:57:34.354484
1144	thespiker	GET	/api/Customer		2025-05-07 08:57:34.390733
1174	thespiker	GET	/api/Customer		2025-05-07 08:57:34.474392
1184	thespiker	GET	/api/Customer		2025-05-07 08:57:34.492423
1187	thespiker	GET	/api/Customer		2025-05-07 08:57:34.496343
1192	thespiker	GET	/api/Customer		2025-05-07 08:57:34.500984
1219	thespiker	GET	/api/Customer		2025-05-07 08:57:34.536475
1242	thespiker	GET	/api/Customer		2025-05-07 08:57:34.564863
1248	thespiker	GET	/api/Customer		2025-05-07 08:57:34.582784
1254	thespiker	GET	/api/Customer		2025-05-07 08:57:33.559903
1261	thespiker	GET	/api/Customer		2025-05-07 08:57:34.626243
1269	thespiker	GET	/api/Customer		2025-05-07 08:57:34.650532
1276	thespiker	GET	/api/Customer		2025-05-07 08:57:34.674276
1285	thespiker	GET	/api/Customer		2025-05-07 08:57:34.6957
1291	thespiker	GET	/api/Customer		2025-05-07 08:57:34.722485
1297	thespiker	GET	/api/Customer		2025-05-07 08:57:34.742107
1348	thespiker	GET	/api/Customer		2025-05-07 08:57:34.809341
1371	thespiker	GET	/api/Customer		2025-05-07 08:57:33.582049
1407	thespiker	GET	/api/Customer		2025-05-07 08:57:34.905512
1417	thespiker	GET	/api/Customer		2025-05-07 08:57:34.911816
1419	thespiker	GET	/api/Customer		2025-05-07 08:57:34.913842
1438	thespiker	GET	/api/Customer		2025-05-07 08:57:34.931109
1452	thespiker	GET	/api/Customer		2025-05-07 08:57:34.939063
1462	thespiker	GET	/api/Customer		2025-05-07 08:57:34.94767
1473	thespiker	GET	/api/Customer		2025-05-07 08:57:34.963259
1483	thespiker	GET	/api/Customer		2025-05-07 08:57:34.97917
1510	thespiker	GET	/api/Customer		2025-05-07 08:57:35.03032
1528	thespiker	GET	/api/Customer		2025-05-07 08:57:35.04979
1552	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555736
1566	thespiker	GET	/api/Customer		2025-05-07 08:57:35.098749
1567	thespiker	GET	/api/Customer		2025-05-07 08:57:35.099378
1584	thespiker	GET	/api/Customer		2025-05-07 08:57:35.112946
1583	thespiker	GET	/api/Customer		2025-05-07 08:57:33.575438
1602	thespiker	GET	/api/Customer		2025-05-07 08:57:35.13839
1621	thespiker	GET	/api/Customer		2025-05-07 08:57:33.576835
1648	thespiker	GET	/api/Customer		2025-05-07 08:57:35.197542
1650	thespiker	GET	/api/Customer		2025-05-07 08:57:35.1989
1657	thespiker	GET	/api/Customer		2025-05-07 08:57:33.559903
1769	thespiker	GET	/api/Customer		2025-05-07 08:57:35.654191
1817	thespiker	GET	/api/Customer		2025-05-07 08:57:35.755652
1845	thespiker	GET	/api/Customer		2025-05-07 08:57:35.382645
1866	thespiker	GET	/api/Customer		2025-05-07 08:57:35.818071
1872	thespiker	GET	/api/Customer		2025-05-07 08:57:35.822244
1914	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619412
1936	thespiker	GET	/api/Customer		2025-05-07 08:58:18.726314
1955	thespiker	GET	/api/Customer		2025-05-07 08:58:18.746927
2004	thespiker	GET	/api/Customer		2025-05-07 08:59:55.7502
2045	thespiker	GET	/api/Customer		2025-05-07 08:59:55.716434
2009	thespiker	GET	/api/Customer		2025-05-07 08:59:55.709419
2097	thespiker	GET	/api/Customer		2025-05-07 08:59:56.976537
2109	thespiker	GET	/api/Customer		2025-05-07 08:59:57.011032
2112	thespiker	GET	/api/Customer		2025-05-07 08:59:57.014389
2122	thespiker	GET	/api/Customer		2025-05-07 08:59:57.022454
2136	thespiker	GET	/api/Customer		2025-05-07 08:59:57.031907
2142	thespiker	GET	/api/Customer		2025-05-07 08:59:57.047969
2145	thespiker	GET	/api/Customer		2025-05-07 08:59:57.052343
2152	thespiker	GET	/api/Customer		2025-05-07 08:59:57.054542
2166	thespiker	GET	/api/Customer		2025-05-07 08:59:57.176775
2187	thespiker	GET	/api/Customer		2025-05-07 08:59:57.200914
2201	thespiker	GET	/api/Customer		2025-05-07 08:59:57.220554
2213	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2223	thespiker	GET	/api/Customer		2025-05-07 08:59:57.316225
2239	thespiker	GET	/api/Customer		2025-05-07 08:59:57.340765
2252	thespiker	GET	/api/Customer		2025-05-07 08:59:57.361308
2256	thespiker	GET	/api/Customer		2025-05-07 08:59:57.365347
2259	thespiker	GET	/api/Customer		2025-05-07 08:59:57.369121
2272	thespiker	GET	/api/Customer		2025-05-07 08:59:57.391169
2286	thespiker	GET	/api/Customer		2025-05-07 08:59:57.405336
2371	thespiker	GET	/api/Customer		2025-05-07 08:59:57.648838
2409	thespiker	GET	/api/Customer		2025-05-07 08:59:57.096231
2424	thespiker	GET	/api/Customer		2025-05-07 08:59:57.76858
2463	thespiker	GET	/api/Customer		2025-05-07 08:59:57.821729
937	thespiker	GET	/api/Customer		2025-05-07 08:57:33.713879
956	thespiker	GET	/api/Customer		2025-05-07 08:57:33.734654
958	thespiker	GET	/api/Customer		2025-05-07 08:57:33.802844
964	thespiker	GET	/api/Customer		2025-05-07 08:57:33.814513
971	thespiker	GET	/api/Customer		2025-05-07 08:57:33.941483
977	thespiker	GET	/api/Customer		2025-05-07 08:57:33.959604
985	thespiker	GET	/api/Customer		2025-05-07 08:57:33.978123
987	thespiker	GET	/api/Customer		2025-05-07 08:57:33.986466
995	thespiker	GET	/api/Customer		2025-05-07 08:57:34.009153
1020	thespiker	GET	/api/Customer		2025-05-07 08:57:34.067957
1023	thespiker	GET	/api/Customer		2025-05-07 08:57:34.073837
1037	thespiker	GET	/api/Customer		2025-05-07 08:57:34.139878
1049	thespiker	GET	/api/Customer		2025-05-07 08:57:34.193226
1074	thespiker	GET	/api/Customer		2025-05-07 08:57:34.25879
1106	thespiker	GET	/api/Customer		2025-05-07 08:57:34.325435
1111	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555765
1139	thespiker	GET	/api/Customer		2025-05-07 08:57:34.381608
1146	thespiker	GET	/api/Customer		2025-05-07 08:57:34.39199
1152	thespiker	GET	/api/Customer		2025-05-07 08:57:34.402674
1160	thespiker	GET	/api/Customer		2025-05-07 08:57:34.41727
1172	thespiker	GET	/api/Customer		2025-05-07 08:57:34.472829
1179	thespiker	GET	/api/Customer		2025-05-07 08:57:34.485459
1188	thespiker	GET	/api/Customer		2025-05-07 08:57:34.499696
1210	thespiker	GET	/api/Customer		2025-05-07 08:57:34.528404
1238	thespiker	GET	/api/Customer		2025-05-07 08:57:34.561036
1264	thespiker	GET	/api/Customer		2025-05-07 08:57:33.752073
1305	thespiker	GET	/api/Customer		2025-05-07 08:57:34.75043
1306	thespiker	GET	/api/Customer		2025-05-07 08:57:34.75043
1309	thespiker	GET	/api/Customer		2025-05-07 08:57:34.755927
1312	thespiker	GET	/api/Customer		2025-05-07 08:57:34.76026
1318	thespiker	GET	/api/Customer		2025-05-07 08:57:34.770439
1321	thespiker	GET	/api/Customer		2025-05-07 08:57:34.774622
1323	thespiker	GET	/api/Customer		2025-05-07 08:57:34.77606
1343	thespiker	GET	/api/Customer		2025-05-07 08:57:34.801673
1370	thespiker	GET	/api/Customer		2025-05-07 08:57:34.85881
1372	thespiker	GET	/api/Customer		2025-05-07 08:57:33.753598
1392	thespiker	GET	/api/Customer		2025-05-07 08:57:34.882396
1431	thespiker	GET	/api/Customer		2025-05-07 08:57:34.921293
1432	thespiker	GET	/api/Customer		2025-05-07 08:57:34.921269
1455	thespiker	GET	/api/Customer		2025-05-07 08:57:34.942882
1454	thespiker	GET	/api/Customer		2025-05-07 08:57:34.94276
1466	thespiker	GET	/api/Customer		2025-05-07 08:57:34.947502
1477	thespiker	GET	/api/Customer		2025-05-07 08:57:34.968199
1502	thespiker	GET	/api/Customer		2025-05-07 08:57:35.01118
1511	thespiker	GET	/api/Customer		2025-05-07 08:57:35.030688
1529	thespiker	GET	/api/Customer		2025-05-07 08:57:35.050117
1555	thespiker	GET	/api/Customer		2025-05-07 08:57:35.08549
1579	thespiker	GET	/api/Customer		2025-05-07 08:57:35.110322
1603	thespiker	GET	/api/Customer		2025-05-07 08:57:35.139808
1622	thespiker	GET	/api/Customer		2025-05-07 08:57:33.752792
1659	thespiker	GET	/api/Customer		2025-05-07 08:57:33.719364
1773	thespiker	GET	/api/Customer		2025-05-07 08:57:35.669572
1786	thespiker	GET	/api/Customer		2025-05-07 08:57:35.700773
1805	thespiker	GET	/api/Customer		2025-05-07 08:57:35.736365
1849	thespiker	GET	/api/Customer		2025-05-07 08:57:35.795656
1847	thespiker	GET	/api/Customer		2025-05-07 08:57:35.384896
1900	thespiker	GET	/api/Customer		2025-05-07 08:57:35.847858
1915	thespiker	GET	/api/Customer		2025-05-07 08:58:18.746909
1938	thespiker	GET	/api/Customer		2025-05-07 08:58:18.618641
1957	thespiker	GET	/api/Customer		2025-05-07 08:58:18.74551
2028	thespiker	GET	/api/Customer		2025-05-07 08:59:55.75126
2046	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713784
2040	thespiker	GET	/api/Customer		2025-05-07 08:59:55.746924
2091	thespiker	GET	/api/Customer		2025-05-07 08:59:56.975382
2121	thespiker	GET	/api/Customer		2025-05-07 08:59:57.022459
2156	thespiker	GET	/api/Customer		2025-05-07 08:59:57.057501
2215	thespiker	GET	/api/Customer		2025-05-07 08:59:57.226884
2224	thespiker	GET	/api/Customer		2025-05-07 08:59:57.317646
2241	thespiker	GET	/api/Customer		2025-05-07 08:59:57.342037
2251	thespiker	GET	/api/Customer		2025-05-07 08:59:57.36067
2263	thespiker	GET	/api/Customer		2025-05-07 08:59:57.371318
2292	thespiker	GET	/api/Customer		2025-05-07 08:59:57.407878
2321	thespiker	GET	/api/Customer		2025-05-07 08:59:57.470251
2333	thespiker	GET	/api/Customer		2025-05-07 08:59:57.535445
2391	thespiker	GET	/api/Customer		2025-05-07 08:59:57.682133
2413	thespiker	GET	/api/Customer		2025-05-07 08:59:57.105563
2451	thespiker	GET	/api/Customer		2025-05-07 08:59:57.804779
2477	thespiker	GET	/api/Customer		2025-05-07 08:59:57.833633
2485	thespiker	GET	/api/Customer		2025-05-07 08:59:57.842143
2514	thespiker	GET	/api/Customer		2025-05-07 08:59:57.876368
2522	thespiker	GET	/api/Customer		2025-05-07 08:59:57.886437
2534	thespiker	GET	/api/Customer		2025-05-07 08:59:57.895482
2574	thespiker	GET	/api/Customer		2025-05-07 08:59:57.097752
2614	thespiker	GET	/api/Customer		2025-05-07 08:59:57.999343
2634	thespiker	GET	/api/Customer		2025-05-07 08:59:58.005359
2648	thespiker	GET	/api/Customer		2025-05-07 08:59:58.024924
2668	thespiker	GET	/api/Customer		2025-05-07 08:59:57.094909
2672	thespiker	GET	/api/Customer		2025-05-07 08:59:58.057886
2731	thespiker	GET	/api/Customer		2025-05-07 08:59:58.104604
2726	thespiker	GET	/api/Customer		2025-05-07 08:59:57.097536
2742	thespiker	GET	/api/Customer		2025-05-07 08:59:58.107209
2751	thespiker	GET	/api/Customer		2025-05-07 08:59:58.126289
2760	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128603
2761	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128473
2799	thespiker	GET	/api/Customer		2025-05-07 08:59:58.172494
2818	thespiker	GET	/api/Customer		2025-05-07 08:59:58.188891
2832	thespiker	GET	/api/Customer		2025-05-07 08:59:58.19254
2839	thespiker	GET	/api/Customer		2025-05-07 08:59:58.197907
2844	thespiker	GET	/api/Customer		2025-05-07 08:59:58.200527
2912	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241388
2921	thespiker	GET	/api/Customer		2025-05-07 08:59:58.243538
2948	thespiker	GET	/api/Customer		2025-05-07 08:59:58.265175
2949	thespiker	GET	/api/Customer		2025-05-07 08:59:58.267966
2974	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243701
3049	thespiker	GET	/api/Customer		2025-05-07 09:00:55.117861
3082	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163635
3128	thespiker	GET	/api/Customer		2025-05-07 09:00:54.291539
944	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733412
953	thespiker	GET	/api/Customer		2025-05-07 08:57:33.763323
962	thespiker	GET	/api/Customer		2025-05-07 08:57:33.812919
969	thespiker	GET	/api/Customer		2025-05-07 08:57:33.916626
979	thespiker	GET	/api/Customer		2025-05-07 08:57:33.966093
986	thespiker	GET	/api/Customer		2025-05-07 08:57:33.979691
988	thespiker	GET	/api/Customer		2025-05-07 08:57:33.987785
996	thespiker	GET	/api/Customer		2025-05-07 08:57:34.01093
1004	thespiker	GET	/api/Customer		2025-05-07 08:57:34.030811
1006	thespiker	GET	/api/Customer		2025-05-07 08:57:34.038235
1017	thespiker	GET	/api/Customer		2025-05-07 08:57:34.066984
1025	thespiker	GET	/api/Customer		2025-05-07 08:57:34.076579
1028	thespiker	GET	/api/Customer		2025-05-07 08:57:34.079441
1041	thespiker	GET	/api/Customer		2025-05-07 08:57:34.157416
1071	thespiker	GET	/api/Customer		2025-05-07 08:57:34.257081
1087	thespiker	GET	/api/Customer		2025-05-07 08:57:34.307267
1093	thespiker	GET	/api/Customer		2025-05-07 08:57:34.314682
1105	thespiker	GET	/api/Customer		2025-05-07 08:57:34.325551
1110	thespiker	GET	/api/Customer		2025-05-07 08:57:34.342426
1112	thespiker	GET	/api/Customer		2025-05-07 08:57:33.559989
1132	thespiker	GET	/api/Customer		2025-05-07 08:57:34.372246
1136	thespiker	GET	/api/Customer		2025-05-07 08:57:34.377506
1137	thespiker	GET	/api/Customer		2025-05-07 08:57:34.377506
1149	thespiker	GET	/api/Customer		2025-05-07 08:57:34.397176
1194	thespiker	GET	/api/Customer		2025-05-07 08:57:34.502344
1218	thespiker	GET	/api/Customer		2025-05-07 08:57:34.536475
1221	thespiker	GET	/api/Customer		2025-05-07 08:57:34.53697
1256	thespiker	GET	/api/Customer		2025-05-07 08:57:34.608407
1270	thespiker	GET	/api/Customer		2025-05-07 08:57:33.579849
1288	thespiker	GET	/api/Customer		2025-05-07 08:57:34.716621
1292	thespiker	GET	/api/Customer		2025-05-07 08:57:34.723273
1295	thespiker	GET	/api/Customer		2025-05-07 08:57:34.730408
1308	thespiker	GET	/api/Customer		2025-05-07 08:57:34.754642
1349	thespiker	GET	/api/Customer		2025-05-07 08:57:34.810228
1385	thespiker	GET	/api/Customer		2025-05-07 08:57:33.573955
1393	thespiker	GET	/api/Customer		2025-05-07 08:57:34.882995
1396	thespiker	GET	/api/Customer		2025-05-07 08:57:34.887076
1399	thespiker	GET	/api/Customer		2025-05-07 08:57:34.900005
1403	thespiker	GET	/api/Customer		2025-05-07 08:57:34.901504
1410	thespiker	GET	/api/Customer		2025-05-07 08:57:34.908002
1421	thespiker	GET	/api/Customer		2025-05-07 08:57:34.914984
1433	thespiker	GET	/api/Customer		2025-05-07 08:57:34.921454
1437	thespiker	GET	/api/Customer		2025-05-07 08:57:34.931109
1446	thespiker	GET	/api/Customer		2025-05-07 08:57:34.936707
1474	thespiker	GET	/api/Customer		2025-05-07 08:57:34.96372
1500	thespiker	GET	/api/Customer		2025-05-07 08:57:35.007679
1512	thespiker	GET	/api/Customer		2025-05-07 08:57:35.030638
1531	thespiker	GET	/api/Customer		2025-05-07 08:57:35.052578
1549	thespiker	GET	/api/Customer		2025-05-07 08:57:35.083783
1551	thespiker	GET	/api/Customer		2025-05-07 08:57:33.752073
1558	thespiker	GET	/api/Customer		2025-05-07 08:57:35.089261
1562	thespiker	GET	/api/Customer		2025-05-07 08:57:35.096009
1572	thespiker	GET	/api/Customer		2025-05-07 08:57:35.102236
1585	thespiker	GET	/api/Customer		2025-05-07 08:57:33.699357
1593	thespiker	GET	/api/Customer		2025-05-07 08:57:35.132247
1601	thespiker	GET	/api/Customer		2025-05-07 08:57:35.13839
1625	thespiker	GET	/api/Customer		2025-05-07 08:57:35.156734
1660	thespiker	GET	/api/Customer		2025-05-07 08:57:33.573955
1775	thespiker	GET	/api/Customer		2025-05-07 08:57:35.384154
1787	thespiker	GET	/api/Customer		2025-05-07 08:57:35.702957
1809	thespiker	GET	/api/Customer		2025-05-07 08:57:35.748617
1815	thespiker	GET	/api/Customer		2025-05-07 08:57:35.752413
1850	thespiker	GET	/api/Customer		2025-05-07 08:57:35.337548
1869	thespiker	GET	/api/Customer		2025-05-07 08:57:35.81996
1874	thespiker	GET	/api/Customer		2025-05-07 08:57:35.824075
1880	thespiker	GET	/api/Customer		2025-05-07 08:57:35.827929
1885	thespiker	GET	/api/Customer		2025-05-07 08:57:35.832949
1897	thespiker	GET	/api/Customer		2025-05-07 08:57:35.846765
1916	thespiker	GET	/api/Customer		2025-05-07 08:58:18.725133
1937	thespiker	GET	/api/Customer		2025-05-07 08:58:21.541347
1939	thespiker	GET	/api/Customer		2025-05-07 08:58:18.74174
1959	thespiker	GET	/api/Customer		2025-05-07 08:58:18.741522
2031	thespiker	GET	/api/Customer		2025-05-07 08:59:55.751541
2048	thespiker	GET	/api/Customer		2025-05-07 08:59:55.745793
2064	thespiker	GET	/api/Customer		2025-05-07 08:59:55.748642
2160	thespiker	GET	/api/Customer		2025-05-07 08:59:57.064568
2177	thespiker	GET	/api/Customer		2025-05-07 08:59:57.192121
2189	thespiker	GET	/api/Customer		2025-05-07 08:59:57.204837
2198	thespiker	GET	/api/Customer		2025-05-07 08:59:57.20794
2208	thespiker	GET	/api/Customer		2025-05-07 08:59:57.225644
2219	thespiker	GET	/api/Customer		2025-05-07 08:59:57.239776
2228	thespiker	GET	/api/Customer		2025-05-07 08:59:57.323893
2244	thespiker	GET	/api/Customer		2025-05-07 08:59:57.350246
2250	thespiker	GET	/api/Customer		2025-05-07 08:59:57.359834
2254	thespiker	GET	/api/Customer		2025-05-07 08:59:57.364091
2279	thespiker	GET	/api/Customer		2025-05-07 08:59:57.398334
2285	thespiker	GET	/api/Customer		2025-05-07 08:59:57.405336
2293	thespiker	GET	/api/Customer		2025-05-07 08:59:57.409182
2331	thespiker	GET	/api/Customer		2025-05-07 08:59:57.525292
2369	thespiker	GET	/api/Customer		2025-05-07 08:59:57.638417
2417	thespiker	GET	/api/Customer		2025-05-07 08:59:57.095796
2441	thespiker	GET	/api/Customer		2025-05-07 08:59:57.789627
2465	thespiker	GET	/api/Customer		2025-05-07 08:59:57.822958
2472	thespiker	GET	/api/Customer		2025-05-07 08:59:57.83066
2482	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84098
2484	thespiker	GET	/api/Customer		2025-05-07 08:59:57.841525
2527	thespiker	GET	/api/Customer		2025-05-07 08:59:57.890814
2546	thespiker	GET	/api/Customer		2025-05-07 08:59:57.913961
2556	thespiker	GET	/api/Customer		2025-05-07 08:59:57.926139
2557	thespiker	GET	/api/Customer		2025-05-07 08:59:57.926711
2580	thespiker	GET	/api/Customer		2025-05-07 08:59:57.951564
2587	thespiker	GET	/api/Customer		2025-05-07 08:59:57.060895
2600	thespiker	GET	/api/Customer		2025-05-07 08:59:57.97663
2616	thespiker	GET	/api/Customer		2025-05-07 08:59:57.999342
2652	thespiker	GET	/api/Customer		2025-05-07 08:59:58.026988
2679	thespiker	GET	/api/Customer		2025-05-07 08:59:58.058984
2683	thespiker	GET	/api/Customer		2025-05-07 08:59:58.059364
543	thespiker	GET	/api/Customer		2025-05-07 08:52:32.852793
558	thespiker	GET	/api/Customer		2025-05-07 08:52:32.869933
567	thespiker	GET	/api/Customer		2025-05-07 08:52:32.873179
593	thespiker	GET	/api/Customer		2025-05-07 08:52:32.90181
620	thespiker	GET	/api/Customer		2025-05-07 08:52:32.918594
635	thespiker	GET	/api/Customer		2025-05-07 08:52:32.927049
659	thespiker	GET	/api/Customer		2025-05-07 08:52:32.942227
671	thespiker	GET	/api/Customer		2025-05-07 08:52:32.946181
679	thespiker	GET	/api/Customer		2025-05-07 08:52:32.957236
686	thespiker	GET	/api/Customer		2025-05-07 08:52:32.960601
2034	thespiker	GET	/api/Customer		2025-05-07 08:59:55.751255
2047	thespiker	GET	/api/Customer		2025-05-07 08:59:55.716359
2065	thespiker	GET	/api/Customer		2025-05-07 08:59:55.714859
2161	thespiker	GET	/api/Customer		2025-05-07 08:59:57.108683
2169	thespiker	GET	/api/Customer		2025-05-07 08:59:57.17894
2176	thespiker	GET	/api/Customer		2025-05-07 08:59:57.1918
2184	thespiker	GET	/api/Customer		2025-05-07 08:59:57.198186
2199	thespiker	GET	/api/Customer		2025-05-07 08:59:57.208104
2207	thespiker	GET	/api/Customer		2025-05-07 08:59:57.226956
2236	thespiker	GET	/api/Customer		2025-05-07 08:59:57.339753
2257	thespiker	GET	/api/Customer		2025-05-07 08:59:57.365349
2261	thespiker	GET	/api/Customer		2025-05-07 08:59:57.370232
2397	thespiker	GET	/api/Customer		2025-05-07 08:59:57.692833
2443	thespiker	GET	/api/Customer		2025-05-07 08:59:57.105172
2460	thespiker	GET	/api/Customer		2025-05-07 08:59:57.813335
2475	thespiker	GET	/api/Customer		2025-05-07 08:59:57.833633
2496	thespiker	GET	/api/Customer		2025-05-07 08:59:57.859307
2506	thespiker	GET	/api/Customer		2025-05-07 08:59:57.871638
2531	thespiker	GET	/api/Customer		2025-05-07 08:59:57.894352
2567	thespiker	GET	/api/Customer		2025-05-07 08:59:57.934513
2585	thespiker	GET	/api/Customer		2025-05-07 08:59:57.959504
2590	thespiker	GET	/api/Customer		2025-05-07 08:59:56.767203
2651	thespiker	GET	/api/Customer		2025-05-07 08:59:58.026849
2657	thespiker	GET	/api/Customer		2025-05-07 08:59:58.030093
2671	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2754	thespiker	GET	/api/Customer		2025-05-07 08:59:58.127299
2765	thespiker	GET	/api/Customer		2025-05-07 08:59:58.128474
2776	thespiker	GET	/api/Customer		2025-05-07 08:59:58.130962
2773	thespiker	GET	/api/Customer		2025-05-07 08:59:58.129655
2788	thespiker	GET	/api/Customer		2025-05-07 08:59:58.158875
2790	thespiker	GET	/api/Customer		2025-05-07 08:59:58.159076
2809	thespiker	GET	/api/Customer		2025-05-07 08:59:58.178358
2817	thespiker	GET	/api/Customer		2025-05-07 08:59:58.186534
2850	thespiker	GET	/api/Customer		2025-05-07 08:59:58.202451
2852	thespiker	GET	/api/Customer		2025-05-07 08:59:58.202372
2879	thespiker	GET	/api/Customer		2025-05-07 08:59:58.223897
2896	thespiker	GET	/api/Customer		2025-05-07 08:59:58.232281
2899	thespiker	GET	/api/Customer		2025-05-07 08:59:58.239536
2915	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241946
2981	thespiker	GET	/api/Customer		2025-05-07 09:00:54.267391
3067	thespiker	GET	/api/Customer		2025-05-07 09:00:55.138237
3074	thespiker	GET	/api/Customer		2025-05-07 09:00:55.159613
3117	thespiker	GET	/api/Customer		2025-05-07 09:00:55.187366
3126	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243789
3162	thespiker	GET	/api/Customer		2025-05-07 09:00:55.243754
3181	thespiker	GET	/api/Customer		2025-05-07 09:00:55.263137
3183	thespiker	GET	/api/Customer		2025-05-07 09:00:55.262156
3215	thespiker	GET	/api/Customer		2025-05-07 09:00:55.293759
3212	thespiker	GET	/api/Customer		2025-05-07 09:00:54.244661
3239	thespiker	GET	/api/Customer		2025-05-07 09:00:54.245469
3251	thespiker	GET	/api/Customer		2025-05-07 09:00:54.267683
3405	thespiker	GET	/api/Customer		2025-05-07 09:00:55.507358
3410	thespiker	GET	/api/Customer		2025-05-07 09:00:56.033695
3418	thespiker	GET	/api/Customer		2025-05-07 09:00:56.065934
3434	thespiker	GET	/api/Customer		2025-05-07 09:00:56.135329
3455	thespiker	GET	/api/Customer		2025-05-07 09:00:56.178937
3462	thespiker	GET	/api/Customer		2025-05-07 09:00:56.19743
3466	thespiker	GET	/api/Customer		2025-05-07 09:00:56.213683
3474	thespiker	GET	/api/Customer		2025-05-07 09:00:56.231631
3472	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605162
3494	thespiker	GET	/api/Customer		2025-05-07 09:00:56.266335
3498	thespiker	GET	/api/Customer		2025-05-07 09:00:56.273308
3501	thespiker	GET	/api/Customer		2025-05-07 09:00:56.278329
3504	thespiker	GET	/api/Customer		2025-05-07 09:00:56.284179
3508	thespiker	GET	/api/Customer		2025-05-07 09:00:56.29006
3518	thespiker	GET	/api/Customer		2025-05-07 09:00:56.308623
3521	thespiker	GET	/api/Customer		2025-05-07 09:00:56.332603
3537	thespiker	GET	/api/Customer		2025-05-07 09:00:55.506212
3540	thespiker	GET	/api/Customer		2025-05-07 09:00:56.388392
3560	thespiker	GET	/api/Customer		2025-05-07 09:00:56.427225
3562	thespiker	GET	/api/Customer		2025-05-07 09:00:56.432352
3574	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54245
3583	thespiker	GET	/api/Customer		2025-05-07 09:00:56.458431
3592	thespiker	GET	/api/Customer		2025-05-07 09:00:56.469168
3604	thespiker	GET	/api/Customer		2025-05-07 09:00:55.328921
3616	thespiker	GET	/api/Customer		2025-05-07 09:00:56.498975
3634	thespiker	GET	/api/Customer		2025-05-07 09:00:56.5182
3637	thespiker	GET	/api/Customer		2025-05-07 09:00:56.519522
3645	thespiker	GET	/api/Customer		2025-05-07 09:00:56.526272
3657	thespiker	GET	/api/Customer		2025-05-07 09:00:56.540288
3664	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54146
3689	thespiker	GET	/api/Customer		2025-05-07 09:00:56.592156
3705	thespiker	GET	/api/Customer		2025-05-07 09:00:56.612847
3721	thespiker	GET	/api/Customer		2025-05-07 09:00:55.607457
3724	thespiker	GET	/api/Customer		2025-05-07 09:00:55.605019
3741	thespiker	GET	/api/Customer		2025-05-07 09:00:56.649259
3754	thespiker	GET	/api/Customer		2025-05-07 09:00:55.34444
3751	thespiker	GET	/api/Customer		2025-05-07 09:00:55.602721
3762	thespiker	GET	/api/Customer		2025-05-07 09:00:56.675974
3771	thespiker	GET	/api/Customer		2025-05-07 09:00:56.691132
3782	thespiker	GET	/api/Customer		2025-05-07 09:00:56.702215
3785	thespiker	GET	/api/Customer		2025-05-07 09:00:56.702265
3787	thespiker	GET	/api/Customer		2025-05-07 09:00:56.703706
3789	thespiker	GET	/api/Customer		2025-05-07 09:00:56.704435
3795	thespiker	GET	/api/Customer		2025-05-07 09:00:56.71115
3796	thespiker	GET	/api/Customer		2025-05-07 09:00:56.71115
3802	thespiker	GET	/api/Customer		2025-05-07 09:00:56.728158
946	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733409
954	thespiker	GET	/api/Customer		2025-05-07 08:57:33.763499
965	thespiker	GET	/api/Customer		2025-05-07 08:57:33.814513
978	thespiker	GET	/api/Customer		2025-05-07 08:57:33.961095
980	thespiker	GET	/api/Customer		2025-05-07 08:57:33.967662
989	thespiker	GET	/api/Customer		2025-05-07 08:57:33.987785
991	thespiker	GET	/api/Customer		2025-05-07 08:57:33.996887
994	thespiker	GET	/api/Customer		2025-05-07 08:57:33.999623
997	thespiker	GET	/api/Customer		2025-05-07 08:57:34.011003
1019	thespiker	GET	/api/Customer		2025-05-07 08:57:34.06808
1024	thespiker	GET	/api/Customer		2025-05-07 08:57:34.075245
1027	thespiker	GET	/api/Customer		2025-05-07 08:57:34.078661
1030	thespiker	GET	/api/Customer		2025-05-07 08:57:34.086327
1039	thespiker	GET	/api/Customer		2025-05-07 08:57:34.147947
1053	thespiker	GET	/api/Customer		2025-05-07 08:57:34.214127
1056	thespiker	GET	/api/Customer		2025-05-07 08:57:34.220053
1062	thespiker	GET	/api/Customer		2025-05-07 08:57:34.235769
1070	thespiker	GET	/api/Customer		2025-05-07 08:57:34.244382
1113	thespiker	GET	/api/Customer		2025-05-07 08:57:34.344705
1116	thespiker	GET	/api/Customer		2025-05-07 08:57:34.347661
1128	thespiker	GET	/api/Customer		2025-05-07 08:57:34.367962
1150	thespiker	GET	/api/Customer		2025-05-07 08:57:34.398483
1151	thespiker	GET	/api/Customer		2025-05-07 08:57:34.400791
1168	thespiker	GET	/api/Customer		2025-05-07 08:57:34.447766
1175	thespiker	GET	/api/Customer		2025-05-07 08:57:34.47442
1180	thespiker	GET	/api/Customer		2025-05-07 08:57:34.486257
1252	thespiker	GET	/api/Customer		2025-05-07 08:57:34.592503
1266	thespiker	GET	/api/Customer		2025-05-07 08:57:34.635355
1281	thespiker	GET	/api/Customer		2025-05-07 08:57:34.68703
1280	thespiker	GET	/api/Customer		2025-05-07 08:57:33.666483
1320	thespiker	GET	/api/Customer		2025-05-07 08:57:34.773232
1322	thespiker	GET	/api/Customer		2025-05-07 08:57:34.77505
1342	thespiker	GET	/api/Customer		2025-05-07 08:57:34.801673
1352	thespiker	GET	/api/Customer		2025-05-07 08:57:34.827142
1361	thespiker	GET	/api/Customer		2025-05-07 08:57:34.850451
1383	thespiker	GET	/api/Customer		2025-05-07 08:57:34.875736
1386	thespiker	GET	/api/Customer		2025-05-07 08:57:33.664386
1450	thespiker	GET	/api/Customer		2025-05-07 08:57:34.937868
1461	thespiker	GET	/api/Customer		2025-05-07 08:57:34.946061
1494	thespiker	GET	/api/Customer		2025-05-07 08:57:35.001616
1505	thespiker	GET	/api/Customer		2025-05-07 08:57:35.015448
1513	thespiker	GET	/api/Customer		2025-05-07 08:57:35.030783
1532	thespiker	GET	/api/Customer		2025-05-07 08:57:35.053883
1554	thespiker	GET	/api/Customer		2025-05-07 08:57:35.084367
1570	thespiker	GET	/api/Customer		2025-05-07 08:57:35.100891
1586	thespiker	GET	/api/Customer		2025-05-07 08:57:35.111644
1587	thespiker	GET	/api/Customer		2025-05-07 08:57:33.55737
1594	thespiker	GET	/api/Customer		2025-05-07 08:57:35.132247
1627	thespiker	GET	/api/Customer		2025-05-07 08:57:33.575819
1646	thespiker	GET	/api/Customer		2025-05-07 08:57:35.192339
1661	thespiker	GET	/api/Customer		2025-05-07 08:57:35.334049
1666	thespiker	GET	/api/Customer		2025-05-07 08:57:35.340597
1668	thespiker	GET	/api/Customer		2025-05-07 08:57:35.343577
1670	thespiker	GET	/api/Customer		2025-05-07 08:57:35.352402
1674	thespiker	GET	/api/Customer		2025-05-07 08:57:35.359103
1677	thespiker	GET	/api/Customer		2025-05-07 08:57:35.36397
1681	thespiker	GET	/api/Customer		2025-05-07 08:57:35.365208
1688	thespiker	GET	/api/Customer		2025-05-07 08:57:35.38373
1700	thespiker	GET	/api/Customer		2025-05-07 08:57:35.398306
1708	thespiker	GET	/api/Customer		2025-05-07 08:57:35.405453
1715	thespiker	GET	/api/Customer		2025-05-07 08:57:35.426208
1720	thespiker	GET	/api/Customer		2025-05-07 08:57:35.433126
1729	thespiker	GET	/api/Customer		2025-05-07 08:57:35.437971
1733	thespiker	GET	/api/Customer		2025-05-07 08:57:35.442113
1738	thespiker	GET	/api/Customer		2025-05-07 08:57:35.446975
1742	thespiker	GET	/api/Customer		2025-05-07 08:57:35.4656
1743	thespiker	GET	/api/Customer		2025-05-07 08:57:35.476497
1746	thespiker	GET	/api/Customer		2025-05-07 08:57:35.501734
1758	thespiker	GET	/api/Customer		2025-05-07 08:57:35.593403
1765	thespiker	GET	/api/Customer		2025-05-07 08:57:35.640358
1768	thespiker	GET	/api/Customer		2025-05-07 08:57:35.652217
1777	thespiker	GET	/api/Customer		2025-05-07 08:57:35.384896
1782	thespiker	GET	/api/Customer		2025-05-07 08:57:35.688529
1789	thespiker	GET	/api/Customer		2025-05-07 08:57:35.704868
1818	thespiker	GET	/api/Customer		2025-05-07 08:57:35.756991
1837	thespiker	GET	/api/Customer		2025-05-07 08:57:35.787875
1848	thespiker	GET	/api/Customer		2025-05-07 08:57:35.796054
1862	thespiker	GET	/api/Customer		2025-05-07 08:57:35.805821
1865	thespiker	GET	/api/Customer		2025-05-07 08:57:35.81022
1877	thespiker	GET	/api/Customer		2025-05-07 08:57:35.825598
1882	thespiker	GET	/api/Customer		2025-05-07 08:57:35.827945
1892	thespiker	GET	/api/Customer		2025-05-07 08:57:35.837115
1917	thespiker	GET	/api/Customer		2025-05-07 08:58:18.723724
1941	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619407
1961	thespiker	GET	/api/Customer		2025-05-07 08:58:18.748017
2014	thespiker	GET	/api/Customer		2025-05-07 08:59:55.745793
2049	thespiker	GET	/api/Customer		2025-05-07 08:59:55.745939
2066	thespiker	GET	/api/Customer		2025-05-07 08:59:55.710294
2170	thespiker	GET	/api/Customer		2025-05-07 08:59:57.17894
2188	thespiker	GET	/api/Customer		2025-05-07 08:59:57.200914
2194	thespiker	GET	/api/Customer		2025-05-07 08:59:57.206761
2200	thespiker	GET	/api/Customer		2025-05-07 08:59:57.220556
2211	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2218	thespiker	GET	/api/Customer		2025-05-07 08:59:57.236857
2266	thespiker	GET	/api/Customer		2025-05-07 08:59:57.372582
2273	thespiker	GET	/api/Customer		2025-05-07 08:59:57.392625
2281	thespiker	GET	/api/Customer		2025-05-07 08:59:57.398334
2284	thespiker	GET	/api/Customer		2025-05-07 08:59:57.405336
2298	thespiker	GET	/api/Customer		2025-05-07 08:59:57.418871
2301	thespiker	GET	/api/Customer		2025-05-07 08:59:57.424006
2338	thespiker	GET	/api/Customer		2025-05-07 08:59:57.588658
2354	thespiker	GET	/api/Customer		2025-05-07 08:59:57.624308
2362	thespiker	GET	/api/Customer		2025-05-07 08:59:57.631733
2410	thespiker	GET	/api/Customer		2025-05-07 08:59:57.739933
2446	thespiker	GET	/api/Customer		2025-05-07 08:59:57.098065
2493	thespiker	GET	/api/Customer		2025-05-07 08:59:57.849416
2521	thespiker	GET	/api/Customer		2025-05-07 08:59:57.885153
942	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733397
949	thespiker	GET	/api/Customer		2025-05-07 08:57:33.735138
955	thespiker	GET	/api/Customer		2025-05-07 08:57:33.763372
966	thespiker	GET	/api/Customer		2025-05-07 08:57:33.816146
981	thespiker	GET	/api/Customer		2025-05-07 08:57:33.967661
983	thespiker	GET	/api/Customer		2025-05-07 08:57:33.976577
990	thespiker	GET	/api/Customer		2025-05-07 08:57:33.989694
992	thespiker	GET	/api/Customer		2025-05-07 08:57:33.997916
1002	thespiker	GET	/api/Customer		2025-05-07 08:57:34.028803
1011	thespiker	GET	/api/Customer		2025-05-07 08:57:34.051391
1029	thespiker	GET	/api/Customer		2025-05-07 08:57:34.080829
1047	thespiker	GET	/api/Customer		2025-05-07 08:57:34.187128
1048	thespiker	GET	/api/Customer		2025-05-07 08:57:34.191816
1063	thespiker	GET	/api/Customer		2025-05-07 08:57:34.235769
1073	thespiker	GET	/api/Customer		2025-05-07 08:57:34.258771
1079	thespiker	GET	/api/Customer		2025-05-07 08:57:34.266817
1095	thespiker	GET	/api/Customer		2025-05-07 08:57:34.316011
1117	thespiker	GET	/api/Customer		2025-05-07 08:57:33.663296
1124	thespiker	GET	/api/Customer		2025-05-07 08:57:34.365229
1135	thespiker	GET	/api/Customer		2025-05-07 08:57:34.376456
1142	thespiker	GET	/api/Customer		2025-05-07 08:57:34.383872
1156	thespiker	GET	/api/Customer		2025-05-07 08:57:34.407363
1161	thespiker	GET	/api/Customer		2025-05-07 08:57:34.418317
1178	thespiker	GET	/api/Customer		2025-05-07 08:57:34.484913
1198	thespiker	GET	/api/Customer		2025-05-07 08:57:34.509643
1207	thespiker	GET	/api/Customer		2025-05-07 08:57:34.526712
1216	thespiker	GET	/api/Customer		2025-05-07 08:57:34.53528
1244	thespiker	GET	/api/Customer		2025-05-07 08:57:34.568231
1251	thespiker	GET	/api/Customer		2025-05-07 08:57:34.588204
1259	thespiker	GET	/api/Customer		2025-05-07 08:57:34.618631
1279	thespiker	GET	/api/Customer		2025-05-07 08:57:34.681721
1286	thespiker	GET	/api/Customer		2025-05-07 08:57:34.715572
1289	thespiker	GET	/api/Customer		2025-05-07 08:57:33.668746
1294	thespiker	GET	/api/Customer		2025-05-07 08:57:34.729674
1304	thespiker	GET	/api/Customer		2025-05-07 08:57:34.749069
1337	thespiker	GET	/api/Customer		2025-05-07 08:57:34.793314
1339	thespiker	GET	/api/Customer		2025-05-07 08:57:34.794693
1353	thespiker	GET	/api/Customer		2025-05-07 08:57:34.827908
1364	thespiker	GET	/api/Customer		2025-05-07 08:57:34.851758
1366	thespiker	GET	/api/Customer		2025-05-07 08:57:34.85776
1374	thespiker	GET	/api/Customer		2025-05-07 08:57:34.866665
1388	thespiker	GET	/api/Customer		2025-05-07 08:57:34.880433
1389	thespiker	GET	/api/Customer		2025-05-07 08:57:33.574016
1404	thespiker	GET	/api/Customer		2025-05-07 08:57:34.901526
1444	thespiker	GET	/api/Customer		2025-05-07 08:57:34.936705
1460	thespiker	GET	/api/Customer		2025-05-07 08:57:34.943991
1493	thespiker	GET	/api/Customer		2025-05-07 08:57:34.999813
1497	thespiker	GET	/api/Customer		2025-05-07 08:57:35.005799
1506	thespiker	GET	/api/Customer		2025-05-07 08:57:35.015721
1514	thespiker	GET	/api/Customer		2025-05-07 08:57:35.033929
1530	thespiker	GET	/api/Customer		2025-05-07 08:57:35.046938
1533	thespiker	GET	/api/Customer		2025-05-07 08:57:35.054067
1548	thespiker	GET	/api/Customer		2025-05-07 08:57:35.076892
1626	thespiker	GET	/api/Customer		2025-05-07 08:57:35.157272
1636	thespiker	GET	/api/Customer		2025-05-07 08:57:35.161109
1588	thespiker	GET	/api/Customer		2025-05-07 08:57:35.11995
1628	thespiker	GET	/api/Customer		2025-05-07 08:57:33.755077
1649	thespiker	GET	/api/Customer		2025-05-07 08:57:35.198323
1656	thespiker	GET	/api/Customer		2025-05-07 08:57:35.201697
1662	thespiker	GET	/api/Customer		2025-05-07 08:57:35.334049
1667	thespiker	GET	/api/Customer		2025-05-07 08:57:35.342062
1671	thespiker	GET	/api/Customer		2025-05-07 08:57:35.35384
1673	thespiker	GET	/api/Customer		2025-05-07 08:57:35.35762
1675	thespiker	GET	/api/Customer		2025-05-07 08:57:35.359758
1678	thespiker	GET	/api/Customer		2025-05-07 08:57:35.364531
1682	thespiker	GET	/api/Customer		2025-05-07 08:57:35.365737
1687	thespiker	GET	/api/Customer		2025-05-07 08:57:35.38373
1690	thespiker	GET	/api/Customer		2025-05-07 08:57:35.387223
1695	thespiker	GET	/api/Customer		2025-05-07 08:57:35.394687
1723	thespiker	GET	/api/Customer		2025-05-07 08:57:35.433126
1726	thespiker	GET	/api/Customer		2025-05-07 08:57:35.437077
1752	thespiker	GET	/api/Customer		2025-05-07 08:57:35.555614
1754	thespiker	GET	/api/Customer		2025-05-07 08:57:35.572289
1761	thespiker	GET	/api/Customer		2025-05-07 08:57:35.620203
1763	thespiker	GET	/api/Customer		2025-05-07 08:57:35.63503
1771	thespiker	GET	/api/Customer		2025-05-07 08:57:35.66319
1776	thespiker	GET	/api/Customer		2025-05-07 08:57:35.336511
1797	thespiker	GET	/api/Customer		2025-05-07 08:57:35.720152
1800	thespiker	GET	/api/Customer		2025-05-07 08:57:35.725815
1821	thespiker	GET	/api/Customer		2025-05-07 08:57:35.759864
1827	thespiker	GET	/api/Customer		2025-05-07 08:57:35.7728
1829	thespiker	GET	/api/Customer		2025-05-07 08:57:35.779255
1853	thespiker	GET	/api/Customer		2025-05-07 08:57:35.798801
1868	thespiker	GET	/api/Customer		2025-05-07 08:57:35.819396
1873	thespiker	GET	/api/Customer		2025-05-07 08:57:35.822308
1875	thespiker	GET	/api/Customer		2025-05-07 08:57:35.824717
1878	thespiker	GET	/api/Customer		2025-05-07 08:57:35.826398
1887	thespiker	GET	/api/Customer		2025-05-07 08:57:35.833564
1891	thespiker	GET	/api/Customer		2025-05-07 08:57:35.837229
1918	thespiker	GET	/api/Customer		2025-05-07 08:58:18.746056
1942	thespiker	GET	/api/Customer		2025-05-07 08:58:18.723393
1944	thespiker	GET	/api/Customer		2025-05-07 08:58:23.733353
1962	thespiker	GET	/api/Customer		2025-05-07 08:58:18.724504
2033	thespiker	GET	/api/Customer		2025-05-07 08:59:55.750759
2051	thespiker	GET	/api/Customer		2025-05-07 08:59:55.711864
2067	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744135
2174	thespiker	GET	/api/Customer		2025-05-07 08:59:56.765662
2185	thespiker	GET	/api/Customer		2025-05-07 08:59:57.198208
2202	thespiker	GET	/api/Customer		2025-05-07 08:59:57.222034
2203	thespiker	GET	/api/Customer		2025-05-07 08:59:57.223758
2231	thespiker	GET	/api/Customer		2025-05-07 08:59:57.324663
2238	thespiker	GET	/api/Customer		2025-05-07 08:59:57.340765
2246	thespiker	GET	/api/Customer		2025-05-07 08:59:57.35447
2262	thespiker	GET	/api/Customer		2025-05-07 08:59:57.370166
2271	thespiker	GET	/api/Customer		2025-05-07 08:59:57.389714
2291	thespiker	GET	/api/Customer		2025-05-07 08:59:57.407878
2294	thespiker	GET	/api/Customer		2025-05-07 08:59:57.417521
945	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733397
957	thespiker	GET	/api/Customer		2025-05-07 08:57:33.766839
959	thespiker	GET	/api/Customer		2025-05-07 08:57:33.804409
963	thespiker	GET	/api/Customer		2025-05-07 08:57:33.812919
972	thespiker	GET	/api/Customer		2025-05-07 08:57:33.943434
974	thespiker	GET	/api/Customer		2025-05-07 08:57:33.951025
1005	thespiker	GET	/api/Customer		2025-05-07 08:57:34.03213
1010	thespiker	GET	/api/Customer		2025-05-07 08:57:34.049893
1022	thespiker	GET	/api/Customer		2025-05-07 08:57:34.073837
1044	thespiker	GET	/api/Customer		2025-05-07 08:57:34.171052
1045	thespiker	GET	/api/Customer		2025-05-07 08:57:34.177372
1060	thespiker	GET	/api/Customer		2025-05-07 08:57:34.227928
1061	thespiker	GET	/api/Customer		2025-05-07 08:57:34.234387
1082	thespiker	GET	/api/Customer		2025-05-07 08:57:34.270969
1088	thespiker	GET	/api/Customer		2025-05-07 08:57:34.307266
1108	thespiker	GET	/api/Customer		2025-05-07 08:57:34.335406
1115	thespiker	GET	/api/Customer		2025-05-07 08:57:34.346728
1122	thespiker	GET	/api/Customer		2025-05-07 08:57:34.356307
1127	thespiker	GET	/api/Customer		2025-05-07 08:57:34.365732
1133	thespiker	GET	/api/Customer		2025-05-07 08:57:34.375244
1148	thespiker	GET	/api/Customer		2025-05-07 08:57:34.396144
1153	thespiker	GET	/api/Customer		2025-05-07 08:57:34.401244
1158	thespiker	GET	/api/Customer		2025-05-07 08:57:34.410237
1159	thespiker	GET	/api/Customer		2025-05-07 08:57:34.415752
1213	thespiker	GET	/api/Customer		2025-05-07 08:57:34.529672
1240	thespiker	GET	/api/Customer		2025-05-07 08:57:34.562361
1298	thespiker	GET	/api/Customer		2025-05-07 08:57:33.578286
1325	thespiker	GET	/api/Customer		2025-05-07 08:57:34.777431
1329	thespiker	GET	/api/Customer		2025-05-07 08:57:34.782349
1336	thespiker	GET	/api/Customer		2025-05-07 08:57:34.793414
1362	thespiker	GET	/api/Customer		2025-05-07 08:57:34.850451
1382	thespiker	GET	/api/Customer		2025-05-07 08:57:34.875736
1387	thespiker	GET	/api/Customer		2025-05-07 08:57:34.880433
1397	thespiker	GET	/api/Customer		2025-05-07 08:57:33.576844
1402	thespiker	GET	/api/Customer		2025-05-07 08:57:34.90126
1413	thespiker	GET	/api/Customer		2025-05-07 08:57:34.909263
1440	thespiker	GET	/api/Customer		2025-05-07 08:57:34.931843
1441	thespiker	GET	/api/Customer		2025-05-07 08:57:34.932832
1442	thespiker	GET	/api/Customer		2025-05-07 08:57:34.935415
1456	thespiker	GET	/api/Customer		2025-05-07 08:57:34.943071
1459	thespiker	GET	/api/Customer		2025-05-07 08:57:34.94305
1476	thespiker	GET	/api/Customer		2025-05-07 08:57:34.966869
1480	thespiker	GET	/api/Customer		2025-05-07 08:57:34.968961
1491	thespiker	GET	/api/Customer		2025-05-07 08:57:34.99759
1515	thespiker	GET	/api/Customer		2025-05-07 08:57:35.034007
1535	thespiker	GET	/api/Customer		2025-05-07 08:57:35.055114
1553	thespiker	GET	/api/Customer		2025-05-07 08:57:33.753274
1563	thespiker	GET	/api/Customer		2025-05-07 08:57:35.097481
1571	thespiker	GET	/api/Customer		2025-05-07 08:57:35.101551
1609	thespiker	GET	/api/Customer		2025-05-07 08:57:35.145671
1619	thespiker	GET	/api/Customer		2025-05-07 08:57:35.153643
1629	thespiker	GET	/api/Customer		2025-05-07 08:57:35.158633
1591	thespiker	GET	/api/Customer		2025-05-07 08:57:35.120259
1663	thespiker	GET	/api/Customer		2025-05-07 08:57:35.335321
1664	thespiker	GET	/api/Customer		2025-05-07 08:57:35.338778
1669	thespiker	GET	/api/Customer		2025-05-07 08:57:35.348009
1676	thespiker	GET	/api/Customer		2025-05-07 08:57:35.363069
1680	thespiker	GET	/api/Customer		2025-05-07 08:57:35.365205
1683	thespiker	GET	/api/Customer		2025-05-07 08:57:35.381356
1692	thespiker	GET	/api/Customer		2025-05-07 08:57:35.382642
1699	thespiker	GET	/api/Customer		2025-05-07 08:57:35.398149
1703	thespiker	GET	/api/Customer		2025-05-07 08:57:35.401098
1714	thespiker	GET	/api/Customer		2025-05-07 08:57:35.425861
1724	thespiker	GET	/api/Customer		2025-05-07 08:57:35.433241
1732	thespiker	GET	/api/Customer		2025-05-07 08:57:35.442113
1740	thespiker	GET	/api/Customer		2025-05-07 08:57:35.451443
1750	thespiker	GET	/api/Customer		2025-05-07 08:57:35.537815
1755	thespiker	GET	/api/Customer		2025-05-07 08:57:35.573768
1762	thespiker	GET	/api/Customer		2025-05-07 08:57:35.626872
1770	thespiker	GET	/api/Customer		2025-05-07 08:57:35.657845
1785	thespiker	GET	/api/Customer		2025-05-07 08:57:35.336576
1790	thespiker	GET	/api/Customer		2025-05-07 08:57:35.706315
1794	thespiker	GET	/api/Customer		2025-05-07 08:57:35.714648
1823	thespiker	GET	/api/Customer		2025-05-07 08:57:35.76122
1859	thespiker	GET	/api/Customer		2025-05-07 08:57:35.804717
1867	thespiker	GET	/api/Customer		2025-05-07 08:57:35.818219
1883	thespiker	GET	/api/Customer		2025-05-07 08:57:35.83161
1888	thespiker	GET	/api/Customer		2025-05-07 08:57:35.83594
1901	thespiker	GET	/api/Customer		2025-05-07 08:57:35.856537
1903	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619414
1919	thespiker	GET	/api/Customer		2025-05-07 08:58:18.723289
1928	thespiker	GET	/api/Customer		2025-05-07 08:58:21.572185
1943	thespiker	GET	/api/Customer		2025-05-07 08:58:18.663664
1963	thespiker	GET	/api/Customer		2025-05-07 08:58:18.748905
2013	thespiker	GET	/api/Customer		2025-05-07 08:59:55.636896
2054	thespiker	GET	/api/Customer		2025-05-07 08:59:55.744343
2069	thespiker	GET	/api/Customer		2025-05-07 08:59:56.88937
2089	thespiker	GET	/api/Customer		2025-05-07 08:59:56.975416
2099	thespiker	GET	/api/Customer		2025-05-07 08:59:56.97772
2103	thespiker	GET	/api/Customer		2025-05-07 08:59:57.005341
2108	thespiker	GET	/api/Customer		2025-05-07 08:59:57.010333
2113	thespiker	GET	/api/Customer		2025-05-07 08:59:57.01223
2127	thespiker	GET	/api/Customer		2025-05-07 08:59:57.023556
2140	thespiker	GET	/api/Customer		2025-05-07 08:59:57.045253
2143	thespiker	GET	/api/Customer		2025-05-07 08:59:57.04929
2146	thespiker	GET	/api/Customer		2025-05-07 08:59:57.052981
2159	thespiker	GET	/api/Customer		2025-05-07 08:59:57.059184
2179	thespiker	GET	/api/Customer		2025-05-07 08:59:56.766857
2193	thespiker	GET	/api/Customer		2025-05-07 08:59:57.206297
2204	thespiker	GET	/api/Customer		2025-05-07 08:59:57.226003
2205	thespiker	GET	/api/Customer		2025-05-07 08:59:57.225682
2233	thespiker	GET	/api/Customer		2025-05-07 08:59:57.334004
2235	thespiker	GET	/api/Customer		2025-05-07 08:59:57.339477
2258	thespiker	GET	/api/Customer		2025-05-07 08:59:57.366637
2265	thespiker	GET	/api/Customer		2025-05-07 08:59:57.371314
2270	thespiker	GET	/api/Customer		2025-05-07 08:59:57.385753
2276	thespiker	GET	/api/Customer		2025-05-07 08:59:57.39709
943	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733406
970	thespiker	GET	/api/Customer		2025-05-07 08:57:33.919614
1001	thespiker	GET	/api/Customer		2025-05-07 08:57:34.023651
1003	thespiker	GET	/api/Customer		2025-05-07 08:57:34.030616
1013	thespiker	GET	/api/Customer		2025-05-07 08:57:34.060986
1015	thespiker	GET	/api/Customer		2025-05-07 08:57:34.066583
1026	thespiker	GET	/api/Customer		2025-05-07 08:57:34.07817
1031	thespiker	GET	/api/Customer		2025-05-07 08:57:34.107898
1034	thespiker	GET	/api/Customer		2025-05-07 08:57:34.12021
1081	thespiker	GET	/api/Customer		2025-05-07 08:57:34.270971
1118	thespiker	GET	/api/Customer		2025-05-07 08:57:34.353994
1140	thespiker	GET	/api/Customer		2025-05-07 08:57:34.382804
1145	thespiker	GET	/api/Customer		2025-05-07 08:57:34.391347
1163	thespiker	GET	/api/Customer		2025-05-07 08:57:33.753326
1200	thespiker	GET	/api/Customer		2025-05-07 08:57:34.511131
1226	thespiker	GET	/api/Customer		2025-05-07 08:57:34.543501
1229	thespiker	GET	/api/Customer		2025-05-07 08:57:34.544659
1231	thespiker	GET	/api/Customer		2025-05-07 08:57:34.548259
1235	thespiker	GET	/api/Customer		2025-05-07 08:57:34.549834
1239	thespiker	GET	/api/Customer		2025-05-07 08:57:34.561316
1273	thespiker	GET	/api/Customer		2025-05-07 08:57:34.661549
1287	thespiker	GET	/api/Customer		2025-05-07 08:57:34.716621
1300	thespiker	GET	/api/Customer		2025-05-07 08:57:33.557368
1310	thespiker	GET	/api/Customer		2025-05-07 08:57:34.755927
1311	thespiker	GET	/api/Customer		2025-05-07 08:57:34.758032
1319	thespiker	GET	/api/Customer		2025-05-07 08:57:34.770955
1338	thespiker	GET	/api/Customer		2025-05-07 08:57:34.793207
1345	thespiker	GET	/api/Customer		2025-05-07 08:57:34.803159
1375	thespiker	GET	/api/Customer		2025-05-07 08:57:34.866685
1384	thespiker	GET	/api/Customer		2025-05-07 08:57:34.875736
1398	thespiker	GET	/api/Customer		2025-05-07 08:57:33.767039
1428	thespiker	GET	/api/Customer		2025-05-07 08:57:34.917406
1451	thespiker	GET	/api/Customer		2025-05-07 08:57:34.93787
1470	thespiker	GET	/api/Customer		2025-05-07 08:57:34.960609
1478	thespiker	GET	/api/Customer		2025-05-07 08:57:34.968597
1495	thespiker	GET	/api/Customer		2025-05-07 08:57:35.001617
1501	thespiker	GET	/api/Customer		2025-05-07 08:57:35.008913
1507	thespiker	GET	/api/Customer		2025-05-07 08:57:35.015849
1516	thespiker	GET	/api/Customer		2025-05-07 08:57:33.717406
1537	thespiker	GET	/api/Customer		2025-05-07 08:57:35.055094
1557	thespiker	GET	/api/Customer		2025-05-07 08:57:33.579745
1590	thespiker	GET	/api/Customer		2025-05-07 08:57:35.130896
1597	thespiker	GET	/api/Customer		2025-05-07 08:57:35.133923
1623	thespiker	GET	/api/Customer		2025-05-07 08:57:35.154952
1637	thespiker	GET	/api/Customer		2025-05-07 08:57:35.162082
1630	thespiker	GET	/api/Customer		2025-05-07 08:57:33.733397
1596	thespiker	GET	/api/Customer		2025-05-07 08:57:35.13363
1665	thespiker	GET	/api/Customer		2025-05-07 08:57:33.561262
1788	thespiker	GET	/api/Customer		2025-05-07 08:57:35.384011
1813	thespiker	GET	/api/Customer		2025-05-07 08:57:35.749886
1838	thespiker	GET	/api/Customer		2025-05-07 08:57:35.787875
1844	thespiker	GET	/api/Customer		2025-05-07 08:57:35.794523
1904	thespiker	GET	/api/Customer		2025-05-07 08:58:17.670908
1920	thespiker	GET	/api/Customer		2025-05-07 08:58:18.742501
1929	thespiker	GET	/api/Customer		2025-05-07 08:58:21.572201
1945	thespiker	GET	/api/Customer		2025-05-07 08:58:18.745511
1964	thespiker	GET	/api/Customer		2025-05-07 08:58:18.726181
2030	thespiker	GET	/api/Customer		2025-05-07 08:59:55.651619
2039	thespiker	GET	/api/Customer		2025-05-07 08:59:55.711841
2068	thespiker	GET	/api/Customer		2025-05-07 08:59:55.715477
2212	thespiker	GET	/api/Customer		2025-05-07 08:59:57.230879
2268	thespiker	GET	/api/Customer		2025-05-07 08:59:57.373885
2315	thespiker	GET	/api/Customer		2025-05-07 08:59:57.45638
2325	thespiker	GET	/api/Customer		2025-05-07 08:59:57.479197
2359	thespiker	GET	/api/Customer		2025-05-07 08:59:57.63045
2367	thespiker	GET	/api/Customer		2025-05-07 08:59:57.637137
2377	thespiker	GET	/api/Customer		2025-05-07 08:59:57.657617
2447	thespiker	GET	/api/Customer		2025-05-07 08:59:57.061686
2494	thespiker	GET	/api/Customer		2025-05-07 08:59:57.849863
2533	thespiker	GET	/api/Customer		2025-05-07 08:59:57.894594
2554	thespiker	GET	/api/Customer		2025-05-07 08:59:57.920378
2555	thespiker	GET	/api/Customer		2025-05-07 08:59:57.921447
2575	thespiker	GET	/api/Customer		2025-05-07 08:59:57.947725
2591	thespiker	GET	/api/Customer		2025-05-07 08:59:57.093514
2669	thespiker	GET	/api/Customer		2025-05-07 08:59:57.093327
2724	thespiker	GET	/api/Customer		2025-05-07 08:59:58.071464
2797	thespiker	GET	/api/Customer		2025-05-07 08:59:58.17105
2881	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224356
2887	thespiker	GET	/api/Customer		2025-05-07 08:59:58.225107
2908	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240891
2914	thespiker	GET	/api/Customer		2025-05-07 08:59:58.241295
2931	thespiker	GET	/api/Customer		2025-05-07 08:59:58.258102
2937	thespiker	GET	/api/Customer		2025-05-07 08:59:58.25928
2976	thespiker	GET	/api/Customer		2025-05-07 09:00:54.245454
3021	thespiker	GET	/api/Customer		2025-05-07 09:00:55.100836
3037	thespiker	GET	/api/Customer		2025-05-07 09:00:55.115087
3068	thespiker	GET	/api/Customer		2025-05-07 09:00:55.138236
3084	thespiker	GET	/api/Customer		2025-05-07 09:00:55.163896
3127	thespiker	GET	/api/Customer		2025-05-07 09:00:54.242904
3150	thespiker	GET	/api/Customer		2025-05-07 09:00:55.233919
3163	thespiker	GET	/api/Customer		2025-05-07 09:00:54.275736
3219	thespiker	GET	/api/Customer		2025-05-07 09:00:54.291539
3232	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243798
3252	thespiker	GET	/api/Customer		2025-05-07 09:00:55.502033
3262	thespiker	GET	/api/Customer		2025-05-07 09:00:55.515301
3270	thespiker	GET	/api/Customer		2025-05-07 09:00:55.538102
3273	thespiker	GET	/api/Customer		2025-05-07 09:00:55.54047
3280	thespiker	GET	/api/Customer		2025-05-07 09:00:55.543372
3294	thespiker	GET	/api/Customer		2025-05-07 09:00:55.557623
3298	thespiker	GET	/api/Customer		2025-05-07 09:00:55.572775
3301	thespiker	GET	/api/Customer		2025-05-07 09:00:55.576056
3321	thespiker	GET	/api/Customer		2025-05-07 09:00:55.586883
3329	thespiker	GET	/api/Customer		2025-05-07 09:00:55.715845
3338	thespiker	GET	/api/Customer		2025-05-07 09:00:55.728516
3372	thespiker	GET	/api/Customer		2025-05-07 09:00:55.811502
3376	thespiker	GET	/api/Customer		2025-05-07 09:00:55.813699
3394	thespiker	GET	/api/Customer		2025-05-07 09:00:55.842233
950	thespiker	GET	/api/Customer		2025-05-07 08:57:33.734653
976	thespiker	GET	/api/Customer		2025-05-07 08:57:33.958085
1014	thespiker	GET	/api/Customer		2025-05-07 08:57:34.062503
1016	thespiker	GET	/api/Customer		2025-05-07 08:57:34.066583
1051	thespiker	GET	/api/Customer		2025-05-07 08:57:34.194378
1078	thespiker	GET	/api/Customer		2025-05-07 08:57:34.26633
1084	thespiker	GET	/api/Customer		2025-05-07 08:57:34.273565
1089	thespiker	GET	/api/Customer		2025-05-07 08:57:34.310997
1104	thespiker	GET	/api/Customer		2025-05-07 08:57:34.325551
1154	thespiker	GET	/api/Customer		2025-05-07 08:57:34.404025
1164	thespiker	GET	/api/Customer		2025-05-07 08:57:33.724772
1169	thespiker	GET	/api/Customer		2025-05-07 08:57:34.456874
1181	thespiker	GET	/api/Customer		2025-05-07 08:57:34.491109
1193	thespiker	GET	/api/Customer		2025-05-07 08:57:34.50098
1195	thespiker	GET	/api/Customer		2025-05-07 08:57:34.505934
1220	thespiker	GET	/api/Customer		2025-05-07 08:57:34.536317
1227	thespiker	GET	/api/Customer		2025-05-07 08:57:34.543501
1232	thespiker	GET	/api/Customer		2025-05-07 08:57:34.548587
1249	thespiker	GET	/api/Customer		2025-05-07 08:57:34.585862
1263	thespiker	GET	/api/Customer		2025-05-07 08:57:34.630715
1277	thespiker	GET	/api/Customer		2025-05-07 08:57:34.67922
1301	thespiker	GET	/api/Customer		2025-05-07 08:57:33.735287
1350	thespiker	GET	/api/Customer		2025-05-07 08:57:34.815766
1373	thespiker	GET	/api/Customer		2025-05-07 08:57:34.864153
1381	thespiker	GET	/api/Customer		2025-05-07 08:57:34.874363
1394	thespiker	GET	/api/Customer		2025-05-07 08:57:34.8829
1414	thespiker	GET	/api/Customer		2025-05-07 08:57:34.91051
1427	thespiker	GET	/api/Customer		2025-05-07 08:57:34.917406
1435	thespiker	GET	/api/Customer		2025-05-07 08:57:34.930098
1469	thespiker	GET	/api/Customer		2025-05-07 08:57:34.960128
1472	thespiker	GET	/api/Customer		2025-05-07 08:57:34.963023
1484	thespiker	GET	/api/Customer		2025-05-07 08:57:33.75388
1498	thespiker	GET	/api/Customer		2025-05-07 08:57:35.007368
1517	thespiker	GET	/api/Customer		2025-05-07 08:57:35.037961
1540	thespiker	GET	/api/Customer		2025-05-07 08:57:35.057304
1560	thespiker	GET	/api/Customer		2025-05-07 08:57:33.706997
1568	thespiker	GET	/api/Customer		2025-05-07 08:57:35.099648
1577	thespiker	GET	/api/Customer		2025-05-07 08:57:35.110339
1635	thespiker	GET	/api/Customer		2025-05-07 08:57:35.161109
1633	thespiker	GET	/api/Customer		2025-05-07 08:57:33.557395
1599	thespiker	GET	/api/Customer		2025-05-07 08:57:35.130896
1642	thespiker	GET	/api/Customer		2025-05-07 08:57:35.179507
1644	thespiker	GET	/api/Customer		2025-05-07 08:57:35.190433
1672	thespiker	GET	/api/Customer		2025-05-07 08:57:35.355266
1689	thespiker	GET	/api/Customer		2025-05-07 08:57:35.38425
1693	thespiker	GET	/api/Customer		2025-05-07 08:57:35.393231
1697	thespiker	GET	/api/Customer		2025-05-07 08:57:35.396631
1701	thespiker	GET	/api/Customer		2025-05-07 08:57:35.399584
1712	thespiker	GET	/api/Customer		2025-05-07 08:57:35.409666
1713	thespiker	GET	/api/Customer		2025-05-07 08:57:35.424391
1725	thespiker	GET	/api/Customer		2025-05-07 08:57:35.434495
1731	thespiker	GET	/api/Customer		2025-05-07 08:57:35.442142
1734	thespiker	GET	/api/Customer		2025-05-07 08:57:35.444164
1747	thespiker	GET	/api/Customer		2025-05-07 08:57:35.520803
1749	thespiker	GET	/api/Customer		2025-05-07 08:57:35.535487
1799	thespiker	GET	/api/Customer		2025-05-07 08:57:35.386061
1801	thespiker	GET	/api/Customer		2025-05-07 08:57:35.72934
1830	thespiker	GET	/api/Customer		2025-05-07 08:57:35.779255
1852	thespiker	GET	/api/Customer		2025-05-07 08:57:35.797736
1856	thespiker	GET	/api/Customer		2025-05-07 08:57:35.804172
1889	thespiker	GET	/api/Customer		2025-05-07 08:57:35.835942
1902	thespiker	GET	/api/Customer		2025-05-07 08:57:35.856418
1905	thespiker	GET	/api/Customer		2025-05-07 08:58:18.664341
1921	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619391
1931	thespiker	GET	/api/Customer		2025-05-07 08:58:21.573332
1947	thespiker	GET	/api/Customer		2025-05-07 08:58:18.663653
1965	thespiker	GET	/api/Customer		2025-05-07 08:58:18.748301
2022	thespiker	GET	/api/Customer		2025-05-07 08:59:55.74431
2032	thespiker	GET	/api/Customer		2025-05-07 08:59:55.714121
2070	thespiker	GET	/api/Customer		2025-05-07 08:59:55.634066
2229	thespiker	GET	/api/Customer		2025-05-07 08:59:56.789056
2277	thespiker	GET	/api/Customer		2025-05-07 08:59:57.396976
2283	thespiker	GET	/api/Customer		2025-05-07 08:59:57.404553
2318	thespiker	GET	/api/Customer		2025-05-07 08:59:57.463518
2326	thespiker	GET	/api/Customer		2025-05-07 08:59:57.489851
2342	thespiker	GET	/api/Customer		2025-05-07 08:59:57.592516
2406	thespiker	GET	/api/Customer		2025-05-07 08:59:57.727963
2427	thespiker	GET	/api/Customer		2025-05-07 08:59:57.773342
2450	thespiker	GET	/api/Customer		2025-05-07 08:59:57.804223
2456	thespiker	GET	/api/Customer		2025-05-07 08:59:57.811109
2481	thespiker	GET	/api/Customer		2025-05-07 08:59:57.84098
2492	thespiker	GET	/api/Customer		2025-05-07 08:59:57.848722
2516	thespiker	GET	/api/Customer		2025-05-07 08:59:57.880061
2525	thespiker	GET	/api/Customer		2025-05-07 08:59:57.887737
2535	thespiker	GET	/api/Customer		2025-05-07 08:59:57.898125
2588	thespiker	GET	/api/Customer		2025-05-07 08:59:57.962899
2598	thespiker	GET	/api/Customer		2025-05-07 08:59:57.973939
2604	thespiker	GET	/api/Customer		2025-05-07 08:59:57.977909
2612	thespiker	GET	/api/Customer		2025-05-07 08:59:57.98844
2639	thespiker	GET	/api/Customer		2025-05-07 08:59:58.019571
2680	thespiker	GET	/api/Customer		2025-05-07 08:59:58.059122
2684	thespiker	GET	/api/Customer		2025-05-07 08:59:57.063281
2729	thespiker	GET	/api/Customer		2025-05-07 08:59:58.103713
2796	thespiker	GET	/api/Customer		2025-05-07 08:59:58.171049
2856	thespiker	GET	/api/Customer		2025-05-07 08:59:58.213211
2885	thespiker	GET	/api/Customer		2025-05-07 08:59:58.224348
2909	thespiker	GET	/api/Customer		2025-05-07 08:59:58.240929
2951	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543747
2963	thespiker	GET	/api/Customer		2025-05-07 09:00:54.997434
2980	thespiker	GET	/api/Customer		2025-05-07 09:00:55.025316
3005	thespiker	GET	/api/Customer		2025-05-07 09:00:55.063882
2977	thespiker	GET	/api/Customer		2025-05-07 09:00:54.278651
3028	thespiker	GET	/api/Customer		2025-05-07 09:00:55.103611
3050	thespiker	GET	/api/Customer		2025-05-07 09:00:55.117732
3075	thespiker	GET	/api/Customer		2025-05-07 09:00:55.1612
3089	thespiker	GET	/api/Customer		2025-05-07 09:00:55.16448
3124	thespiker	GET	/api/Customer		2025-05-07 09:00:54.24628
1008	thespiker	GET	/api/Customer		2025-05-07 08:57:33.555736
1035	thespiker	GET	/api/Customer		2025-05-07 08:57:34.131152
1038	thespiker	GET	/api/Customer		2025-05-07 08:57:34.141478
1052	thespiker	GET	/api/Customer		2025-05-07 08:57:34.201564
1064	thespiker	GET	/api/Customer		2025-05-07 08:57:34.241136
1077	thespiker	GET	/api/Customer		2025-05-07 08:57:34.26633
1098	thespiker	GET	/api/Customer		2025-05-07 08:57:34.320028
1103	thespiker	GET	/api/Customer		2025-05-07 08:57:34.325435
1114	thespiker	GET	/api/Customer		2025-05-07 08:57:34.346179
1125	thespiker	GET	/api/Customer		2025-05-07 08:57:34.366718
1131	thespiker	GET	/api/Customer		2025-05-07 08:57:34.371041
1162	thespiker	GET	/api/Customer		2025-05-07 08:57:34.420398
1165	thespiker	GET	/api/Customer		2025-05-07 08:57:33.668746
1176	thespiker	GET	/api/Customer		2025-05-07 08:57:34.476331
1183	thespiker	GET	/api/Customer		2025-05-07 08:57:34.492423
1190	thespiker	GET	/api/Customer		2025-05-07 08:57:34.499929
1201	thespiker	GET	/api/Customer		2025-05-07 08:57:34.511018
1215	thespiker	GET	/api/Customer		2025-05-07 08:57:34.533941
1243	thespiker	GET	/api/Customer		2025-05-07 08:57:34.565198
1275	thespiker	GET	/api/Customer		2025-05-07 08:57:34.668757
1283	thespiker	GET	/api/Customer		2025-05-07 08:57:34.695734
1314	thespiker	GET	/api/Customer		2025-05-07 08:57:33.753271
1317	thespiker	GET	/api/Customer		2025-05-07 08:57:34.769736
1346	thespiker	GET	/api/Customer		2025-05-07 08:57:34.808517
1377	thespiker	GET	/api/Customer		2025-05-07 08:57:34.868032
1418	thespiker	GET	/api/Customer		2025-05-07 08:57:34.913639
1430	thespiker	GET	/api/Customer		2025-05-07 08:57:34.920437
1465	thespiker	GET	/api/Customer		2025-05-07 08:57:34.949206
1468	thespiker	GET	/api/Customer		2025-05-07 08:57:34.950495
1485	thespiker	GET	/api/Customer		2025-05-07 08:57:33.576917
1499	thespiker	GET	/api/Customer		2025-05-07 08:57:35.007679
1518	thespiker	GET	/api/Customer		2025-05-07 08:57:35.040351
1538	thespiker	GET	/api/Customer		2025-05-07 08:57:35.0573
1542	thespiker	GET	/api/Customer		2025-05-07 08:57:35.07455
1561	thespiker	GET	/api/Customer		2025-05-07 08:57:35.093219
1575	thespiker	GET	/api/Customer		2025-05-07 08:57:35.109174
1592	thespiker	GET	/api/Customer		2025-05-07 08:57:35.132247
1610	thespiker	GET	/api/Customer		2025-05-07 08:57:35.14689
1615	thespiker	GET	/api/Customer		2025-05-07 08:57:35.152335
1634	thespiker	GET	/api/Customer		2025-05-07 08:57:35.160943
1639	thespiker	GET	/api/Customer		2025-05-07 08:57:35.163725
1631	thespiker	GET	/api/Customer		2025-05-07 08:57:35.160148
1600	thespiker	GET	/api/Customer		2025-05-07 08:57:33.56131
1652	thespiker	GET	/api/Customer		2025-05-07 08:57:35.20023
1679	thespiker	GET	/api/Customer		2025-05-07 08:57:35.364531
1685	thespiker	GET	/api/Customer		2025-05-07 08:57:35.381356
1691	thespiker	GET	/api/Customer		2025-05-07 08:57:35.387597
1696	thespiker	GET	/api/Customer		2025-05-07 08:57:35.39619
1698	thespiker	GET	/api/Customer		2025-05-07 08:57:35.397607
1704	thespiker	GET	/api/Customer		2025-05-07 08:57:35.404047
1719	thespiker	GET	/api/Customer		2025-05-07 08:57:35.43077
1736	thespiker	GET	/api/Customer		2025-05-07 08:57:35.446976
1792	thespiker	GET	/api/Customer		2025-05-07 08:57:35.713164
1796	thespiker	GET	/api/Customer		2025-05-07 08:57:35.720149
1806	thespiker	GET	/api/Customer		2025-05-07 08:57:35.386042
1811	thespiker	GET	/api/Customer		2025-05-07 08:57:35.749068
1814	thespiker	GET	/api/Customer		2025-05-07 08:57:35.752322
1820	thespiker	GET	/api/Customer		2025-05-07 08:57:35.758309
1835	thespiker	GET	/api/Customer		2025-05-07 08:57:35.785577
1858	thespiker	GET	/api/Customer		2025-05-07 08:57:35.804465
1894	thespiker	GET	/api/Customer		2025-05-07 08:57:35.842114
1896	thespiker	GET	/api/Customer		2025-05-07 08:57:35.843836
1906	thespiker	GET	/api/Customer		2025-05-07 08:58:17.619394
1923	thespiker	GET	/api/Customer		2025-05-07 08:58:18.647115
1949	thespiker	GET	/api/Customer		2025-05-07 08:58:18.724516
1958	thespiker	GET	/api/Customer		2025-05-07 08:58:24.073243
1966	thespiker	GET	/api/Customer		2025-05-07 08:58:18.742685
2026	thespiker	GET	/api/Customer		2025-05-07 08:59:55.713508
2044	thespiker	GET	/api/Customer		2025-05-07 08:59:55.747715
2072	thespiker	GET	/api/Customer		2025-05-07 08:59:55.651619
2232	thespiker	GET	/api/Customer		2025-05-07 08:59:57.3323
2264	thespiker	GET	/api/Customer		2025-05-07 08:59:57.371314
2269	thespiker	GET	/api/Customer		2025-05-07 08:59:57.385753
2300	thespiker	GET	/api/Customer		2025-05-07 08:59:57.420129
2308	thespiker	GET	/api/Customer		2025-05-07 08:59:57.446823
2314	thespiker	GET	/api/Customer		2025-05-07 08:59:57.452635
2328	thespiker	GET	/api/Customer		2025-05-07 08:59:57.504026
2380	thespiker	GET	/api/Customer		2025-05-07 08:59:57.660333
2414	thespiker	GET	/api/Customer		2025-05-07 08:59:57.747177
2428	thespiker	GET	/api/Customer		2025-05-07 08:59:57.773602
2455	thespiker	GET	/api/Customer		2025-05-07 08:59:57.106205
2466	thespiker	GET	/api/Customer		2025-05-07 08:59:57.823791
2474	thespiker	GET	/api/Customer		2025-05-07 08:59:57.831939
2498	thespiker	GET	/api/Customer		2025-05-07 08:59:57.86067
2570	thespiker	GET	/api/Customer		2025-05-07 08:59:57.937905
2578	thespiker	GET	/api/Customer		2025-05-07 08:59:57.950274
2596	thespiker	GET	/api/Customer		2025-05-07 08:59:57.970035
2601	thespiker	GET	/api/Customer		2025-05-07 08:59:57.97663
2605	thespiker	GET	/api/Customer		2025-05-07 08:59:57.092622
2647	thespiker	GET	/api/Customer		2025-05-07 08:59:58.025208
2655	thespiker	GET	/api/Customer		2025-05-07 08:59:58.029905
2687	thespiker	GET	/api/Customer		2025-05-07 08:59:57.107669
2698	thespiker	GET	/api/Customer		2025-05-07 08:59:58.071014
2704	thespiker	GET	/api/Customer		2025-05-07 08:59:58.0729
2711	thespiker	GET	/api/Customer		2025-05-07 08:59:58.073506
2917	thespiker	GET	/api/Customer		2025-05-07 08:59:58.242398
2927	thespiker	GET	/api/Customer		2025-05-07 08:59:58.257578
2955	thespiker	GET	/api/Customer		2025-05-07 09:00:53.543741
2962	thespiker	GET	/api/Customer		2025-05-07 09:00:54.99744
2985	thespiker	GET	/api/Customer		2025-05-07 09:00:55.028133
2995	thespiker	GET	/api/Customer		2025-05-07 09:00:55.060252
2982	thespiker	GET	/api/Customer		2025-05-07 09:00:54.243789
3031	thespiker	GET	/api/Customer		2025-05-07 09:00:55.114115
3043	thespiker	GET	/api/Customer		2025-05-07 09:00:55.116975
3097	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165228
3105	thespiker	GET	/api/Customer		2025-05-07 09:00:55.165875
3122	thespiker	GET	/api/Customer		2025-05-07 09:00:54.274842
3819	thespiker	GET	/api/Customer		2025-05-07 09:00:56.738238
3838	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761234
3891	thespiker	GET	/api/Customer		2025-05-07 09:00:56.807471
4911	thespiker	GET	/api/Customer		2025-05-07 09:02:12.404002
4936	thespiker	GET	/api/Customer		2025-05-07 09:02:15.807344
4948	thespiker	GET	/api/Customer		2025-05-07 09:02:13.41496
4989	thespiker	GET	/api/Customer		2025-05-07 09:05:10.828394
5016	thespiker	GET	/api/Customer		2025-05-07 09:05:10.915634
5058	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917518
5041	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914809
5202	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525754
5223	thespiker	GET	/api/Customer		2025-05-07 09:05:12.553689
5270	thespiker	GET	/api/Customer		2025-05-07 09:05:12.617982
5282	thespiker	GET	/api/Customer		2025-05-07 09:05:12.632691
5329	thespiker	GET	/api/Customer		2025-05-07 09:05:12.681228
5392	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756959
5406	thespiker	GET	/api/Customer		2025-05-07 09:05:12.787738
5430	thespiker	GET	/api/Customer		2025-05-07 09:05:12.806049
5435	thespiker	GET	/api/Customer		2025-05-07 09:05:12.81814
5466	thespiker	GET	/api/Customer		2025-05-07 09:05:12.843745
5475	thespiker	GET	/api/Customer		2025-05-07 09:05:12.859768
5492	thespiker	GET	/api/Customer		2025-05-07 09:05:12.86383
5508	thespiker	GET	/api/Customer		2025-05-07 09:05:12.893233
5527	thespiker	GET	/api/Customer		2025-05-07 09:05:12.90919
5535	thespiker	GET	/api/Customer		2025-05-07 09:05:12.913301
5545	thespiker	GET	/api/Customer		2025-05-07 09:05:12.932114
5575	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965095
5595	thespiker	GET	/api/Customer		2025-05-07 09:05:13.022649
5608	thespiker	GET	/api/Customer		2025-05-07 09:05:13.081682
5614	thespiker	GET	/api/Customer		2025-05-07 09:05:13.10075
5667	thespiker	GET	/api/Customer		2025-05-07 09:05:13.334942
5694	thespiker	GET	/api/Customer		2025-05-07 09:05:12.7592
5700	thespiker	GET	/api/Customer		2025-05-07 09:05:13.456873
5740	thespiker	GET	/api/Customer		2025-05-07 09:05:13.512685
5801	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540657
5811	thespiker	GET	/api/Customer		2025-05-07 09:05:13.655434
5816	thespiker	GET	/api/Customer		2025-05-07 09:05:13.660603
5819	thespiker	GET	/api/Customer		2025-05-07 09:05:13.664892
5910	thespiker	GET	/api/Customer		2025-05-07 09:05:13.764932
5926	thespiker	GET	/api/Customer		2025-05-07 09:05:13.791605
5960	thespiker	GET	/api/Customer		2025-05-07 09:05:13.828827
6238	thespiker	GET	/api/Customer		2025-05-07 10:07:55.195414
6241	thespiker	GET	/api/Payment		2025-05-07 10:07:56.396699
6242	thespiker	GET	/api/LoanStatus		2025-05-07 10:07:56.460697
6244	thespiker	GET	/api/Loan		2025-05-07 10:07:56.523995
6246	thespiker	GET	/api/LoanType		2025-05-07 10:07:56.658343
6248	thespiker	GET	/api/PaymentType		2025-05-07 10:07:56.69797
6251	thespiker	GET	/api/Loan		2025-05-07 10:08:07.386579
6257	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:17.444897
6262	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:23.981298
6267	thespiker	GET	/api/Loan		2025-05-07 10:08:26.224798
6270	thespiker	GET	/api/LoanStatus		2025-05-07 10:08:26.293912
6272	thespiker	GET	/api/LoanStatus		2025-05-07 10:08:26.454542
6276	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:26.937204
6280	thespiker	DELETE	/api/Loan/38		2025-05-07 10:08:33.304007
6281	thespiker	GET	/api/Loan		2025-05-07 10:08:33.330241
3820	thespiker	GET	/api/Customer		2025-05-07 09:00:56.738259
3846	thespiker	GET	/api/Customer		2025-05-07 09:00:56.76248
4917	thespiker	GET	/api/Customer		2025-05-07 09:02:12.403997
4944	thespiker	GET	/api/Customer		2025-05-07 09:02:13.398018
5006	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914518
5017	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916105
5040	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888017
5207	thespiker	GET	/api/Customer		2025-05-07 09:05:12.190804
5242	thespiker	GET	/api/Customer		2025-05-07 09:05:12.586035
5272	thespiker	GET	/api/Customer		2025-05-07 09:05:12.617981
5288	thespiker	GET	/api/Customer		2025-05-07 09:05:12.639383
5296	thespiker	GET	/api/Customer		2025-05-07 09:05:12.642604
5303	thespiker	GET	/api/Customer		2025-05-07 09:05:12.648628
5314	thespiker	GET	/api/Customer		2025-05-07 09:05:12.66665
5355	thespiker	GET	/api/Customer		2025-05-07 09:05:12.724792
5362	thespiker	GET	/api/Customer		2025-05-07 09:05:12.731718
5394	thespiker	GET	/api/Customer		2025-05-07 09:05:12.757464
5410	thespiker	GET	/api/Customer		2025-05-07 09:05:12.789046
5423	thespiker	GET	/api/Customer		2025-05-07 09:05:12.800358
5452	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834169
5463	thespiker	GET	/api/Customer		2025-05-07 09:05:12.84177
5496	thespiker	GET	/api/Customer		2025-05-07 09:05:12.871119
5532	thespiker	GET	/api/Customer		2025-05-07 09:05:12.911713
5565	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935192
5576	thespiker	GET	/api/Customer		2025-05-07 09:05:12.966172
5687	thespiker	GET	/api/Customer		2025-05-07 09:05:13.406664
5695	thespiker	GET	/api/Customer		2025-05-07 09:05:12.553739
5735	thespiker	GET	/api/Customer		2025-05-07 09:05:13.508037
5756	thespiker	GET	/api/Customer		2025-05-07 09:05:13.543171
5766	thespiker	GET	/api/Customer		2025-05-07 09:05:13.581732
5802	thespiker	GET	/api/Customer		2025-05-07 09:05:12.761934
5907	thespiker	GET	/api/Customer		2025-05-07 09:05:13.763951
5961	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-07 09:11:37.255303
5962	Anonymous	POST	/login	{"username":"thespiker","password":"sdf"}	2025-05-07 09:11:45.265303
5963	Anonymous	POST	/login	{"username":"thespiker","password":"sdf"}	2025-05-07 09:11:46.898414
5964	Anonymous	POST	/login	{\n  "username": "thespiker",\n  "password": "df-"\n}	2025-05-07 09:11:58.132263
6239	thespiker	GET	/api/Payment		2025-05-07 10:07:55.195416
6240	thespiker	GET	/api/Loan		2025-05-07 10:07:56.401214
6249	thespiker	GET	/api/PaymentType		2025-05-07 10:07:56.782817
6253	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:08.645202
6255	thespiker	GET	/api/Payment		2025-05-07 10:08:16.513746
6260	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:21.823065
6265	thespiker	GET	/api/Customer		2025-05-07 10:08:26.094861
6269	thespiker	GET	/api/Loan		2025-05-07 10:08:26.293835
6277	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:26.944852
3821	thespiker	GET	/api/Customer		2025-05-07 09:00:56.738909
3894	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808112
4913	thespiker	GET	/api/Customer		2025-05-07 09:02:13.031951
4929	thespiker	GET	/api/Customer		2025-05-07 09:02:15.535463
4950	thespiker	GET	/api/Customer		2025-05-07 09:02:13.491851
5005	thespiker	GET	/api/Customer		2025-05-07 09:05:10.827957
5010	thespiker	GET	/api/Customer		2025-05-07 09:05:12.094849
5063	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916462
5061	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887266
5227	thespiker	GET	/api/Customer		2025-05-07 09:05:12.551646
5240	thespiker	GET	/api/Customer		2025-05-07 09:05:12.583859
5254	thespiker	GET	/api/Customer		2025-05-07 09:05:12.597482
5268	thespiker	GET	/api/Customer		2025-05-07 09:05:12.606773
5292	thespiker	GET	/api/Customer		2025-05-07 09:05:12.641135
5302	thespiker	GET	/api/Customer		2025-05-07 09:05:12.648653
5324	thespiker	GET	/api/Customer		2025-05-07 09:05:12.681694
5338	thespiker	GET	/api/Customer		2025-05-07 09:05:12.716085
5354	thespiker	GET	/api/Customer		2025-05-07 09:05:12.724692
5361	thespiker	GET	/api/Customer		2025-05-07 09:05:12.731718
5389	thespiker	GET	/api/Customer		2025-05-07 09:05:12.75687
5415	thespiker	GET	/api/Customer		2025-05-07 09:05:12.79467
5427	thespiker	GET	/api/Customer		2025-05-07 09:05:12.806049
5462	thespiker	GET	/api/Customer		2025-05-07 09:05:12.835303
5479	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861203
5563	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935192
5581	thespiker	GET	/api/Customer		2025-05-07 09:05:12.970897
5612	thespiker	GET	/api/Customer		2025-05-07 09:05:13.091729
5645	thespiker	GET	/api/Customer		2025-05-07 09:05:13.288041
5663	thespiker	GET	/api/Customer		2025-05-07 09:05:13.328596
5696	thespiker	GET	/api/Customer		2025-05-07 09:05:13.445573
5698	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758177
5742	thespiker	GET	/api/Customer		2025-05-07 09:05:13.516369
5775	thespiker	GET	/api/Customer		2025-05-07 09:05:13.597157
5824	thespiker	GET	/api/Customer		2025-05-07 09:05:12.759938
5858	thespiker	GET	/api/Customer		2025-05-07 09:05:13.705548
5882	thespiker	GET	/api/Customer		2025-05-07 09:05:13.735966
5924	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775448
5965	Anonymous	POST	/login	{\n  "username": "thespiker",\n  "password": "df-"\n}	2025-05-07 09:13:01.954918
5966	Anonymous	POST	/login	{"username":"thespiker","password":"sdf"}	2025-05-07 09:17:17.648547
5967	Anonymous	POST	/login	{"username":"dfdf","password":"df"}	2025-05-07 09:17:28.594343
5968	Anonymous	POST	/login	{"username":"dfdf","password":"df"}	2025-05-07 09:17:41.960109
5969	Anonymous	POST	/login	{"username":"dfdfdf","password":"df"}	2025-05-07 09:18:03.176177
6243	thespiker	GET	/api/Customer		2025-05-07 10:07:56.452184
6245	thespiker	GET	/api/LoanStatus		2025-05-07 10:07:56.636264
6252	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:08.623457
6258	thespiker	DELETE	/api/Payment/61		2025-05-07 10:08:21.284203
6259	thespiker	GET	/api/Payment		2025-05-07 10:08:21.327739
6263	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:23.988676
6264	thespiker	GET	/api/Payment		2025-05-07 10:08:26.094861
6268	thespiker	GET	/api/Customer		2025-05-07 10:08:26.289918
6273	thespiker	GET	/api/PaymentType		2025-05-07 10:08:26.459215
6274	thespiker	GET	/api/LoanType		2025-05-07 10:08:26.489319
6278	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:31.271584
3822	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739105
3880	thespiker	GET	/api/Customer		2025-05-07 09:00:56.799561
4919	thespiker	GET	/api/Customer		2025-05-07 09:02:12.404012
4951	thespiker	GET	/api/Customer		2025-05-07 09:02:13.391034
5007	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913437
5018	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914626
5039	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914662
5251	thespiker	GET	/api/Customer		2025-05-07 09:05:12.192667
5266	thespiker	GET	/api/Customer		2025-05-07 09:05:12.606773
5281	thespiker	GET	/api/Customer		2025-05-07 09:05:12.63269
5300	thespiker	GET	/api/Customer		2025-05-07 09:05:12.648622
5334	thespiker	GET	/api/Customer		2025-05-07 09:05:12.700268
5345	thespiker	GET	/api/Customer		2025-05-07 09:05:12.717412
5350	thespiker	GET	/api/Customer		2025-05-07 09:05:12.723384
5373	thespiker	GET	/api/Customer		2025-05-07 09:05:12.739069
5382	thespiker	GET	/api/Customer		2025-05-07 09:05:12.755677
5444	thespiker	GET	/api/Customer		2025-05-07 09:05:12.825445
5481	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861458
5498	thespiker	GET	/api/Customer		2025-05-07 09:05:12.872374
5539	thespiker	GET	/api/Customer		2025-05-07 09:05:12.926895
5550	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933165
5568	thespiker	GET	/api/Customer		2025-05-07 09:05:12.964347
5626	thespiker	GET	/api/Customer		2025-05-07 09:05:13.145375
5705	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758943
5719	thespiker	GET	/api/Customer		2025-05-07 09:05:13.493158
5730	thespiker	GET	/api/Customer		2025-05-07 09:05:13.504082
5748	thespiker	GET	/api/Customer		2025-05-07 09:05:13.523831
5825	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528514
5840	thespiker	GET	/api/Customer		2025-05-07 09:05:13.684344
5843	thespiker	GET	/api/Customer		2025-05-07 09:05:13.685665
5868	thespiker	GET	/api/Customer		2025-05-07 09:05:13.722957
5875	thespiker	GET	/api/Customer		2025-05-07 09:05:13.73372
5887	thespiker	GET	/api/Customer		2025-05-07 09:05:13.74105
5930	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794184
5970	Anonymous	POST	/login	{"username":"dfdfdf","password":"df"}	2025-05-07 09:18:06.618213
5971	Anonymous	POST	/login	{"username":"dfdfdf","password":"df"}	2025-05-07 09:18:07.094797
5972	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-07 09:18:45.076906
5973	thespiker	GET	/api/CustomerType		2025-05-07 09:18:48.559207
5974	thespiker	GET	/api/Customer		2025-05-07 09:18:48.569714
5975	thespiker	GET	/api/CustomerType		2025-05-07 09:18:48.625601
5976	thespiker	GET	/api/Customer		2025-05-07 09:18:48.73547
5977	thespiker	GET	/api/Position		2025-05-07 09:19:00.615984
5979	thespiker	GET	/api/Position		2025-05-07 09:19:00.755593
5980	thespiker	GET	/api/Employee		2025-05-07 09:19:00.759088
5981	thespiker	GET	/api/CustomerType		2025-05-07 09:19:04.604001
5983	thespiker	GET	/api/CustomerType		2025-05-07 09:19:04.665644
5985	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:19:06.078422
5986	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:19:06.732244
5987	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:19:10.681719
5988	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:19:40.634743
5989	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:02.195371
6247	thespiker	GET	/api/LoanType		2025-05-07 10:07:56.695947
6250	thespiker	POST	/api/Loan	{"amount":"12345","interestrate":"4","termmonths":"12","loantypeid":2,"statusid":3,"customerid":10,"creatintime":"2025-05-07T07:07:54.731Z","id":0}	2025-05-07 10:08:07.207765
6254	thespiker	POST	/api/Payment	{"loanId":38,"amount":2000,"paymentTypeId":4,"paymentdate":"2025-05-07"}	2025-05-07 10:08:16.469485
6256	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:17.43386
6261	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:21.831088
6266	thespiker	GET	/api/Payment		2025-05-07 10:08:26.1652
6271	thespiker	GET	/api/LoanType		2025-05-07 10:08:26.429768
6275	thespiker	GET	/api/PaymentType		2025-05-07 10:08:26.512718
6279	thespiker	GET	/api/PaymentSchedule/loan/38		2025-05-07 10:08:31.278801
3823	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739104
3890	thespiker	GET	/api/Customer		2025-05-07 09:00:56.807035
3927	thespiker	GET	/api/Customer		2025-05-07 09:00:56.846457
4921	thespiker	GET	/api/Customer		2025-05-07 09:02:12.404
4930	thespiker	GET	/api/Customer		2025-05-07 09:02:15.532067
4952	thespiker	GET	/api/Customer		2025-05-07 09:02:13.465774
5009	thespiker	GET	/api/Customer		2025-05-07 09:05:10.912008
5062	thespiker	GET	/api/Customer		2025-05-07 09:05:10.915343
5057	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917587
5276	thespiker	GET	/api/Customer		2025-05-07 09:05:12.198779
5284	thespiker	GET	/api/Customer		2025-05-07 09:05:12.632667
5311	thespiker	GET	/api/Customer		2025-05-07 09:05:12.666556
5340	thespiker	GET	/api/Customer		2025-05-07 09:05:12.716085
5352	thespiker	GET	/api/Customer		2025-05-07 09:05:12.724514
5366	thespiker	GET	/api/Customer		2025-05-07 09:05:12.733118
5378	thespiker	GET	/api/Customer		2025-05-07 09:05:12.754218
5413	thespiker	GET	/api/Customer		2025-05-07 09:05:12.786501
5418	thespiker	GET	/api/Customer		2025-05-07 09:05:12.799156
5443	thespiker	GET	/api/Customer		2025-05-07 09:05:12.824306
5470	thespiker	GET	/api/Customer		2025-05-07 09:05:12.854671
5472	thespiker	GET	/api/Customer		2025-05-07 09:05:12.858998
5554	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933197
5579	thespiker	GET	/api/Customer		2025-05-07 09:05:12.970897
5583	thespiker	GET	/api/Customer		2025-05-07 09:05:12.975202
5618	thespiker	GET	/api/Customer		2025-05-07 09:05:13.105988
5636	thespiker	GET	/api/Customer		2025-05-07 09:05:13.267755
5642	thespiker	GET	/api/Customer		2025-05-07 09:05:13.286733
5706	thespiker	GET	/api/Customer		2025-05-07 09:05:12.527275
5714	thespiker	GET	/api/Customer		2025-05-07 09:05:13.479957
5780	thespiker	GET	/api/Customer		2025-05-07 09:05:13.602225
5826	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937492
5835	thespiker	GET	/api/Customer		2025-05-07 09:05:13.675107
5859	thespiker	GET	/api/Customer		2025-05-07 09:05:13.705548
5906	thespiker	GET	/api/Customer		2025-05-07 09:05:13.763632
5921	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775236
5932	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794184
5941	thespiker	GET	/api/Customer		2025-05-07 09:05:13.80313
5978	thespiker	GET	/api/Employee		2025-05-07 09:19:00.616022
5982	thespiker	GET	/api/Customer		2025-05-07 09:19:04.604001
5984	thespiker	GET	/api/Customer		2025-05-07 09:19:04.668855
6282	thespiker	POST	/api/Loan	{"amount":"12345","interestrate":"3","termmonths":"12","loantypeid":2,"statusid":3,"customerid":10,"creatintime":"2025-05-07T07:08:26.042Z","id":0}	2025-05-07 10:09:26.500314
6283	thespiker	GET	/api/Loan		2025-05-07 10:09:27.747701
6284	thespiker	POST	/api/Payment	{"loanId":39,"amount":2233,"paymentTypeId":4,"paymentdate":"2025-05-07"}	2025-05-07 10:09:34.646261
6285	thespiker	GET	/api/Payment		2025-05-07 10:09:34.713493
6286	thespiker	GET	/api/PaymentSchedule/loan/39		2025-05-07 10:09:35.579596
6287	thespiker	GET	/api/PaymentSchedule/loan/39		2025-05-07 10:09:35.596764
6288	thespiker	DELETE	/api/Payment/62		2025-05-07 10:09:38.645293
6289	thespiker	GET	/api/Payment		2025-05-07 10:09:38.702962
6290	thespiker	GET	/api/PaymentSchedule/loan/39		2025-05-07 10:09:39.278026
6291	thespiker	GET	/api/PaymentSchedule/loan/39		2025-05-07 10:09:39.286893
3824	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739105
4918	thespiker	GET	/api/Customer		2025-05-07 09:02:12.403992
4953	thespiker	GET	/api/Customer		2025-05-07 09:02:13.485551
4978	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164508
5020	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888466
5029	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916741
5286	thespiker	GET	/api/Customer		2025-05-07 09:05:12.125534
5317	thespiker	GET	/api/Customer		2025-05-07 09:05:12.668288
5336	thespiker	GET	/api/Customer		2025-05-07 09:05:12.703165
5388	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756858
5398	thespiker	GET	/api/Customer		2025-05-07 09:05:12.781281
5407	thespiker	GET	/api/Customer		2025-05-07 09:05:12.787738
5419	thespiker	GET	/api/Customer		2025-05-07 09:05:12.799156
5449	thespiker	GET	/api/Customer		2025-05-07 09:05:12.827806
5456	thespiker	GET	/api/Customer		2025-05-07 09:05:12.83544
5490	thespiker	GET	/api/Customer		2025-05-07 09:05:12.863213
5516	thespiker	GET	/api/Customer		2025-05-07 09:05:12.89937
5541	thespiker	GET	/api/Customer		2025-05-07 09:05:12.928263
5569	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965095
5603	thespiker	GET	/api/Customer		2025-05-07 09:05:13.075383
5670	thespiker	GET	/api/Customer		2025-05-07 09:05:13.33866
5692	thespiker	GET	/api/Customer		2025-05-07 09:05:13.433676
5707	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540657
5731	thespiker	GET	/api/Customer		2025-05-07 09:05:13.505381
5762	thespiker	GET	/api/Customer		2025-05-07 09:05:13.567119
5786	thespiker	GET	/api/Customer		2025-05-07 09:05:13.616657
5815	thespiker	GET	/api/Customer		2025-05-07 09:05:13.659018
5834	thespiker	GET	/api/Customer		2025-05-07 09:05:13.675107
5827	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937491
5990	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:48.078158
5991	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:49.165392
5992	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:50.045348
5993	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:51.717188
5994	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:23:52.087159
5995	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:24:58.051806
5996	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:25:09.512175
5997	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:25:10.197592
5998	thespiker	GET	/api/Customer		2025-05-07 09:27:02.454037
5999	thespiker	GET	/api/Customer		2025-05-07 09:27:02.477013
6001	thespiker	GET	/api/CustomerType		2025-05-07 09:27:02.620903
6006	thespiker	GET	/api/Customer		2025-05-07 09:27:49.863917
6007	thespiker	GET	/api/Employee		2025-05-07 09:28:11.837579
6009	thespiker	GET	/api/Position		2025-05-07 09:28:11.899694
6010	thespiker	GET	/api/Employee		2025-05-07 09:28:11.930553
6011	thespiker	GET	/api/Position		2025-05-07 09:28:31.69272
6013	thespiker	GET	/api/Position		2025-05-07 09:28:31.796177
6292	thespiker	DELETE	/api/Loan/39		2025-05-07 10:11:16.885512
6293	thespiker	GET	/api/Loan		2025-05-07 10:11:18.108852
6294	thespiker	GET	/api/Customer		2025-05-07 10:11:24.881094
6297	thespiker	GET	/api/LoanStatus		2025-05-07 10:11:25.170528
3825	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739191
4914	thespiker	GET	/api/Customer		2025-05-07 09:02:12.403989
4954	thespiker	GET	/api/Customer		2025-05-07 09:02:13.486587
4979	thespiker	GET	/api/Customer		2025-05-07 09:05:10.886892
5060	thespiker	GET	/api/Customer		2025-05-07 09:05:10.886984
5035	thespiker	GET	/api/Customer		2025-05-07 09:05:10.827879
5298	thespiker	GET	/api/Customer		2025-05-07 09:05:12.195356
5346	thespiker	GET	/api/Customer		2025-05-07 09:05:12.722113
5360	thespiker	GET	/api/Customer		2025-05-07 09:05:12.730472
5393	thespiker	GET	/api/Customer		2025-05-07 09:05:12.757146
5417	thespiker	GET	/api/Customer		2025-05-07 09:05:12.799156
5434	thespiker	GET	/api/Customer		2025-05-07 09:05:12.81725
5440	thespiker	GET	/api/Customer		2025-05-07 09:05:12.823126
5454	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834285
5465	thespiker	GET	/api/Customer		2025-05-07 09:05:12.843745
5477	thespiker	GET	/api/Customer		2025-05-07 09:05:12.860935
5494	thespiker	GET	/api/Customer		2025-05-07 09:05:12.865123
5502	thespiker	GET	/api/Customer		2025-05-07 09:05:12.885872
5510	thespiker	GET	/api/Customer		2025-05-07 09:05:12.893534
5559	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934165
5572	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965095
5594	thespiker	GET	/api/Customer		2025-05-07 09:05:13.017552
5622	thespiker	GET	/api/Customer		2025-05-07 09:05:13.116055
5713	thespiker	GET	/api/Customer		2025-05-07 09:05:13.477412
5720	thespiker	GET	/api/Customer		2025-05-07 09:05:12.759938
5733	thespiker	GET	/api/Customer		2025-05-07 09:05:13.506653
5744	thespiker	GET	/api/Customer		2025-05-07 09:05:13.517262
5761	thespiker	GET	/api/Customer		2025-05-07 09:05:13.559265
5779	thespiker	GET	/api/Customer		2025-05-07 09:05:13.601148
5803	thespiker	GET	/api/Customer		2025-05-07 09:05:13.645036
5829	thespiker	GET	/api/Customer		2025-05-07 09:05:12.760867
5881	thespiker	GET	/api/Customer		2025-05-07 09:05:13.735966
5902	thespiker	GET	/api/Customer		2025-05-07 09:05:13.76019
5939	thespiker	GET	/api/Customer		2025-05-07 09:05:13.793351
5944	thespiker	GET	/api/Customer		2025-05-07 09:05:13.804269
6000	thespiker	GET	/api/CustomerType		2025-05-07 09:27:02.45889
6002	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:27:07.603604
6003	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:27:12.089567
6004	thespiker	POST	/api/Customer	{"name":"","dateofbirth":"","phone":"","type":""}	2025-05-07 09:27:25.495979
6005	thespiker	PUT	/api/Customer	{"name":"Customer_0","dateofbirth":"1990-01-01","phone":"+380999000000","type":"1","id":10}	2025-05-07 09:27:49.819845
6008	thespiker	GET	/api/Position		2025-05-07 09:28:11.837579
6012	thespiker	GET	/api/Employee		2025-05-07 09:28:31.692518
6014	thespiker	GET	/api/Employee		2025-05-07 09:28:31.82405
6015	thespiker	GET	/api/Position		2025-05-07 09:29:23.479166
6016	thespiker	GET	/api/Position		2025-05-07 09:29:23.486838
6018	thespiker	GET	/api/Employee		2025-05-07 09:29:23.534032
6022	thespiker	GET	/api/Payment		2025-05-07 09:33:15.86423
6024	thespiker	GET	/api/LoanStatus		2025-05-07 09:33:16.0688
6025	thespiker	GET	/api/LoanStatus		2025-05-07 09:33:16.191249
6026	thespiker	GET	/api/LoanType		2025-05-07 09:33:16.251982
6295	thespiker	GET	/api/Payment		2025-05-07 10:11:24.881094
6296	thespiker	GET	/api/Payment		2025-05-07 10:11:24.95952
6298	thespiker	GET	/api/Loan		2025-05-07 10:11:25.140789
6300	thespiker	GET	/api/Loan		2025-05-07 10:11:25.225496
6301	thespiker	GET	/api/LoanStatus		2025-05-07 10:11:25.393114
6302	thespiker	GET	/api/LoanType		2025-05-07 10:11:25.423142
6303	thespiker	GET	/api/LoanType		2025-05-07 10:11:25.443572
6304	thespiker	GET	/api/PaymentType		2025-05-07 10:11:25.450927
6305	thespiker	GET	/api/PaymentType		2025-05-07 10:11:25.472726
6306	thespiker	POST	/api/Loan	{"amount":"12233","interestrate":"3","termmonths":"12","loantypeid":2,"statusid":3,"customerid":10,"creatintime":"2025-05-07T07:11:24.819Z","id":0}	2025-05-07 10:11:36.966129
6307	thespiker	GET	/api/Loan		2025-05-07 10:11:37.071761
6308	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:38.147701
6309	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:38.167187
6310	thespiker	POST	/api/Payment	{"loanId":40,"amount":2233,"paymentTypeId":4,"paymentdate":"2025-05-07"}	2025-05-07 10:11:48.390557
6311	thespiker	GET	/api/Payment		2025-05-07 10:11:48.443812
6312	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:49.831182
6313	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:49.838533
6314	thespiker	DELETE	/api/Payment/63		2025-05-07 10:11:51.789942
3826	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739262
3866	thespiker	GET	/api/Customer		2025-05-07 09:00:56.772768
4916	thespiker	GET	/api/Customer		2025-05-07 09:02:12.404005
4955	thespiker	GET	/api/Customer		2025-05-07 09:02:13.328765
4981	thespiker	GET	/api/Customer		2025-05-07 09:05:10.828109
5024	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887473
5025	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914395
5370	thespiker	GET	/api/Customer		2025-05-07 09:05:12.737077
5383	thespiker	GET	/api/Customer		2025-05-07 09:05:12.755676
5442	thespiker	GET	/api/Customer		2025-05-07 09:05:12.824305
5453	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834164
5471	thespiker	GET	/api/Customer		2025-05-07 09:05:12.855709
5509	thespiker	GET	/api/Customer		2025-05-07 09:05:12.893534
5518	thespiker	GET	/api/Customer		2025-05-07 09:05:12.900712
5529	thespiker	GET	/api/Customer		2025-05-07 09:05:12.909188
5544	thespiker	GET	/api/Customer		2025-05-07 09:05:12.932114
5585	thespiker	GET	/api/Customer		2025-05-07 09:05:12.976872
5637	thespiker	GET	/api/Customer		2025-05-07 09:05:13.269048
5658	thespiker	GET	/api/Customer		2025-05-07 09:05:13.311393
5664	thespiker	GET	/api/Customer		2025-05-07 09:05:13.329659
5697	thespiker	GET	/api/Customer		2025-05-07 09:05:13.447684
5709	thespiker	GET	/api/Customer		2025-05-07 09:05:13.471648
5723	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937491
5729	thespiker	GET	/api/Customer		2025-05-07 09:05:13.50277
5784	thespiker	GET	/api/Customer		2025-05-07 09:05:13.610098
5830	thespiker	GET	/api/Customer		2025-05-07 09:05:12.761544
6017	thespiker	GET	/api/Employee		2025-05-07 09:29:23.479166
6019	thespiker	POST	/api/Employee	{"name":"dfdf","login":"fff","password":"Password1-","position":"1"}	2025-05-07 09:31:44.34532
6020	thespiker	GET	/api/Employee		2025-05-07 09:31:44.504774
6021	thespiker	GET	/api/Customer		2025-05-07 09:33:15.901733
6023	thespiker	GET	/api/Customer		2025-05-07 09:33:16.004475
6027	thespiker	GET	/api/Payment		2025-05-07 09:33:16.297194
6028	thespiker	GET	/api/Loan		2025-05-07 09:33:16.303216
6029	thespiker	GET	/api/LoanType		2025-05-07 09:33:16.313918
6030	thespiker	GET	/api/PaymentType		2025-05-07 09:33:16.349433
6031	thespiker	GET	/api/Loan		2025-05-07 09:33:16.355248
6032	thespiker	GET	/api/PaymentType		2025-05-07 09:33:16.409395
6299	thespiker	GET	/api/Customer		2025-05-07 10:11:25.140788
6315	thespiker	GET	/api/Payment		2025-05-07 10:11:51.817154
6316	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:52.336145
6317	thespiker	GET	/api/PaymentSchedule/loan/40		2025-05-07 10:11:52.343701
3827	thespiker	GET	/api/Customer		2025-05-07 09:00:56.739472
4912	thespiker	GET	/api/Customer		2025-05-07 09:02:12.40401
4958	thespiker	GET	/api/Customer		2025-05-07 09:02:13.486627
4980	thespiker	GET	/api/Customer		2025-05-07 09:05:10.827951
5059	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888931
5038	thespiker	GET	/api/Customer		2025-05-07 09:05:10.828364
5436	thespiker	GET	/api/Customer		2025-05-07 09:05:12.341234
5489	thespiker	GET	/api/Customer		2025-05-07 09:05:12.863067
5505	thespiker	GET	/api/Customer		2025-05-07 09:05:12.892448
5534	thespiker	GET	/api/Customer		2025-05-07 09:05:12.91213
5552	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933174
5582	thespiker	GET	/api/Customer		2025-05-07 09:05:12.972106
5619	thespiker	GET	/api/Customer		2025-05-07 09:05:13.11099
5625	thespiker	GET	/api/Customer		2025-05-07 09:05:13.134798
5639	thespiker	GET	/api/Customer		2025-05-07 09:05:13.275376
5725	thespiker	GET	/api/Customer		2025-05-07 09:05:12.761826
5746	thespiker	GET	/api/Customer		2025-05-07 09:05:13.521167
5820	thespiker	GET	/api/Customer		2025-05-07 09:05:13.665789
5831	thespiker	GET	/api/Customer		2025-05-07 09:05:12.762923
5893	thespiker	GET	/api/Customer		2025-05-07 09:05:13.750163
5900	thespiker	GET	/api/Customer		2025-05-07 09:05:13.751266
5920	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775235
5940	thespiker	GET	/api/Customer		2025-05-07 09:05:13.803059
6033	thespiker	GET	/api/Payment		2025-05-07 09:37:03.485087
6035	thespiker	GET	/api/Payment		2025-05-07 09:37:03.637673
6036	thespiker	GET	/api/Customer		2025-05-07 09:37:03.639948
6037	thespiker	GET	/api/Loan		2025-05-07 09:37:03.727642
6038	thespiker	GET	/api/Loan		2025-05-07 09:37:03.884419
6051	thespiker	GET	/api/Payment		2025-05-07 09:38:38.411952
6054	thespiker	GET	/api/LoanStatus		2025-05-07 09:38:38.536006
6056	thespiker	GET	/api/LoanStatus		2025-05-07 09:38:38.658589
6057	thespiker	GET	/api/LoanType		2025-05-07 09:38:38.665942
6058	thespiker	GET	/api/LoanType		2025-05-07 09:38:38.696182
6059	thespiker	GET	/api/PaymentType		2025-05-07 09:38:38.701624
6060	thespiker	GET	/api/PaymentType		2025-05-07 09:38:38.729072
6061	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:39.284248
6062	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:39.29251
6063	thespiker	PUT	/api/Loan	{"loantypeid":2,"statusid":3,"customerid":9,"creationTime":"2025-05-01","id":34,"amount":10000,"interestrate":5,"termmonths":"10","creatintime":"2025-05-07T06:38:40.871Z"}	2025-05-07 09:38:44.988178
6064	thespiker	GET	/api/Loan		2025-05-07 09:38:45.091629
6065	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:46.214744
6066	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:46.220817
6067	thespiker	PUT	/api/Loan	{"loantypeid":2,"statusid":3,"customerid":9,"creationTime":"2025-05-07","id":34,"amount":10000,"interestrate":5,"termmonths":"12","creatintime":"2025-05-07T06:38:48.632Z"}	2025-05-07 09:38:51.554995
6068	thespiker	GET	/api/Loan		2025-05-07 09:38:51.600033
6069	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:52.606245
6070	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:52.611547
6071	thespiker	PUT	/api/Payment	{"id":57,"paymentdate":"2025-05-09","amount":2333,"loanId":34,"paymentTypeId":3}	2025-05-07 09:39:06.922535
6076	thespiker	GET	/api/Payment		2025-05-07 09:39:11.286459
6077	thespiker	PUT	/api/Payment	{"id":57,"paymentdate":"2025-05-09","amount":2333,"loanId":34,"paymentTypeId":3}	2025-05-07 09:39:15.308148
6318	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-07 11:12:22.651173
6319	thespiker	GET	/api/Customer		2025-05-07 11:12:30.419266
6323	thespiker	GET	/api/CustomerType		2025-05-07 11:13:41.506196
6324	thespiker	GET	/api/Customer		2025-05-07 11:13:41.514645
6326	thespiker	GET	/api/Customer		2025-05-07 11:13:41.644675
6327	thespiker	GET	/api/Position		2025-05-07 11:13:46.344628
6330	thespiker	GET	/api/Employee		2025-05-07 11:13:46.457123
6335	test1	GET	/api/Customer		2025-05-07 11:14:07.331423
6337	test1	GET	/api/Customer		2025-05-07 11:14:07.368524
6338	test1	GET	/api/Position		2025-05-07 11:14:12.335667
6341	test1	GET	/api/Employee		2025-05-07 11:14:12.402062
6342	test1	GET	/api/backup/list		2025-05-07 11:14:48.19398
6344	test1	GET	/api/backup/list		2025-05-07 11:14:48.2514
6345	test1	GET	/api/UserLog/filter		2025-05-07 11:14:48.282405
6346	Anonymous	POST	/login	{"username":"thespiker","password":"Password1-"}	2025-05-07 11:15:05.662073
6348	thespiker	GET	/api/CustomerType		2025-05-07 11:15:08.041706
6349	thespiker	GET	/api/Customer		2025-05-07 11:15:08.107371
6354	thespiker	GET	/api/backup/list		2025-05-07 11:15:10.820232
6355	thespiker	GET	/api/backup/list		2025-05-07 11:15:10.894887
6357	thespiker	POST	/api/backup/create		2025-05-07 11:15:11.972454
3829	thespiker	GET	/api/Customer		2025-05-07 09:00:56.740292
3922	thespiker	GET	/api/Customer		2025-05-07 09:00:56.83956
4915	thespiker	GET	/api/Customer		2025-05-07 09:02:12.404007
4959	thespiker	GET	/api/Customer		2025-05-07 09:02:13.468844
4977	thespiker	GET	/api/Customer		2025-05-07 09:05:10.828409
5032	thespiker	GET	/api/Customer		2025-05-07 09:05:10.91419
5028	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913903
5474	thespiker	GET	/api/Customer		2025-05-07 09:05:12.859406
5506	thespiker	GET	/api/Customer		2025-05-07 09:05:12.892873
5528	thespiker	GET	/api/Customer		2025-05-07 09:05:12.905301
5543	thespiker	GET	/api/Customer		2025-05-07 09:05:12.931633
5727	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936394
5741	thespiker	GET	/api/Customer		2025-05-07 09:05:13.513222
5782	thespiker	GET	/api/Customer		2025-05-07 09:05:13.60754
5793	thespiker	GET	/api/Customer		2025-05-07 09:05:13.625042
5828	thespiker	GET	/api/Customer		2025-05-07 09:05:12.759938
5928	thespiker	GET	/api/Customer		2025-05-07 09:05:13.79303
5934	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794184
6034	thespiker	GET	/api/Customer		2025-05-07 09:37:03.485087
6050	thespiker	GET	/api/Payment		2025-05-07 09:38:38.3447
6053	thespiker	GET	/api/Loan		2025-05-07 09:38:38.448563
6320	thespiker	GET	/api/CustomerType		2025-05-07 11:12:30.41242
6321	thespiker	GET	/api/CustomerType		2025-05-07 11:12:30.565493
6322	thespiker	GET	/api/Customer		2025-05-07 11:12:30.584869
6325	thespiker	GET	/api/CustomerType		2025-05-07 11:13:41.58202
6328	thespiker	GET	/api/Employee		2025-05-07 11:13:46.344629
6329	thespiker	GET	/api/Position		2025-05-07 11:13:46.453833
6331	thespiker	PUT	/api/Employee	{"name":"test1","login":"test1","password":"Password1-","position":"3","id":6}	2025-05-07 11:13:55.760082
6332	thespiker	GET	/api/Employee		2025-05-07 11:13:56.090078
6333	Anonymous	POST	/login	{"username":"test1","password":"Password1-"}	2025-05-07 11:14:05.696091
6334	test1	GET	/api/CustomerType		2025-05-07 11:14:07.331431
6336	test1	GET	/api/CustomerType		2025-05-07 11:14:07.365148
6339	test1	GET	/api/Employee		2025-05-07 11:14:12.335079
6340	test1	GET	/api/Position		2025-05-07 11:14:12.398641
6343	test1	GET	/api/UserLog/filter		2025-05-07 11:14:48.194443
6347	thespiker	GET	/api/Customer		2025-05-07 11:15:08.039024
6350	thespiker	GET	/api/CustomerType		2025-05-07 11:15:08.107457
6351	thespiker	GET	/api/Settings/period		2025-05-07 11:15:09.833693
6352	thespiker	GET	/api/Settings/period		2025-05-07 11:15:09.844118
6353	thespiker	GET	/api/UserLog/filter		2025-05-07 11:15:10.820279
6356	thespiker	GET	/api/UserLog/filter		2025-05-07 11:15:10.997762
3830	thespiker	GET	/api/Customer		2025-05-07 09:00:56.74036
3870	thespiker	GET	/api/Customer		2025-05-07 09:00:56.77884
3906	thespiker	GET	/api/Customer		2025-05-07 09:00:56.830512
4920	thespiker	GET	/api/Customer		2025-05-07 09:02:12.403994
4928	thespiker	GET	/api/Customer		2025-05-07 09:02:15.535656
4935	thespiker	GET	/api/Customer		2025-05-07 09:02:15.683995
4960	thespiker	GET	/api/Customer		2025-05-07 09:02:13.489122
4985	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888185
5021	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887956
5037	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917803
5514	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526944
5530	thespiker	GET	/api/Customer		2025-05-07 09:05:12.910426
5566	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936424
5604	thespiker	GET	/api/Customer		2025-05-07 09:05:13.075074
5610	thespiker	GET	/api/Customer		2025-05-07 09:05:13.090331
5701	thespiker	GET	/api/Customer		2025-05-07 09:05:13.459176
5750	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758084
5760	thespiker	GET	/api/Customer		2025-05-07 09:05:13.555204
5817	thespiker	GET	/api/Customer		2025-05-07 09:05:13.660577
5851	thespiker	GET	/api/Customer		2025-05-07 09:05:13.694928
5841	thespiker	GET	/api/Customer		2025-05-07 09:05:12.760855
5894	thespiker	GET	/api/Customer		2025-05-07 09:05:13.750405
5923	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775236
5936	thespiker	GET	/api/Customer		2025-05-07 09:05:13.795256
6039	thespiker	GET	/api/LoanStatus		2025-05-07 09:37:03.81792
6040	thespiker	GET	/api/LoanStatus		2025-05-07 09:37:03.938242
6041	thespiker	GET	/api/LoanType		2025-05-07 09:37:03.972607
6042	thespiker	GET	/api/LoanType		2025-05-07 09:37:04.006257
6043	thespiker	GET	/api/PaymentType		2025-05-07 09:37:04.009863
6044	thespiker	GET	/api/PaymentType		2025-05-07 09:37:04.074332
6045	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:24.346991
6046	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:24.377783
6047	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:31.734192
6048	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:38:31.741263
6049	thespiker	GET	/api/Customer		2025-05-07 09:38:38.344461
6052	thespiker	GET	/api/Customer		2025-05-07 09:38:38.41641
6055	thespiker	GET	/api/Loan		2025-05-07 09:38:38.567873
6072	thespiker	GET	/api/Payment		2025-05-07 09:39:06.950356
6073	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:39:08.097409
6074	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:39:08.104534
6075	thespiker	DELETE	/api/Payment/57		2025-05-07 09:39:11.265441
3831	thespiker	GET	/api/Customer		2025-05-07 09:00:56.740497
4922	thespiker	GET	/api/Customer		2025-05-07 09:02:13.261647
4961	thespiker	GET	/api/Customer		2025-05-07 09:02:13.398018
4987	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164517
5026	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888475
5022	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916273
5027	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913087
5522	thespiker	GET	/api/Customer		2025-05-07 09:05:12.189022
5531	thespiker	GET	/api/Customer		2025-05-07 09:05:12.910425
5537	thespiker	GET	/api/Customer		2025-05-07 09:05:12.926895
5562	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935192
5593	thespiker	GET	/api/Customer		2025-05-07 09:05:13.009799
5616	thespiker	GET	/api/Customer		2025-05-07 09:05:13.105287
5635	thespiker	GET	/api/Customer		2025-05-07 09:05:13.262853
5754	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528515
5774	thespiker	GET	/api/Customer		2025-05-07 09:05:13.594849
5807	thespiker	GET	/api/Customer		2025-05-07 09:05:13.651399
5855	thespiker	GET	/api/Customer		2025-05-07 09:05:13.696167
5849	thespiker	GET	/api/Customer		2025-05-07 09:05:12.938507
5895	thespiker	GET	/api/Customer		2025-05-07 09:05:13.750405
5917	thespiker	GET	/api/Customer		2025-05-07 09:05:13.772049
5957	thespiker	GET	/api/Customer		2025-05-07 09:05:13.823176
6078	thespiker	GET	/api/Customer		2025-05-07 09:40:49.724152
6080	thespiker	GET	/api/Payment		2025-05-07 09:40:50.963894
6085	thespiker	GET	/api/LoanType		2025-05-07 09:40:51.231474
6089	thespiker	GET	/api/PaymentType		2025-05-07 09:40:51.352914
3832	thespiker	GET	/api/Customer		2025-05-07 09:00:56.740778
3861	thespiker	GET	/api/Customer		2025-05-07 09:00:56.771124
4923	thespiker	GET	/api/Customer		2025-05-07 09:02:13.284659
4934	thespiker	GET	/api/Customer		2025-05-07 09:02:15.68398
4962	thespiker	GET	/api/Customer		2025-05-07 09:02:13.467132
4988	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913421
4986	thespiker	GET	/api/Customer		2025-05-07 09:05:10.886921
4984	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913636
5013	thespiker	GET	/api/Customer		2025-05-07 09:05:12.111893
5034	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887328
5036	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916867
5524	thespiker	GET	/api/Customer		2025-05-07 09:05:12.903506
5561	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934269
5574	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965296
5577	thespiker	GET	/api/Customer		2025-05-07 09:05:12.968389
5587	thespiker	GET	/api/Customer		2025-05-07 09:05:12.982059
5611	thespiker	GET	/api/Customer		2025-05-07 09:05:13.090254
5641	thespiker	GET	/api/Customer		2025-05-07 09:05:13.281169
5676	thespiker	GET	/api/Customer		2025-05-07 09:05:13.354428
5712	thespiker	GET	/api/Customer		2025-05-07 09:05:13.478163
5721	thespiker	GET	/api/Customer		2025-05-07 09:05:13.496536
5755	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937492
5787	thespiker	GET	/api/Customer		2025-05-07 09:05:13.617513
5809	thespiker	GET	/api/Customer		2025-05-07 09:05:13.653814
5839	thespiker	GET	/api/Customer		2025-05-07 09:05:13.682998
5842	thespiker	GET	/api/Customer		2025-05-07 09:05:12.938503
5896	thespiker	GET	/api/Customer		2025-05-07 09:05:13.751266
5927	thespiker	GET	/api/Customer		2025-05-07 09:05:13.792011
5954	thespiker	GET	/api/Customer		2025-05-07 09:05:13.819091
6079	thespiker	GET	/api/Payment		2025-05-07 09:40:49.724149
6081	thespiker	GET	/api/Loan		2025-05-07 09:40:50.968062
6084	thespiker	GET	/api/LoanStatus		2025-05-07 09:40:51.225951
6088	thespiker	GET	/api/PaymentType		2025-05-07 09:40:51.330409
6092	thespiker	DELETE	/api/Loan/34		2025-05-07 09:41:01.249539
3828	thespiker	GET	/api/Customer		2025-05-07 09:00:56.7402
3860	thespiker	GET	/api/Customer		2025-05-07 09:00:56.771036
4926	thespiker	GET	/api/Customer		2025-05-07 09:02:13.284659
4933	thespiker	GET	/api/Customer		2025-05-07 09:02:15.55615
4957	thespiker	GET	/api/Customer		2025-05-07 09:02:17.414724
4963	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164496
4983	thespiker	GET	/api/Customer		2025-05-07 09:05:10.88902
5033	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917434
5030	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917555
5019	thespiker	GET	/api/Customer		2025-05-07 09:05:10.919785
5586	thespiker	GET	/api/Customer		2025-05-07 09:05:12.197051
5602	thespiker	GET	/api/Customer		2025-05-07 09:05:13.041363
5606	thespiker	GET	/api/Customer		2025-05-07 09:05:13.080423
5764	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936394
5805	thespiker	GET	/api/Customer		2025-05-07 09:05:13.649868
5848	thespiker	GET	/api/Customer		2025-05-07 09:05:12.760046
5885	thespiker	GET	/api/Customer		2025-05-07 09:05:13.740745
5949	thespiker	GET	/api/Customer		2025-05-07 09:05:13.808187
6082	thespiker	GET	/api/Customer		2025-05-07 09:40:51.008858
6086	thespiker	GET	/api/Loan		2025-05-07 09:40:51.266003
6087	thespiker	GET	/api/LoanType		2025-05-07 09:40:51.289562
6091	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:40:54.211077
3833	thespiker	GET	/api/Customer		2025-05-07 09:00:56.741426
3889	thespiker	GET	/api/Customer		2025-05-07 09:00:56.80706
3925	thespiker	GET	/api/Customer		2025-05-07 09:00:56.843912
4925	thespiker	GET	/api/Customer		2025-05-07 09:02:13.284659
4965	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164514
4993	thespiker	GET	/api/Customer		2025-05-07 09:05:10.919837
5023	thespiker	GET	/api/Customer		2025-05-07 09:05:10.912385
5064	thespiker	GET	/api/Customer		2025-05-07 09:05:12.277709
5071	thespiker	GET	/api/Customer		2025-05-07 09:05:12.378841
5078	thespiker	GET	/api/Customer		2025-05-07 09:05:12.388816
5097	thespiker	GET	/api/Customer		2025-05-07 09:05:12.405881
5104	thespiker	GET	/api/Customer		2025-05-07 09:05:12.414121
5111	thespiker	GET	/api/Customer		2025-05-07 09:05:12.43086
5129	thespiker	GET	/api/Customer		2025-05-07 09:05:12.44641
5140	thespiker	GET	/api/Customer		2025-05-07 09:05:12.474319
5144	thespiker	GET	/api/Customer		2025-05-07 09:05:12.477437
5154	thespiker	GET	/api/Customer		2025-05-07 09:05:12.488842
5176	thespiker	GET	/api/Customer		2025-05-07 09:05:12.500795
5187	thespiker	GET	/api/Customer		2025-05-07 09:05:12.519783
5191	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523785
5216	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550755
5236	thespiker	GET	/api/Customer		2025-05-07 09:05:12.582601
5252	thespiker	GET	/api/Customer		2025-05-07 09:05:12.594489
5263	thespiker	GET	/api/Customer		2025-05-07 09:05:12.604908
5289	thespiker	GET	/api/Customer		2025-05-07 09:05:12.639421
5322	thespiker	GET	/api/Customer		2025-05-07 09:05:12.668288
5330	thespiker	GET	/api/Customer		2025-05-07 09:05:12.699112
5341	thespiker	GET	/api/Customer		2025-05-07 09:05:12.71667
5353	thespiker	GET	/api/Customer		2025-05-07 09:05:12.724514
5385	thespiker	GET	/api/Customer		2025-05-07 09:05:12.755676
5408	thespiker	GET	/api/Customer		2025-05-07 09:05:12.789046
5441	thespiker	GET	/api/Customer		2025-05-07 09:05:12.823344
5451	thespiker	GET	/api/Customer		2025-05-07 09:05:12.833064
5501	thespiker	GET	/api/Customer		2025-05-07 09:05:12.875275
5519	thespiker	GET	/api/Customer		2025-05-07 09:05:12.901945
5538	thespiker	GET	/api/Customer		2025-05-07 09:05:12.926895
5547	thespiker	GET	/api/Customer		2025-05-07 09:05:12.932114
5573	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965255
5590	thespiker	GET	/api/Customer		2025-05-07 09:05:13.004308
5598	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526963
5607	thespiker	GET	/api/Customer		2025-05-07 09:05:13.081609
5613	thespiker	GET	/api/Customer		2025-05-07 09:05:13.099414
5638	thespiker	GET	/api/Customer		2025-05-07 09:05:13.274252
5651	thespiker	GET	/api/Customer		2025-05-07 09:05:13.296749
5659	thespiker	GET	/api/Customer		2025-05-07 09:05:13.31275
5673	thespiker	GET	/api/Customer		2025-05-07 09:05:13.348626
5681	thespiker	GET	/api/Customer		2025-05-07 09:05:13.366262
5690	thespiker	GET	/api/Customer		2025-05-07 09:05:13.42369
5765	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758943
5845	thespiker	GET	/api/Customer		2025-05-07 09:05:12.759938
5899	thespiker	GET	/api/Customer		2025-05-07 09:05:13.751297
5942	thespiker	GET	/api/Customer		2025-05-07 09:05:13.803444
5948	thespiker	GET	/api/Customer		2025-05-07 09:05:13.810926
6083	thespiker	GET	/api/LoanStatus		2025-05-07 09:40:51.012592
6090	thespiker	GET	/api/PaymentSchedule/loan/34		2025-05-07 09:40:54.166503
3834	thespiker	GET	/api/Customer		2025-05-07 09:00:56.741527
4924	thespiker	GET	/api/Customer		2025-05-07 09:02:13.285251
4974	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164511
4991	thespiker	GET	/api/Customer		2025-05-07 09:05:10.915819
5011	thespiker	GET	/api/Customer		2025-05-07 09:05:12.102589
5049	thespiker	GET	/api/Customer		2025-05-07 09:05:10.91439
5065	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917546
5601	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540476
5615	thespiker	GET	/api/Customer		2025-05-07 09:05:13.100815
5621	thespiker	GET	/api/Customer		2025-05-07 09:05:13.112852
5632	thespiker	GET	/api/Customer		2025-05-07 09:05:13.253629
5718	thespiker	GET	/api/Customer		2025-05-07 09:05:13.491293
5737	thespiker	GET	/api/Customer		2025-05-07 09:05:13.512168
5767	thespiker	GET	/api/Customer		2025-05-07 09:05:12.55369
5847	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528597
5929	thespiker	GET	/api/Customer		2025-05-07 09:05:13.79303
5956	thespiker	GET	/api/Customer		2025-05-07 09:05:13.821276
6093	thespiker	DELETE	/api/Loan/34		2025-05-07 09:46:05.515995
6094	thespiker	GET	/api/Loan		2025-05-07 09:46:07.052886
6095	thespiker	DELETE	/api/Loan/34		2025-05-07 09:46:07.216491
3836	thespiker	GET	/api/Customer		2025-05-07 09:00:56.741535
4927	thespiker	GET	/api/Customer		2025-05-07 09:02:13.285212
4966	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164521
4992	thespiker	GET	/api/Customer		2025-05-07 09:05:10.886924
5044	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913623
5066	thespiker	GET	/api/Customer		2025-05-07 09:05:12.316178
5072	thespiker	GET	/api/Customer		2025-05-07 09:05:12.378841
5080	thespiker	GET	/api/Customer		2025-05-07 09:05:12.390579
5085	thespiker	GET	/api/Customer		2025-05-07 09:05:12.394258
5087	thespiker	GET	/api/Customer		2025-05-07 09:05:12.397237
5090	thespiker	GET	/api/Customer		2025-05-07 09:05:12.400171
5096	thespiker	GET	/api/Customer		2025-05-07 09:05:12.404088
5098	thespiker	GET	/api/Customer		2025-05-07 09:05:12.408706
5112	thespiker	GET	/api/Customer		2025-05-07 09:05:12.43094
5114	thespiker	GET	/api/Customer		2025-05-07 09:05:12.435077
5120	thespiker	GET	/api/Customer		2025-05-07 09:05:12.438344
5126	thespiker	GET	/api/Customer		2025-05-07 09:05:12.446386
5138	thespiker	GET	/api/Customer		2025-05-07 09:05:12.456046
5156	thespiker	GET	/api/Customer		2025-05-07 09:05:12.490247
5163	thespiker	GET	/api/Customer		2025-05-07 09:05:12.492362
5166	thespiker	GET	/api/Customer		2025-05-07 09:05:12.49476
5172	thespiker	GET	/api/Customer		2025-05-07 09:05:12.499697
5186	thespiker	GET	/api/Customer		2025-05-07 09:05:12.518901
5189	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523748
5204	thespiker	GET	/api/Customer		2025-05-07 09:05:12.542158
5213	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550104
5233	thespiker	GET	/api/Customer		2025-05-07 09:05:12.577679
5244	thespiker	GET	/api/Customer		2025-05-07 09:05:12.586035
5260	thespiker	GET	/api/Customer		2025-05-07 09:05:12.605013
5271	thespiker	GET	/api/Customer		2025-05-07 09:05:12.617981
5277	thespiker	GET	/api/Customer		2025-05-07 09:05:12.63088
5309	thespiker	GET	/api/Customer		2025-05-07 09:05:12.664718
5319	thespiker	GET	/api/Customer		2025-05-07 09:05:12.670125
5333	thespiker	GET	/api/Customer		2025-05-07 09:05:12.699493
5337	thespiker	GET	/api/Customer		2025-05-07 09:05:12.703164
5376	thespiker	GET	/api/Customer		2025-05-07 09:05:12.752437
5395	thespiker	GET	/api/Customer		2025-05-07 09:05:12.757918
5399	thespiker	GET	/api/Customer		2025-05-07 09:05:12.785301
5416	thespiker	GET	/api/Customer		2025-05-07 09:05:12.795848
5439	thespiker	GET	/api/Customer		2025-05-07 09:05:12.823115
5484	thespiker	GET	/api/Customer		2025-05-07 09:05:12.862166
5513	thespiker	GET	/api/Customer		2025-05-07 09:05:12.894521
5558	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934162
5580	thespiker	GET	/api/Customer		2025-05-07 09:05:12.970897
5591	thespiker	GET	/api/Customer		2025-05-07 09:05:13.005865
5609	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528555
5629	thespiker	GET	/api/Customer		2025-05-07 09:05:13.244195
5650	thespiker	GET	/api/Customer		2025-05-07 09:05:13.296749
5665	thespiker	GET	/api/Customer		2025-05-07 09:05:13.329827
5666	thespiker	GET	/api/Customer		2025-05-07 09:05:13.330945
5672	thespiker	GET	/api/Customer		2025-05-07 09:05:13.343625
5674	thespiker	GET	/api/Customer		2025-05-07 09:05:13.349081
5680	thespiker	GET	/api/Customer		2025-05-07 09:05:13.363419
5716	thespiker	GET	/api/Customer		2025-05-07 09:05:13.489813
5717	thespiker	GET	/api/Customer		2025-05-07 09:05:13.490895
5736	thespiker	GET	/api/Customer		2025-05-07 09:05:13.511419
5770	thespiker	GET	/api/Customer		2025-05-07 09:05:13.590042
5769	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526959
5812	thespiker	GET	/api/Customer		2025-05-07 09:05:13.655434
5856	thespiker	GET	/api/Customer		2025-05-07 09:05:13.696166
5844	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528825
5892	thespiker	GET	/api/Customer		2025-05-07 09:05:13.750168
5915	thespiker	GET	/api/Customer		2025-05-07 09:05:13.771476
5933	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794184
5951	thespiker	GET	/api/Customer		2025-05-07 09:05:13.816548
5958	thespiker	GET	/api/Customer		2025-05-07 09:05:13.827329
6096	thespiker	POST	/api/Loan	{"amount":"12345","interestrate":"5","termmonths":"12","loantypeid":1,"statusid":1,"customerid":10,"creatintime":"2025-05-07T06:40:49.199Z","id":0}	2025-05-07 09:48:48.585275
6097	thespiker	GET	/api/Loan		2025-05-07 09:48:50.375427
6098	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:48:53.641623
6099	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:48:53.680467
6100	thespiker	POST	/api/Payment	{"loanId":35,"amount":2000,"paymentTypeId":3,"paymentdate":"2025-05-07"}	2025-05-07 09:49:07.415245
6101	thespiker	GET	/api/Payment		2025-05-07 09:49:07.468202
6102	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:08.75524
6103	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:08.765584
6104	thespiker	PUT	/api/Loan	{"loantypeid":1,"statusid":1,"customerid":10,"creationTime":"2025-05-07","id":35,"amount":"4000","interestrate":5,"termmonths":12,"creatintime":"2025-05-07T06:49:14.386Z"}	2025-05-07 09:49:25.919334
6105	thespiker	GET	/api/Loan		2025-05-07 09:49:26.111404
6106	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:27.796577
6107	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:27.805922
6108	thespiker	GET	/api/Customer		2025-05-07 09:49:31.030292
6109	thespiker	GET	/api/Customer		2025-05-07 09:49:31.088133
6112	thespiker	GET	/api/LoanStatus		2025-05-07 09:49:31.241646
6114	thespiker	GET	/api/Payment		2025-05-07 09:49:31.301642
6118	thespiker	GET	/api/PaymentType		2025-05-07 09:49:31.39129
6119	thespiker	GET	/api/PaymentType		2025-05-07 09:49:31.447453
6120	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:32.208116
6121	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:32.218363
6122	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:33.482014
6123	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:33.488499
6124	thespiker	PUT	/api/Payment	{"id":58,"paymentdate":"2025-05-07","amount":2200,"loanId":35,"paymentTypeId":3}	2025-05-07 09:49:51.243655
3835	thespiker	GET	/api/Customer		2025-05-07 09:00:56.741674
3919	thespiker	GET	/api/Customer		2025-05-07 09:00:56.839565
4931	thespiker	GET	/api/Customer		2025-05-07 09:02:13.41492
4956	thespiker	GET	/api/Customer		2025-05-07 09:02:17.135317
4967	thespiker	GET	/api/Customer		2025-05-07 09:05:10.668998
4990	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888178
5031	thespiker	GET	/api/Customer		2025-05-07 09:05:10.979343
5067	thespiker	GET	/api/Customer		2025-05-07 09:05:12.339554
5081	thespiker	GET	/api/Customer		2025-05-07 09:05:12.390697
5094	thespiker	GET	/api/Customer		2025-05-07 09:05:12.404088
5109	thespiker	GET	/api/Customer		2025-05-07 09:05:12.43002
5115	thespiker	GET	/api/Customer		2025-05-07 09:05:12.43677
5148	thespiker	GET	/api/Customer		2025-05-07 09:05:12.479214
5169	thespiker	GET	/api/Customer		2025-05-07 09:05:12.497928
5203	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526897
5206	thespiker	GET	/api/Customer		2025-05-07 09:05:12.543633
5209	thespiker	GET	/api/Customer		2025-05-07 09:05:12.549136
5221	thespiker	GET	/api/Customer		2025-05-07 09:05:12.551982
5231	thespiker	GET	/api/Customer		2025-05-07 09:05:12.562813
5241	thespiker	GET	/api/Customer		2025-05-07 09:05:12.58413
5264	thespiker	GET	/api/Customer		2025-05-07 09:05:12.604908
5278	thespiker	GET	/api/Customer		2025-05-07 09:05:12.631098
5293	thespiker	GET	/api/Customer		2025-05-07 09:05:12.64095
5305	thespiker	GET	/api/Customer		2025-05-07 09:05:12.659844
5316	thespiker	GET	/api/Customer		2025-05-07 09:05:12.668291
5384	thespiker	GET	/api/Customer		2025-05-07 09:05:12.755676
5412	thespiker	GET	/api/Customer		2025-05-07 09:05:12.790378
5447	thespiker	GET	/api/Customer		2025-05-07 09:05:12.826543
5504	thespiker	GET	/api/Customer		2025-05-07 09:05:12.892448
5521	thespiker	GET	/api/Customer		2025-05-07 09:05:12.902411
5560	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934146
5578	thespiker	GET	/api/Customer		2025-05-07 09:05:12.970897
5589	thespiker	GET	/api/Customer		2025-05-07 09:05:12.982583
5617	thespiker	GET	/api/Customer		2025-05-07 09:05:13.105705
5627	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528594
5649	thespiker	GET	/api/Customer		2025-05-07 09:05:13.29586
5656	thespiker	GET	/api/Customer		2025-05-07 09:05:13.311393
5703	thespiker	GET	/api/Customer		2025-05-07 09:05:13.463021
5745	thespiker	GET	/api/Customer		2025-05-07 09:05:13.517465
5778	thespiker	GET	/api/Customer		2025-05-07 09:05:13.600462
5768	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937491
5791	thespiker	GET	/api/Customer		2025-05-07 09:05:13.621676
5836	thespiker	GET	/api/Customer		2025-05-07 09:05:13.67627
5837	thespiker	GET	/api/Customer		2025-05-07 09:05:13.676494
5846	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936403
5908	thespiker	GET	/api/Customer		2025-05-07 09:05:13.764379
5959	thespiker	GET	/api/Customer		2025-05-07 09:05:13.827329
6110	thespiker	GET	/api/Payment		2025-05-07 09:49:31.030683
6111	thespiker	GET	/api/LoanStatus		2025-05-07 09:49:31.162444
6113	thespiker	GET	/api/LoanType		2025-05-07 09:49:31.256011
6115	thespiker	GET	/api/LoanType		2025-05-07 09:49:31.309912
6116	thespiker	GET	/api/Loan		2025-05-07 09:49:31.318643
6117	thespiker	GET	/api/Loan		2025-05-07 09:49:31.355057
6125	thespiker	GET	/api/Payment		2025-05-07 09:49:51.269351
6126	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:52.987326
6127	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:52.993601
6128	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:56.67234
6129	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:49:56.679747
3837	thespiker	GET	/api/Customer		2025-05-07 09:00:56.76132
3862	thespiker	GET	/api/Customer		2025-05-07 09:00:56.771504
3887	thespiker	GET	/api/Customer		2025-05-07 09:00:56.801911
4932	thespiker	GET	/api/Customer		2025-05-07 09:02:13.271895
4970	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164494
4994	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916657
5045	thespiker	GET	/api/Customer		2025-05-07 09:05:10.886892
5068	thespiker	GET	/api/Customer		2025-05-07 09:05:12.339554
5075	thespiker	GET	/api/Customer		2025-05-07 09:05:12.383918
5077	thespiker	GET	/api/Customer		2025-05-07 09:05:12.387361
5086	thespiker	GET	/api/Customer		2025-05-07 09:05:12.396096
5095	thespiker	GET	/api/Customer		2025-05-07 09:05:12.404088
5099	thespiker	GET	/api/Customer		2025-05-07 09:05:12.410333
5108	thespiker	GET	/api/Customer		2025-05-07 09:05:12.429307
5122	thespiker	GET	/api/Customer		2025-05-07 09:05:12.440117
5134	thespiker	GET	/api/Customer		2025-05-07 09:05:12.449328
5146	thespiker	GET	/api/Customer		2025-05-07 09:05:12.479042
5157	thespiker	GET	/api/Customer		2025-05-07 09:05:12.490732
5170	thespiker	GET	/api/Customer		2025-05-07 09:05:12.499175
5178	thespiker	GET	/api/Customer		2025-05-07 09:05:12.510471
5182	thespiker	GET	/api/Customer		2025-05-07 09:05:12.515761
5196	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525279
5215	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550342
5229	thespiker	GET	/api/Customer		2025-05-07 09:05:12.55998
5234	thespiker	GET	/api/Customer		2025-05-07 09:05:12.579295
5257	thespiker	GET	/api/Customer		2025-05-07 09:05:12.602996
5283	thespiker	GET	/api/Customer		2025-05-07 09:05:12.632667
5307	thespiker	GET	/api/Customer		2025-05-07 09:05:12.65988
5377	thespiker	GET	/api/Customer		2025-05-07 09:05:12.754219
5400	thespiker	GET	/api/Customer		2025-05-07 09:05:12.786359
5411	thespiker	GET	/api/Customer		2025-05-07 09:05:12.790378
5426	thespiker	GET	/api/Customer		2025-05-07 09:05:12.804612
5482	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861966
5520	thespiker	GET	/api/Customer		2025-05-07 09:05:12.901945
5526	thespiker	GET	/api/Customer		2025-05-07 09:05:12.905873
5557	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934121
5571	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965096
5628	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526897
5657	thespiker	GET	/api/Customer		2025-05-07 09:05:13.311392
5678	thespiker	GET	/api/Customer		2025-05-07 09:05:13.355935
5686	thespiker	GET	/api/Customer		2025-05-07 09:05:13.40042
5691	thespiker	GET	/api/Customer		2025-05-07 09:05:13.425267
5710	thespiker	GET	/api/Customer		2025-05-07 09:05:13.476215
5724	thespiker	GET	/api/Customer		2025-05-07 09:05:13.498273
5743	thespiker	GET	/api/Customer		2025-05-07 09:05:13.517214
5753	thespiker	GET	/api/Customer		2025-05-07 09:05:13.534361
5763	thespiker	GET	/api/Customer		2025-05-07 09:05:13.574346
5781	thespiker	GET	/api/Customer		2025-05-07 09:05:12.55536
5804	thespiker	GET	/api/Customer		2025-05-07 09:05:13.649868
5857	thespiker	GET	/api/Customer		2025-05-07 09:05:12.761826
5869	thespiker	GET	/api/Customer		2025-05-07 09:05:13.723315
5876	thespiker	GET	/api/Customer		2025-05-07 09:05:13.733948
5888	thespiker	GET	/api/Customer		2025-05-07 09:05:13.749479
5914	thespiker	GET	/api/Customer		2025-05-07 09:05:13.771477
5938	thespiker	GET	/api/Customer		2025-05-07 09:05:13.795255
6130	thespiker	DELETE	/api/Payment/58		2025-05-07 09:59:47.018766
6131	thespiker	GET	/api/Payment		2025-05-07 09:59:48.472715
6132	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:59:50.759761
6133	thespiker	GET	/api/PaymentSchedule/loan/35		2025-05-07 09:59:50.822413
6134	thespiker	DELETE	/api/Loan/35		2025-05-07 09:59:54.760096
6135	thespiker	GET	/api/Loan		2025-05-07 09:59:54.813561
6136	thespiker	POST	/api/Loan	{"amount":"10000","interestrate":"4","termmonths":"12","loantypeid":1,"statusid":3,"customerid":9,"creatintime":"2025-05-07T06:49:30.969Z","id":0}	2025-05-07 10:00:07.581013
6137	thespiker	GET	/api/Loan		2025-05-07 10:00:07.660847
6138	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:00:11.395544
6139	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:00:11.40491
6140	thespiker	PUT	/api/Payment	{"id":58,"paymentdate":"2025-05-07","amount":2200,"loanId":36,"paymentTypeId":3}	2025-05-07 10:00:16.472217
3839	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761234
3896	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808199
4937	thespiker	GET	/api/Customer		2025-05-07 09:02:13.284787
4973	thespiker	GET	/api/Customer		2025-05-07 09:05:10.916572
4997	thespiker	GET	/api/Customer		2025-05-07 09:05:10.840967
5043	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888791
5069	thespiker	GET	/api/Customer		2025-05-07 09:05:12.34598
5074	thespiker	GET	/api/Customer		2025-05-07 09:05:12.383918
5088	thespiker	GET	/api/Customer		2025-05-07 09:05:12.398501
5093	thespiker	GET	/api/Customer		2025-05-07 09:05:12.402056
5113	thespiker	GET	/api/Customer		2025-05-07 09:05:12.432401
5119	thespiker	GET	/api/Customer		2025-05-07 09:05:12.438277
5149	thespiker	GET	/api/Customer		2025-05-07 09:05:12.479833
5165	thespiker	GET	/api/Customer		2025-05-07 09:05:12.493122
5179	thespiker	GET	/api/Customer		2025-05-07 09:05:12.510466
5193	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523794
5205	thespiker	GET	/api/Customer		2025-05-07 09:05:12.542158
5224	thespiker	GET	/api/Customer		2025-05-07 09:05:12.553661
5247	thespiker	GET	/api/Customer		2025-05-07 09:05:12.584334
5273	thespiker	GET	/api/Customer		2025-05-07 09:05:12.61989
5280	thespiker	GET	/api/Customer		2025-05-07 09:05:12.631351
5297	thespiker	GET	/api/Customer		2025-05-07 09:05:12.644273
5325	thespiker	GET	/api/Customer		2025-05-07 09:05:12.682393
5332	thespiker	GET	/api/Customer		2025-05-07 09:05:12.699489
5348	thespiker	GET	/api/Customer		2025-05-07 09:05:12.723363
5369	thespiker	GET	/api/Customer		2025-05-07 09:05:12.73725
5396	thespiker	GET	/api/Customer		2025-05-07 09:05:12.757918
5403	thespiker	GET	/api/Customer		2025-05-07 09:05:12.786644
5420	thespiker	GET	/api/Customer		2025-05-07 09:05:12.800154
5432	thespiker	GET	/api/Customer		2025-05-07 09:05:12.807208
5448	thespiker	GET	/api/Customer		2025-05-07 09:05:12.82654
5483	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861919
5511	thespiker	GET	/api/Customer		2025-05-07 09:05:12.894532
5553	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933173
5588	thespiker	GET	/api/Customer		2025-05-07 09:05:12.981714
5597	thespiker	GET	/api/Customer		2025-05-07 09:05:13.028709
5630	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528581
5634	thespiker	GET	/api/Customer		2025-05-07 09:05:13.259745
5640	thespiker	GET	/api/Customer		2025-05-07 09:05:13.281242
5677	thespiker	GET	/api/Customer		2025-05-07 09:05:13.354428
5751	thespiker	GET	/api/Customer		2025-05-07 09:05:13.528148
5773	thespiker	GET	/api/Customer		2025-05-07 09:05:13.594849
5776	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937537
5814	thespiker	GET	/api/Customer		2025-05-07 09:05:13.658108
5853	thespiker	GET	/api/Customer		2025-05-07 09:05:13.694852
5861	thespiker	GET	/api/Customer		2025-05-07 09:05:12.761827
5889	thespiker	GET	/api/Customer		2025-05-07 09:05:13.749433
5945	thespiker	GET	/api/Customer		2025-05-07 09:05:13.804269
6141	thespiker	GET	/api/Customer		2025-05-07 10:01:04.123323
6144	thespiker	GET	/api/Payment		2025-05-07 10:01:05.44527
6147	thespiker	GET	/api/LoanStatus		2025-05-07 10:01:05.68259
6151	thespiker	GET	/api/PaymentType		2025-05-07 10:01:05.747586
6154	thespiker	GET	/api/Payment		2025-05-07 10:01:20.017967
6161	thespiker	PUT	/api/Payment	{"id":59,"paymentdate":"2025-07-06","amount":3000,"loanId":36,"paymentTypeId":4}	2025-05-07 10:01:39.774762
6164	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:40.536259
6168	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:46.136643
6170	thespiker	GET	/api/Customer		2025-05-07 10:01:48.659327
6172	thespiker	GET	/api/Loan		2025-05-07 10:01:48.818648
6178	thespiker	GET	/api/LoanType		2025-05-07 10:01:49.102936
6182	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:49.471071
6187	thespiker	GET	/api/Payment		2025-05-07 10:02:31.324004
6193	thespiker	GET	/api/Loan		2025-05-07 10:02:31.730163
6197	thespiker	GET	/api/PaymentType		2025-05-07 10:02:31.870794
6201	thespiker	DELETE	/api/Payment/59		2025-05-07 10:02:35.402707
6203	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:36.088316
3841	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761234
3879	thespiker	GET	/api/Customer		2025-05-07 09:00:56.799535
4938	thespiker	GET	/api/Customer		2025-05-07 09:02:13.39405
4968	thespiker	GET	/api/Customer		2025-05-07 09:05:10.813053
5000	thespiker	GET	/api/Customer		2025-05-07 09:05:10.919291
5050	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888897
5070	thespiker	GET	/api/Customer		2025-05-07 09:05:12.353384
5083	thespiker	GET	/api/Customer		2025-05-07 09:05:12.392417
5124	thespiker	GET	/api/Customer		2025-05-07 09:05:12.441854
5128	thespiker	GET	/api/Customer		2025-05-07 09:05:12.447422
5136	thespiker	GET	/api/Customer		2025-05-07 09:05:12.451187
5142	thespiker	GET	/api/Customer		2025-05-07 09:05:12.477442
5151	thespiker	GET	/api/Customer		2025-05-07 09:05:12.480534
5159	thespiker	GET	/api/Customer		2025-05-07 09:05:12.491219
5171	thespiker	GET	/api/Customer		2025-05-07 09:05:12.499679
5183	thespiker	GET	/api/Customer		2025-05-07 09:05:12.516619
5198	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525356
5214	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550349
5235	thespiker	GET	/api/Customer		2025-05-07 09:05:12.581007
5245	thespiker	GET	/api/Customer		2025-05-07 09:05:12.587774
5261	thespiker	GET	/api/Customer		2025-05-07 09:05:12.605111
5275	thespiker	GET	/api/Customer		2025-05-07 09:05:12.621499
5294	thespiker	GET	/api/Customer		2025-05-07 09:05:12.64095
5301	thespiker	GET	/api/Customer		2025-05-07 09:05:12.648625
5365	thespiker	GET	/api/Customer		2025-05-07 09:05:12.732773
5379	thespiker	GET	/api/Customer		2025-05-07 09:05:12.754224
5433	thespiker	GET	/api/Customer		2025-05-07 09:05:12.807208
5455	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834235
5469	thespiker	GET	/api/Customer		2025-05-07 09:05:12.853754
5488	thespiker	GET	/api/Customer		2025-05-07 09:05:12.863212
5512	thespiker	GET	/api/Customer		2025-05-07 09:05:12.894521
5525	thespiker	GET	/api/Customer		2025-05-07 09:05:12.90486
5536	thespiker	GET	/api/Customer		2025-05-07 09:05:12.913301
5551	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933161
5631	thespiker	GET	/api/Customer		2025-05-07 09:05:13.245721
5647	thespiker	GET	/api/Customer		2025-05-07 09:05:13.288041
5643	thespiker	GET	/api/Customer		2025-05-07 09:05:12.527161
5662	thespiker	GET	/api/Customer		2025-05-07 09:05:13.322551
5671	thespiker	GET	/api/Customer		2025-05-07 09:05:13.339954
5704	thespiker	GET	/api/Customer		2025-05-07 09:05:13.463737
5715	thespiker	GET	/api/Customer		2025-05-07 09:05:13.480262
5726	thespiker	GET	/api/Customer		2025-05-07 09:05:13.499525
5752	thespiker	GET	/api/Customer		2025-05-07 09:05:13.532654
5777	thespiker	GET	/api/Customer		2025-05-07 09:05:12.938501
5818	thespiker	GET	/api/Customer		2025-05-07 09:05:13.662974
5860	thespiker	GET	/api/Customer		2025-05-07 09:05:13.705548
5862	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540657
5867	thespiker	GET	/api/Customer		2025-05-07 09:05:13.713149
5877	thespiker	GET	/api/Customer		2025-05-07 09:05:13.733948
5883	thespiker	GET	/api/Customer		2025-05-07 09:05:13.737366
5884	thespiker	GET	/api/Customer		2025-05-07 09:05:13.73891
5891	thespiker	GET	/api/Customer		2025-05-07 09:05:13.750163
5905	thespiker	GET	/api/Customer		2025-05-07 09:05:13.762427
5909	thespiker	GET	/api/Customer		2025-05-07 09:05:13.764932
5918	thespiker	GET	/api/Customer		2025-05-07 09:05:13.772568
5943	thespiker	GET	/api/Customer		2025-05-07 09:05:13.803059
6142	thespiker	GET	/api/Payment		2025-05-07 10:01:04.123319
6143	thespiker	GET	/api/Loan		2025-05-07 10:01:05.447958
6148	thespiker	GET	/api/Loan		2025-05-07 10:01:05.692678
6152	thespiker	GET	/api/PaymentType		2025-05-07 10:01:05.793254
6155	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:21.152055
6158	thespiker	GET	/api/Loan		2025-05-07 10:01:29.015999
6165	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:44.876466
6169	thespiker	GET	/api/Payment		2025-05-07 10:01:48.659175
6174	thespiker	GET	/api/Loan		2025-05-07 10:01:48.879218
6179	thespiker	GET	/api/PaymentType		2025-05-07 10:01:49.122293
6183	thespiker	PUT	/api/Payment	{"id":59,"paymentdate":"2025-07-06","amount":5000,"loanId":36,"paymentTypeId":4}	2025-05-07 10:02:27.704002
6184	thespiker	GET	/api/Payment		2025-05-07 10:02:27.723939
6188	thespiker	GET	/api/Customer		2025-05-07 10:02:31.394393
6189	thespiker	GET	/api/Payment		2025-05-07 10:02:31.468999
6192	thespiker	GET	/api/LoanStatus		2025-05-07 10:02:31.57153
6195	thespiker	GET	/api/LoanType		2025-05-07 10:02:31.804358
6199	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:32.613823
3842	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761627
3883	thespiker	GET	/api/Customer		2025-05-07 09:00:56.800513
3902	thespiker	GET	/api/Customer		2025-05-07 09:00:56.800183
4939	thespiker	GET	/api/Customer		2025-05-07 09:02:13.328765
4972	thespiker	GET	/api/Customer		2025-05-07 09:05:10.918893
4999	thespiker	GET	/api/Customer		2025-05-07 09:05:10.919781
5052	thespiker	GET	/api/Customer		2025-05-07 09:05:10.918469
5073	thespiker	GET	/api/Customer		2025-05-07 09:05:12.380697
5076	thespiker	GET	/api/Customer		2025-05-07 09:05:12.385656
5091	thespiker	GET	/api/Customer		2025-05-07 09:05:12.402061
5100	thespiker	GET	/api/Customer		2025-05-07 09:05:12.412906
5105	thespiker	GET	/api/Customer		2025-05-07 09:05:12.425667
5118	thespiker	GET	/api/Customer		2025-05-07 09:05:12.438296
5130	thespiker	GET	/api/Customer		2025-05-07 09:05:12.447422
5161	thespiker	GET	/api/Customer		2025-05-07 09:05:12.491646
5199	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525385
5219	thespiker	GET	/api/Customer		2025-05-07 09:05:12.551646
5226	thespiker	GET	/api/Customer		2025-05-07 09:05:12.553049
5238	thespiker	GET	/api/Customer		2025-05-07 09:05:12.584352
5248	thespiker	GET	/api/Customer		2025-05-07 09:05:12.589635
5255	thespiker	GET	/api/Customer		2025-05-07 09:05:12.597727
5258	thespiker	GET	/api/Customer		2025-05-07 09:05:12.602945
5310	thespiker	GET	/api/Customer		2025-05-07 09:05:12.665068
5327	thespiker	GET	/api/Customer		2025-05-07 09:05:12.693625
5335	thespiker	GET	/api/Customer		2025-05-07 09:05:12.703164
5351	thespiker	GET	/api/Customer		2025-05-07 09:05:12.723364
5363	thespiker	GET	/api/Customer		2025-05-07 09:05:12.731718
5372	thespiker	GET	/api/Customer		2025-05-07 09:05:12.73846
5386	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756177
5401	thespiker	GET	/api/Customer		2025-05-07 09:05:12.786627
5424	thespiker	GET	/api/Customer		2025-05-07 09:05:12.801539
5446	thespiker	GET	/api/Customer		2025-05-07 09:05:12.825445
5468	thespiker	GET	/api/Customer		2025-05-07 09:05:12.853105
5486	thespiker	GET	/api/Customer		2025-05-07 09:05:12.862753
5500	thespiker	GET	/api/Customer		2025-05-07 09:05:12.875275
5503	thespiker	GET	/api/Customer		2025-05-07 09:05:12.892074
5533	thespiker	GET	/api/Customer		2025-05-07 09:05:12.912168
5542	thespiker	GET	/api/Customer		2025-05-07 09:05:12.929564
5592	thespiker	GET	/api/Customer		2025-05-07 09:05:13.005998
5620	thespiker	GET	/api/Customer		2025-05-07 09:05:13.112556
5644	thespiker	GET	/api/Customer		2025-05-07 09:05:12.528597
5654	thespiker	GET	/api/Customer		2025-05-07 09:05:13.306809
5660	thespiker	GET	/api/Customer		2025-05-07 09:05:13.321097
5749	thespiker	GET	/api/Customer		2025-05-07 09:05:13.52731
5759	thespiker	GET	/api/Customer		2025-05-07 09:05:13.553465
5789	thespiker	GET	/api/Customer		2025-05-07 09:05:12.526936
5798	thespiker	GET	/api/Customer		2025-05-07 09:05:13.633933
5806	thespiker	GET	/api/Customer		2025-05-07 09:05:13.651042
5850	thespiker	GET	/api/Customer		2025-05-07 09:05:13.695021
5864	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758947
5878	thespiker	GET	/api/Customer		2025-05-07 09:05:13.734869
5904	thespiker	GET	/api/Customer		2025-05-07 09:05:13.762426
5953	thespiker	GET	/api/Customer		2025-05-07 09:05:13.818633
6145	thespiker	GET	/api/LoanStatus		2025-05-07 10:01:05.497628
6150	thespiker	GET	/api/LoanType		2025-05-07 10:01:05.725752
6157	thespiker	PUT	/api/Loan	{"loantypeid":1,"statusid":3,"customerid":9,"creationTime":"2025-05-07","id":36,"amount":"7000","interestrate":4,"termmonths":12,"creatintime":"2025-05-07T07:01:24.855Z"}	2025-05-07 10:01:28.855459
6160	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:29.912093
6163	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:40.525969
6167	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:46.105185
6173	thespiker	GET	/api/Customer		2025-05-07 10:01:48.851369
6176	thespiker	GET	/api/LoanStatus		2025-05-07 10:01:49.065717
6180	thespiker	GET	/api/PaymentType		2025-05-07 10:01:49.15522
6185	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:28.604743
6190	thespiker	GET	/api/Loan		2025-05-07 10:02:31.499985
6194	thespiker	GET	/api/LoanStatus		2025-05-07 10:02:31.798281
6198	thespiker	GET	/api/PaymentType		2025-05-07 10:02:31.905363
6204	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:36.098967
3843	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761968
4940	thespiker	GET	/api/Customer		2025-05-07 09:02:13.389207
4971	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164505
5004	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888947
5012	thespiker	GET	/api/Customer		2025-05-07 09:05:12.105924
5054	thespiker	GET	/api/Customer		2025-05-07 09:05:10.920019
5079	thespiker	GET	/api/Customer		2025-05-07 09:05:12.388751
5101	thespiker	GET	/api/Customer		2025-05-07 09:05:12.413567
5117	thespiker	GET	/api/Customer		2025-05-07 09:05:12.438306
5132	thespiker	GET	/api/Customer		2025-05-07 09:05:12.448073
5139	thespiker	GET	/api/Customer		2025-05-07 09:05:12.456045
5141	thespiker	GET	/api/Customer		2025-05-07 09:05:12.476307
5155	thespiker	GET	/api/Customer		2025-05-07 09:05:12.489852
5162	thespiker	GET	/api/Customer		2025-05-07 09:05:12.492195
5173	thespiker	GET	/api/Customer		2025-05-07 09:05:12.4997
5181	thespiker	GET	/api/Customer		2025-05-07 09:05:12.515761
5197	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525278
5225	thespiker	GET	/api/Customer		2025-05-07 09:05:12.55536
5239	thespiker	GET	/api/Customer		2025-05-07 09:05:12.58413
5262	thespiker	GET	/api/Customer		2025-05-07 09:05:12.604992
5291	thespiker	GET	/api/Customer		2025-05-07 09:05:12.640242
5299	thespiker	GET	/api/Customer		2025-05-07 09:05:12.646797
5326	thespiker	GET	/api/Customer		2025-05-07 09:05:12.692091
5343	thespiker	GET	/api/Customer		2025-05-07 09:05:12.716085
5409	thespiker	GET	/api/Customer		2025-05-07 09:05:12.789046
5422	thespiker	GET	/api/Customer		2025-05-07 09:05:12.800339
5429	thespiker	GET	/api/Customer		2025-05-07 09:05:12.806049
5437	thespiker	GET	/api/Customer		2025-05-07 09:05:12.821838
5445	thespiker	GET	/api/Customer		2025-05-07 09:05:12.825555
5450	thespiker	GET	/api/Customer		2025-05-07 09:05:12.833064
5487	thespiker	GET	/api/Customer		2025-05-07 09:05:12.86286
5499	thespiker	GET	/api/Customer		2025-05-07 09:05:12.875275
5515	thespiker	GET	/api/Customer		2025-05-07 09:05:12.89937
5540	thespiker	GET	/api/Customer		2025-05-07 09:05:12.928263
5564	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935192
5624	thespiker	GET	/api/Customer		2025-05-07 09:05:13.127216
5646	thespiker	GET	/api/Customer		2025-05-07 09:05:13.288041
5648	thespiker	GET	/api/Customer		2025-05-07 09:05:13.295244
5668	thespiker	GET	/api/Customer		2025-05-07 09:05:13.33641
5683	thespiker	GET	/api/Customer		2025-05-07 09:05:13.371491
5699	thespiker	GET	/api/Customer		2025-05-07 09:05:13.455619
5738	thespiker	GET	/api/Customer		2025-05-07 09:05:13.512168
5757	thespiker	GET	/api/Customer		2025-05-07 09:05:13.54882
5758	thespiker	GET	/api/Customer		2025-05-07 09:05:13.54882
5772	thespiker	GET	/api/Customer		2025-05-07 09:05:13.590052
5771	thespiker	GET	/api/Customer		2025-05-07 09:05:13.590002
5790	thespiker	GET	/api/Customer		2025-05-07 09:05:12.937491
5810	thespiker	GET	/api/Customer		2025-05-07 09:05:13.654054
5838	thespiker	GET	/api/Customer		2025-05-07 09:05:13.680066
5865	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540657
5897	thespiker	GET	/api/Customer		2025-05-07 09:05:13.751266
5947	thespiker	GET	/api/Customer		2025-05-07 09:05:13.810926
5950	thespiker	GET	/api/Customer		2025-05-07 09:05:13.814437
6146	thespiker	GET	/api/Customer		2025-05-07 10:01:05.49419
6149	thespiker	GET	/api/LoanType		2025-05-07 10:01:05.701043
6153	thespiker	POST	/api/Payment	{"loanId":36,"amount":2000,"paymentTypeId":4,"paymentdate":"2025-07-06"}	2025-05-07 10:01:19.887308
6156	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:21.171605
6159	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:29.90077
6162	thespiker	GET	/api/Payment		2025-05-07 10:01:39.805703
6166	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:44.885566
6171	thespiker	GET	/api/Payment		2025-05-07 10:01:48.729525
6175	thespiker	GET	/api/LoanStatus		2025-05-07 10:01:48.881268
6177	thespiker	GET	/api/LoanType		2025-05-07 10:01:49.095358
6181	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:01:49.457386
6186	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:28.613955
6191	thespiker	GET	/api/Customer		2025-05-07 10:02:31.565579
6196	thespiker	GET	/api/LoanType		2025-05-07 10:02:31.834068
6200	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:02:32.622307
6202	thespiker	GET	/api/Payment		2025-05-07 10:02:35.438963
3844	thespiker	GET	/api/Customer		2025-05-07 09:00:56.76248
3885	thespiker	GET	/api/Customer		2025-05-07 09:00:56.799535
4941	thespiker	GET	/api/Customer		2025-05-07 09:02:13.487157
4969	thespiker	GET	/api/Customer		2025-05-07 09:05:10.827879
4996	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164499
5051	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913661
5082	thespiker	GET	/api/Customer		2025-05-07 09:05:12.390466
5092	thespiker	GET	/api/Customer		2025-05-07 09:05:12.402065
5106	thespiker	GET	/api/Customer		2025-05-07 09:05:12.429067
5123	thespiker	GET	/api/Customer		2025-05-07 09:05:12.440117
5125	thespiker	GET	/api/Customer		2025-05-07 09:05:12.444559
5137	thespiker	GET	/api/Customer		2025-05-07 09:05:12.451187
5145	thespiker	GET	/api/Customer		2025-05-07 09:05:12.478005
5152	thespiker	GET	/api/Customer		2025-05-07 09:05:12.480742
5158	thespiker	GET	/api/Customer		2025-05-07 09:05:12.490726
5177	thespiker	GET	/api/Customer		2025-05-07 09:05:12.510464
5185	thespiker	GET	/api/Customer		2025-05-07 09:05:12.517496
5194	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523799
5222	thespiker	GET	/api/Customer		2025-05-07 09:05:12.5521
5228	thespiker	GET	/api/Customer		2025-05-07 09:05:12.559056
5237	thespiker	GET	/api/Customer		2025-05-07 09:05:12.582875
5246	thespiker	GET	/api/Customer		2025-05-07 09:05:12.587771
5259	thespiker	GET	/api/Customer		2025-05-07 09:05:12.603893
5306	thespiker	GET	/api/Customer		2025-05-07 09:05:12.659844
5318	thespiker	GET	/api/Customer		2025-05-07 09:05:12.670125
5356	thespiker	GET	/api/Customer		2025-05-07 09:05:12.725655
5368	thespiker	GET	/api/Customer		2025-05-07 09:05:12.735509
5374	thespiker	GET	/api/Customer		2025-05-07 09:05:12.739746
5391	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756864
5405	thespiker	GET	/api/Customer		2025-05-07 09:05:12.787738
5421	thespiker	GET	/api/Customer		2025-05-07 09:05:12.800292
5431	thespiker	GET	/api/Customer		2025-05-07 09:05:12.807208
5458	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834165
5467	thespiker	GET	/api/Customer		2025-05-07 09:05:12.844145
5480	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861227
5507	thespiker	GET	/api/Customer		2025-05-07 09:05:12.892677
5523	thespiker	GET	/api/Customer		2025-05-07 09:05:12.903506
5556	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934047
5570	thespiker	GET	/api/Customer		2025-05-07 09:05:12.965095
5599	thespiker	GET	/api/Customer		2025-05-07 09:05:13.034465
5605	thespiker	GET	/api/Customer		2025-05-07 09:05:13.076452
5653	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758381
5679	thespiker	GET	/api/Customer		2025-05-07 09:05:13.360683
5684	thespiker	GET	/api/Customer		2025-05-07 09:05:13.391559
5688	thespiker	GET	/api/Customer		2025-05-07 09:05:13.406664
5693	thespiker	GET	/api/Customer		2025-05-07 09:05:13.434739
5708	thespiker	GET	/api/Customer		2025-05-07 09:05:13.470212
5783	thespiker	GET	/api/Customer		2025-05-07 09:05:13.60754
5794	thespiker	GET	/api/Customer		2025-05-07 09:05:13.625299
5792	thespiker	GET	/api/Customer		2025-05-07 09:05:12.758943
5808	thespiker	GET	/api/Customer		2025-05-07 09:05:13.653814
5823	thespiker	GET	/api/Customer		2025-05-07 09:05:13.666162
5832	thespiker	GET	/api/Customer		2025-05-07 09:05:13.673926
5854	thespiker	GET	/api/Customer		2025-05-07 09:05:13.695059
5866	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935213
5880	thespiker	GET	/api/Customer		2025-05-07 09:05:13.734861
5890	thespiker	GET	/api/Customer		2025-05-07 09:05:13.740745
5903	thespiker	GET	/api/Customer		2025-05-07 09:05:13.762426
5925	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775236
5935	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794185
5955	thespiker	GET	/api/Customer		2025-05-07 09:05:13.819915
6205	thespiker	GET	/api/Payment		2025-05-07 10:03:49.851495
6208	thespiker	GET	/api/Customer		2025-05-07 10:03:51.356078
6213	thespiker	GET	/api/LoanType		2025-05-07 10:03:51.528249
6217	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:03:53.026699
6223	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:13.748975
6229	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:25.148796
3845	thespiker	GET	/api/Customer		2025-05-07 09:00:56.762481
4942	thespiker	GET	/api/Customer		2025-05-07 09:02:13.398018
4964	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164503
5001	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887969
5056	thespiker	GET	/api/Customer		2025-05-07 09:05:10.918469
5084	thespiker	GET	/api/Customer		2025-05-07 09:05:12.392417
5103	thespiker	GET	/api/Customer		2025-05-07 09:05:12.42487
5107	thespiker	GET	/api/Customer		2025-05-07 09:05:12.429072
5116	thespiker	GET	/api/Customer		2025-05-07 09:05:12.436777
5131	thespiker	GET	/api/Customer		2025-05-07 09:05:12.448073
5150	thespiker	GET	/api/Customer		2025-05-07 09:05:12.480486
5164	thespiker	GET	/api/Customer		2025-05-07 09:05:12.493122
5168	thespiker	GET	/api/Customer		2025-05-07 09:05:12.498199
5201	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525475
5208	thespiker	GET	/api/Customer		2025-05-07 09:05:12.545436
5218	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550761
5230	thespiker	GET	/api/Customer		2025-05-07 09:05:12.562032
5249	thespiker	GET	/api/Customer		2025-05-07 09:05:12.591898
5256	thespiker	GET	/api/Customer		2025-05-07 09:05:12.597482
5269	thespiker	GET	/api/Customer		2025-05-07 09:05:12.606779
5285	thespiker	GET	/api/Customer		2025-05-07 09:05:12.634314
5313	thespiker	GET	/api/Customer		2025-05-07 09:05:12.666649
5323	thespiker	GET	/api/Customer		2025-05-07 09:05:12.677265
5387	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756401
5402	thespiker	GET	/api/Customer		2025-05-07 09:05:12.786647
5460	thespiker	GET	/api/Customer		2025-05-07 09:05:12.834732
5473	thespiker	GET	/api/Customer		2025-05-07 09:05:12.859346
5493	thespiker	GET	/api/Customer		2025-05-07 09:05:12.864005
5555	thespiker	GET	/api/Customer		2025-05-07 09:05:12.934136
5567	thespiker	GET	/api/Customer		2025-05-07 09:05:12.964148
5655	thespiker	GET	/api/Customer		2025-05-07 09:05:13.307098
5661	thespiker	GET	/api/Customer		2025-05-07 09:05:13.321749
5669	thespiker	GET	/api/Customer		2025-05-07 09:05:12.757918
5702	thespiker	GET	/api/Customer		2025-05-07 09:05:13.461126
5795	thespiker	GET	/api/Customer		2025-05-07 09:05:12.938302
5800	thespiker	GET	/api/Customer		2025-05-07 09:05:13.636267
5852	thespiker	GET	/api/Customer		2025-05-07 09:05:13.694995
5870	thespiker	GET	/api/Customer		2025-05-07 09:05:13.726363
5871	thespiker	GET	/api/Customer		2025-05-07 09:05:12.938501
5886	thespiker	GET	/api/Customer		2025-05-07 09:05:13.740745
5901	thespiker	GET	/api/Customer		2025-05-07 09:05:13.752568
5912	thespiker	GET	/api/Customer		2025-05-07 09:05:13.770247
5919	thespiker	GET	/api/Customer		2025-05-07 09:05:13.77524
6206	thespiker	GET	/api/Customer		2025-05-07 10:03:49.851492
6207	thespiker	GET	/api/Loan		2025-05-07 10:03:51.303685
6212	thespiker	GET	/api/LoanStatus		2025-05-07 10:03:51.510575
6216	thespiker	GET	/api/PaymentType		2025-05-07 10:03:51.637021
6221	thespiker	POST	/api/Loan	{"amount":"12345","interestrate":"4","termmonths":"21","loantypeid":2,"statusid":3,"customerid":10,"creatintime":"2025-05-07T07:03:49.346Z","id":0}	2025-05-07 10:04:11.230144
6222	thespiker	GET	/api/Loan		2025-05-07 10:04:11.352434
6228	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:22.184929
6234	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:30.708337
3850	thespiker	GET	/api/Customer		2025-05-07 09:00:56.762481
3859	thespiker	GET	/api/Customer		2025-05-07 09:00:56.769513
3873	thespiker	GET	/api/Customer		2025-05-07 09:00:56.776659
3876	thespiker	GET	/api/Customer		2025-05-07 09:00:56.79852
3882	thespiker	GET	/api/Customer		2025-05-07 09:00:56.800426
3893	thespiker	GET	/api/Customer		2025-05-07 09:00:56.807611
3901	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808198
3920	thespiker	GET	/api/Customer		2025-05-07 09:00:56.83956
3923	thespiker	GET	/api/Customer		2025-05-07 09:00:56.83956
3939	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731017
3945	thespiker	GET	/api/Customer		2025-05-07 09:01:25.164066
3956	thespiker	GET	/api/Customer		2025-05-07 09:01:25.172644
3978	thespiker	GET	/api/Customer		2025-05-07 09:01:25.24009
3987	thespiker	GET	/api/Customer		2025-05-07 09:01:24.450664
4001	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
4007	thespiker	GET	/api/Customer		2025-05-07 09:01:25.265523
4029	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291667
4032	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292032
4039	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292841
4057	thespiker	GET	/api/Customer		2025-05-07 09:01:24.413226
4058	thespiker	GET	/api/Customer		2025-05-07 09:01:25.319319
4064	thespiker	GET	/api/Customer		2025-05-07 09:01:25.323904
4077	thespiker	GET	/api/Customer		2025-05-07 09:01:25.344913
4078	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345102
4080	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345012
4099	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346656
4085	thespiker	GET	/api/Customer		2025-05-07 09:01:24.450882
4121	thespiker	GET	/api/Customer		2025-05-07 09:01:24.411091
4123	thespiker	GET	/api/Customer		2025-05-07 09:01:25.38356
4125	thespiker	GET	/api/Customer		2025-05-07 09:01:25.38356
4151	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452469
4148	thespiker	GET	/api/Customer		2025-05-07 09:01:24.412982
4168	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452608
4175	thespiker	GET	/api/Customer		2025-05-07 09:01:24.414096
4279	thespiker	GET	/api/Customer		2025-05-07 09:01:25.71929
4287	thespiker	GET	/api/Customer		2025-05-07 09:01:25.724064
4297	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7427
4307	thespiker	GET	/api/Customer		2025-05-07 09:01:25.745846
4327	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7692
4341	thespiker	GET	/api/Customer		2025-05-07 09:01:25.781892
4355	thespiker	GET	/api/Customer		2025-05-07 09:01:25.786428
4397	thespiker	GET	/api/Customer		2025-05-07 09:01:25.853772
4433	thespiker	GET	/api/Customer		2025-05-07 09:01:25.893488
4447	thespiker	GET	/api/Customer		2025-05-07 09:01:25.903225
4473	thespiker	GET	/api/Customer		2025-05-07 09:01:25.93255
4493	thespiker	GET	/api/Customer		2025-05-07 09:01:25.948484
4520	thespiker	GET	/api/Customer		2025-05-07 09:01:25.973368
4527	thespiker	GET	/api/Customer		2025-05-07 09:01:26.01235
4557	thespiker	GET	/api/Customer		2025-05-07 09:01:26.045764
4595	thespiker	GET	/api/Customer		2025-05-07 09:01:26.076665
4601	thespiker	GET	/api/Customer		2025-05-07 09:01:26.086365
4615	thespiker	GET	/api/Customer		2025-05-07 09:01:26.099211
4620	thespiker	GET	/api/Customer		2025-05-07 09:01:26.108877
4618	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4632	thespiker	GET	/api/Customer		2025-05-07 09:01:26.114294
4688	thespiker	GET	/api/Customer		2025-05-07 09:01:26.168764
4708	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177416
4733	thespiker	GET	/api/Customer		2025-05-07 09:01:26.201711
4736	thespiker	GET	/api/Customer		2025-05-07 09:01:26.206173
4774	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237612
4776	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237863
4787	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239888
4791	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236573
4802	thespiker	GET	/api/Customer		2025-05-07 09:01:26.25406
4811	thespiker	GET	/api/Customer		2025-05-07 09:01:26.257246
4812	thespiker	GET	/api/Customer		2025-05-07 09:01:26.257237
4825	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298244
4835	thespiker	GET	/api/Customer		2025-05-07 09:01:26.300348
4851	thespiker	GET	/api/Customer		2025-05-07 09:01:26.300208
4853	thespiker	GET	/api/Customer		2025-05-07 09:01:26.377564
4859	thespiker	GET	/api/Customer		2025-05-07 09:01:26.385716
4866	thespiker	GET	/api/Customer		2025-05-07 09:01:26.257247
4867	thespiker	GET	/api/Customer		2025-05-07 09:01:26.465142
4875	thespiker	GET	/api/Customer		2025-05-07 09:01:26.481892
4879	thespiker	GET	/api/Customer		2025-05-07 09:01:26.484513
4884	thespiker	GET	/api/Customer		2025-05-07 09:01:26.500098
4887	thespiker	GET	/api/Customer		2025-05-07 09:01:26.505832
4889	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255274
4897	thespiker	GET	/api/Customer		2025-05-07 09:01:26.524926
4898	thespiker	GET	/api/Customer		2025-05-07 09:01:26.241966
4902	thespiker	GET	/api/Customer		2025-05-07 09:01:26.529817
4904	thespiker	GET	/api/Customer		2025-05-07 09:01:26.534356
4905	thespiker	GET	/api/Customer		2025-05-07 09:01:26.536639
4908	thespiker	GET	/api/Customer		2025-05-07 09:01:26.542
4910	thespiker	GET	/api/Customer		2025-05-07 09:01:26.551612
4943	thespiker	GET	/api/Customer		2025-05-07 09:02:13.271895
4975	thespiker	GET	/api/Customer		2025-05-07 09:05:10.91854
4998	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888511
5047	thespiker	GET	/api/Customer		2025-05-07 09:05:10.915764
5089	thespiker	GET	/api/Customer		2025-05-07 09:05:12.398715
5102	thespiker	GET	/api/Customer		2025-05-07 09:05:12.413577
5110	thespiker	GET	/api/Customer		2025-05-07 09:05:12.43086
5121	thespiker	GET	/api/Customer		2025-05-07 09:05:12.440117
5127	thespiker	GET	/api/Customer		2025-05-07 09:05:12.446386
5133	thespiker	GET	/api/Customer		2025-05-07 09:05:12.449328
5147	thespiker	GET	/api/Customer		2025-05-07 09:05:12.479042
5153	thespiker	GET	/api/Customer		2025-05-07 09:05:12.485283
5174	thespiker	GET	/api/Customer		2025-05-07 09:05:12.497928
5195	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523805
5210	thespiker	GET	/api/Customer		2025-05-07 09:05:12.549131
5250	thespiker	GET	/api/Customer		2025-05-07 09:05:12.591898
5253	thespiker	GET	/api/Customer		2025-05-07 09:05:12.596123
5265	thespiker	GET	/api/Customer		2025-05-07 09:05:12.605334
5279	thespiker	GET	/api/Customer		2025-05-07 09:05:12.630923
5304	thespiker	GET	/api/Customer		2025-05-07 09:05:12.659534
5320	thespiker	GET	/api/Customer		2025-05-07 09:05:12.671851
5364	thespiker	GET	/api/Customer		2025-05-07 09:05:12.732586
3840	thespiker	GET	/api/Customer		2025-05-07 09:00:56.761234
4945	thespiker	GET	/api/Customer		2025-05-07 09:02:13.48773
4982	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887571
5003	thespiker	GET	/api/Customer		2025-05-07 09:05:10.915216
5055	thespiker	GET	/api/Customer		2025-05-07 09:05:10.919782
5135	thespiker	GET	/api/Customer		2025-05-07 09:05:12.449457
5143	thespiker	GET	/api/Customer		2025-05-07 09:05:12.477743
5167	thespiker	GET	/api/Customer		2025-05-07 09:05:12.497928
5184	thespiker	GET	/api/Customer		2025-05-07 09:05:12.517459
5190	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523748
5217	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550761
5274	thespiker	GET	/api/Customer		2025-05-07 09:05:12.619864
5321	thespiker	GET	/api/Customer		2025-05-07 09:05:12.6725
5328	thespiker	GET	/api/Customer		2025-05-07 09:05:12.680598
5339	thespiker	GET	/api/Customer		2025-05-07 09:05:12.716086
5359	thespiker	GET	/api/Customer		2025-05-07 09:05:12.730776
5371	thespiker	GET	/api/Customer		2025-05-07 09:05:12.73846
5390	thespiker	GET	/api/Customer		2025-05-07 09:05:12.756858
5414	thespiker	GET	/api/Customer		2025-05-07 09:05:12.794539
5425	thespiker	GET	/api/Customer		2025-05-07 09:05:12.802027
5459	thespiker	GET	/api/Customer		2025-05-07 09:05:12.836748
5485	thespiker	GET	/api/Customer		2025-05-07 09:05:12.862324
5546	thespiker	GET	/api/Customer		2025-05-07 09:05:12.932114
5600	thespiker	GET	/api/Customer		2025-05-07 09:05:13.040999
5682	thespiker	GET	/api/Customer		2025-05-07 09:05:12.540663
5711	thespiker	GET	/api/Customer		2025-05-07 09:05:13.478163
5722	thespiker	GET	/api/Customer		2025-05-07 09:05:13.496547
5732	thespiker	GET	/api/Customer		2025-05-07 09:05:13.506653
5788	thespiker	GET	/api/Customer		2025-05-07 09:05:13.619943
5796	thespiker	GET	/api/Customer		2025-05-07 09:05:12.76085
5863	thespiker	GET	/api/Customer		2025-05-07 09:05:13.707821
5873	thespiker	GET	/api/Customer		2025-05-07 09:05:12.760858
5879	thespiker	GET	/api/Customer		2025-05-07 09:05:13.734872
5911	thespiker	GET	/api/Customer		2025-05-07 09:05:13.770247
5931	thespiker	GET	/api/Customer		2025-05-07 09:05:13.794185
5952	thespiker	GET	/api/Customer		2025-05-07 09:05:13.816927
6209	thespiker	GET	/api/LoanStatus		2025-05-07 10:03:51.361597
6211	thespiker	GET	/api/Loan		2025-05-07 10:03:51.500103
6215	thespiker	GET	/api/PaymentType		2025-05-07 10:03:51.605136
6219	thespiker	DELETE	/api/Loan/36		2025-05-07 10:03:58.227579
6220	thespiker	GET	/api/Loan		2025-05-07 10:03:58.292287
6225	thespiker	POST	/api/Payment	{"loanId":37,"amount":3000,"paymentTypeId":3,"paymentdate":"2025-05-07"}	2025-05-07 10:04:21.544865
6227	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:22.176516
6231	thespiker	DELETE	/api/Payment/60		2025-05-07 10:04:30.097961
6233	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:30.694751
3849	thespiker	GET	/api/Customer		2025-05-07 09:00:56.765557
3863	thespiker	GET	/api/Customer		2025-05-07 09:00:56.771491
3877	thespiker	GET	/api/Customer		2025-05-07 09:00:56.799535
3903	thespiker	GET	/api/Customer		2025-05-07 09:00:56.816586
3928	thespiker	GET	/api/Customer		2025-05-07 09:00:56.848445
3940	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731011
3959	thespiker	GET	/api/Customer		2025-05-07 09:01:25.174539
3969	thespiker	GET	/api/Customer		2025-05-07 09:01:25.235634
3990	thespiker	GET	/api/Customer		2025-05-07 09:01:24.448467
4004	thespiker	GET	/api/Customer		2025-05-07 09:01:25.259866
3993	thespiker	GET	/api/Customer		2025-05-07 09:01:24.449822
4005	thespiker	GET	/api/Customer		2025-05-07 09:01:25.264101
4008	thespiker	GET	/api/Customer		2025-05-07 09:01:25.266055
4014	thespiker	GET	/api/Customer		2025-05-07 09:01:25.28981
4025	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291698
4045	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293576
4055	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408047
4075	thespiker	GET	/api/Customer		2025-05-07 09:01:25.344498
4093	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346341
4098	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346656
4100	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451049
4108	thespiker	GET	/api/Customer		2025-05-07 09:01:25.358321
4127	thespiker	GET	/api/Customer		2025-05-07 09:01:25.38472
4122	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408842
4153	thespiker	GET	/api/Customer		2025-05-07 09:01:24.449516
4156	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452387
4171	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451741
4176	thespiker	GET	/api/Customer		2025-05-07 09:01:25.587153
4181	thespiker	GET	/api/Customer		2025-05-07 09:01:25.612229
4198	thespiker	GET	/api/Customer		2025-05-07 09:01:25.639824
4208	thespiker	GET	/api/Customer		2025-05-07 09:01:25.647046
4221	thespiker	GET	/api/Customer		2025-05-07 09:01:25.668638
4229	thespiker	GET	/api/Customer		2025-05-07 09:01:25.676811
4236	thespiker	GET	/api/Customer		2025-05-07 09:01:25.678892
4262	thespiker	GET	/api/Customer		2025-05-07 09:01:25.710008
4270	thespiker	GET	/api/Customer		2025-05-07 09:01:25.712181
4272	thespiker	GET	/api/Customer		2025-05-07 09:01:25.71665
4283	thespiker	GET	/api/Customer		2025-05-07 09:01:25.723145
4284	thespiker	GET	/api/Customer		2025-05-07 09:01:25.723011
4299	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743039
4300	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743756
4315	thespiker	GET	/api/Customer		2025-05-07 09:01:25.752633
4325	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4334	thespiker	GET	/api/Customer		2025-05-07 09:01:25.775599
4343	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782551
4348	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782762
4361	thespiker	GET	/api/Customer		2025-05-07 09:01:25.804175
4376	thespiker	GET	/api/Customer		2025-05-07 09:01:25.826379
4383	thespiker	GET	/api/Customer		2025-05-07 09:01:25.83265
4388	thespiker	GET	/api/Customer		2025-05-07 09:01:25.848927
4401	thespiker	GET	/api/Customer		2025-05-07 09:01:25.858265
4402	thespiker	GET	/api/Customer		2025-05-07 09:01:25.858278
4409	thespiker	GET	/api/Customer		2025-05-07 09:01:25.863887
4421	thespiker	GET	/api/Customer		2025-05-07 09:01:25.874087
4440	thespiker	GET	/api/Customer		2025-05-07 09:01:25.896829
4443	thespiker	GET	/api/Customer		2025-05-07 09:01:25.902132
4453	thespiker	GET	/api/Customer		2025-05-07 09:01:25.908314
4462	thespiker	GET	/api/Customer		2025-05-07 09:01:25.922779
4477	thespiker	GET	/api/Customer		2025-05-07 09:01:25.933404
4484	thespiker	GET	/api/Customer		2025-05-07 09:01:25.941947
4528	thespiker	GET	/api/Customer		2025-05-07 09:01:26.012924
4531	thespiker	GET	/api/Customer		2025-05-07 09:01:26.013098
4540	thespiker	GET	/api/Customer		2025-05-07 09:01:26.033938
4548	thespiker	GET	/api/Customer		2025-05-07 09:01:26.037763
4552	thespiker	GET	/api/Customer		2025-05-07 09:01:26.039253
4577	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071186
4583	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071402
4609	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088198
4612	thespiker	GET	/api/Customer		2025-05-07 09:01:26.097524
4631	thespiker	GET	/api/Customer		2025-05-07 09:01:26.112402
4633	thespiker	GET	/api/Customer		2025-05-07 09:01:26.114294
4640	thespiker	GET	/api/Customer		2025-05-07 09:01:26.11801
4643	thespiker	GET	/api/Customer		2025-05-07 09:01:25.785422
4660	thespiker	GET	/api/Customer		2025-05-07 09:01:26.145012
4663	thespiker	GET	/api/Customer		2025-05-07 09:01:26.146403
4675	thespiker	GET	/api/Customer		2025-05-07 09:01:26.153684
4686	thespiker	GET	/api/Customer		2025-05-07 09:01:26.168047
4687	thespiker	GET	/api/Customer		2025-05-07 09:01:26.168764
4696	thespiker	GET	/api/Customer		2025-05-07 09:01:26.170184
4698	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176122
4707	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177104
4715	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177585
4722	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178505
4724	thespiker	GET	/api/Customer		2025-05-07 09:01:26.179214
4732	thespiker	GET	/api/Customer		2025-05-07 09:01:26.201711
4739	thespiker	GET	/api/Customer		2025-05-07 09:01:26.209684
4750	thespiker	GET	/api/Customer		2025-05-07 09:01:26.219547
4751	thespiker	GET	/api/Customer		2025-05-07 09:01:26.220704
4775	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237518
4778	thespiker	GET	/api/Customer		2025-05-07 09:01:26.238455
4779	thespiker	GET	/api/Customer		2025-05-07 09:01:26.2385
4783	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239477
4801	thespiker	GET	/api/Customer		2025-05-07 09:01:26.250768
4809	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255768
4814	thespiker	GET	/api/Customer		2025-05-07 09:01:26.261642
4816	thespiker	GET	/api/Customer		2025-05-07 09:01:26.261422
4833	thespiker	GET	/api/Customer		2025-05-07 09:01:26.301622
4834	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298244
4836	thespiker	GET	/api/Customer		2025-05-07 09:01:26.302883
4843	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4858	thespiker	GET	/api/Customer		2025-05-07 09:01:26.382406
4868	thespiker	GET	/api/Customer		2025-05-07 09:01:26.470491
4869	thespiker	GET	/api/Customer		2025-05-07 09:01:26.470733
4880	thespiker	GET	/api/Customer		2025-05-07 09:01:26.487602
4890	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256378
4896	thespiker	GET	/api/Customer		2025-05-07 09:01:26.524419
4899	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255274
3851	thespiker	GET	/api/Customer		2025-05-07 09:00:56.767726
3864	thespiker	GET	/api/Customer		2025-05-07 09:00:56.771498
3878	thespiker	GET	/api/Customer		2025-05-07 09:00:56.799535
3905	thespiker	GET	/api/Customer		2025-05-07 09:00:56.830202
3908	thespiker	GET	/api/Customer		2025-05-07 09:00:56.830574
3933	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731027
3941	thespiker	GET	/api/Customer		2025-05-07 09:01:24.45065
3948	thespiker	GET	/api/Customer		2025-05-07 09:01:25.164066
3949	thespiker	GET	/api/Customer		2025-05-07 09:01:25.165801
3957	thespiker	GET	/api/Customer		2025-05-07 09:01:25.172645
3968	thespiker	GET	/api/Customer		2025-05-07 09:01:25.234291
3983	thespiker	GET	/api/Customer		2025-05-07 09:01:25.240986
3989	thespiker	GET	/api/Customer		2025-05-07 09:01:24.447108
3999	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451518
4019	thespiker	GET	/api/Customer		2025-05-07 09:01:25.29082
4022	thespiker	GET	/api/Customer		2025-05-07 09:01:25.290994
4033	thespiker	GET	/api/Customer		2025-05-07 09:01:25.29253
4034	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292518
4052	thespiker	GET	/api/Customer		2025-05-07 09:01:24.412666
4065	thespiker	GET	/api/Customer		2025-05-07 09:01:25.324921
4079	thespiker	GET	/api/Customer		2025-05-07 09:01:25.344967
4082	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345521
4073	thespiker	GET	/api/Customer		2025-05-07 09:01:24.448497
4106	thespiker	GET	/api/Customer		2025-05-07 09:01:25.358255
4107	thespiker	GET	/api/Customer		2025-05-07 09:01:25.358255
4117	thespiker	GET	/api/Customer		2025-05-07 09:01:25.36931
4138	thespiker	GET	/api/Customer		2025-05-07 09:01:24.412071
4155	thespiker	GET	/api/Customer		2025-05-07 09:01:24.413382
4150	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453421
4173	thespiker	GET	/api/Customer		2025-05-07 09:01:24.414154
4177	thespiker	GET	/api/Customer		2025-05-07 09:01:25.591785
4183	thespiker	GET	/api/Customer		2025-05-07 09:01:25.612229
4190	thespiker	GET	/api/Customer		2025-05-07 09:01:25.632088
4194	thespiker	GET	/api/Customer		2025-05-07 09:01:25.638607
4217	thespiker	GET	/api/Customer		2025-05-07 09:01:25.667457
4225	thespiker	GET	/api/Customer		2025-05-07 09:01:25.673375
4234	thespiker	GET	/api/Customer		2025-05-07 09:01:25.678892
4243	thespiker	GET	/api/Customer		2025-05-07 09:01:25.684653
4246	thespiker	GET	/api/Customer		2025-05-07 09:01:25.688276
4257	thespiker	GET	/api/Customer		2025-05-07 09:01:25.704917
4282	thespiker	GET	/api/Customer		2025-05-07 09:01:25.722971
4288	thespiker	GET	/api/Customer		2025-05-07 09:01:25.724065
4305	thespiker	GET	/api/Customer		2025-05-07 09:01:25.744762
4306	thespiker	GET	/api/Customer		2025-05-07 09:01:25.744762
4312	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4318	thespiker	GET	/api/Customer		2025-05-07 09:01:25.752633
4326	thespiker	GET	/api/Customer		2025-05-07 09:01:25.76929
4333	thespiker	GET	/api/Customer		2025-05-07 09:01:25.77439
4349	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782813
4351	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783445
4358	thespiker	GET	/api/Customer		2025-05-07 09:01:25.797693
4362	thespiker	GET	/api/Customer		2025-05-07 09:01:25.805743
4377	thespiker	GET	/api/Customer		2025-05-07 09:01:25.827644
4390	thespiker	GET	/api/Customer		2025-05-07 09:01:25.848877
4400	thespiker	GET	/api/Customer		2025-05-07 09:01:25.858005
4404	thespiker	GET	/api/Customer		2025-05-07 09:01:25.859197
4426	thespiker	GET	/api/Customer		2025-05-07 09:01:25.886546
4435	thespiker	GET	/api/Customer		2025-05-07 09:01:25.894636
4445	thespiker	GET	/api/Customer		2025-05-07 09:01:25.902861
4449	thespiker	GET	/api/Customer		2025-05-07 09:01:25.907047
4451	thespiker	GET	/api/Customer		2025-05-07 09:01:25.908297
4459	thespiker	GET	/api/Customer		2025-05-07 09:01:25.914001
4463	thespiker	GET	/api/Customer		2025-05-07 09:01:25.923354
4467	thespiker	GET	/api/Customer		2025-05-07 09:01:25.926893
4472	thespiker	GET	/api/Customer		2025-05-07 09:01:25.929944
4492	thespiker	GET	/api/Customer		2025-05-07 09:01:25.948252
4494	thespiker	GET	/api/Customer		2025-05-07 09:01:25.949298
4507	thespiker	GET	/api/Customer		2025-05-07 09:01:25.96866
4529	thespiker	GET	/api/Customer		2025-05-07 09:01:26.013165
4541	thespiker	GET	/api/Customer		2025-05-07 09:01:26.035444
4543	thespiker	GET	/api/Customer		2025-05-07 09:01:26.035755
4554	thespiker	GET	/api/Customer		2025-05-07 09:01:26.039227
4569	thespiker	GET	/api/Customer		2025-05-07 09:01:26.049212
4582	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071592
4588	thespiker	GET	/api/Customer		2025-05-07 09:01:26.073506
4591	thespiker	GET	/api/Customer		2025-05-07 09:01:26.074939
4596	thespiker	GET	/api/Customer		2025-05-07 09:01:26.076665
4597	thespiker	GET	/api/Customer		2025-05-07 09:01:26.078359
4628	thespiker	GET	/api/Customer		2025-05-07 09:01:26.112347
4629	thespiker	GET	/api/Customer		2025-05-07 09:01:26.112346
4636	thespiker	GET	/api/Customer		2025-05-07 09:01:26.116135
4642	thespiker	GET	/api/Customer		2025-05-07 09:01:26.118618
4653	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783635
4671	thespiker	GET	/api/Customer		2025-05-07 09:01:26.152474
4679	thespiker	GET	/api/Customer		2025-05-07 09:01:26.154891
4684	thespiker	GET	/api/Customer		2025-05-07 09:01:26.167692
4692	thespiker	GET	/api/Customer		2025-05-07 09:01:26.169777
4697	thespiker	GET	/api/Customer		2025-05-07 09:01:26.175415
4701	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176506
4727	thespiker	GET	/api/Customer		2025-05-07 09:01:26.192416
4735	thespiker	GET	/api/Customer		2025-05-07 09:01:26.193574
4749	thespiker	GET	/api/Customer		2025-05-07 09:01:26.21946
4756	thespiker	GET	/api/Customer		2025-05-07 09:01:26.227069
4772	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237114
4780	thespiker	GET	/api/Customer		2025-05-07 09:01:26.238455
4784	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239723
4795	thespiker	GET	/api/Customer		2025-05-07 09:01:26.240973
4796	thespiker	GET	/api/Customer		2025-05-07 09:01:26.241448
4800	thespiker	GET	/api/Customer		2025-05-07 09:01:26.249932
4804	thespiker	GET	/api/Customer		2025-05-07 09:01:26.254051
4818	thespiker	GET	/api/Customer		2025-05-07 09:01:26.265807
4821	thespiker	GET	/api/Customer		2025-05-07 09:01:26.297184
4826	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298325
4830	thespiker	GET	/api/Customer		2025-05-07 09:01:26.299331
4841	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303676
4847	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304407
4856	thespiker	GET	/api/Customer		2025-05-07 09:01:26.381073
3847	thespiker	GET	/api/Customer		2025-05-07 09:00:56.762675
4946	thespiker	GET	/api/Customer		2025-05-07 09:02:13.284914
4976	thespiker	GET	/api/Customer		2025-05-07 09:05:10.827879
5008	thespiker	GET	/api/Customer		2025-05-07 09:05:10.828628
5048	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917433
5046	thespiker	GET	/api/Customer		2025-05-07 09:05:10.917598
5160	thespiker	GET	/api/Customer		2025-05-07 09:05:12.490735
5220	thespiker	GET	/api/Customer		2025-05-07 09:05:12.551753
5232	thespiker	GET	/api/Customer		2025-05-07 09:05:12.565016
5287	thespiker	GET	/api/Customer		2025-05-07 09:05:12.638663
5295	thespiker	GET	/api/Customer		2025-05-07 09:05:12.642598
5312	thespiker	GET	/api/Customer		2025-05-07 09:05:12.666556
5344	thespiker	GET	/api/Customer		2025-05-07 09:05:12.717412
5349	thespiker	GET	/api/Customer		2025-05-07 09:05:12.723412
5357	thespiker	GET	/api/Customer		2025-05-07 09:05:12.730472
5381	thespiker	GET	/api/Customer		2025-05-07 09:05:12.755676
5397	thespiker	GET	/api/Customer		2025-05-07 09:05:12.760379
5404	thespiker	GET	/api/Customer		2025-05-07 09:05:12.787741
5428	thespiker	GET	/api/Customer		2025-05-07 09:05:12.806049
5438	thespiker	GET	/api/Customer		2025-05-07 09:05:12.821992
5457	thespiker	GET	/api/Customer		2025-05-07 09:05:12.835303
5464	thespiker	GET	/api/Customer		2025-05-07 09:05:12.84305
5478	thespiker	GET	/api/Customer		2025-05-07 09:05:12.861103
5495	thespiker	GET	/api/Customer		2025-05-07 09:05:12.871119
5517	thespiker	GET	/api/Customer		2025-05-07 09:05:12.900712
5548	thespiker	GET	/api/Customer		2025-05-07 09:05:12.932831
5596	thespiker	GET	/api/Customer		2025-05-07 09:05:13.024163
5633	thespiker	GET	/api/Customer		2025-05-07 09:05:13.253629
5675	thespiker	GET	/api/Customer		2025-05-07 09:05:13.350026
5685	thespiker	GET	/api/Customer		2025-05-07 09:05:12.759208
5734	thespiker	GET	/api/Customer		2025-05-07 09:05:13.506653
5739	thespiker	GET	/api/Customer		2025-05-07 09:05:13.512168
5785	thespiker	GET	/api/Customer		2025-05-07 09:05:13.6148
5797	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935192
5813	thespiker	GET	/api/Customer		2025-05-07 09:05:13.656826
5833	thespiker	GET	/api/Customer		2025-05-07 09:05:13.673926
5874	thespiker	GET	/api/Customer		2025-05-07 09:05:12.935417
5913	thespiker	GET	/api/Customer		2025-05-07 09:05:13.770247
5916	thespiker	GET	/api/Customer		2025-05-07 09:05:13.771476
5937	thespiker	GET	/api/Customer		2025-05-07 09:05:13.795256
6210	thespiker	GET	/api/Payment		2025-05-07 10:03:51.29689
6214	thespiker	GET	/api/LoanType		2025-05-07 10:03:51.556503
6218	thespiker	GET	/api/PaymentSchedule/loan/36		2025-05-07 10:03:53.071261
6224	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:13.760256
6226	thespiker	GET	/api/Payment		2025-05-07 10:04:21.593992
6230	thespiker	GET	/api/PaymentSchedule/loan/37		2025-05-07 10:04:25.159087
6232	thespiker	GET	/api/Payment		2025-05-07 10:04:30.122549
3852	thespiker	GET	/api/Customer		2025-05-07 09:00:56.768697
3865	thespiker	GET	/api/Customer		2025-05-07 09:00:56.773139
3881	thespiker	GET	/api/Customer		2025-05-07 09:00:56.80043
3907	thespiker	GET	/api/Customer		2025-05-07 09:00:56.829574
3931	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731023
3944	thespiker	GET	/api/Customer		2025-05-07 09:01:25.164066
3942	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
3952	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171338
3972	thespiker	GET	/api/Customer		2025-05-07 09:01:25.238255
3979	thespiker	GET	/api/Customer		2025-05-07 09:01:25.24009
3986	thespiker	GET	/api/Customer		2025-05-07 09:01:25.252138
3991	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451665
3994	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731005
4015	thespiker	GET	/api/Customer		2025-05-07 09:01:25.28981
4031	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292038
4046	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293633
4054	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452363
4063	thespiker	GET	/api/Customer		2025-05-07 09:01:25.323904
4076	thespiker	GET	/api/Customer		2025-05-07 09:01:25.344499
4069	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408046
4113	thespiker	GET	/api/Customer		2025-05-07 09:01:25.364804
4115	thespiker	GET	/api/Customer		2025-05-07 09:01:25.365941
4139	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452625
4157	thespiker	GET	/api/Customer		2025-05-07 09:01:24.411688
4152	thespiker	GET	/api/Customer		2025-05-07 09:01:24.449734
4170	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453254
4178	thespiker	GET	/api/Customer		2025-05-07 09:01:25.609902
4188	thespiker	GET	/api/Customer		2025-05-07 09:01:25.630896
4191	thespiker	GET	/api/Customer		2025-05-07 09:01:25.633312
4197	thespiker	GET	/api/Customer		2025-05-07 09:01:25.639824
4203	thespiker	GET	/api/Customer		2025-05-07 09:01:25.64579
4212	thespiker	GET	/api/Customer		2025-05-07 09:01:25.650158
4244	thespiker	GET	/api/Customer		2025-05-07 09:01:25.684924
4256	thespiker	GET	/api/Customer		2025-05-07 09:01:25.704546
4260	thespiker	GET	/api/Customer		2025-05-07 09:01:25.709039
4268	thespiker	GET	/api/Customer		2025-05-07 09:01:25.711231
4276	thespiker	GET	/api/Customer		2025-05-07 09:01:25.71764
4308	thespiker	GET	/api/Customer		2025-05-07 09:01:25.748317
4317	thespiker	GET	/api/Customer		2025-05-07 09:01:25.752633
4332	thespiker	GET	/api/Customer		2025-05-07 09:01:25.77439
4347	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782723
4352	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783445
4363	thespiker	GET	/api/Customer		2025-05-07 09:01:25.809178
4366	thespiker	GET	/api/Customer		2025-05-07 09:01:25.816069
4381	thespiker	GET	/api/Customer		2025-05-07 09:01:25.832691
4387	thespiker	GET	/api/Customer		2025-05-07 09:01:25.834883
4398	thespiker	GET	/api/Customer		2025-05-07 09:01:25.857252
4415	thespiker	GET	/api/Customer		2025-05-07 09:01:25.867309
4422	thespiker	GET	/api/Customer		2025-05-07 09:01:25.874524
4430	thespiker	GET	/api/Customer		2025-05-07 09:01:25.890838
4434	thespiker	GET	/api/Customer		2025-05-07 09:01:25.893488
4438	thespiker	GET	/api/Customer		2025-05-07 09:01:25.895832
4446	thespiker	GET	/api/Customer		2025-05-07 09:01:25.9032
4458	thespiker	GET	/api/Customer		2025-05-07 09:01:25.913309
4468	thespiker	GET	/api/Customer		2025-05-07 09:01:25.926893
4481	thespiker	GET	/api/Customer		2025-05-07 09:01:25.934763
4490	thespiker	GET	/api/Customer		2025-05-07 09:01:25.947466
4504	thespiker	GET	/api/Customer		2025-05-07 09:01:25.964782
4516	thespiker	GET	/api/Customer		2025-05-07 09:01:25.971976
4522	thespiker	GET	/api/Customer		2025-05-07 09:01:26.010771
4535	thespiker	GET	/api/Customer		2025-05-07 09:01:26.015058
4544	thespiker	GET	/api/Customer		2025-05-07 09:01:26.035567
4545	thespiker	GET	/api/Customer		2025-05-07 09:01:26.037247
4556	thespiker	GET	/api/Customer		2025-05-07 09:01:25.785422
4565	thespiker	GET	/api/Customer		2025-05-07 09:01:26.047533
4573	thespiker	GET	/api/Customer		2025-05-07 09:01:26.050816
4578	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071315
4592	thespiker	GET	/api/Customer		2025-05-07 09:01:26.074928
4611	thespiker	GET	/api/Customer		2025-05-07 09:01:26.097524
4627	thespiker	GET	/api/Customer		2025-05-07 09:01:26.110476
4639	thespiker	GET	/api/Customer		2025-05-07 09:01:26.112368
4648	thespiker	GET	/api/Customer		2025-05-07 09:01:26.124515
4654	thespiker	GET	/api/Customer		2025-05-07 09:01:26.135671
4656	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4667	thespiker	GET	/api/Customer		2025-05-07 09:01:26.149081
4669	thespiker	GET	/api/Customer		2025-05-07 09:01:26.152474
4678	thespiker	GET	/api/Customer		2025-05-07 09:01:26.154891
4681	thespiker	GET	/api/Customer		2025-05-07 09:01:26.155249
4694	thespiker	GET	/api/Customer		2025-05-07 09:01:26.169854
4699	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176513
4704	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176558
4717	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178321
4723	thespiker	GET	/api/Customer		2025-05-07 09:01:26.179214
4726	thespiker	GET	/api/Customer		2025-05-07 09:01:26.190656
4743	thespiker	GET	/api/Customer		2025-05-07 09:01:26.213269
4753	thespiker	GET	/api/Customer		2025-05-07 09:01:26.22704
4755	thespiker	GET	/api/Customer		2025-05-07 09:01:26.227281
4766	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236144
4777	thespiker	GET	/api/Customer		2025-05-07 09:01:26.238491
4785	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239079
4790	thespiker	GET	/api/Customer		2025-05-07 09:01:26.240612
4798	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237512
4807	thespiker	GET	/api/Customer		2025-05-07 09:01:26.25425
4817	thespiker	GET	/api/Customer		2025-05-07 09:01:26.262731
4827	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298469
4829	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298244
4839	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303676
4840	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303906
4845	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4860	thespiker	GET	/api/Customer		2025-05-07 09:01:26.385716
4870	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255274
4881	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256379
4891	thespiker	GET	/api/Customer		2025-05-07 09:01:26.515427
4892	thespiker	GET	/api/Customer		2025-05-07 09:01:26.519234
4893	thespiker	GET	/api/Customer		2025-05-07 09:01:26.519039
4900	thespiker	GET	/api/Customer		2025-05-07 09:01:26.527141
4903	thespiker	GET	/api/Customer		2025-05-07 09:01:26.534018
3853	thespiker	GET	/api/Customer		2025-05-07 09:00:56.768841
3867	thespiker	GET	/api/Customer		2025-05-07 09:00:56.773233
3884	thespiker	GET	/api/Customer		2025-05-07 09:00:56.800738
3904	thespiker	GET	/api/Customer		2025-05-07 09:00:56.818614
3910	thespiker	GET	/api/Customer		2025-05-07 09:00:56.816575
3911	thespiker	GET	/api/Customer		2025-05-07 09:00:56.831403
3935	thespiker	GET	/api/Customer		2025-05-07 09:01:23.73103
3950	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171338
3960	thespiker	GET	/api/Customer		2025-05-07 09:01:24.410896
3975	thespiker	GET	/api/Customer		2025-05-07 09:01:25.239276
3995	thespiker	GET	/api/Customer		2025-05-07 09:01:24.410892
3997	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453233
4010	thespiker	GET	/api/Customer		2025-05-07 09:01:25.280784
4016	thespiker	GET	/api/Customer		2025-05-07 09:01:25.28981
4023	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291227
4028	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291816
4049	thespiker	GET	/api/Customer		2025-05-07 09:01:25.314688
4053	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453147
4062	thespiker	GET	/api/Customer		2025-05-07 09:01:25.323904
4074	thespiker	GET	/api/Customer		2025-05-07 09:01:25.344498
4088	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345792
4091	thespiker	GET	/api/Customer		2025-05-07 09:01:25.34589
4095	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346658
4097	thespiker	GET	/api/Customer		2025-05-07 09:01:24.411717
4109	thespiker	GET	/api/Customer		2025-05-07 09:01:25.358771
4124	thespiker	GET	/api/Customer		2025-05-07 09:01:25.38356
4132	thespiker	GET	/api/Customer		2025-05-07 09:01:25.406454
4136	thespiker	GET	/api/Customer		2025-05-07 09:01:25.417689
4140	thespiker	GET	/api/Customer		2025-05-07 09:01:24.414257
4158	thespiker	GET	/api/Customer		2025-05-07 09:01:24.45152
4147	thespiker	GET	/api/Customer		2025-05-07 09:01:24.412156
4172	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408764
4180	thespiker	GET	/api/Customer		2025-05-07 09:01:25.611205
4186	thespiker	GET	/api/Customer		2025-05-07 09:01:25.629835
4189	thespiker	GET	/api/Customer		2025-05-07 09:01:25.632088
4196	thespiker	GET	/api/Customer		2025-05-07 09:01:25.638608
4200	thespiker	GET	/api/Customer		2025-05-07 09:01:25.645145
4207	thespiker	GET	/api/Customer		2025-05-07 09:01:25.646546
4213	thespiker	GET	/api/Customer		2025-05-07 09:01:25.650152
4224	thespiker	GET	/api/Customer		2025-05-07 09:01:25.669754
4230	thespiker	GET	/api/Customer		2025-05-07 09:01:25.677985
4242	thespiker	GET	/api/Customer		2025-05-07 09:01:25.684639
4249	thespiker	GET	/api/Customer		2025-05-07 09:01:25.690849
4255	thespiker	GET	/api/Customer		2025-05-07 09:01:25.704546
4264	thespiker	GET	/api/Customer		2025-05-07 09:01:25.710316
4277	thespiker	GET	/api/Customer		2025-05-07 09:01:25.718659
4289	thespiker	GET	/api/Customer		2025-05-07 09:01:25.725088
4292	thespiker	GET	/api/Customer		2025-05-07 09:01:25.738325
4298	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7427
4310	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4314	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751594
4336	thespiker	GET	/api/Customer		2025-05-07 09:01:25.778648
4340	thespiker	GET	/api/Customer		2025-05-07 09:01:25.781835
4353	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4360	thespiker	GET	/api/Customer		2025-05-07 09:01:25.80079
4370	thespiker	GET	/api/Customer		2025-05-07 09:01:25.820343
4371	thespiker	GET	/api/Customer		2025-05-07 09:01:25.823997
4379	thespiker	GET	/api/Customer		2025-05-07 09:01:25.831521
4385	thespiker	GET	/api/Customer		2025-05-07 09:01:25.833761
4391	thespiker	GET	/api/Customer		2025-05-07 09:01:25.848877
4405	thespiker	GET	/api/Customer		2025-05-07 09:01:25.859211
4414	thespiker	GET	/api/Customer		2025-05-07 09:01:25.867207
4419	thespiker	GET	/api/Customer		2025-05-07 09:01:25.873366
4428	thespiker	GET	/api/Customer		2025-05-07 09:01:25.888273
4442	thespiker	GET	/api/Customer		2025-05-07 09:01:25.900916
4452	thespiker	GET	/api/Customer		2025-05-07 09:01:25.90823
4460	thespiker	GET	/api/Customer		2025-05-07 09:01:25.921629
4469	thespiker	GET	/api/Customer		2025-05-07 09:01:25.927911
4501	thespiker	GET	/api/Customer		2025-05-07 09:01:25.963825
4508	thespiker	GET	/api/Customer		2025-05-07 09:01:25.969484
4513	thespiker	GET	/api/Customer		2025-05-07 09:01:25.970646
4519	thespiker	GET	/api/Customer		2025-05-07 09:01:25.971974
4523	thespiker	GET	/api/Customer		2025-05-07 09:01:26.010723
4542	thespiker	GET	/api/Customer		2025-05-07 09:01:26.035462
4558	thespiker	GET	/api/Customer		2025-05-07 09:01:26.045764
4570	thespiker	GET	/api/Customer		2025-05-07 09:01:26.04924
4579	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071249
4589	thespiker	GET	/api/Customer		2025-05-07 09:01:26.074894
4600	thespiker	GET	/api/Customer		2025-05-07 09:01:26.086481
4602	thespiker	GET	/api/Customer		2025-05-07 09:01:26.08642
4623	thespiker	GET	/api/Customer		2025-05-07 09:01:26.108589
4624	thespiker	GET	/api/Customer		2025-05-07 09:01:26.110418
4644	thespiker	GET	/api/Customer		2025-05-07 09:01:26.12447
4657	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4666	thespiker	GET	/api/Customer		2025-05-07 09:01:26.147753
4670	thespiker	GET	/api/Customer		2025-05-07 09:01:26.152474
4673	thespiker	GET	/api/Customer		2025-05-07 09:01:26.153819
4683	thespiker	GET	/api/Customer		2025-05-07 09:01:26.165712
4693	thespiker	GET	/api/Customer		2025-05-07 09:01:26.170088
4700	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176507
4709	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177411
4716	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178322
4720	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178321
4738	thespiker	GET	/api/Customer		2025-05-07 09:01:26.208592
4757	thespiker	GET	/api/Customer		2025-05-07 09:01:26.228222
4759	thespiker	GET	/api/Customer		2025-05-07 09:01:26.228204
4786	thespiker	GET	/api/Customer		2025-05-07 09:01:26.240697
4789	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237107
4794	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237512
4792	thespiker	GET	/api/Customer		2025-05-07 09:01:26.240551
4803	thespiker	GET	/api/Customer		2025-05-07 09:01:26.254008
4805	thespiker	GET	/api/Customer		2025-05-07 09:01:26.253987
4824	thespiker	GET	/api/Customer		2025-05-07 09:01:26.298244
4837	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303679
4846	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4852	thespiker	GET	/api/Customer		2025-05-07 09:01:26.358889
4862	thespiker	GET	/api/Customer		2025-05-07 09:01:26.391565
3854	thespiker	GET	/api/Customer		2025-05-07 09:00:56.769999
3868	thespiker	GET	/api/Customer		2025-05-07 09:00:56.774706
3886	thespiker	GET	/api/Customer		2025-05-07 09:00:56.797915
3892	thespiker	GET	/api/Customer		2025-05-07 09:00:56.807635
3912	thespiker	GET	/api/Customer		2025-05-07 09:00:56.831078
3926	thespiker	GET	/api/Customer		2025-05-07 09:00:56.845687
3932	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731008
3953	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171338
3961	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451839
3970	thespiker	GET	/api/Customer		2025-05-07 09:01:25.235628
3982	thespiker	GET	/api/Customer		2025-05-07 09:01:25.240545
3985	thespiker	GET	/api/Customer		2025-05-07 09:01:25.244555
4000	thespiker	GET	/api/Customer		2025-05-07 09:01:24.410154
3998	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453405
4020	thespiker	GET	/api/Customer		2025-05-07 09:01:25.29082
4021	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291192
4037	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292631
4038	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292835
4048	thespiker	GET	/api/Customer		2025-05-07 09:01:25.298399
4059	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731021
4083	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345524
4068	thespiker	GET	/api/Customer		2025-05-07 09:01:24.452401
4103	thespiker	GET	/api/Customer		2025-05-07 09:01:25.347112
4104	thespiker	GET	/api/Customer		2025-05-07 09:01:25.357641
4128	thespiker	GET	/api/Customer		2025-05-07 09:01:25.390032
4133	thespiker	GET	/api/Customer		2025-05-07 09:01:25.408601
4134	thespiker	GET	/api/Customer		2025-05-07 09:01:25.416553
4137	thespiker	GET	/api/Customer		2025-05-07 09:01:24.45
4159	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342482
4161	thespiker	GET	/api/Customer		2025-05-07 09:01:24.41121
4169	thespiker	GET	/api/Customer		2025-05-07 09:01:24.407216
4182	thespiker	GET	/api/Customer		2025-05-07 09:01:25.612229
4195	thespiker	GET	/api/Customer		2025-05-07 09:01:25.638607
4201	thespiker	GET	/api/Customer		2025-05-07 09:01:25.644991
4210	thespiker	GET	/api/Customer		2025-05-07 09:01:25.648026
4218	thespiker	GET	/api/Customer		2025-05-07 09:01:25.667457
4239	thespiker	GET	/api/Customer		2025-05-07 09:01:25.683958
4251	thespiker	GET	/api/Customer		2025-05-07 09:01:25.692065
4259	thespiker	GET	/api/Customer		2025-05-07 09:01:25.705702
4269	thespiker	GET	/api/Customer		2025-05-07 09:01:25.712181
4280	thespiker	GET	/api/Customer		2025-05-07 09:01:25.719613
4302	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743757
4316	thespiker	GET	/api/Customer		2025-05-07 09:01:25.752633
4324	thespiker	GET	/api/Customer		2025-05-07 09:01:25.75468
4323	thespiker	GET	/api/Customer		2025-05-07 09:01:25.753511
4339	thespiker	GET	/api/Customer		2025-05-07 09:01:25.781664
4344	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782557
4356	thespiker	GET	/api/Customer		2025-05-07 09:01:25.786428
4367	thespiker	GET	/api/Customer		2025-05-07 09:01:25.816069
4368	thespiker	GET	/api/Customer		2025-05-07 09:01:25.817301
4373	thespiker	GET	/api/Customer		2025-05-07 09:01:25.825195
4386	thespiker	GET	/api/Customer		2025-05-07 09:01:25.83376
4396	thespiker	GET	/api/Customer		2025-05-07 09:01:25.85096
4399	thespiker	GET	/api/Customer		2025-05-07 09:01:25.857252
4408	thespiker	GET	/api/Customer		2025-05-07 09:01:25.862798
4412	thespiker	GET	/api/Customer		2025-05-07 09:01:25.866303
4417	thespiker	GET	/api/Customer		2025-05-07 09:01:25.87087
4432	thespiker	GET	/api/Customer		2025-05-07 09:01:25.893488
4444	thespiker	GET	/api/Customer		2025-05-07 09:01:25.902132
4450	thespiker	GET	/api/Customer		2025-05-07 09:01:25.907937
4464	thespiker	GET	/api/Customer		2025-05-07 09:01:25.92586
4479	thespiker	GET	/api/Customer		2025-05-07 09:01:25.933601
4483	thespiker	GET	/api/Customer		2025-05-07 09:01:25.939082
4487	thespiker	GET	/api/Customer		2025-05-07 09:01:25.943167
4502	thespiker	GET	/api/Customer		2025-05-07 09:01:25.964333
4510	thespiker	GET	/api/Customer		2025-05-07 09:01:25.969551
4511	thespiker	GET	/api/Customer		2025-05-07 09:01:25.969755
4530	thespiker	GET	/api/Customer		2025-05-07 09:01:26.013102
4536	thespiker	GET	/api/Customer		2025-05-07 09:01:26.02826
4546	thespiker	GET	/api/Customer		2025-05-07 09:01:26.037247
4562	thespiker	GET	/api/Customer		2025-05-07 09:01:26.047533
4561	thespiker	GET	/api/Customer		2025-05-07 09:01:25.785427
4576	thespiker	GET	/api/Customer		2025-05-07 09:01:26.070808
4586	thespiker	GET	/api/Customer		2025-05-07 09:01:26.073009
4606	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088162
4610	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088196
4621	thespiker	GET	/api/Customer		2025-05-07 09:01:26.108659
4626	thespiker	GET	/api/Customer		2025-05-07 09:01:26.110389
4647	thespiker	GET	/api/Customer		2025-05-07 09:01:26.12447
4646	thespiker	GET	/api/Customer		2025-05-07 09:01:26.12447
4680	thespiker	GET	/api/Customer		2025-05-07 09:01:26.154891
4691	thespiker	GET	/api/Customer		2025-05-07 09:01:26.16912
4695	thespiker	GET	/api/Customer		2025-05-07 09:01:26.170168
4702	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176587
4703	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176507
4729	thespiker	GET	/api/Customer		2025-05-07 09:01:26.192515
4730	thespiker	GET	/api/Customer		2025-05-07 09:01:26.195744
4737	thespiker	GET	/api/Customer		2025-05-07 09:01:26.208284
4763	thespiker	GET	/api/Customer		2025-05-07 09:01:26.229322
4764	thespiker	GET	/api/Customer		2025-05-07 09:01:26.230145
4765	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236101
4768	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236613
4781	thespiker	GET	/api/Customer		2025-05-07 09:01:26.238839
4788	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239504
4810	thespiker	GET	/api/Customer		2025-05-07 09:01:26.257119
4813	thespiker	GET	/api/Customer		2025-05-07 09:01:26.261599
4820	thespiker	GET	/api/Customer		2025-05-07 09:01:26.295028
4823	thespiker	GET	/api/Customer		2025-05-07 09:01:26.297377
4844	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4848	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4850	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303676
4855	thespiker	GET	/api/Customer		2025-05-07 09:01:26.380837
4854	thespiker	GET	/api/Customer		2025-05-07 09:01:26.380837
4863	thespiker	GET	/api/Customer		2025-05-07 09:01:26.250061
4873	thespiker	GET	/api/Customer		2025-05-07 09:01:26.250061
4882	thespiker	GET	/api/Customer		2025-05-07 09:01:26.492279
4883	thespiker	GET	/api/Customer		2025-05-07 09:01:26.257244
3848	thespiker	GET	/api/Customer		2025-05-07 09:00:56.762485
4949	thespiker	GET	/api/Customer		2025-05-07 09:02:13.412949
4995	thespiker	GET	/api/Customer		2025-05-07 09:05:10.164524
5014	thespiker	GET	/api/Customer		2025-05-07 09:05:10.888029
5042	thespiker	GET	/api/Customer		2025-05-07 09:05:10.918879
5175	thespiker	GET	/api/Customer		2025-05-07 09:05:12.499687
5188	thespiker	GET	/api/Customer		2025-05-07 09:05:12.522153
5200	thespiker	GET	/api/Customer		2025-05-07 09:05:12.525393
5211	thespiker	GET	/api/Customer		2025-05-07 09:05:12.549429
5243	thespiker	GET	/api/Customer		2025-05-07 09:05:12.586035
5267	thespiker	GET	/api/Customer		2025-05-07 09:05:12.606773
5290	thespiker	GET	/api/Customer		2025-05-07 09:05:12.637089
5308	thespiker	GET	/api/Customer		2025-05-07 09:05:12.663636
5315	thespiker	GET	/api/Customer		2025-05-07 09:05:12.66829
5331	thespiker	GET	/api/Customer		2025-05-07 09:05:12.699088
5342	thespiker	GET	/api/Customer		2025-05-07 09:05:12.716086
5347	thespiker	GET	/api/Customer		2025-05-07 09:05:12.722113
5358	thespiker	GET	/api/Customer		2025-05-07 09:05:12.730472
5367	thespiker	GET	/api/Customer		2025-05-07 09:05:12.735508
5375	thespiker	GET	/api/Customer		2025-05-07 09:05:12.740209
5380	thespiker	GET	/api/Customer		2025-05-07 09:05:12.754219
5461	thespiker	GET	/api/Customer		2025-05-07 09:05:12.838451
5476	thespiker	GET	/api/Customer		2025-05-07 09:05:12.860431
5491	thespiker	GET	/api/Customer		2025-05-07 09:05:12.863834
5497	thespiker	GET	/api/Customer		2025-05-07 09:05:12.871119
5549	thespiker	GET	/api/Customer		2025-05-07 09:05:12.933187
5584	thespiker	GET	/api/Customer		2025-05-07 09:05:12.976872
5623	thespiker	GET	/api/Customer		2025-05-07 09:05:13.117528
5652	thespiker	GET	/api/Customer		2025-05-07 09:05:13.297001
5689	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936394
5728	thespiker	GET	/api/Customer		2025-05-07 09:05:13.501315
5747	thespiker	GET	/api/Customer		2025-05-07 09:05:13.521376
5799	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936394
5821	thespiker	GET	/api/Customer		2025-05-07 09:05:13.666232
5822	thespiker	GET	/api/Customer		2025-05-07 09:05:13.666221
5872	thespiker	GET	/api/Customer		2025-05-07 09:05:12.936394
5898	thespiker	GET	/api/Customer		2025-05-07 09:05:13.751357
5922	thespiker	GET	/api/Customer		2025-05-07 09:05:13.775235
5946	thespiker	GET	/api/Customer		2025-05-07 09:05:13.808187
6235	thespiker	DELETE	/api/Loan/37		2025-05-07 10:07:36.248137
6236	thespiker	GET	/api/Loan		2025-05-07 10:07:37.501878
6237	thespiker	PUT	/api/Loan	{"loantypeid":2,"statusid":3,"customerid":10,"creationTime":"2025-05-07","id":37,"amount":12345,"interestrate":4,"termmonths":21,"creatintime":"2025-05-07T07:04:26.588Z"}	2025-05-07 10:07:40.560017
3855	thespiker	GET	/api/Customer		2025-05-07 09:00:56.770123
3869	thespiker	GET	/api/Customer		2025-05-07 09:00:56.774837
3875	thespiker	GET	/api/Customer		2025-05-07 09:00:56.798351
3895	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808108
3914	thespiker	GET	/api/Customer		2025-05-07 09:00:56.833488
3915	thespiker	GET	/api/Customer		2025-05-07 09:00:56.833588
3916	thespiker	GET	/api/Customer		2025-05-07 09:00:56.833488
3936	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731026
3943	thespiker	GET	/api/Customer		2025-05-07 09:01:25.164066
3958	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171764
3962	thespiker	GET	/api/Customer		2025-05-07 09:01:24.45019
3966	thespiker	GET	/api/Customer		2025-05-07 09:01:25.223315
3967	thespiker	GET	/api/Customer		2025-05-07 09:01:25.229035
3980	thespiker	GET	/api/Customer		2025-05-07 09:01:25.239983
3981	thespiker	GET	/api/Customer		2025-05-07 09:01:25.240545
4003	thespiker	GET	/api/Customer		2025-05-07 09:01:24.407942
3996	thespiker	GET	/api/Customer		2025-05-07 09:01:24.448467
4013	thespiker	GET	/api/Customer		2025-05-07 09:01:25.288814
4018	thespiker	GET	/api/Customer		2025-05-07 09:01:25.29082
4036	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292777
4042	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292841
4041	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293615
4050	thespiker	GET	/api/Customer		2025-05-07 09:01:25.314688
4061	thespiker	GET	/api/Customer		2025-05-07 09:01:25.322169
4060	thespiker	GET	/api/Customer		2025-05-07 09:01:24.450674
4066	thespiker	GET	/api/Customer		2025-05-07 09:01:25.32771
4084	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345524
4087	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345876
4086	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345775
4071	thespiker	GET	/api/Customer		2025-05-07 09:01:24.448875
4112	thespiker	GET	/api/Customer		2025-05-07 09:01:25.364804
4118	thespiker	GET	/api/Customer		2025-05-07 09:01:25.37061
4120	thespiker	GET	/api/Customer		2025-05-07 09:01:25.375568
4129	thespiker	GET	/api/Customer		2025-05-07 09:01:25.390057
4141	thespiker	GET	/api/Customer		2025-05-07 09:01:24.414376
4145	thespiker	GET	/api/Customer		2025-05-07 09:01:24.446902
4160	thespiker	GET	/api/Customer		2025-05-07 09:01:24.454309
4167	thespiker	GET	/api/Customer		2025-05-07 09:01:24.407216
4184	thespiker	GET	/api/Customer		2025-05-07 09:01:25.624432
4193	thespiker	GET	/api/Customer		2025-05-07 09:01:25.637258
4199	thespiker	GET	/api/Customer		2025-05-07 09:01:25.641057
4204	thespiker	GET	/api/Customer		2025-05-07 09:01:25.64609
4215	thespiker	GET	/api/Customer		2025-05-07 09:01:25.65185
4220	thespiker	GET	/api/Customer		2025-05-07 09:01:25.668631
4226	thespiker	GET	/api/Customer		2025-05-07 09:01:25.67376
4235	thespiker	GET	/api/Customer		2025-05-07 09:01:25.678889
4245	thespiker	GET	/api/Customer		2025-05-07 09:01:25.685015
4252	thespiker	GET	/api/Customer		2025-05-07 09:01:25.692065
4254	thespiker	GET	/api/Customer		2025-05-07 09:01:25.703267
4258	thespiker	GET	/api/Customer		2025-05-07 09:01:25.70581
4263	thespiker	GET	/api/Customer		2025-05-07 09:01:25.71008
4274	thespiker	GET	/api/Customer		2025-05-07 09:01:25.717663
4281	thespiker	GET	/api/Customer		2025-05-07 09:01:25.723078
4294	thespiker	GET	/api/Customer		2025-05-07 09:01:25.739589
4303	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743756
4321	thespiker	GET	/api/Customer		2025-05-07 09:01:25.753608
4331	thespiker	GET	/api/Customer		2025-05-07 09:01:25.771734
4335	thespiker	GET	/api/Customer		2025-05-07 09:01:25.778082
4350	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783445
4364	thespiker	GET	/api/Customer		2025-05-07 09:01:25.809178
4365	thespiker	GET	/api/Customer		2025-05-07 09:01:25.529777
4369	thespiker	GET	/api/Customer		2025-05-07 09:01:25.818952
4392	thespiker	GET	/api/Customer		2025-05-07 09:01:25.849909
4403	thespiker	GET	/api/Customer		2025-05-07 09:01:25.858764
4406	thespiker	GET	/api/Customer		2025-05-07 09:01:25.861635
4410	thespiker	GET	/api/Customer		2025-05-07 09:01:25.86523
4416	thespiker	GET	/api/Customer		2025-05-07 09:01:25.868361
4420	thespiker	GET	/api/Customer		2025-05-07 09:01:25.87406
4431	thespiker	GET	/api/Customer		2025-05-07 09:01:25.892077
4441	thespiker	GET	/api/Customer		2025-05-07 09:01:25.899653
4455	thespiker	GET	/api/Customer		2025-05-07 09:01:25.909284
4474	thespiker	GET	/api/Customer		2025-05-07 09:01:25.93255
4476	thespiker	GET	/api/Customer		2025-05-07 09:01:25.933547
4485	thespiker	GET	/api/Customer		2025-05-07 09:01:25.941947
4488	thespiker	GET	/api/Customer		2025-05-07 09:01:25.944313
4491	thespiker	GET	/api/Customer		2025-05-07 09:01:25.948252
4514	thespiker	GET	/api/Customer		2025-05-07 09:01:25.970613
4515	thespiker	GET	/api/Customer		2025-05-07 09:01:25.970613
4525	thespiker	GET	/api/Customer		2025-05-07 09:01:26.011332
4533	thespiker	GET	/api/Customer		2025-05-07 09:01:26.0151
4553	thespiker	GET	/api/Customer		2025-05-07 09:01:26.039233
4559	thespiker	GET	/api/Customer		2025-05-07 09:01:25.785422
4574	thespiker	GET	/api/Customer		2025-05-07 09:01:26.063619
4575	thespiker	GET	/api/Customer		2025-05-07 09:01:26.063619
4585	thespiker	GET	/api/Customer		2025-05-07 09:01:26.073009
4593	thespiker	GET	/api/Customer		2025-05-07 09:01:26.074938
4605	thespiker	GET	/api/Customer		2025-05-07 09:01:26.086343
4608	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088184
4614	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088151
4617	thespiker	GET	/api/Customer		2025-05-07 09:01:26.106382
4619	thespiker	GET	/api/Customer		2025-05-07 09:01:26.108589
4637	thespiker	GET	/api/Customer		2025-05-07 09:01:26.116135
4638	thespiker	GET	/api/Customer		2025-05-07 09:01:26.116135
4655	thespiker	GET	/api/Customer		2025-05-07 09:01:26.135794
4659	thespiker	GET	/api/Customer		2025-05-07 09:01:26.145012
4672	thespiker	GET	/api/Customer		2025-05-07 09:01:26.152474
4676	thespiker	GET	/api/Customer		2025-05-07 09:01:26.153684
4677	thespiker	GET	/api/Customer		2025-05-07 09:01:26.153781
4714	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177687
4721	thespiker	GET	/api/Customer		2025-05-07 09:01:26.17832
4725	thespiker	GET	/api/Customer		2025-05-07 09:01:26.179214
4731	thespiker	GET	/api/Customer		2025-05-07 09:01:26.195744
4734	thespiker	GET	/api/Customer		2025-05-07 09:01:26.204536
4742	thespiker	GET	/api/Customer		2025-05-07 09:01:26.213033
4745	thespiker	GET	/api/Customer		2025-05-07 09:01:26.215369
4754	thespiker	GET	/api/Customer		2025-05-07 09:01:26.22704
4758	thespiker	GET	/api/Customer		2025-05-07 09:01:26.228203
3856	thespiker	GET	/api/Customer		2025-05-07 09:00:56.770329
3871	thespiker	GET	/api/Customer		2025-05-07 09:00:56.77884
3888	thespiker	GET	/api/Customer		2025-05-07 09:00:56.806403
3897	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808705
3917	thespiker	GET	/api/Customer		2025-05-07 09:00:56.837137
3929	thespiker	GET	/api/Customer		2025-05-07 09:00:56.850476
3934	thespiker	GET	/api/Customer		2025-05-07 09:01:23.731015
3951	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171338
3963	thespiker	GET	/api/Customer		2025-05-07 09:01:24.407216
3964	thespiker	GET	/api/Customer		2025-05-07 09:01:25.222759
3973	thespiker	GET	/api/Customer		2025-05-07 09:01:25.238255
3976	thespiker	GET	/api/Customer		2025-05-07 09:01:25.239273
3992	thespiker	GET	/api/Customer		2025-05-07 09:01:24.448467
4009	thespiker	GET	/api/Customer		2025-05-07 09:01:25.266506
4012	thespiker	GET	/api/Customer		2025-05-07 09:01:24.41004
4017	thespiker	GET	/api/Customer		2025-05-07 09:01:25.290404
4027	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293295
4030	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292016
4043	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293235
4067	thespiker	GET	/api/Customer		2025-05-07 09:01:24.45183
4094	thespiker	GET	/api/Customer		2025-05-07 09:01:25.34661
4096	thespiker	GET	/api/Customer		2025-05-07 09:01:24.41211
4111	thespiker	GET	/api/Customer		2025-05-07 09:01:25.364804
4116	thespiker	GET	/api/Customer		2025-05-07 09:01:25.369299
4142	thespiker	GET	/api/Customer		2025-05-07 09:01:24.410056
4144	thespiker	GET	/api/Customer		2025-05-07 09:01:24.413292
4162	thespiker	GET	/api/Customer		2025-05-07 09:01:24.450949
4164	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408909
4205	thespiker	GET	/api/Customer		2025-05-07 09:01:25.646068
4214	thespiker	GET	/api/Customer		2025-05-07 09:01:25.651466
4219	thespiker	GET	/api/Customer		2025-05-07 09:01:25.667457
4223	thespiker	GET	/api/Customer		2025-05-07 09:01:25.66968
4231	thespiker	GET	/api/Customer		2025-05-07 09:01:25.677946
4241	thespiker	GET	/api/Customer		2025-05-07 09:01:25.684137
4261	thespiker	GET	/api/Customer		2025-05-07 09:01:25.709371
4265	thespiker	GET	/api/Customer		2025-05-07 09:01:25.711102
4278	thespiker	GET	/api/Customer		2025-05-07 09:01:25.718659
4291	thespiker	GET	/api/Customer		2025-05-07 09:01:25.725088
4293	thespiker	GET	/api/Customer		2025-05-07 09:01:25.738325
4301	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743756
4309	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4320	thespiker	GET	/api/Customer		2025-05-07 09:01:25.753609
4330	thespiker	GET	/api/Customer		2025-05-07 09:01:25.770399
4337	thespiker	GET	/api/Customer		2025-05-07 09:01:25.779173
4346	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782556
4359	thespiker	GET	/api/Customer		2025-05-07 09:01:25.80079
4375	thespiker	GET	/api/Customer		2025-05-07 09:01:25.826379
4378	thespiker	GET	/api/Customer		2025-05-07 09:01:25.647043
4393	thespiker	GET	/api/Customer		2025-05-07 09:01:25.849874
4411	thespiker	GET	/api/Customer		2025-05-07 09:01:25.866082
4437	thespiker	GET	/api/Customer		2025-05-07 09:01:25.894636
4456	thespiker	GET	/api/Customer		2025-05-07 09:01:25.909284
4457	thespiker	GET	/api/Customer		2025-05-07 09:01:25.912752
4461	thespiker	GET	/api/Customer		2025-05-07 09:01:25.922391
4465	thespiker	GET	/api/Customer		2025-05-07 09:01:25.925964
4470	thespiker	GET	/api/Customer		2025-05-07 09:01:25.927911
4480	thespiker	GET	/api/Customer		2025-05-07 09:01:25.934452
4498	thespiker	GET	/api/Customer		2025-05-07 09:01:25.95853
4503	thespiker	GET	/api/Customer		2025-05-07 09:01:25.964369
4521	thespiker	GET	/api/Customer		2025-05-07 09:01:26.010723
4532	thespiker	GET	/api/Customer		2025-05-07 09:01:26.013789
4534	thespiker	GET	/api/Customer		2025-05-07 09:01:26.015058
4537	thespiker	GET	/api/Customer		2025-05-07 09:01:26.02826
4547	thespiker	GET	/api/Customer		2025-05-07 09:01:26.037247
4564	thespiker	GET	/api/Customer		2025-05-07 09:01:26.047693
4567	thespiker	GET	/api/Customer		2025-05-07 09:01:26.049232
4560	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783458
4571	thespiker	GET	/api/Customer		2025-05-07 09:01:26.050816
4580	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071439
4587	thespiker	GET	/api/Customer		2025-05-07 09:01:26.073014
4607	thespiker	GET	/api/Customer		2025-05-07 09:01:26.088151
4634	thespiker	GET	/api/Customer		2025-05-07 09:01:26.114343
4641	thespiker	GET	/api/Customer		2025-05-07 09:01:26.11801
4645	thespiker	GET	/api/Customer		2025-05-07 09:01:26.124471
4662	thespiker	GET	/api/Customer		2025-05-07 09:01:26.146404
4668	thespiker	GET	/api/Customer		2025-05-07 09:01:26.150917
4682	thespiker	GET	/api/Customer		2025-05-07 09:01:26.156005
4705	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176507
4710	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177397
4718	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178321
4740	thespiker	GET	/api/Customer		2025-05-07 09:01:26.210886
4746	thespiker	GET	/api/Customer		2025-05-07 09:01:26.218253
4747	thespiker	GET	/api/Customer		2025-05-07 09:01:26.218459
4760	thespiker	GET	/api/Customer		2025-05-07 09:01:26.220705
4762	thespiker	GET	/api/Customer		2025-05-07 09:01:26.229322
4767	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236559
4773	thespiker	GET	/api/Customer		2025-05-07 09:01:26.237474
4782	thespiker	GET	/api/Customer		2025-05-07 09:01:26.239476
4797	thespiker	GET	/api/Customer		2025-05-07 09:01:26.241118
4799	thespiker	GET	/api/Customer		2025-05-07 09:01:26.24175
4806	thespiker	GET	/api/Customer		2025-05-07 09:01:26.253987
4815	thespiker	GET	/api/Customer		2025-05-07 09:01:26.261455
4819	thespiker	GET	/api/Customer		2025-05-07 09:01:26.269112
4822	thespiker	GET	/api/Customer		2025-05-07 09:01:26.297206
4832	thespiker	GET	/api/Customer		2025-05-07 09:01:26.300346
4838	thespiker	GET	/api/Customer		2025-05-07 09:01:26.303676
4849	thespiker	GET	/api/Customer		2025-05-07 09:01:26.305589
4857	thespiker	GET	/api/Customer		2025-05-07 09:01:26.380837
4861	thespiker	GET	/api/Customer		2025-05-07 09:01:26.38828
4864	thespiker	GET	/api/Customer		2025-05-07 09:01:26.249691
4871	thespiker	GET	/api/Customer		2025-05-07 09:01:26.471922
4872	thespiker	GET	/api/Customer		2025-05-07 09:01:26.476975
4877	thespiker	GET	/api/Customer		2025-05-07 09:01:26.483399
4876	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256197
4885	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256666
4894	thespiker	GET	/api/Customer		2025-05-07 09:01:26.521513
4901	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256443
3857	thespiker	GET	/api/Customer		2025-05-07 09:00:56.770341
3872	thespiker	GET	/api/Customer		2025-05-07 09:00:56.77884
3899	thespiker	GET	/api/Customer		2025-05-07 09:00:56.809159
3909	thespiker	GET	/api/Customer		2025-05-07 09:00:56.830685
3918	thespiker	GET	/api/Customer		2025-05-07 09:00:56.837137
3937	thespiker	GET	/api/Customer		2025-05-07 09:01:24.408813
3947	thespiker	GET	/api/Customer		2025-05-07 09:01:25.16407
3954	thespiker	GET	/api/Customer		2025-05-07 09:01:25.172117
3977	thespiker	GET	/api/Customer		2025-05-07 09:01:25.24009
3971	thespiker	GET	/api/Customer		2025-05-07 09:01:24.449708
4002	thespiker	GET	/api/Customer		2025-05-07 09:01:24.446051
4026	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291692
4044	thespiker	GET	/api/Customer		2025-05-07 09:01:25.29336
4047	thespiker	GET	/api/Customer		2025-05-07 09:01:25.293469
4051	thespiker	GET	/api/Customer		2025-05-07 09:01:24.414489
4081	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345076
4089	thespiker	GET	/api/Customer		2025-05-07 09:01:25.345844
4070	thespiker	GET	/api/Customer		2025-05-07 09:01:24.349839
4105	thespiker	GET	/api/Customer		2025-05-07 09:01:25.358255
4110	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453225
4114	thespiker	GET	/api/Customer		2025-05-07 09:01:25.365941
4126	thespiker	GET	/api/Customer		2025-05-07 09:01:25.38472
4131	thespiker	GET	/api/Customer		2025-05-07 09:01:25.391171
4146	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
4143	thespiker	GET	/api/Customer		2025-05-07 09:01:24.450704
4163	thespiker	GET	/api/Customer		2025-05-07 09:01:24.411975
4166	thespiker	GET	/api/Customer		2025-05-07 09:01:24.349634
4209	thespiker	GET	/api/Customer		2025-05-07 09:01:25.647043
4216	thespiker	GET	/api/Customer		2025-05-07 09:01:25.665924
4222	thespiker	GET	/api/Customer		2025-05-07 09:01:25.668631
4232	thespiker	GET	/api/Customer		2025-05-07 09:01:25.677946
4238	thespiker	GET	/api/Customer		2025-05-07 09:01:25.683481
4266	thespiker	GET	/api/Customer		2025-05-07 09:01:25.711225
4275	thespiker	GET	/api/Customer		2025-05-07 09:01:25.717666
4285	thespiker	GET	/api/Customer		2025-05-07 09:01:25.724064
4304	thespiker	GET	/api/Customer		2025-05-07 09:01:25.743887
4313	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4322	thespiker	GET	/api/Customer		2025-05-07 09:01:25.753618
4338	thespiker	GET	/api/Customer		2025-05-07 09:01:25.781503
4354	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4374	thespiker	GET	/api/Customer		2025-05-07 09:01:25.825195
4382	thespiker	GET	/api/Customer		2025-05-07 09:01:25.832649
4395	thespiker	GET	/api/Customer		2025-05-07 09:01:25.849874
4407	thespiker	GET	/api/Customer		2025-05-07 09:01:25.862578
4424	thespiker	GET	/api/Customer		2025-05-07 09:01:25.883749
4427	thespiker	GET	/api/Customer		2025-05-07 09:01:25.888058
4436	thespiker	GET	/api/Customer		2025-05-07 09:01:25.894636
4466	thespiker	GET	/api/Customer		2025-05-07 09:01:25.926482
4471	thespiker	GET	/api/Customer		2025-05-07 09:01:25.929039
4475	thespiker	GET	/api/Customer		2025-05-07 09:01:25.93255
4482	thespiker	GET	/api/Customer		2025-05-07 09:01:25.93757
4486	thespiker	GET	/api/Customer		2025-05-07 09:01:25.943167
4495	thespiker	GET	/api/Customer		2025-05-07 09:01:25.949291
4499	thespiker	GET	/api/Customer		2025-05-07 09:01:25.95853
4500	thespiker	GET	/api/Customer		2025-05-07 09:01:25.963391
4505	thespiker	GET	/api/Customer		2025-05-07 09:01:25.964782
4512	thespiker	GET	/api/Customer		2025-05-07 09:01:25.969486
4517	thespiker	GET	/api/Customer		2025-05-07 09:01:25.971974
4524	thespiker	GET	/api/Customer		2025-05-07 09:01:26.011369
4555	thespiker	GET	/api/Customer		2025-05-07 09:01:26.041192
4563	thespiker	GET	/api/Customer		2025-05-07 09:01:26.047562
4566	thespiker	GET	/api/Customer		2025-05-07 09:01:26.047685
4572	thespiker	GET	/api/Customer		2025-05-07 09:01:26.050877
4581	thespiker	GET	/api/Customer		2025-05-07 09:01:26.071398
4590	thespiker	GET	/api/Customer		2025-05-07 09:01:26.074906
4598	thespiker	GET	/api/Customer		2025-05-07 09:01:25.783603
4604	thespiker	GET	/api/Customer		2025-05-07 09:01:26.086137
4613	thespiker	GET	/api/Customer		2025-05-07 09:01:26.098412
4625	thespiker	GET	/api/Customer		2025-05-07 09:01:26.110465
4635	thespiker	GET	/api/Customer		2025-05-07 09:01:26.114325
4650	thespiker	GET	/api/Customer		2025-05-07 09:01:26.134316
4652	thespiker	GET	/api/Customer		2025-05-07 09:01:26.134205
4658	thespiker	GET	/api/Customer		2025-05-07 09:01:26.139587
4661	thespiker	GET	/api/Customer		2025-05-07 09:01:26.146403
4664	thespiker	GET	/api/Customer		2025-05-07 09:01:26.147753
4689	thespiker	GET	/api/Customer		2025-05-07 09:01:26.168764
4712	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177456
4719	thespiker	GET	/api/Customer		2025-05-07 09:01:26.178321
4741	thespiker	GET	/api/Customer		2025-05-07 09:01:26.212231
4744	thespiker	GET	/api/Customer		2025-05-07 09:01:26.214267
4748	thespiker	GET	/api/Customer		2025-05-07 09:01:26.219547
4752	thespiker	GET	/api/Customer		2025-05-07 09:01:26.22704
4761	thespiker	GET	/api/Customer		2025-05-07 09:01:26.228574
4769	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236582
4770	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236585
4771	thespiker	GET	/api/Customer		2025-05-07 09:01:26.236783
4793	thespiker	GET	/api/Customer		2025-05-07 09:01:26.238468
4808	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255274
4828	thespiker	GET	/api/Customer		2025-05-07 09:01:26.299331
4831	thespiker	GET	/api/Customer		2025-05-07 09:01:26.299941
4842	thespiker	GET	/api/Customer		2025-05-07 09:01:26.304882
4865	thespiker	GET	/api/Customer		2025-05-07 09:01:26.460347
4874	thespiker	GET	/api/Customer		2025-05-07 09:01:26.478002
4878	thespiker	GET	/api/Customer		2025-05-07 09:01:26.483873
4886	thespiker	GET	/api/Customer		2025-05-07 09:01:26.504216
4888	thespiker	GET	/api/Customer		2025-05-07 09:01:26.256378
4895	thespiker	GET	/api/Customer		2025-05-07 09:01:26.255274
4906	thespiker	GET	/api/Customer		2025-05-07 09:01:26.536903
4907	thespiker	GET	/api/Customer		2025-05-07 09:01:26.538685
4909	thespiker	GET	/api/Customer		2025-05-07 09:01:26.54492
4947	thespiker	GET	/api/Customer		2025-05-07 09:02:13.395347
5002	thespiker	GET	/api/Customer		2025-05-07 09:05:10.887086
5015	thespiker	GET	/api/Customer		2025-05-07 09:05:10.914857
5053	thespiker	GET	/api/Customer		2025-05-07 09:05:10.913433
5180	thespiker	GET	/api/Customer		2025-05-07 09:05:12.510476
5192	thespiker	GET	/api/Customer		2025-05-07 09:05:12.523804
5212	thespiker	GET	/api/Customer		2025-05-07 09:05:12.550103
3858	thespiker	GET	/api/Customer		2025-05-07 09:00:56.769999
3874	thespiker	GET	/api/Customer		2025-05-07 09:00:56.797943
3898	thespiker	GET	/api/Customer		2025-05-07 09:00:56.808705
3900	thespiker	GET	/api/Customer		2025-05-07 09:00:56.809437
3913	thespiker	GET	/api/Customer		2025-05-07 09:00:56.833607
3921	thespiker	GET	/api/Customer		2025-05-07 09:00:56.83956
3924	thespiker	GET	/api/Customer		2025-05-07 09:00:56.841625
3930	thespiker	GET	/api/Customer		2025-05-07 09:00:56.853498
3938	thespiker	GET	/api/Customer		2025-05-07 09:01:24.340247
3946	thespiker	GET	/api/Customer		2025-05-07 09:01:25.164066
3955	thespiker	GET	/api/Customer		2025-05-07 09:01:25.171341
3965	thespiker	GET	/api/Customer		2025-05-07 09:01:25.2229
3974	thespiker	GET	/api/Customer		2025-05-07 09:01:25.239103
3984	thespiker	GET	/api/Customer		2025-05-07 09:01:24.453411
3988	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
4006	thespiker	GET	/api/Customer		2025-05-07 09:01:25.264585
4011	thespiker	GET	/api/Customer		2025-05-07 09:01:25.282599
4024	thespiker	GET	/api/Customer		2025-05-07 09:01:25.291572
4035	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292404
4040	thespiker	GET	/api/Customer		2025-05-07 09:01:25.292821
4056	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
4090	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346323
4092	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346336
4101	thespiker	GET	/api/Customer		2025-05-07 09:01:25.346615
4072	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451071
4102	thespiker	GET	/api/Customer		2025-05-07 09:01:25.347112
4119	thespiker	GET	/api/Customer		2025-05-07 09:01:24.412963
4130	thespiker	GET	/api/Customer		2025-05-07 09:01:25.390032
4135	thespiker	GET	/api/Customer		2025-05-07 09:01:25.416553
4149	thespiker	GET	/api/Customer		2025-05-07 09:01:24.350489
4154	thespiker	GET	/api/Customer		2025-05-07 09:01:24.342246
4165	thespiker	GET	/api/Customer		2025-05-07 09:01:24.451519
4174	thespiker	GET	/api/Customer		2025-05-07 09:01:25.583765
4179	thespiker	GET	/api/Customer		2025-05-07 09:01:25.611205
4185	thespiker	GET	/api/Customer		2025-05-07 09:01:25.627195
4187	thespiker	GET	/api/Customer		2025-05-07 09:01:25.630896
4192	thespiker	GET	/api/Customer		2025-05-07 09:01:25.637258
4202	thespiker	GET	/api/Customer		2025-05-07 09:01:25.645139
4211	thespiker	GET	/api/Customer		2025-05-07 09:01:25.648026
4206	thespiker	GET	/api/Customer		2025-05-07 09:01:25.646065
4227	thespiker	GET	/api/Customer		2025-05-07 09:01:25.674566
4228	thespiker	GET	/api/Customer		2025-05-07 09:01:25.674781
4233	thespiker	GET	/api/Customer		2025-05-07 09:01:25.67855
4237	thespiker	GET	/api/Customer		2025-05-07 09:01:25.679942
4240	thespiker	GET	/api/Customer		2025-05-07 09:01:25.684012
4247	thespiker	GET	/api/Customer		2025-05-07 09:01:25.688914
4248	thespiker	GET	/api/Customer		2025-05-07 09:01:25.689465
4250	thespiker	GET	/api/Customer		2025-05-07 09:01:25.690849
4253	thespiker	GET	/api/Customer		2025-05-07 09:01:25.701763
4267	thespiker	GET	/api/Customer		2025-05-07 09:01:25.711231
4271	thespiker	GET	/api/Customer		2025-05-07 09:01:25.713325
4273	thespiker	GET	/api/Customer		2025-05-07 09:01:25.71665
4286	thespiker	GET	/api/Customer		2025-05-07 09:01:25.724064
4290	thespiker	GET	/api/Customer		2025-05-07 09:01:25.725088
4295	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7427
4296	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7427
4311	thespiker	GET	/api/Customer		2025-05-07 09:01:25.751555
4319	thespiker	GET	/api/Customer		2025-05-07 09:01:25.752633
4328	thespiker	GET	/api/Customer		2025-05-07 09:01:25.7692
4329	thespiker	GET	/api/Customer		2025-05-07 09:01:25.770374
4342	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782014
4345	thespiker	GET	/api/Customer		2025-05-07 09:01:25.782552
4357	thespiker	GET	/api/Customer		2025-05-07 09:01:25.786432
4372	thespiker	GET	/api/Customer		2025-05-07 09:01:25.82452
4380	thespiker	GET	/api/Customer		2025-05-07 09:01:25.831524
4384	thespiker	GET	/api/Customer		2025-05-07 09:01:25.83266
4389	thespiker	GET	/api/Customer		2025-05-07 09:01:25.848732
4394	thespiker	GET	/api/Customer		2025-05-07 09:01:25.849874
4413	thespiker	GET	/api/Customer		2025-05-07 09:01:25.867181
4418	thespiker	GET	/api/Customer		2025-05-07 09:01:25.871102
4423	thespiker	GET	/api/Customer		2025-05-07 09:01:25.875128
4425	thespiker	GET	/api/Customer		2025-05-07 09:01:25.885104
4429	thespiker	GET	/api/Customer		2025-05-07 09:01:25.889541
4439	thespiker	GET	/api/Customer		2025-05-07 09:01:25.895832
4448	thespiker	GET	/api/Customer		2025-05-07 09:01:25.904403
4454	thespiker	GET	/api/Customer		2025-05-07 09:01:25.909284
4478	thespiker	GET	/api/Customer		2025-05-07 09:01:25.933559
4489	thespiker	GET	/api/Customer		2025-05-07 09:01:25.94344
4496	thespiker	GET	/api/Customer		2025-05-07 09:01:25.949291
4497	thespiker	GET	/api/Customer		2025-05-07 09:01:25.949982
4506	thespiker	GET	/api/Customer		2025-05-07 09:01:25.965787
4509	thespiker	GET	/api/Customer		2025-05-07 09:01:25.969484
4518	thespiker	GET	/api/Customer		2025-05-07 09:01:25.970622
4526	thespiker	GET	/api/Customer		2025-05-07 09:01:26.01235
4538	thespiker	GET	/api/Customer		2025-05-07 09:01:26.029893
4539	thespiker	GET	/api/Customer		2025-05-07 09:01:26.02976
4549	thespiker	GET	/api/Customer		2025-05-07 09:01:26.037773
4550	thespiker	GET	/api/Customer		2025-05-07 09:01:26.039172
4551	thespiker	GET	/api/Customer		2025-05-07 09:01:26.039331
4568	thespiker	GET	/api/Customer		2025-05-07 09:01:26.049212
4584	thespiker	GET	/api/Customer		2025-05-07 09:01:26.073009
4594	thespiker	GET	/api/Customer		2025-05-07 09:01:26.076665
4603	thespiker	GET	/api/Customer		2025-05-07 09:01:26.086654
4599	thespiker	GET	/api/Customer		2025-05-07 09:01:25.78444
4616	thespiker	GET	/api/Customer		2025-05-07 09:01:26.102722
4622	thespiker	GET	/api/Customer		2025-05-07 09:01:26.1087
4630	thespiker	GET	/api/Customer		2025-05-07 09:01:26.112868
4649	thespiker	GET	/api/Customer		2025-05-07 09:01:26.124539
4651	thespiker	GET	/api/Customer		2025-05-07 09:01:26.134205
4665	thespiker	GET	/api/Customer		2025-05-07 09:01:26.147753
4674	thespiker	GET	/api/Customer		2025-05-07 09:01:26.153684
4685	thespiker	GET	/api/Customer		2025-05-07 09:01:26.167692
4690	thespiker	GET	/api/Customer		2025-05-07 09:01:26.16896
4706	thespiker	GET	/api/Customer		2025-05-07 09:01:26.176546
4711	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177411
4713	thespiker	GET	/api/Customer		2025-05-07 09:01:26.177493
4728	thespiker	GET	/api/Customer		2025-05-07 09:01:26.192416
\.


--
-- Name: accounting_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounting_period_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.customers_id_seq', 121, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.loans_id_seq', 40, true);


--
-- Name: payment_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_schedules_id_seq', 163, true);


--
-- Name: payment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_types_id_seq', 4, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 63, true);


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

SELECT pg_catalog.setval('public.user_logs_id_seq', 6357, true);


--
-- Name: accounting_period accounting_period_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounting_period
    ADD CONSTRAINT accounting_period_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT payment_schedules_loanid_fkey FOREIGN KEY (loanid) REFERENCES public.loans(id) ON DELETE CASCADE;


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


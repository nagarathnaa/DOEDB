--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Debian 12.6-1.pgdg100+1)
-- Dumped by pg_dump version 12.6 (Debian 12.6-1.pgdg100+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    description character varying NOT NULL,
    projectid integer NOT NULL,
    assessmentcompletion numeric,
    achievedpercentage numeric,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_id_seq OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


--
-- Name: assessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessment (
    id integer NOT NULL,
    emp_id character varying(50) NOT NULL,
    projectid integer NOT NULL,
    area_id integer NOT NULL,
    functionality_id integer NOT NULL,
    subfunctionality_id integer,
    employeeassignedstatus integer,
    combination character varying(50) NOT NULL,
    totalmaxscore integer,
    totalscoreachieved integer,
    comment character varying(180),
    assessmentstatus character varying(50) NOT NULL,
    assessmenttakendatetime timestamp without time zone,
    assessmentrevieweddatetime timestamp without time zone,
    assessmentretakedatetime timestamp without time zone,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.assessment OWNER TO postgres;

--
-- Name: assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessment_id_seq OWNER TO postgres;

--
-- Name: assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessment_id_seq OWNED BY public.assessment.id;


--
-- Name: blacklist_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklist_token (
    id integer NOT NULL,
    token character varying(500) NOT NULL,
    blacklisted_on timestamp without time zone NOT NULL
);


ALTER TABLE public.blacklist_token OWNER TO postgres;

--
-- Name: blacklist_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blacklist_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blacklist_token_id_seq OWNER TO postgres;

--
-- Name: blacklist_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blacklist_token_id_seq OWNED BY public.blacklist_token.id;


--
-- Name: companydetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companydetails (
    id integer NOT NULL,
    companyname character varying(120) NOT NULL,
    registeredaddress character varying(255) NOT NULL,
    billingaddress character varying(255) NOT NULL,
    gstortaxnumber character varying(120) NOT NULL,
    registrationkey character varying(255) NOT NULL,
    registrationkeyvalidated integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.companydetails OWNER TO postgres;

--
-- Name: companydetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companydetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companydetails_id_seq OWNER TO postgres;

--
-- Name: companydetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companydetails_id_seq OWNED BY public.companydetails.id;


--
-- Name: companyuserdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyuserdetails (
    id integer NOT NULL,
    empid character varying(20) NOT NULL,
    empname character varying(120) NOT NULL,
    emprole character varying(50) NOT NULL,
    empemail character varying(120) NOT NULL,
    emppasswordhash character varying(255),
    companyid integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.companyuserdetails OWNER TO postgres;

--
-- Name: companyuserdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companyuserdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companyuserdetails_id_seq OWNER TO postgres;

--
-- Name: companyuserdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companyuserdetails_id_seq OWNED BY public.companyuserdetails.id;


--
-- Name: emailconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emailconfiguration (
    id integer NOT NULL,
    email character varying(120) NOT NULL,
    host character varying(120) NOT NULL,
    password character varying(255) NOT NULL,
    companyid integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.emailconfiguration OWNER TO postgres;

--
-- Name: emailconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emailconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emailconfiguration_id_seq OWNER TO postgres;

--
-- Name: emailconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emailconfiguration_id_seq OWNED BY public.emailconfiguration.id;


--
-- Name: functionality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.functionality (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying NOT NULL,
    retake_assessment_days integer,
    area_id integer NOT NULL,
    proj_id integer NOT NULL,
    assessmentcompletion numeric,
    achievedpercentage numeric,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.functionality OWNER TO postgres;

--
-- Name: functionality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.functionality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.functionality_id_seq OWNER TO postgres;

--
-- Name: functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.functionality_id_seq OWNED BY public.functionality.id;


--
-- Name: git; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.git (
    id integer NOT NULL,
    repo_id integer,
    name character varying(180) NOT NULL,
    description character varying,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    owner character varying,
    license character varying,
    includes_wiki character varying,
    forks_count character varying,
    issues_count character varying,
    stars_count character varying,
    watchers_count character varying,
    repo_url character varying,
    commits_url character varying,
    languages_url character varying,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.git OWNER TO postgres;

--
-- Name: git_hub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.git_hub (
    id integer NOT NULL,
    repo_id integer NOT NULL,
    name character varying(180) NOT NULL,
    description character varying,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    owner character varying,
    license character varying,
    includes_wiki character varying,
    forks_count character varying,
    issues_count character varying,
    stars_count character varying,
    watchers_count character varying,
    repo_url character varying,
    commits_url character varying,
    branches_url character varying,
    branch_name character varying,
    branch_commit character varying,
    branches_count character varying,
    branch_commit_count character varying,
    languages_url character varying,
    languages json[],
    languages_count character varying,
    releases_url character varying,
    releases_url_name character varying,
    releases_count character varying,
    releases_url_published_at character varying,
    prerelease character varying,
    commits_count character varying,
    community_health_percentage character varying,
    pulls_rqs_count character varying,
    count_user character varying,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.git_hub OWNER TO postgres;

--
-- Name: git_hub_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.git_hub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.git_hub_id_seq OWNER TO postgres;

--
-- Name: git_hub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.git_hub_id_seq OWNED BY public.git_hub.id;


--
-- Name: git_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.git_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.git_id_seq OWNER TO postgres;

--
-- Name: git_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.git_id_seq OWNED BY public.git.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    description character varying NOT NULL,
    levels json[] NOT NULL,
    companyid integer NOT NULL,
    assessmentcompletion numeric,
    achievedpercentage numeric,
    achievedlevel character varying(2),
    needforreview integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: projectassignmenttomanager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projectassignmenttomanager (
    id integer NOT NULL,
    emp_id character varying(50) NOT NULL,
    project_id integer NOT NULL,
    status integer,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.projectassignmenttomanager OWNER TO postgres;

--
-- Name: projectassignmenttomanager_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projectassignmenttomanager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projectassignmenttomanager_id_seq OWNER TO postgres;

--
-- Name: projectassignmenttomanager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projectassignmenttomanager_id_seq OWNED BY public.projectassignmenttomanager.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    answer_type character varying(50) NOT NULL,
    answers json[] NOT NULL,
    maxscore integer NOT NULL,
    subfunc_id integer,
    func_id integer NOT NULL,
    area_id integer NOT NULL,
    proj_id integer NOT NULL,
    combination character varying NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: questions_answered; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions_answered (
    id integer NOT NULL,
    qid integer NOT NULL,
    applicability integer,
    answers json[] NOT NULL,
    scoreachieved integer NOT NULL,
    maxscore integer NOT NULL,
    assignmentid integer NOT NULL,
    active integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.questions_answered OWNER TO postgres;

--
-- Name: questions_answered_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_answered_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_answered_id_seq OWNER TO postgres;

--
-- Name: questions_answered_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_answered_id_seq OWNED BY public.questions_answered.id;


--
-- Name: rbac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rbac (
    id integer NOT NULL,
    feature character varying(120) NOT NULL,
    roles character varying(255) NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    button character varying(3),
    icon character varying(120),
    url character varying(120)
);


ALTER TABLE public.rbac OWNER TO postgres;

--
-- Name: rbac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rbac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rbac_id_seq OWNER TO postgres;

--
-- Name: rbac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rbac_id_seq OWNED BY public.rbac.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    companyid integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: subfunctionality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subfunctionality (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying NOT NULL,
    retake_assessment_days integer,
    func_id integer NOT NULL,
    area_id integer NOT NULL,
    proj_id integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.subfunctionality OWNER TO postgres;

--
-- Name: subfunctionality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subfunctionality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subfunctionality_id_seq OWNER TO postgres;

--
-- Name: subfunctionality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subfunctionality_id_seq OWNED BY public.subfunctionality.id;


--
-- Name: tools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tools (
    id integer NOT NULL,
    job_name character varying(255) NOT NULL,
    total_no_build character varying(50),
    total_no_success character varying(50),
    total_no_failure character varying(50),
    "lastBuild_number" character varying(50),
    "lastBuild_duration" character varying(50),
    "lastBuild_user" character varying(100),
    "lastBuild_result" character varying(50),
    "lastCompletedBuild_number" character varying(50),
    "lastCompletedBuild_duration" character varying(50),
    "lastCompletedBuild_user" character varying(100),
    "lastFailedBuild_number" character varying(50),
    "lastFailedBuild_duration" character varying(50),
    "lastFailedBuild_user" character varying(100),
    "lastStableBuild_number" character varying(50),
    "lastStableBuild_duration" character varying(50),
    "lastSuccessfulBuild_number" character varying(50),
    "lastSuccessfulBuild_duration" character varying(50),
    "lastUnstableBuild" character varying(50),
    "healthReport_score" character varying(50),
    "lastUnsuccessfulBuild_number" character varying(50),
    "lastUnsuccessfulBuild_duration" character varying(50),
    "lastUnsuccessfulBuild_user" character varying(100),
    "lastSuccessfulBuild_user" character varying(100),
    "lastStableBuild_user" character varying(100),
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tools OWNER TO postgres;

--
-- Name: tools_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tools_login (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    url character varying(120) NOT NULL,
    password character varying(255) NOT NULL,
    projectid integer NOT NULL,
    creationdatetime timestamp without time zone DEFAULT now() NOT NULL,
    updationdatetime timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tools_login OWNER TO postgres;

--
-- Name: area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- Name: assessment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessment ALTER COLUMN id SET DEFAULT nextval('public.assessment_id_seq'::regclass);


--
-- Name: blacklist_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_token ALTER COLUMN id SET DEFAULT nextval('public.blacklist_token_id_seq'::regclass);


--
-- Name: companydetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companydetails ALTER COLUMN id SET DEFAULT nextval('public.companydetails_id_seq'::regclass);


--
-- Name: companyuserdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companyuserdetails ALTER COLUMN id SET DEFAULT nextval('public.companyuserdetails_id_seq'::regclass);


--
-- Name: emailconfiguration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emailconfiguration ALTER COLUMN id SET DEFAULT nextval('public.emailconfiguration_id_seq'::regclass);


--
-- Name: functionality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.functionality ALTER COLUMN id SET DEFAULT nextval('public.functionality_id_seq'::regclass);


--
-- Name: git id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.git ALTER COLUMN id SET DEFAULT nextval('public.git_id_seq'::regclass);


--
-- Name: git_hub id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.git_hub ALTER COLUMN id SET DEFAULT nextval('public.git_hub_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: projectassignmenttomanager id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projectassignmenttomanager ALTER COLUMN id SET DEFAULT nextval('public.projectassignmenttomanager_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: questions_answered id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions_answered ALTER COLUMN id SET DEFAULT nextval('public.questions_answered_id_seq'::regclass);


--
-- Name: rbac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rbac ALTER COLUMN id SET DEFAULT nextval('public.rbac_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: subfunctionality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subfunctionality ALTER COLUMN id SET DEFAULT nextval('public.subfunctionality_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
ac6ee34407ed
\.


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id, name, description, projectid, assessmentcompletion, achievedpercentage, creationdatetime, updationdatetime) FROM stdin;
199	Basic Info	Area-Basic Info Description	64	\N	\N	2021-02-26 08:58:12.473223	2021-02-26 08:58:12.473223
200	General	Area-general Description	64	\N	\N	2021-02-26 08:58:12.74472	2021-02-26 08:58:12.74472
201	Configuration & Change Management	Description	64	\N	\N	2021-02-26 08:58:12.915602	2021-02-26 08:58:12.915602
212	General	Area-general Description	69	\N	\N	2021-02-26 12:28:26.206913	2021-02-26 12:28:26.206913
213	Configuration & Change Management	Description	69	\N	\N	2021-02-26 12:28:26.39701	2021-02-26 12:28:26.39701
214	A1	Area desc	70	\N	\N	2021-02-26 12:54:32.764928	2021-02-26 12:54:32.764928
215	without review area	area desc	71	75.0	38.46153846153847	2021-02-26 13:17:40.483621	2021-02-26 13:42:51.340267
211	Basic Info	Area-Basic Info Description	69	100.0	23.684210526315788	2021-02-26 12:28:25.887619	2021-02-26 16:00:43.050483
223	toast test last	last desc	64	\N	\N	2021-02-26 20:43:29.822031	2021-02-26 20:43:29.822031
\.


--
-- Data for Name: assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessment (id, emp_id, projectid, area_id, functionality_id, subfunctionality_id, employeeassignedstatus, combination, totalmaxscore, totalscoreachieved, comment, assessmentstatus, assessmenttakendatetime, assessmentrevieweddatetime, assessmentretakedatetime, creationdatetime, updationdatetime) FROM stdin;
48	001	64	199	340	\N	1	00164199340	\N	\N	\N	NEW	\N	\N	\N	2021-02-26 12:07:10.431693	2021-02-26 12:07:10.431693
49	0001	64	199	340	\N	1	000164199340	35	12	\N	COMPLETED	2021-02-26 12:16:26.215784	\N	2021-03-03 12:16:26.215784	2021-02-26 12:08:55.430536	2021-02-26 12:16:26.566515
50	0001	69	211	364	\N	1	000169211364	38	9	Ok Good	COMPLETED	2021-02-26 12:35:33.544002	2021-02-26 12:37:42.504534	2021-03-03 12:35:33.544002	2021-02-26 12:30:40.176767	2021-02-26 12:37:42.380447
51	0001	70	214	370	54	1	00017021437054	14	6	Ok Good	COMPLETED	2021-02-26 13:07:20.191655	2021-02-26 13:09:41.93686	2021-03-03 13:07:20.191655	2021-02-26 13:03:22.974975	2021-02-26 13:09:41.853888
52	0001	71	215	371	\N	1	000171215371	13	5	\N	COMPLETED	2021-02-26 13:38:31.249304	\N	2021-02-27 09:38:31.249304	2021-02-26 13:37:30.310055	2021-02-26 13:38:31.3806
53	0001	72	216	372	\N	1	000172216372	\N	\N	\N	NEW	\N	\N	\N	2021-02-26 13:54:58.250784	2021-02-26 13:54:58.250784
54	0001	73	218	374	\N	1	000173218374	46	17	ok	COMPLETED	2021-02-26 14:12:49.42227	2021-02-26 15:04:23.168682	2021-03-01 14:12:49.42227	2021-02-26 14:11:34.387154	2021-02-26 15:04:23.076586
\.


--
-- Data for Name: blacklist_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklist_token (id, token, blacklisted_on) FROM stdin;
346	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTQyMDksImlhdCI6MTYxNDMyNzgwOSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.Vo3kE4crqjJ3G-20MLDFsMiyZ4M7kPFUr6ntuzoW-bU	2021-02-26 09:05:31.425969
347	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTY3NDksImlhdCI6MTYxNDMzMDM0OSwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.eIvYO08AM7Q07dvGM4BbXSlm-twfKA4gXW1hULpaprs	2021-02-26 09:15:53.147705
348	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTczNTksImlhdCI6MTYxNDMzMDk1OSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.mcOCD9mFTMlcC6Tm-XZDxCDBz6b8cHqp-Hg6pSiGNjc	2021-02-26 09:16:31.299347
349	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTc0MDAsImlhdCI6MTYxNDMzMTAwMCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.6ZIejIIxbU2MWVA0QnOk_jQV_WMAMM-L5rmgZ0Nrc6E	2021-02-26 09:23:19.312482
350	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTc4MDAsImlhdCI6MTYxNDMzMTQwMCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.-YI0pPK_SlrfQVZEzZf1_WMbrgfKPSBwibJjcm97tJM	2021-02-26 09:47:07.847983
351	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTkyNDQsImlhdCI6MTYxNDMzMjg0NCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.VOebcaz1MdOeDmM9fTROfmA4VaGK9wLoHDf4EjDWnB0	2021-02-26 09:59:35.076188
352	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MTk5ODIsImlhdCI6MTYxNDMzMzU4Miwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.zh35WJBtH7NgXMQG_6HldTLD9dy--z4IYKYsC4j4rDA	2021-02-26 10:31:27.825146
353	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjE4OTQsImlhdCI6MTYxNDMzNTQ5NCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.B1Dxha3-GzUZbQUMuF-NAL0DBhLfbaUO5gqeN3hz31c	2021-02-26 11:38:04.558242
354	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjU4OTAsImlhdCI6MTYxNDMzOTQ5MCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.tqSqCkMIr20UYURpJSqQhWP0ZCyrkV7As38JPJSVqCY	2021-02-26 11:47:30.816869
355	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjY0NTgsImlhdCI6MTYxNDM0MDA1OCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.HNbEuuHU48CKN67tUf89LiFDrCdBrDnY6yXbBmh8FIQ	2021-02-26 11:47:54.447129
356	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjY0ODIsImlhdCI6MTYxNDM0MDA4Miwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.R8qrs3tRXDDYyAFIgVq_mbsGZGPjqVC5kjjxNQceIxs	2021-02-26 11:52:08.716239
357	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Mjc2NzgsImlhdCI6MTYxNDM0MTI3OCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.5HRjoUOokoLR_0i051MkCY_6YujtVS0aqyWWZmgZH64	2021-02-26 12:14:02.138277
358	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjgwNTAsImlhdCI6MTYxNDM0MTY1MCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.mRp4_SoIm-T75FN99oPxoRqpPOq-K03rYHq629zkI7M	2021-02-26 12:16:42.140323
359	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjgyMDksImlhdCI6MTYxNDM0MTgwOSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.w6u6DP_E6GYRd1driY-aZApFVlwEJViypfTDVLuty8A	2021-02-26 12:17:04.760694
360	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjgyMzAsImlhdCI6MTYxNDM0MTgzMCwic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.99pAhFo8iAJvglLVR766n-Sf-tfsvQSquw0KQK-BBqo	2021-02-26 12:27:33.278572
361	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Mjg4NTksImlhdCI6MTYxNDM0MjQ1OSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.yUdniGNwgaI13UUAw40UgMTSBn42cgSSt0E6BxonGLw	2021-02-26 12:34:43.83836
362	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjkyOTEsImlhdCI6MTYxNDM0Mjg5MSwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.mOZZXHjK5lDu-6troPpone28OQjRJdRJYthVcVUxjxc	2021-02-26 12:35:41.207445
363	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MjkzNTAsImlhdCI6MTYxNDM0Mjk1MCwic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.b4yoY-xwQYghaqRjvuSJLcCAnsy8A3mec1ar6RUNNrk	2021-02-26 12:37:54.687248
364	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Mjk0ODMsImlhdCI6MTYxNDM0MzA4Mywic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.OZikdOqSYv6q7ucHeMTOHGz_Bd9LvmfzC8Kuv80ReDA	2021-02-26 12:48:43.22103
365	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzAxMjksImlhdCI6MTYxNDM0MzcyOSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.S4EvQmEA_elfJ3D2E4IZ6Tzk6Fe_pIqKKZ1afm8GTPQ	2021-02-26 13:04:27.232692
366	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzEwNzksImlhdCI6MTYxNDM0NDY3OSwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.14YGETNaaVdZDQHheq2jrAcZDXbR5kd2eSSRokv4dq0	2021-02-26 13:07:51.654321
367	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzEyODIsImlhdCI6MTYxNDM0NDg4Miwic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.X40YzIsQzC0oIAu_QgSEYKS-D3Xpq5V7psaHduJ25qk	2021-02-26 13:09:58.837038
368	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzE0MTAsImlhdCI6MTYxNDM0NTAxMCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.g7q7A2QY7WF-maxEEPZlyRJ7MVghmj4CMkqXw2o-ioE	2021-02-26 13:10:36.247796
369	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzE0NDUsImlhdCI6MTYxNDM0NTA0NSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.unvULkUMN6SuWK3n4hNh6k__Uh0FejQnMoC482sM9vE	2021-02-26 13:12:28.167339
370	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzE1NjMsImlhdCI6MTYxNDM0NTE2Mywic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.jQ4cehLnPTMoicmPZcj47GoXJEz4cwdZH7u7sPCbGd8	2021-02-26 13:13:06.777288
371	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzI5MTUsImlhdCI6MTYxNDM0NjUxNSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.TgDWLFd8ZWrx82ZisilzXPFDH3bI70j7rpJdyY3URSk	2021-02-26 13:37:56.129622
372	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzMwODUsImlhdCI6MTYxNDM0NjY4NSwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.TewvyltVnngc4Ujvm3zR1P2KotTDYkdsrlUBIRrINA0	2021-02-26 13:38:50.191821
373	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzMxMzcsImlhdCI6MTYxNDM0NjczNywic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.Dz2LXPVWt8YanwzEXOfFMmQp_7HBY9CFEQJkGFcXzX8	2021-02-26 13:42:24.81728
374	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzMzNTAsImlhdCI6MTYxNDM0Njk1MCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.IsHKx9AGZDZ-30dBtGPqznry9G8hz1qQbmfaFnljCfI	2021-02-26 13:45:08.172091
375	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzI3NTAsImlhdCI6MTYxNDM0NjM1MCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.9xZnQU7RW_8stUZzE9LpJrH2XI2PDcAsK3q8VIRSS78	2021-02-26 13:48:30.804202
376	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzM5MjcsImlhdCI6MTYxNDM0NzUyNywic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.vcGnzLYOdceXwGE9jtRt5m91wChBPWamaeqLHnMylJ0	2021-02-26 14:00:14.489406
377	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzQ0MjEsImlhdCI6MTYxNDM0ODAyMSwic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.gU2VQzZ-9LyRt9nZVcspnstNWYpDheQqoqRLBe-8xe8	2021-02-26 14:10:08.50874
378	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzUwMTQsImlhdCI6MTYxNDM0ODYxNCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.d5mWMZHuYwQq--2bbVtdXdSjixjTYp9FYmjIkqxeEr8	2021-02-26 14:11:52.303509
379	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzUxMjEsImlhdCI6MTYxNDM0ODcyMSwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.6H0vpu0WImNDA_ZDLVcyAt2d1m4l0sheDNIF7BwYmss	2021-02-26 14:12:55.693612
380	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0MzUxODQsImlhdCI6MTYxNDM0ODc4NCwic3ViIjoiZGVtb21hbmFnZXJAc3VyZXNoLmNvbSJ9.p4M1w3PwSZjqBQL9TkA9CrC4ato0ZmLZxbndAb06Ab4	2021-02-26 15:04:46.03837
381	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Mzg1MDEsImlhdCI6MTYxNDM1MjEwMSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.8_FaGrOLerp-B7Z0rNWUH_C5qe97ZSS9oMWPSlhSwoo	2021-02-26 15:09:08.978297
382	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Mzg1NjAsImlhdCI6MTYxNDM1MjE2MCwic3ViIjoiZGVtb1RNQHN1cmVzaC5jb20ifQ.90IRK9GYvxSpUpDWlOoUe8hBh7Uvl1Ie5AJLYkD1Pbk	2021-02-26 15:33:06.444092
383	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0NDA1NjUsImlhdCI6MTYxNDM1NDE2NSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.CMf1DdhGGMLbWui-n25_SUiW2cU1cB8hCwLa7B1SErU	2021-02-26 15:42:53.188391
384	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0NDA2NTYsImlhdCI6MTYxNDM1NDI1Niwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.VvVcJuif-a8P_rE1i3IeyGQamFWTBf6IL63fVjGunPY	2021-02-26 15:44:32.641299
385	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0NDcyNTYsImlhdCI6MTYxNDM2MDg1Niwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.O9Gvo8Xo89JYxUMTTlbA0kUx5iiRAaoPZndF4I_rn8M	2021-02-26 17:35:36.305228
386	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0NTg5MTgsImlhdCI6MTYxNDM3MjUxOCwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.frV-Utxq1BaCT7UGFMJVYVNL6x7AyTQ4fpBu-TDpXgk	2021-02-26 20:48:56.437518
387	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Nzg4ODIsImlhdCI6MTYxNDM5MjQ4Miwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.AhU0Olazg88esEYOTe0se8eQqPCBDakmOePJdfTjhZk	2021-02-27 02:21:49.808896
388	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0Nzg3NjMsImlhdCI6MTYxNDM5MjM2Mywic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.S7zhUK8VVWyBn3UEoTDbpelOkaf5xIKNE_CaLCbPhGs	2021-02-27 02:21:53.076912
389	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ0OTYzMzUsImlhdCI6MTYxNDQwOTkzNSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.EoahNp0m8U3dN8tI8lTyi_PlP5vlQvVJFjz2CGVAC-8	2021-02-27 08:57:56.774108
390	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ1MDI2ODMsImlhdCI6MTYxNDQxNjI4Mywic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.b2QMVYGddyQFgz_c4rklzTYjSvYlqN23K-_yze6IH6g	2021-02-27 09:00:29.828865
391	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTQ1MDI4MzUsImlhdCI6MTYxNDQxNjQzNSwic3ViIjoiaW5mb0BkZXZvcHNlbmFibGVyLmNvbSJ9.IWIGAzOnbOArqcgeB0ccc0T_MYK4ZbHZuJXHNP-1NuI	2021-02-27 15:13:08.591355
\.


--
-- Data for Name: companydetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companydetails (id, companyname, registeredaddress, billingaddress, gstortaxnumber, registrationkey, registrationkeyvalidated, creationdatetime, updationdatetime) FROM stdin;
1	DevOps Enabler & Co.	Varanasi Main Road	Varanasi Main Road	GSTIN12281800	ff4d4476-5ce1-42dd-bfe9-20cf1c54b35b	1	2021-02-26 13:30:47.325095	2021-02-26 13:30:47.325095
\.


--
-- Data for Name: companyuserdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companyuserdetails (id, empid, empname, emprole, empemail, emppasswordhash, companyid, creationdatetime, updationdatetime) FROM stdin;
129	DOE1	DOE App Admin	admin	info@devopsenabler.com	pbkdf2:sha256:150000$JhqEcUcJ$1c5d6a6d0b3f09a35342d2a825e3495eea8829196676312bcd7fa07afac5d78a	1	2021-02-26 13:30:47.440765	2021-02-26 13:30:47.440765
127	0001	Demo Team Member	teamMember	demoTM@suresh.com	pbkdf2:sha256:150000$jyWeoRC1$0383c7b947df8746f20e31abcff63d43f10fe13c474870af5acf9e2f60fe6a94	1	2021-02-26 12:03:40.984293	2021-02-26 12:03:40.984293
128	0002	Demo Manager	manager	demomanager@suresh.com	pbkdf2:sha256:150000$uaGxnkVC$6225f561eda486a6072ad74a880b8e1eaf88d59a978512227407a74e2adb6125	1	2021-02-26 12:04:12.940564	2021-02-26 12:04:12.940564
\.


--
-- Data for Name: emailconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emailconfiguration (id, email, host, password, companyid, creationdatetime, updationdatetime) FROM stdin;
5	default@gmail.com	default1234@gmail.com	abcdef	1	2021-02-26 05:33:54.575134	2021-02-26 09:53:06.885086
\.


--
-- Data for Name: functionality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.functionality (id, name, description, retake_assessment_days, area_id, proj_id, assessmentcompletion, achievedpercentage, creationdatetime, updationdatetime) FROM stdin;
341	overview	overview description	72	200	64	\N	\N	2021-02-26 08:58:12.752069	2021-02-26 08:58:12.752069
342	Version Control	vcs description	240	201	64	\N	\N	2021-02-26 08:58:12.922214	2021-02-26 08:58:12.922214
343	Continuous Integration 	ci description	48	201	64	\N	\N	2021-02-26 08:58:13.093819	2021-02-26 08:58:13.093819
344	Continuous Delivery	c.delivery description	120	201	64	\N	\N	2021-02-26 08:58:13.228779	2021-02-26 08:58:13.228779
345	Continuous Deployment	c.deployment description	240	201	64	\N	\N	2021-02-26 08:58:13.326265	2021-02-26 08:58:13.326265
365	overview	overview description	72	212	69	\N	\N	2021-02-26 12:28:26.213675	2021-02-26 12:28:26.213675
366	Version Control	vcs description	240	213	69	\N	\N	2021-02-26 12:28:26.40469	2021-02-26 12:28:26.40469
367	Continuous Integration 	ci description	48	213	69	\N	\N	2021-02-26 12:28:26.58134	2021-02-26 12:28:26.58134
368	Continuous Delivery	c.delivery description	120	213	69	\N	\N	2021-02-26 12:28:26.71286	2021-02-26 12:28:26.71286
369	Continuous Deployment	c.deployment description	240	213	69	\N	\N	2021-02-26 12:28:26.806779	2021-02-26 12:28:26.806779
364	Metadata 	metadata description	120	211	69	100.0	23.684210526315788	2021-02-26 12:28:25.980277	2021-02-26 12:49:49.644001
370	Func 1	func 1 desc	120	214	70	\N	\N	2021-02-26 12:54:57.920679	2021-02-26 12:54:57.920679
371	func 2	func desc	20	215	71	75.0	38.46153846153847	2021-02-26 13:18:03.397558	2021-02-26 13:42:55.644093
340	Metadata 	metadata description	200	199	64	\N	\N	2021-02-26 08:58:12.568122	2021-02-26 16:04:01.435587
\.


--
-- Data for Name: git; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.git (id, repo_id, name, description, created_on, updated_on, owner, license, includes_wiki, forks_count, issues_count, stars_count, watchers_count, repo_url, commits_url, languages_url, creationdatetime, updationdatetime) FROM stdin;
\.


--
-- Data for Name: git_hub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.git_hub (id, repo_id, name, description, created_on, updated_on, owner, license, includes_wiki, forks_count, issues_count, stars_count, watchers_count, repo_url, commits_url, branches_url, branch_name, branch_commit, branches_count, branch_commit_count, languages_url, languages, languages_count, releases_url, releases_url_name, releases_count, releases_url_published_at, prerelease, commits_count, community_health_percentage, pulls_rqs_count, count_user, creationdatetime, updationdatetime) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, name, description, levels, companyid, assessmentcompletion, achievedpercentage, achievedlevel, needforreview, creationdatetime, updationdatetime) FROM stdin;
71	Demo manual Question without review	demo project without review desc	{"{\\"LevelName\\": \\"A\\", \\"RangeFrom\\": 0, \\"RangeTo\\": 27}","{\\"LevelName\\": \\"B\\", \\"RangeFrom\\": 28, \\"RangeTo\\": 59}","{\\"LevelName\\": \\"C\\", \\"RangeFrom\\": 60, \\"RangeTo\\": 80}","{\\"LevelName\\": \\"D\\", \\"RangeFrom\\": 81, \\"RangeTo\\": 94}","{\\"LevelName\\": \\"E\\", \\"RangeFrom\\": 95, \\"RangeTo\\": 100}"}	1	75.0	38.46	B	0	2021-02-26 13:16:54.213351	2021-02-27 03:58:46.211002
70	Demo Project manual Question	demo project with manually added questions desc	{"{\\"LevelName\\": \\"A\\", \\"RangeFrom\\": 0, \\"RangeTo\\": 21}","{\\"LevelName\\": \\"B\\", \\"RangeFrom\\": 22, \\"RangeTo\\": 48}","{\\"LevelName\\": \\"C\\", \\"RangeFrom\\": 49, \\"RangeTo\\": 71}","{\\"LevelName\\": \\"D\\", \\"RangeFrom\\": 72, \\"RangeTo\\": 80}","{\\"LevelName\\": \\"E\\", \\"RangeFrom\\": 81, \\"RangeTo\\": 100}"}	1	100.0	42.86	B	1	2021-02-26 12:52:51.633748	2021-02-27 03:58:49.792319
69	Demo Project with Review	demo project with review on desc	{"{\\"LevelName\\": \\"A\\", \\"RangeFrom\\": 0, \\"RangeTo\\": 17}","{\\"LevelName\\": \\"B\\", \\"RangeFrom\\": 18, \\"RangeTo\\": 48}","{\\"LevelName\\": \\"C\\", \\"RangeFrom\\": 49, \\"RangeTo\\": 72}","{\\"LevelName\\": \\"D\\", \\"RangeFrom\\": 73, \\"RangeTo\\": 83}","{\\"LevelName\\": \\"E\\", \\"RangeFrom\\": 84, \\"RangeTo\\": 100}"}	1	21.666666666666668	23.68	B	1	2021-02-26 12:28:25.877012	2021-02-27 03:58:54.118866
64	Demo Project	Demo Project	{"{\\"LevelName\\": \\"B\\", \\"RangeFrom\\": 71, \\"RangeTo\\": 100}","{\\"LevelName\\": \\"C\\", \\"RangeFrom\\": 36, \\"RangeTo\\": 70}","{\\"LevelName\\": \\"F\\", \\"RangeFrom\\": 0, \\"RangeTo\\": 35}"}	1	16.666666666666664	34.29	B	1	2021-02-26 08:58:12.460532	2021-02-27 07:18:24.396017
98	Again last final test	this is the last one	{"{\\"LevelName\\": \\"A\\", \\"RangeFrom\\": 0, \\"RangeTo\\": 34}","{\\"LevelName\\": \\"B\\", \\"RangeFrom\\": 35, \\"RangeTo\\": 60}","{\\"LevelName\\": \\"C\\", \\"RangeFrom\\": 61, \\"RangeTo\\": 83}","{\\"LevelName\\": \\"D\\", \\"RangeFrom\\": 84, \\"RangeTo\\": 92}","{\\"LevelName\\": \\"E\\", \\"RangeFrom\\": 93, \\"RangeTo\\": 100}"}	1	\N	\N	\N	0	2021-02-27 15:46:14.456477	2021-02-27 15:46:14.456477
\.


--
-- Data for Name: projectassignmenttomanager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projectassignmenttomanager (id, emp_id, project_id, status, creationdatetime, updationdatetime) FROM stdin;
31	0002	64	1	2021-02-26 12:09:30.348344	2021-02-26 12:09:30.348344
32	0002	69	1	2021-02-26 12:31:05.01052	2021-02-26 12:31:05.01052
33	0002	70	1	2021-02-26 13:03:49.25958	2021-02-26 13:03:49.25958
34	0002	71	1	2021-02-26 13:37:46.281938	2021-02-26 13:37:46.281938
35	0002	72	1	2021-02-26 13:55:33.750705	2021-02-26 13:55:33.750705
36	0002	73	1	2021-02-26 14:11:46.185145	2021-02-26 14:11:46.185145
37	0002	81	1	2021-02-27 07:50:33.24108	2021-02-27 07:50:33.24108
38	0002	82	1	2021-02-27 07:53:44.474322	2021-02-27 07:53:44.474322
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, name, answer_type, answers, maxscore, subfunc_id, func_id, area_id, proj_id, combination, creationdatetime, updationdatetime) FROM stdin;
3005	What parameters you want the project to be considered on	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Mangement \\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	340	199	64	64199340What parameters you want the project to be considered on	2021-02-26 08:58:12.576549	2021-02-26 08:58:12.576549
3006	What parameters have been implemented in his project	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Mangement \\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	340	199	64	64199340What parameters have been implemented in his project	2021-02-26 08:58:12.586856	2021-02-26 08:58:12.586856
3007	Are you using auto healing for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Are you using auto healing for your cloud?	2021-02-26 08:58:12.599964	2021-02-26 08:58:12.599964
3008	Are you using vertical auto scaling for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Are you using vertical auto scaling for your cloud?	2021-02-26 08:58:12.61228	2021-02-26 08:58:12.61228
3009	Are you using horizontal auto scaling for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Are you using horizontal auto scaling for your cloud?	2021-02-26 08:58:12.624689	2021-02-26 08:58:12.624689
3010	Kind of application being developed? 	Multi choice	{"{\\"option1\\": \\"Microservices Based\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Product based\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"SaaS\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"others\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	5	\N	340	199	64	64199340Kind of application being developed? 	2021-02-26 08:58:12.637418	2021-02-26 08:58:12.637418
3011	Dev,test ,production is performed on-prem, Cloud Services or Hybrid -Segregate	Single choice	{"{\\"option1\\": \\"On-prem\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Cloud\\", \\"score\\": \\"3\\", \\"childquestionid\\": [3007, 3008, 3009]}","{\\"option3\\": \\"Hybrid\\", \\"score\\": \\"2\\", \\"childquestionid\\": [3007, 3008, 3009]}"}	3	\N	340	199	64	64199340Dev,test ,production is performed on-prem, Cloud Services or Hybrid -Segregate	2021-02-26 08:58:12.649912	2021-02-26 08:58:12.649912
3012	What are the environments available	Multi choice	{"{\\"option1\\": \\"Dev\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Test\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Staging\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Prod\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	340	199	64	64199340What are the environments available	2021-02-26 08:58:12.671073	2021-02-26 08:58:12.671073
3013	Is the Infrastructure being created through code, is it applicable for all the environments? (ex: terraform)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Is the Infrastructure being created through code, is it applicable for all the environments? (ex: terraform)	2021-02-26 08:58:12.683709	2021-02-26 08:58:12.683709
3014	Is your IaaC cloud agnostic( multi- cloud – AWS, GCP, AZURE, IBM…)/ on-prem environment agnostic.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Is your IaaC cloud agnostic( multi- cloud – AWS, GCP, AZURE, IBM…)/ on-prem environment agnostic.	2021-02-26 08:58:12.696421	2021-02-26 08:58:12.696421
3015	Do you have the scripts that will automatically configure the infrastructure for deploying the application	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Do you have the scripts that will automatically configure the infrastructure for deploying the application	2021-02-26 08:58:12.708334	2021-02-26 08:58:12.708334
3016	Are you performing automatic pre-deployment checks (all env)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Are you performing automatic pre-deployment checks (all env)	2021-02-26 08:58:12.720275	2021-02-26 08:58:12.720275
3017	Are you performing automatic post-deployment checks (all env)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	340	199	64	64199340Are you performing automatic post-deployment checks (all env)	2021-02-26 08:58:12.732626	2021-02-26 08:58:12.732626
3018	What Devops practises have been implemented by your organization	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Management\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	341	200	64	64200341What Devops practises have been implemented by your organization	2021-02-26 08:58:12.760256	2021-02-26 08:58:12.760256
3019	Is DevOps Implemented in your organization ()	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Is DevOps Implemented in your organization ()	2021-02-26 08:58:12.770208	2021-02-26 08:58:12.770208
3020	Is there a process by which the pre-production env configuration are kept in sync with production	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Is there a process by which the pre-production env configuration are kept in sync with production	2021-02-26 08:58:12.782334	2021-02-26 08:58:12.782334
3021	How are you provisioning different env	Single choice	{"{\\"option1\\": \\"Manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automatically (terraform)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	3	\N	341	200	64	64200341How are you provisioning different env	2021-02-26 08:58:12.795036	2021-02-26 08:58:12.795036
3022	How are you configuring these env 	Single choice	{"{\\"option1\\": \\"Manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automatically (Ansible)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	3	\N	341	200	64	64200341How are you configuring these env 	2021-02-26 08:58:12.807756	2021-02-26 08:58:12.807756
3023	Is there a process for provisioning the env	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": [3021, 3022]}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Is there a process for provisioning the env	2021-02-26 08:58:12.820332	2021-02-26 08:58:12.820332
3064	Are blue-green deployment testing done?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	345	201	64	64201345Are blue-green deployment testing done?	2021-02-26 08:58:13.382272	2021-02-26 08:58:13.382272
3024	what are the different types of users you have?	Multi choice	{"{\\"option1\\": \\"admin\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"manager\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Lead\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"other\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	341	200	64	64200341what are the different types of users you have?	2021-02-26 08:58:12.836168	2021-02-26 08:58:12.836168
3025	what are the different tools you are using for threat intelligence?	Multi choice	{"{\\"option1\\": \\"IBM X-Force Exchange\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Anomali ThreatStream\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"SolarWinds\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"LogRhythm\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"others\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	5	\N	341	200	64	64200341what are the different tools you are using for threat intelligence?	2021-02-26 08:58:12.848716	2021-02-26 08:58:12.848716
3026	Do you have Log and Event Management	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Do you have Log and Event Management	2021-02-26 08:58:12.863379	2021-02-26 08:58:12.863379
3027	Are user accounts monitored and privilliged as per the user	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 3024}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Are user accounts monitored and privilliged as per the user	2021-02-26 08:58:12.875738	2021-02-26 08:58:12.875738
3028	Are you considering Threat Intelligence?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 3025}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Are you considering Threat Intelligence?	2021-02-26 08:58:12.889306	2021-02-26 08:58:12.889306
3029	Are you using a defined Process for monitoring	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	341	200	64	64200341Are you using a defined Process for monitoring	2021-02-26 08:58:12.902949	2021-02-26 08:58:12.902949
3030	Is RBAC system  implemented for vc	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Is RBAC system  implemented for vc	2021-02-26 08:58:12.930416	2021-02-26 08:58:12.930416
3031	Are you following a Documented Naming Convention?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Are you following a Documented Naming Convention?	2021-02-26 08:58:12.940326	2021-02-26 08:58:12.940326
3032	Is there a defined merging and branching strategy?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Is there a defined merging and branching strategy?	2021-02-26 08:58:12.953014	2021-02-26 08:58:12.953014
3033	Is there a process of identifying a configuration Item?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Is there a process of identifying a configuration Item?	2021-02-26 08:58:12.965664	2021-02-26 08:58:12.965664
3034	 Is there a process of identifying a non-configuration Item?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342 Is there a process of identifying a non-configuration Item?	2021-02-26 08:58:12.978189	2021-02-26 08:58:12.978189
3035	Are daily checkins are carried out or not i.e, on a daily basis code is pushed or not?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Are daily checkins are carried out or not i.e, on a daily basis code is pushed or not?	2021-02-26 08:58:12.990219	2021-02-26 08:58:12.990219
3036	Are there static code scan done before every commit? (So as to pull metrics)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Are there static code scan done before every commit? (So as to pull metrics)	2021-02-26 08:58:13.002626	2021-02-26 08:58:13.002626
3037	What files do you keep under version control?	Multi choice	{"{\\"option1\\": \\"Source Code files (.java, .sql, .js, .html, .css)\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"build tool configuration files (mvn.xml, build.gradle, package.json)\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"DevOps tools configuration files ( Dockerfile, Jenkinsfile, Vagrantfile)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"infrastructure code (terraform, ansible, helm)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"Readme, License\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	14	\N	342	201	64	64201342What files do you keep under version control?	2021-02-26 08:58:13.014514	2021-02-26 08:58:13.014514
3038	How do you review code changes?	Single choice	{"{\\"option1\\": \\"Manual\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automation Tool like sonarqube\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"None of above\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	3	\N	342	201	64	64201342How do you review code changes?	2021-02-26 08:58:13.027076	2021-02-26 08:58:13.027076
3039	How do you manage code dependencies across teams?	Single choice	{"{\\"option1\\": \\"Rise tickets\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	3	\N	342	201	64	64201342How do you manage code dependencies across teams?	2021-02-26 08:58:13.039721	2021-02-26 08:58:13.039721
3040	What is the Backup frequency	Single choice	{"{\\"option1\\": \\"Daily\\", \\"score\\": \\"6\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Weekly \\", \\"score\\": \\"5\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Monthly\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Quaterly\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"Semi-Anually\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option6\\": \\"Anually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	6	\N	342	201	64	64201342What is the Backup frequency	2021-02-26 08:58:13.052459	2021-02-26 08:58:13.052459
3041	How often Backup testing is done to ensure its integrity	Single choice	{"{\\"option1\\": \\"Whenever there is a backup\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"before backup\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}"}	4	\N	342	201	64	64201342How often Backup testing is done to ensure its integrity	2021-02-26 08:58:13.067052	2021-02-26 08:58:13.067052
3042	Is roll back pre- configured, if there is a push/merge failure	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	342	201	64	64201342Is roll back pre- configured, if there is a push/merge failure	2021-02-26 08:58:13.081759	2021-02-26 08:58:13.081759
3043	Is RBAC system  implemented for CI	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Is RBAC system  implemented for CI	2021-02-26 08:58:13.103271	2021-02-26 08:58:13.103271
3044	How is code repo authenticated	Single choice	{"{\\"option1\\": \\"SSH Username with private key\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Username & Password\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"API Token\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Secret File / Secret text\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"PAT\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option6\\": \\"Certificate / X.509 Client Certificate\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	2	\N	343	201	64	64201343How is code repo authenticated	2021-02-26 08:58:13.113266	2021-02-26 08:58:13.113266
3045	How do code changes get built	Single choice	{"{\\"option1\\": \\"Automatic Triggering\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Mannualy Triggering\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	343	201	64	64201343How do code changes get built	2021-02-26 08:58:13.126103	2021-02-26 08:58:13.126103
3046	How do you manage environments in dev, test and production?	Single choice	{"{\\"option1\\": \\"CICD\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Partial CICD\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Mannualy\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Mannual & Automatic\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	4	\N	343	201	64	64201343How do you manage environments in dev, test and production?	2021-02-26 08:58:13.138711	2021-02-26 08:58:13.138711
3047	How is build repo managed? Eg: who initiated the build, from where it was initiated	Single choice	{"{\\"option1\\": \\"Rolses assigned to each user\\", \\"score\\": \\"5\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Only Admin Can\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Senior Developers\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"DevOps Engineers\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}"}	5	\N	343	201	64	64201343How is build repo managed? Eg: who initiated the build, from where it was initiated	2021-02-26 08:58:13.151804	2021-02-26 08:58:13.151804
3048	Are there unit test scripts and execution of them. (If unit test script test fails build should also fail.)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Are there unit test scripts and execution of them. (If unit test script test fails build should also fail.)	2021-02-26 08:58:13.164752	2021-02-26 08:58:13.164752
3049	Is the Integration testing part of the build pipeline ( If integration testing fails build should also fail).	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Is the Integration testing part of the build pipeline ( If integration testing fails build should also fail).	2021-02-26 08:58:13.176839	2021-02-26 08:58:13.176839
3050	Is automated testing part of the build?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Is automated testing part of the build?	2021-02-26 08:58:13.188785	2021-02-26 08:58:13.188785
3051	Are you performing build configs audit	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Are you performing build configs audit	2021-02-26 08:58:13.201746	2021-02-26 08:58:13.201746
3052	Is there a process defined for post-build failure.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	343	201	64	64201343Is there a process defined for post-build failure.	2021-02-26 08:58:13.21574	2021-02-26 08:58:13.21574
3053	Is RBAC system  implemented for Continuous Delivery	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Is RBAC system  implemented for Continuous Delivery	2021-02-26 08:58:13.238075	2021-02-26 08:58:13.238075
3054	Are you checking Code quality ?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Are you checking Code quality ?	2021-02-26 08:58:13.248116	2021-02-26 08:58:13.248116
3055	Is deployment automated or manual	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Is deployment automated or manual	2021-02-26 08:58:13.260262	2021-02-26 08:58:13.260262
3056	Is deployment management present	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Is deployment management present	2021-02-26 08:58:13.2759	2021-02-26 08:58:13.2759
3057	Where it is getting deployed cloud/on-prem	Single choice	{"{\\"option1\\": \\"cloud\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"On-Prem\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Hybrid\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	4	\N	344	201	64	64201344Where it is getting deployed cloud/on-prem	2021-02-26 08:58:13.28876	2021-02-26 08:58:13.28876
3058	Is there a comparison chart to compare between two deployments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Is there a comparison chart to compare between two deployments	2021-02-26 08:58:13.30132	2021-02-26 08:58:13.30132
3059	Is there a process defined after deployment failure? EX- what version of image/deployment should be running after the failure.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	344	201	64	64201344Is there a process defined after deployment failure? EX- what version of image/deployment should be running after the failure.	2021-02-26 08:58:13.313494	2021-02-26 08:58:13.313494
3060	Is RBAC system  implemented for Continuous Deployment	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	345	201	64	64201345Is RBAC system  implemented for Continuous Deployment	2021-02-26 08:58:13.335631	2021-02-26 08:58:13.335631
3061	Do you have automation in place that can promote the release from development to production (any environment)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	345	201	64	64201345Do you have automation in place that can promote the release from development to production (any environment)	2021-02-26 08:58:13.345205	2021-02-26 08:58:13.345205
3062	Do you have automated testing enabled for all the environments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	345	201	64	64201345Do you have automated testing enabled for all the environments	2021-02-26 08:58:13.357768	2021-02-26 08:58:13.357768
3063	Is there a process defined for performing blue-green deployments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	345	201	64	64201345Is there a process defined for performing blue-green deployments	2021-02-26 08:58:13.369567	2021-02-26 08:58:13.369567
3305	Do You Know Me?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": 1, \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": 0, \\"childquestionid\\": 0}"}	1	54	370	214	70	7021437054Do You Know Me?	2021-02-26 12:56:59.154308	2021-02-26 12:56:59.154308
3306	How Often do you conduct Survey?	Single choice	{"{\\"option1\\": \\"Weekly\\", \\"score\\": 2, \\"childquestionid\\": 3305}","{\\"option2\\": \\"Daily\\", \\"score\\": 3, \\"childquestionid\\": 0}","{\\"option3\\": \\"Monthly\\", \\"score\\": 4, \\"childquestionid\\": 0}"}	4	54	370	214	70	7021437054How Often do you conduct Survey?	2021-02-26 12:57:45.40133	2021-02-26 12:57:45.40133
3307	Do you Know ReactJS	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": 1, \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": 0, \\"childquestionid\\": 0}"}	1	54	370	214	70	7021437054Do you Know ReactJS	2021-02-26 12:59:38.03132	2021-02-26 12:59:38.03132
3308	What type of Credit Card do you have?	Multi choice	{"{\\"option1\\": \\"American Express\\", \\"score\\": 2, \\"childquestionid\\": 0}","{\\"option2\\": \\"VISA\\", \\"score\\": 4, \\"childquestionid\\": 0}","{\\"option3\\": \\"Debit card\\", \\"score\\": 2, \\"childquestionid\\": 0}"}	8	54	370	214	70	7021437054What type of Credit Card do you have?	2021-02-26 13:00:37.561272	2021-02-26 13:00:37.561272
3309	Do You Know Me?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": 1, \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": 0, \\"childquestionid\\": 0}"}	1	\N	371	215	71	71215371Do You Know Me?	2021-02-26 13:18:33.373776	2021-02-26 13:18:33.373776
3311	Do you Know ReactJS	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": 1, \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": 0, \\"childquestionid\\": 0}"}	1	\N	371	215	71	71215371Do you Know ReactJS	2021-02-26 13:36:18.803459	2021-02-26 13:36:18.803459
3312	What type of Credit Card do you have?	Multi choice	{"{\\"option1\\": \\"VISA\\", \\"score\\": 1, \\"childquestionid\\": 0}","{\\"option2\\": \\"American Express\\", \\"score\\": 3, \\"childquestionid\\": 0}","{\\"option3\\": \\"Debit Card\\", \\"score\\": 4, \\"childquestionid\\": 0}"}	8	\N	371	215	71	71215371What type of Credit Card do you have?	2021-02-26 13:36:53.94472	2021-02-26 13:36:53.94472
3245	What parameters you want the project to be considered on	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Mangement \\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	364	211	69	69211364What parameters you want the project to be considered on	2021-02-26 12:28:25.991003	2021-02-26 12:28:25.991003
3246	What parameters have been implemented in his project	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Mangement \\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	364	211	69	69211364What parameters have been implemented in his project	2021-02-26 12:28:26.004003	2021-02-26 12:28:26.004003
3247	Are you using auto healing for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Are you using auto healing for your cloud?	2021-02-26 12:28:26.020314	2021-02-26 12:28:26.020314
3248	Are you using vertical auto scaling for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Are you using vertical auto scaling for your cloud?	2021-02-26 12:28:26.036734	2021-02-26 12:28:26.036734
3249	Are you using horizontal auto scaling for your cloud?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Are you using horizontal auto scaling for your cloud?	2021-02-26 12:28:26.053684	2021-02-26 12:28:26.053684
3250	Kind of application being developed? 	Multi choice	{"{\\"option1\\": \\"Microservices Based\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Product based\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"SaaS\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"others\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	5	\N	364	211	69	69211364Kind of application being developed? 	2021-02-26 12:28:26.07036	2021-02-26 12:28:26.07036
3251	Dev,test ,production is performed on-prem, Cloud Services or Hybrid -Segregate	Single choice	{"{\\"option1\\": \\"On-prem\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Cloud\\", \\"score\\": \\"3\\", \\"childquestionid\\": [3007, 3008, 3009]}","{\\"option3\\": \\"Hybrid\\", \\"score\\": \\"2\\", \\"childquestionid\\": [3007, 3008, 3009]}"}	3	\N	364	211	69	69211364Dev,test ,production is performed on-prem, Cloud Services or Hybrid -Segregate	2021-02-26 12:28:26.088315	2021-02-26 12:28:26.088315
3252	What are the environments available	Multi choice	{"{\\"option1\\": \\"Dev\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Test\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Staging\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Prod\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	364	211	69	69211364What are the environments available	2021-02-26 12:28:26.117709	2021-02-26 12:28:26.117709
3253	Is the Infrastructure being created through code, is it applicable for all the environments? (ex: terraform)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Is the Infrastructure being created through code, is it applicable for all the environments? (ex: terraform)	2021-02-26 12:28:26.134598	2021-02-26 12:28:26.134598
3254	Is your IaaC cloud agnostic( multi- cloud – AWS, GCP, AZURE, IBM…)/ on-prem environment agnostic.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Is your IaaC cloud agnostic( multi- cloud – AWS, GCP, AZURE, IBM…)/ on-prem environment agnostic.	2021-02-26 12:28:26.151097	2021-02-26 12:28:26.151097
3255	Do you have the scripts that will automatically configure the infrastructure for deploying the application	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Do you have the scripts that will automatically configure the infrastructure for deploying the application	2021-02-26 12:28:26.1676	2021-02-26 12:28:26.1676
3256	Are you performing automatic pre-deployment checks (all env)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Are you performing automatic pre-deployment checks (all env)	2021-02-26 12:28:26.181862	2021-02-26 12:28:26.181862
3257	Are you performing automatic post-deployment checks (all env)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	364	211	69	69211364Are you performing automatic post-deployment checks (all env)	2021-02-26 12:28:26.19374	2021-02-26 12:28:26.19374
3258	What Devops practises have been implemented by your organization	Multi choice	{"{\\"option1\\": \\"Configuration Management\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Security Management \\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Environment Management\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	9	\N	365	212	69	69212365What Devops practises have been implemented by your organization	2021-02-26 12:28:26.221862	2021-02-26 12:28:26.221862
3259	Is DevOps Implemented in your organization ()	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Is DevOps Implemented in your organization ()	2021-02-26 12:28:26.23177	2021-02-26 12:28:26.23177
3260	Is there a process by which the pre-production env configuration are kept in sync with production	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Is there a process by which the pre-production env configuration are kept in sync with production	2021-02-26 12:28:26.244932	2021-02-26 12:28:26.244932
3261	How are you provisioning different env	Single choice	{"{\\"option1\\": \\"Manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automatically (terraform)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	3	\N	365	212	69	69212365How are you provisioning different env	2021-02-26 12:28:26.258715	2021-02-26 12:28:26.258715
3262	How are you configuring these env 	Single choice	{"{\\"option1\\": \\"Manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automatically (Ansible)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	3	\N	365	212	69	69212365How are you configuring these env 	2021-02-26 12:28:26.278102	2021-02-26 12:28:26.278102
3263	Is there a process for provisioning the env	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": [3021, 3022]}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Is there a process for provisioning the env	2021-02-26 12:28:26.296038	2021-02-26 12:28:26.296038
3304	Are blue-green deployment testing done?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	369	213	69	69213369Are blue-green deployment testing done?	2021-02-26 12:28:26.86094	2021-02-26 12:28:26.86094
3264	what are the different types of users you have?	Multi choice	{"{\\"option1\\": \\"admin\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"manager\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Lead\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"other\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	365	212	69	69212365what are the different types of users you have?	2021-02-26 12:28:26.3154	2021-02-26 12:28:26.3154
3265	what are the different tools you are using for threat intelligence?	Multi choice	{"{\\"option1\\": \\"IBM X-Force Exchange\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Anomali ThreatStream\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"SolarWinds\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"LogRhythm\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"others\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	5	\N	365	212	69	69212365what are the different tools you are using for threat intelligence?	2021-02-26 12:28:26.331329	2021-02-26 12:28:26.331329
3266	Do you have Log and Event Management	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Do you have Log and Event Management	2021-02-26 12:28:26.343415	2021-02-26 12:28:26.343415
3267	Are user accounts monitored and privilliged as per the user	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 3024}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Are user accounts monitored and privilliged as per the user	2021-02-26 12:28:26.355698	2021-02-26 12:28:26.355698
3268	Are you considering Threat Intelligence?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 3025}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Are you considering Threat Intelligence?	2021-02-26 12:28:26.368996	2021-02-26 12:28:26.368996
3269	Are you using a defined Process for monitoring	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	365	212	69	69212365Are you using a defined Process for monitoring	2021-02-26 12:28:26.383636	2021-02-26 12:28:26.383636
3270	Is RBAC system  implemented for vc	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Is RBAC system  implemented for vc	2021-02-26 12:28:26.412714	2021-02-26 12:28:26.412714
3271	Are you following a Documented Naming Convention?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Are you following a Documented Naming Convention?	2021-02-26 12:28:26.422151	2021-02-26 12:28:26.422151
3272	Is there a defined merging and branching strategy?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Is there a defined merging and branching strategy?	2021-02-26 12:28:26.434239	2021-02-26 12:28:26.434239
3273	Is there a process of identifying a configuration Item?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Is there a process of identifying a configuration Item?	2021-02-26 12:28:26.445549	2021-02-26 12:28:26.445549
3274	 Is there a process of identifying a non-configuration Item?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366 Is there a process of identifying a non-configuration Item?	2021-02-26 12:28:26.457678	2021-02-26 12:28:26.457678
3275	Are daily checkins are carried out or not i.e, on a daily basis code is pushed or not?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Are daily checkins are carried out or not i.e, on a daily basis code is pushed or not?	2021-02-26 12:28:26.471315	2021-02-26 12:28:26.471315
3276	Are there static code scan done before every commit? (So as to pull metrics)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Are there static code scan done before every commit? (So as to pull metrics)	2021-02-26 12:28:26.482741	2021-02-26 12:28:26.482741
3277	What files do you keep under version control?	Multi choice	{"{\\"option1\\": \\"Source Code files (.java, .sql, .js, .html, .css)\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"build tool configuration files (mvn.xml, build.gradle, package.json)\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"DevOps tools configuration files ( Dockerfile, Jenkinsfile, Vagrantfile)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"infrastructure code (terraform, ansible, helm)\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"Readme, License\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	14	\N	366	213	69	69213366What files do you keep under version control?	2021-02-26 12:28:26.494351	2021-02-26 12:28:26.494351
3278	How do you review code changes?	Single choice	{"{\\"option1\\": \\"Manual\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Automation Tool like sonarqube\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"None of above\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	3	\N	366	213	69	69213366How do you review code changes?	2021-02-26 12:28:26.50625	2021-02-26 12:28:26.50625
3279	How do you manage code dependencies across teams?	Single choice	{"{\\"option1\\": \\"Rise tickets\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"manually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	3	\N	366	213	69	69213366How do you manage code dependencies across teams?	2021-02-26 12:28:26.518144	2021-02-26 12:28:26.518144
3280	What is the Backup frequency	Single choice	{"{\\"option1\\": \\"Daily\\", \\"score\\": \\"6\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Weekly \\", \\"score\\": \\"5\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Monthly\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Quaterly\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"Semi-Anually\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option6\\": \\"Anually\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	6	\N	366	213	69	69213366What is the Backup frequency	2021-02-26 12:28:26.529954	2021-02-26 12:28:26.529954
3281	How often Backup testing is done to ensure its integrity	Single choice	{"{\\"option1\\": \\"Whenever there is a backup\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"before backup\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}"}	4	\N	366	213	69	69213366How often Backup testing is done to ensure its integrity	2021-02-26 12:28:26.547515	2021-02-26 12:28:26.547515
3282	Is roll back pre- configured, if there is a push/merge failure	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	366	213	69	69213366Is roll back pre- configured, if there is a push/merge failure	2021-02-26 12:28:26.564071	2021-02-26 12:28:26.564071
3283	Is RBAC system  implemented for CI	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Is RBAC system  implemented for CI	2021-02-26 12:28:26.59367	2021-02-26 12:28:26.59367
3284	How is code repo authenticated	Single choice	{"{\\"option1\\": \\"SSH Username with private key\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Username & Password\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"API Token\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Secret File / Secret text\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option5\\": \\"PAT\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option6\\": \\"Certificate / X.509 Client Certificate\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	2	\N	367	213	69	69213367How is code repo authenticated	2021-02-26 12:28:26.605417	2021-02-26 12:28:26.605417
3285	How do code changes get built	Single choice	{"{\\"option1\\": \\"Automatic Triggering\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Mannualy Triggering\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	4	\N	367	213	69	69213367How do code changes get built	2021-02-26 12:28:26.618194	2021-02-26 12:28:26.618194
3286	How do you manage environments in dev, test and production?	Single choice	{"{\\"option1\\": \\"CICD\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Partial CICD\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Mannualy\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"Mannual & Automatic\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}"}	4	\N	367	213	69	69213367How do you manage environments in dev, test and production?	2021-02-26 12:28:26.629518	2021-02-26 12:28:26.629518
3287	How is build repo managed? Eg: who initiated the build, from where it was initiated	Single choice	{"{\\"option1\\": \\"Rolses assigned to each user\\", \\"score\\": \\"5\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"Only Admin Can\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Senior Developers\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}","{\\"option4\\": \\"DevOps Engineers\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}"}	5	\N	367	213	69	69213367How is build repo managed? Eg: who initiated the build, from where it was initiated	2021-02-26 12:28:26.64134	2021-02-26 12:28:26.64134
3288	Are there unit test scripts and execution of them. (If unit test script test fails build should also fail.)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Are there unit test scripts and execution of them. (If unit test script test fails build should also fail.)	2021-02-26 12:28:26.653204	2021-02-26 12:28:26.653204
3289	Is the Integration testing part of the build pipeline ( If integration testing fails build should also fail).	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Is the Integration testing part of the build pipeline ( If integration testing fails build should also fail).	2021-02-26 12:28:26.664716	2021-02-26 12:28:26.664716
3290	Is automated testing part of the build?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Is automated testing part of the build?	2021-02-26 12:28:26.677353	2021-02-26 12:28:26.677353
3291	Are you performing build configs audit	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Are you performing build configs audit	2021-02-26 12:28:26.68959	2021-02-26 12:28:26.68959
3292	Is there a process defined for post-build failure.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	367	213	69	69213367Is there a process defined for post-build failure.	2021-02-26 12:28:26.701499	2021-02-26 12:28:26.701499
3293	Is RBAC system  implemented for Continuous Delivery	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Is RBAC system  implemented for Continuous Delivery	2021-02-26 12:28:26.721659	2021-02-26 12:28:26.721659
3294	Are you checking Code quality ?	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Are you checking Code quality ?	2021-02-26 12:28:26.731261	2021-02-26 12:28:26.731261
3295	Is deployment automated or manual	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Is deployment automated or manual	2021-02-26 12:28:26.743186	2021-02-26 12:28:26.743186
3296	Is deployment management present	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Is deployment management present	2021-02-26 12:28:26.755605	2021-02-26 12:28:26.755605
3297	Where it is getting deployed cloud/on-prem	Single choice	{"{\\"option1\\": \\"cloud\\", \\"score\\": \\"4\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"On-Prem\\", \\"score\\": \\"2\\", \\"childquestionid\\": 0}","{\\"option3\\": \\"Hybrid\\", \\"score\\": \\"3\\", \\"childquestionid\\": 0}"}	4	\N	368	213	69	69213368Where it is getting deployed cloud/on-prem	2021-02-26 12:28:26.767237	2021-02-26 12:28:26.767237
3298	Is there a comparison chart to compare between two deployments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Is there a comparison chart to compare between two deployments	2021-02-26 12:28:26.782788	2021-02-26 12:28:26.782788
3299	Is there a process defined after deployment failure? EX- what version of image/deployment should be running after the failure.	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	368	213	69	69213368Is there a process defined after deployment failure? EX- what version of image/deployment should be running after the failure.	2021-02-26 12:28:26.795023	2021-02-26 12:28:26.795023
3300	Is RBAC system  implemented for Continuous Deployment	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	369	213	69	69213369Is RBAC system  implemented for Continuous Deployment	2021-02-26 12:28:26.815537	2021-02-26 12:28:26.815537
3301	Do you have automation in place that can promote the release from development to production (any environment)	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	369	213	69	69213369Do you have automation in place that can promote the release from development to production (any environment)	2021-02-26 12:28:26.825107	2021-02-26 12:28:26.825107
3302	Do you have automated testing enabled for all the environments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	369	213	69	69213369Do you have automated testing enabled for all the environments	2021-02-26 12:28:26.83679	2021-02-26 12:28:26.83679
3303	Is there a process defined for performing blue-green deployments	Yes / No	{"{\\"option1\\": \\"Yes\\", \\"score\\": \\"1\\", \\"childquestionid\\": 0}","{\\"option2\\": \\"No\\", \\"score\\": \\"0\\", \\"childquestionid\\": 0}"}	1	\N	369	213	69	69213369Is there a process defined for performing blue-green deployments	2021-02-26 12:28:26.849151	2021-02-26 12:28:26.849151
3310	How Often do you conduct Survey?	Single choice	{"{\\"option1\\": \\"Weekly\\", \\"score\\": 2, \\"childquestionid\\": 3309}","{\\"option2\\": \\"Daily\\", \\"score\\": 3, \\"childquestionid\\": 0}","{\\"option3\\": \\"Monthly\\", \\"score\\": 4, \\"childquestionid\\": 0}","{\\"option4\\": \\"Yearly\\", \\"score\\": 0, \\"childquestionid\\": 0}"}	4	\N	371	215	71	71215371How Often do you conduct Survey?	2021-02-26 13:19:27.70537	2021-02-26 13:19:27.70537
\.


--
-- Data for Name: questions_answered; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions_answered (id, qid, applicability, answers, scoreachieved, maxscore, assignmentid, active, creationdatetime, updationdatetime) FROM stdin;
80	3005	1	{"{\\"option1\\": \\"Configuration Management\\", \\"selected\\": true}","{\\"option2\\": \\"Security Management \\", \\"selected\\": false}","{\\"option3\\": \\"Environment Mangement \\", \\"selected\\": false}"}	2	9	49	1	2021-02-26 12:16:26.203997	2021-02-26 12:16:26.203997
81	3006	1	{"{\\"option1\\": \\"Configuration Management\\", \\"selected\\": true}","{\\"option2\\": \\"Security Management \\", \\"selected\\": false}","{\\"option3\\": \\"Environment Mangement \\", \\"selected\\": false}"}	2	9	49	1	2021-02-26 12:16:26.521942	2021-02-26 12:16:26.521942
82	3010	1	{"{\\"option1\\": \\"Microservices Based\\", \\"selected\\": false}","{\\"option2\\": \\"Product based\\", \\"selected\\": true}","{\\"option3\\": \\"SaaS\\", \\"selected\\": false}","{\\"option4\\": \\"others\\", \\"selected\\": false}"}	1	5	49	1	2021-02-26 12:16:26.526726	2021-02-26 12:16:26.526726
83	3011	1	{"{\\"option1\\": \\"On-prem\\", \\"selected\\": true}","{\\"option2\\": \\"Cloud\\", \\"selected\\": false}","{\\"option3\\": \\"Hybrid\\", \\"selected\\": false}"}	1	3	49	1	2021-02-26 12:16:26.531845	2021-02-26 12:16:26.531845
84	3012	1	{"{\\"option1\\": \\"Dev\\", \\"selected\\": true}","{\\"option2\\": \\"Test\\", \\"selected\\": false}","{\\"option3\\": \\"Staging\\", \\"selected\\": false}","{\\"option4\\": \\"Prod\\", \\"selected\\": false}"}	1	4	49	1	2021-02-26 12:16:26.53657	2021-02-26 12:16:26.53657
85	3013	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	49	1	2021-02-26 12:16:26.541228	2021-02-26 12:16:26.541228
86	3014	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	49	1	2021-02-26 12:16:26.545881	2021-02-26 12:16:26.545881
87	3015	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	49	1	2021-02-26 12:16:26.551013	2021-02-26 12:16:26.551013
88	3016	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	49	1	2021-02-26 12:16:26.555595	2021-02-26 12:16:26.555595
89	3017	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	49	1	2021-02-26 12:16:26.560212	2021-02-26 12:16:26.560212
90	3245	1	{"{\\"option1\\": \\"Configuration Management\\", \\"selected\\": true}","{\\"option2\\": \\"Security Management \\", \\"selected\\": false}","{\\"option3\\": \\"Environment Mangement \\", \\"selected\\": false}"}	2	9	50	1	2021-02-26 12:35:33.531648	2021-02-26 12:35:33.531648
91	3246	1	{"{\\"option1\\": \\"Configuration Management\\", \\"selected\\": true}","{\\"option2\\": \\"Security Management \\", \\"selected\\": false}","{\\"option3\\": \\"Environment Mangement \\", \\"selected\\": false}"}	2	9	50	1	2021-02-26 12:35:33.740735	2021-02-26 12:35:33.740735
92	3247	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	50	1	2021-02-26 12:35:33.746	2021-02-26 12:35:33.746
93	3248	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	0	1	50	1	2021-02-26 12:35:33.750967	2021-02-26 12:35:33.750967
94	3249	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.756014	2021-02-26 12:35:33.756014
95	3250	1	{"{\\"option1\\": \\"Microservices Based\\", \\"selected\\": true}","{\\"option2\\": \\"Product based\\", \\"selected\\": false}","{\\"option3\\": \\"SaaS\\", \\"selected\\": false}","{\\"option4\\": \\"others\\", \\"selected\\": false}"}	2	5	50	1	2021-02-26 12:35:33.760977	2021-02-26 12:35:33.760977
96	3251	1	{"{\\"option1\\": \\"On-prem\\", \\"selected\\": true}","{\\"option2\\": \\"Cloud\\", \\"selected\\": false}","{\\"option3\\": \\"Hybrid\\", \\"selected\\": false}"}	1	3	50	1	2021-02-26 12:35:33.76615	2021-02-26 12:35:33.76615
97	3252	1	{"{\\"option1\\": \\"Dev\\", \\"selected\\": true}","{\\"option2\\": \\"Test\\", \\"selected\\": false}","{\\"option3\\": \\"Staging\\", \\"selected\\": false}","{\\"option4\\": \\"Prod\\", \\"selected\\": false}"}	1	4	50	1	2021-02-26 12:35:33.770946	2021-02-26 12:35:33.770946
98	3253	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.775883	2021-02-26 12:35:33.775883
99	3254	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.780773	2021-02-26 12:35:33.780773
100	3255	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.78548	2021-02-26 12:35:33.78548
101	3256	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.790238	2021-02-26 12:35:33.790238
102	3257	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": false}","{\\"option2\\": \\"No\\", \\"selected\\": true}"}	0	1	50	1	2021-02-26 12:35:33.79498	2021-02-26 12:35:33.79498
103	3306	1	{"{\\"option1\\": \\"Weekly\\", \\"selected\\": true}","{\\"option2\\": \\"Daily\\", \\"selected\\": false}","{\\"option3\\": \\"Monthly\\", \\"selected\\": false}"}	2	4	51	1	2021-02-26 13:07:20.18123	2021-02-26 13:07:20.18123
104	3305	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	51	1	2021-02-26 13:07:20.423675	2021-02-26 13:07:20.423675
105	3307	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	51	1	2021-02-26 13:07:20.429912	2021-02-26 13:07:20.429912
106	3308	1	{"{\\"option1\\": \\"American Express\\", \\"selected\\": true}","{\\"option2\\": \\"VISA\\", \\"selected\\": false}","{\\"option3\\": \\"Debit card\\", \\"selected\\": false}"}	2	8	51	1	2021-02-26 13:07:20.434873	2021-02-26 13:07:20.434873
107	3311	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	52	1	2021-02-26 13:38:31.235999	2021-02-26 13:38:31.235999
108	3312	1	{"{\\"option1\\": \\"VISA\\", \\"selected\\": true}","{\\"option2\\": \\"American Express\\", \\"selected\\": false}","{\\"option3\\": \\"Debit Card\\", \\"selected\\": false}"}	1	8	52	1	2021-02-26 13:38:31.370109	2021-02-26 13:38:31.370109
109	3310	1	{"{\\"option1\\": \\"Weekly\\", \\"selected\\": false}","{\\"option2\\": \\"Daily\\", \\"selected\\": true}","{\\"option3\\": \\"Monthly\\", \\"selected\\": false}","{\\"option4\\": \\"Yearly\\", \\"selected\\": false}"}	3	4	52	1	2021-02-26 13:38:31.37529	2021-02-26 13:38:31.37529
110	3326	1	{"{\\"option1\\": \\"Configuration Management\\", \\"selected\\": true}","{\\"option2\\": \\"Security Management \\", \\"selected\\": false}","{\\"option3\\": \\"Environment Management\\", \\"selected\\": false}"}	2	9	54	1	2021-02-26 14:12:49.412573	2021-02-26 14:12:49.412573
111	3327	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	0	1	54	1	2021-02-26 14:12:49.667325	2021-02-26 14:12:49.667325
112	3328	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	0	1	54	1	2021-02-26 14:12:49.672252	2021-02-26 14:12:49.672252
113	3329	1	{"{\\"option1\\": \\"Manually\\", \\"selected\\": false}","{\\"option2\\": \\"Automatically (terraform)\\", \\"selected\\": true}"}	3	3	54	1	2021-02-26 14:12:49.677002	2021-02-26 14:12:49.677002
114	3330	1	{"{\\"option1\\": \\"Manually\\", \\"selected\\": true}","{\\"option2\\": \\"Automatically (Ansible)\\", \\"selected\\": false}"}	1	3	54	1	2021-02-26 14:12:49.681419	2021-02-26 14:12:49.681419
115	3331	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	54	1	2021-02-26 14:12:49.685754	2021-02-26 14:12:49.685754
116	3022	1	{"{\\"option1\\": \\"Manually\\", \\"selected\\": true}","{\\"option2\\": \\"Automatically (Ansible)\\", \\"selected\\": false}"}	1	3	54	1	2021-02-26 14:12:49.690252	2021-02-26 14:12:49.690252
117	3021	1	{"{\\"option1\\": \\"Manually\\", \\"selected\\": true}","{\\"option2\\": \\"Automatically (terraform)\\", \\"selected\\": false}"}	1	3	54	1	2021-02-26 14:12:49.694976	2021-02-26 14:12:49.694976
118	3332	1	{"{\\"option1\\": \\"admin\\", \\"selected\\": false}","{\\"option2\\": \\"manager\\", \\"selected\\": true}","{\\"option3\\": \\"Lead\\", \\"selected\\": false}","{\\"option4\\": \\"other\\", \\"selected\\": false}"}	1	4	54	1	2021-02-26 14:12:49.703005	2021-02-26 14:12:49.703005
119	3333	1	{"{\\"option1\\": \\"IBM X-Force Exchange\\", \\"selected\\": false}","{\\"option2\\": \\"Anomali ThreatStream\\", \\"selected\\": true}","{\\"option3\\": \\"SolarWinds\\", \\"selected\\": false}","{\\"option4\\": \\"LogRhythm\\", \\"selected\\": false}","{\\"option5\\": \\"others\\", \\"selected\\": false}"}	1	5	54	1	2021-02-26 14:12:49.707899	2021-02-26 14:12:49.707899
120	3334	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	54	1	2021-02-26 14:12:49.715176	2021-02-26 14:12:49.715176
121	3335	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	54	1	2021-02-26 14:12:49.719964	2021-02-26 14:12:49.719964
122	3024	1	{"{\\"option1\\": \\"admin\\", \\"selected\\": true}","{\\"option2\\": \\"manager\\", \\"selected\\": false}","{\\"option3\\": \\"Lead\\", \\"selected\\": false}","{\\"option4\\": \\"other\\", \\"selected\\": false}"}	1	4	54	1	2021-02-26 14:12:49.724509	2021-02-26 14:12:49.724509
123	3336	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	54	1	2021-02-26 14:12:49.729177	2021-02-26 14:12:49.729177
124	3025	1	{"{\\"option1\\": \\"IBM X-Force Exchange\\", \\"selected\\": true}","{\\"option2\\": \\"Anomali ThreatStream\\", \\"selected\\": false}","{\\"option3\\": \\"SolarWinds\\", \\"selected\\": false}","{\\"option4\\": \\"LogRhythm\\", \\"selected\\": false}","{\\"option5\\": \\"others\\", \\"selected\\": false}"}	1	5	54	1	2021-02-26 14:12:49.734085	2021-02-26 14:12:49.734085
125	3337	1	{"{\\"option1\\": \\"Yes\\", \\"selected\\": true}","{\\"option2\\": \\"No\\", \\"selected\\": false}"}	1	1	54	1	2021-02-26 14:12:49.738623	2021-02-26 14:12:49.738623
\.


--
-- Data for Name: rbac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rbac (id, feature, roles, creationdatetime, updationdatetime, button, icon, url) FROM stdin;
46	Delete User	admin	2021-02-10 18:35:16.87789	2021-02-20 03:09:36.89038	yes		
35	View Questions	admin	2021-02-10 18:26:57.40565	2021-02-24 04:52:24.994494	no	mdi mdi-file-document-box-check-outline	/viewQuestion
45	Edit User	admin	2021-02-10 18:35:16.87789	2021-02-20 03:10:04.756903	yes		
28	Edit Functionality	admin	2021-02-10 18:23:04.464276	2021-02-20 02:36:52.763137	yes		
16	View Project	admin	2021-02-04 04:12:27.74033	2021-02-24 04:57:29.866322	no	mdi mdi-file-table-box-multiple	/viewproject
29	Delete Functionality	admin	2021-02-10 18:23:04.464276	2021-02-20 02:37:47.959538	yes		
22	Area	admin	2021-02-06 01:12:55.400452	2021-02-24 04:50:31.130596	no	mdi mdi-note-plus	/addarea
26	Functionality	admin	2021-02-09 11:11:00.738628	2021-02-20 06:51:00.708176	no	mdi mdi-note-plus	/addfunctionality
27	View Functionality	manager	2021-02-10 18:23:04.464276	2021-02-22 06:43:00.661094	no	mdi mdi-file-table-box-multiple	/viewFunctionality
30	Sub Functionality	admin	2021-02-10 18:25:10.741835	2021-02-20 06:49:34.357589	no	mdi mdi-note-plus	/addsubfunctionality
31	View Sub Functionality	manager	2021-02-10 18:25:10.741835	2021-02-22 06:41:33.398071	no	mdi mdi-file-table-box-multiple	/viewSubFunctionality
43	Add User	admin,manager	2021-02-10 18:35:16.87789	2021-02-20 03:12:08.288422	yes		
23	View Area	manager	2021-02-06 01:22:56.488809	2021-02-22 06:44:38.808632	no	mdi mdi-file-table-box-multiple	/viewArea
32	Edit Sub Functionality	admin	2021-02-10 18:25:10.741835	2021-02-20 02:38:27.803955	yes		
58	Assessment Acceptance 	admin,manager	2021-02-22 06:19:58.114616	2021-02-22 06:51:46.857733	no	mdi mdi mdi-poll-box	/assessmentacceptanceform
33	Delete Sub Functionality	admin,manager	2021-02-10 18:25:10.741835	2021-02-20 02:39:32.483065	yes		
57	Assessment Reports	admin,manager	2021-02-20 09:32:35.284968	2021-02-20 09:32:35.284968	no	mdi mdi-history	/reports
60	User Dashboard	teamMember	2021-02-22 07:26:34.378917	2021-02-22 07:26:34.378917	no	mdi mdi-view-dashboard	/userDashboard
44	Assign Team Member	admin	2021-02-10 18:35:16.87789	2021-02-24 04:53:39.838293	no	mdi mdi-file-document-box-check-outline	/viewUsers
41	Edit Company Profile	admin	2021-02-10 18:35:16.87789	2021-02-20 03:14:10.611363	yes		
56	Assign Project Manager	admin	2021-02-20 09:29:45.96021	2021-02-20 09:29:45.96021	no	mdi mdi-file-document-box-check-outline	/viewProjectManager
48	Edit RBAC	admin	2021-02-10 18:39:32.624695	2021-02-20 02:45:07.539574	yes		
59	Assessment Taking	teamMember	2021-02-22 06:26:42.205993	2021-02-22 07:24:45.530494	no	mdi mdi mdi-poll-box	/assessmenttakingform
49	Add Email configuration	admin	2021-02-10 18:39:32.624695	2021-02-20 02:45:55.494598	yes		
17	Edit Project	admin	2021-02-04 04:16:30.430247	2021-02-20 02:21:21.357778	yes		
18	Delete Project	admin	2021-02-04 06:46:53.428489	2021-02-20 02:22:12.80065	yes		
38	Add Role	admin	2021-02-10 18:29:01.490119	2021-02-20 03:15:45.169551	yes		
42	View Company Profile	admin, manager, user	2021-02-10 18:35:16.87789	2021-02-24 03:39:23.033518	yes		
51	Edit Email configuration	admin,manager	2021-02-10 18:39:32.624695	2021-02-20 03:04:42.716051	yes		
40	Delete Role	admin	2021-02-10 18:29:01.490119	2021-02-20 03:16:31.565733	yes		
50	View Email configuration	admin	2021-02-10 18:39:32.624695	2021-02-24 03:48:09.489948	yes		
36	Edit Questions	admin	2021-02-10 18:26:57.40565	2021-02-20 03:06:24.855955	yes		
61	Settings	admin	2021-02-24 03:52:21.409198	2021-02-24 03:52:21.409198	no	mdi mdi-settings	/settings
24	Edit Area	admin	2021-02-06 01:26:58.905721	2021-02-20 02:32:54.672624	yes		
37	Delete Questions	admin	2021-02-10 18:26:57.40565	2021-02-20 03:07:20.181899	yes		
39	View Role	admin	2021-02-10 18:29:01.490119	2021-02-24 03:54:46.817708	yes		
25	Delete Area	admin	2021-02-06 01:29:28.950816	2021-02-20 02:33:42.424729	yes		
47	View RBAC	admin	2021-02-10 18:39:32.624695	2021-02-24 03:55:45.489723	yes		
34	Add Questions	admin, manager	2021-02-10 18:26:57.40565	2021-02-24 04:47:24.73132	no	mdi mdi-note-plus	/addquestions
15	Add Project	admin	2021-02-02 10:55:41.386694	2021-02-24 04:49:21.855713	no	mdi mdi-note-plus	/addproject
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, companyid, creationdatetime) FROM stdin;
1	admin	1	2021-01-13 11:22:02.118419
2	teamMember	1	2021-01-13 11:22:40.397881
4	manager	1	2021-01-13 11:23:24.117859
20	no role	1	2021-01-13 11:23:24.117859
29	developer	1	2021-02-24 03:55:17.323851
30	Tester	1	2021-02-24 04:02:53.104043
\.


--
-- Data for Name: subfunctionality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subfunctionality (id, name, description, retake_assessment_days, func_id, area_id, proj_id, creationdatetime, updationdatetime) FROM stdin;
54	Sub Func 1	sub func 1 desc	120	370	214	70	2021-02-26 12:55:27.453691	2021-02-26 12:55:27.453691
\.


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tools (id, job_name, total_no_build, total_no_success, total_no_failure, "lastBuild_number", "lastBuild_duration", "lastBuild_user", "lastBuild_result", "lastCompletedBuild_number", "lastCompletedBuild_duration", "lastCompletedBuild_user", "lastFailedBuild_number", "lastFailedBuild_duration", "lastFailedBuild_user", "lastStableBuild_number", "lastStableBuild_duration", "lastSuccessfulBuild_number", "lastSuccessfulBuild_duration", "lastUnstableBuild", "healthReport_score", "lastUnsuccessfulBuild_number", "lastUnsuccessfulBuild_duration", "lastUnsuccessfulBuild_user", "lastSuccessfulBuild_user", "lastStableBuild_user", creationdatetime, updationdatetime) FROM stdin;
\.


--
-- Data for Name: tools_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tools_login (id, name, url, password, projectid, creationdatetime, updationdatetime) FROM stdin;
\.


--
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 224, true);


--
-- Name: assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessment_id_seq', 54, true);


--
-- Name: blacklist_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklist_token_id_seq', 391, true);


--
-- Name: companydetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companydetails_id_seq', 2, true);


--
-- Name: companyuserdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companyuserdetails_id_seq', 133, true);


--
-- Name: emailconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emailconfiguration_id_seq', 5, true);


--
-- Name: functionality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.functionality_id_seq', 382, true);


--
-- Name: git_hub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.git_hub_id_seq', 1, false);


--
-- Name: git_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.git_id_seq', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 98, true);


--
-- Name: projectassignmenttomanager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projectassignmenttomanager_id_seq', 38, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 3372, true);


--
-- Name: questions_answered_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_answered_id_seq', 125, true);


--
-- Name: rbac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rbac_id_seq', 61, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 30, true);


--
-- Name: subfunctionality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subfunctionality_id_seq', 57, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: assessment assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessment
    ADD CONSTRAINT assessment_pkey PRIMARY KEY (id);


--
-- Name: blacklist_token blacklist_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_token
    ADD CONSTRAINT blacklist_token_pkey PRIMARY KEY (id);


--
-- Name: blacklist_token blacklist_token_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_token
    ADD CONSTRAINT blacklist_token_token_key UNIQUE (token);


--
-- Name: companydetails companydetails_companyname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companydetails
    ADD CONSTRAINT companydetails_companyname_key UNIQUE (companyname);


--
-- Name: companydetails companydetails_gstortaxnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companydetails
    ADD CONSTRAINT companydetails_gstortaxnumber_key UNIQUE (gstortaxnumber);


--
-- Name: companydetails companydetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companydetails
    ADD CONSTRAINT companydetails_pkey PRIMARY KEY (id);


--
-- Name: companyuserdetails companyuserdetails_empemail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companyuserdetails
    ADD CONSTRAINT companyuserdetails_empemail_key UNIQUE (empemail);


--
-- Name: companyuserdetails companyuserdetails_empid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companyuserdetails
    ADD CONSTRAINT companyuserdetails_empid_key UNIQUE (empid);


--
-- Name: companyuserdetails companyuserdetails_empname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companyuserdetails
    ADD CONSTRAINT companyuserdetails_empname_key UNIQUE (empname);


--
-- Name: companyuserdetails companyuserdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companyuserdetails
    ADD CONSTRAINT companyuserdetails_pkey PRIMARY KEY (id);


--
-- Name: emailconfiguration emailconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emailconfiguration
    ADD CONSTRAINT emailconfiguration_pkey PRIMARY KEY (id);


--
-- Name: functionality functionality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.functionality
    ADD CONSTRAINT functionality_pkey PRIMARY KEY (id);


--
-- Name: git_hub git_hub_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.git_hub
    ADD CONSTRAINT git_hub_pkey PRIMARY KEY (id);


--
-- Name: git_hub git_hub_repo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.git_hub
    ADD CONSTRAINT git_hub_repo_id_key UNIQUE (repo_id);


--
-- Name: git git_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.git
    ADD CONSTRAINT git_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: projectassignmenttomanager projectassignmenttomanager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projectassignmenttomanager
    ADD CONSTRAINT projectassignmenttomanager_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: questions_answered questions_answered_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions_answered
    ADD CONSTRAINT questions_answered_pkey PRIMARY KEY (id);


--
-- Name: rbac rbac_feature_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rbac
    ADD CONSTRAINT rbac_feature_key UNIQUE (feature);


--
-- Name: rbac rbac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rbac
    ADD CONSTRAINT rbac_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: subfunctionality subfunctionality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subfunctionality
    ADD CONSTRAINT subfunctionality_pkey PRIMARY KEY (id);


--
-- Name: tools_login tools_login_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools_login
    ADD CONSTRAINT tools_login_name_key UNIQUE (name);


--
-- Name: tools_login tools_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools_login
    ADD CONSTRAINT tools_login_pkey PRIMARY KEY (id);


--
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


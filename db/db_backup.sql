--
-- PostgreSQL database dump
--

\restrict Q3rBMeSo7hbNwtepMUN6lwQa8IRxyyeNZQe9r4l0KbK7izhKyKlF6Lm5jXa1Oo0

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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

ALTER TABLE IF EXISTS ONLY public.step_score DROP CONSTRAINT IF EXISTS fk_stepscore_step;
ALTER TABLE IF EXISTS ONLY public.step_score DROP CONSTRAINT IF EXISTS fk_stepscore_report;
ALTER TABLE IF EXISTS ONLY public.step DROP CONSTRAINT IF EXISTS fk_step_interview;
ALTER TABLE IF EXISTS ONLY public.skill_score DROP CONSTRAINT IF EXISTS fk_skillscore_skill;
ALTER TABLE IF EXISTS ONLY public.skill_score DROP CONSTRAINT IF EXISTS fk_skillscore_question;
ALTER TABLE IF EXISTS ONLY public.skill_score DROP CONSTRAINT IF EXISTS fk_skillscore_candidate;
ALTER TABLE IF EXISTS ONLY public.interview_report DROP CONSTRAINT IF EXISTS fk_report_interview;
ALTER TABLE IF EXISTS ONLY public.question_skill DROP CONSTRAINT IF EXISTS fk_questionskill_skill;
ALTER TABLE IF EXISTS ONLY public.question_skill DROP CONSTRAINT IF EXISTS fk_questionskill_question;
ALTER TABLE IF EXISTS ONLY public.question_score DROP CONSTRAINT IF EXISTS fk_questionscore_stepscore;
ALTER TABLE IF EXISTS ONLY public.question_score DROP CONSTRAINT IF EXISTS fk_questionscore_question;
ALTER TABLE IF EXISTS ONLY public.question DROP CONSTRAINT IF EXISTS fk_question_step;
ALTER TABLE IF EXISTS ONLY public.job_ad DROP CONSTRAINT IF EXISTS fk_jobad_occupation;
ALTER TABLE IF EXISTS ONLY public.job_ad DROP CONSTRAINT IF EXISTS fk_jobad_interview;
ALTER TABLE IF EXISTS ONLY public.jobad_department DROP CONSTRAINT IF EXISTS fk_jobad_dept_jobad;
ALTER TABLE IF EXISTS ONLY public.jobad_department DROP CONSTRAINT IF EXISTS fk_jobad_dept_dept;
ALTER TABLE IF EXISTS ONLY public.department DROP CONSTRAINT IF EXISTS fk_department_org;
ALTER TABLE IF EXISTS ONLY public.candidate DROP CONSTRAINT IF EXISTS fk_candidate_report;
ALTER TABLE IF EXISTS ONLY public.candidate DROP CONSTRAINT IF EXISTS fk_candidate_jobad;
DROP INDEX IF EXISTS public.idx_skillscore_skill;
DROP INDEX IF EXISTS public.idx_skillscore_question;
DROP INDEX IF EXISTS public.idx_skillscore_candidate;
ALTER TABLE IF EXISTS ONLY public.step DROP CONSTRAINT IF EXISTS uq_interview_position;
ALTER TABLE IF EXISTS ONLY public.skill_score DROP CONSTRAINT IF EXISTS uq_candidate_question_skill;
ALTER TABLE IF EXISTS ONLY public.skill DROP CONSTRAINT IF EXISTS uk_skill_title;
ALTER TABLE IF EXISTS ONLY public.job_ad DROP CONSTRAINT IF EXISTS uk_jobad_interview;
ALTER TABLE IF EXISTS ONLY public.candidate DROP CONSTRAINT IF EXISTS uk_candidate_report;
ALTER TABLE IF EXISTS ONLY public.step_score DROP CONSTRAINT IF EXISTS step_score_pkey;
ALTER TABLE IF EXISTS ONLY public.step DROP CONSTRAINT IF EXISTS step_pkey;
ALTER TABLE IF EXISTS ONLY public.skill_score DROP CONSTRAINT IF EXISTS skill_score_pkey;
ALTER TABLE IF EXISTS ONLY public.skill DROP CONSTRAINT IF EXISTS skill_pkey;
ALTER TABLE IF EXISTS ONLY public.question_skill DROP CONSTRAINT IF EXISTS question_skill_pkey;
ALTER TABLE IF EXISTS ONLY public.question_score DROP CONSTRAINT IF EXISTS question_score_pkey;
ALTER TABLE IF EXISTS ONLY public.question DROP CONSTRAINT IF EXISTS question_pkey;
ALTER TABLE IF EXISTS ONLY public.organisation DROP CONSTRAINT IF EXISTS organisation_pkey;
ALTER TABLE IF EXISTS ONLY public.occupation DROP CONSTRAINT IF EXISTS occupation_pkey;
ALTER TABLE IF EXISTS ONLY public.jobad_department DROP CONSTRAINT IF EXISTS jobad_department_pkey;
ALTER TABLE IF EXISTS ONLY public.job_ad DROP CONSTRAINT IF EXISTS job_ad_pkey;
ALTER TABLE IF EXISTS ONLY public.interview_report DROP CONSTRAINT IF EXISTS interview_report_pkey;
ALTER TABLE IF EXISTS ONLY public.interview DROP CONSTRAINT IF EXISTS interview_pkey;
ALTER TABLE IF EXISTS ONLY public.department DROP CONSTRAINT IF EXISTS department_pkey;
ALTER TABLE IF EXISTS ONLY public.candidate DROP CONSTRAINT IF EXISTS candidate_pkey;
DROP SEQUENCE IF EXISTS public.step_sequence;
DROP SEQUENCE IF EXISTS public.step_score_sequence;
DROP TABLE IF EXISTS public.step_score;
DROP TABLE IF EXISTS public.step;
DROP SEQUENCE IF EXISTS public.skill_sequence;
DROP TABLE IF EXISTS public.skill_score;
DROP TABLE IF EXISTS public.skill;
DROP SEQUENCE IF EXISTS public.questions_sequence;
DROP TABLE IF EXISTS public.question_skill;
DROP TABLE IF EXISTS public.question_score;
DROP TABLE IF EXISTS public.question;
DROP SEQUENCE IF EXISTS public.organisation_sequence;
DROP TABLE IF EXISTS public.organisation;
DROP SEQUENCE IF EXISTS public.occupation_sequence;
DROP TABLE IF EXISTS public.occupation;
DROP TABLE IF EXISTS public.jobad_department;
DROP SEQUENCE IF EXISTS public.job_ad_sequence;
DROP TABLE IF EXISTS public.job_ad;
DROP SEQUENCE IF EXISTS public.interview_sequence;
DROP SEQUENCE IF EXISTS public.interview_report_sequence;
DROP TABLE IF EXISTS public.interview_report;
DROP TABLE IF EXISTS public.interview;
DROP SEQUENCE IF EXISTS public.department_sequence;
DROP TABLE IF EXISTS public.department;
DROP SEQUENCE IF EXISTS public.candidate_sequence;
DROP TABLE IF EXISTS public.candidate;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: candidate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.candidate (
    id integer NOT NULL,
    comments text,
    cv_original_name character varying(255),
    cv_path character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    status character varying(255),
    interview_report_id integer,
    job_ad_id integer
);


--
-- Name: candidate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.candidate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.department (
    id integer NOT NULL,
    description character varying(255),
    location character varying(255),
    name character varying(255),
    organisation_id integer
);


--
-- Name: department_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.department_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interview; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interview (
    id integer NOT NULL,
    description character varying(255),
    title character varying(255)
);


--
-- Name: interview_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interview_report (
    id integer NOT NULL,
    interview_id integer NOT NULL
);


--
-- Name: interview_report_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interview_report_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interview_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interview_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: job_ad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_ad (
    id integer NOT NULL,
    description character varying(255),
    publish_date date,
    status character varying(255),
    title character varying(255),
    interview_id integer,
    occupation_id integer
);


--
-- Name: job_ad_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.job_ad_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobad_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobad_department (
    jobad_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- Name: occupation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.occupation (
    id integer NOT NULL,
    esco_id character varying(255),
    title character varying(255)
);


--
-- Name: occupation_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.occupation_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organisation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organisation (
    id integer NOT NULL,
    description character varying(255),
    name character varying(255)
);


--
-- Name: organisation_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organisation_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.question (
    id integer NOT NULL,
    description character varying(2000),
    "position" integer,
    title character varying(255) NOT NULL,
    step_id integer NOT NULL
);


--
-- Name: question_score; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.question_score (
    id integer NOT NULL,
    score double precision NOT NULL,
    question_id integer,
    step_score_id integer
);


--
-- Name: question_skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.question_skill (
    question_id integer NOT NULL,
    skill_id integer NOT NULL
);


--
-- Name: questions_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skill (
    id integer NOT NULL,
    esco_id character varying(255),
    score double precision NOT NULL,
    title character varying(255)
);


--
-- Name: skill_score; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skill_score (
    id bigint NOT NULL,
    comment character varying(2000),
    score integer,
    candidate_id integer NOT NULL,
    question_id integer NOT NULL,
    skill_id integer NOT NULL
);


--
-- Name: skill_score_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.skill_score ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.skill_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: skill_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skill_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: step; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.step (
    id integer NOT NULL,
    description character varying(255),
    "position" integer NOT NULL,
    score double precision NOT NULL,
    title character varying(255),
    interview_id integer
);


--
-- Name: step_score; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.step_score (
    id integer NOT NULL,
    interview_report_id integer,
    step_id integer
);


--
-- Name: step_score_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.step_score_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: step_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.step_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Data for Name: candidate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.candidate (id, comments, cv_original_name, cv_path, email, first_name, last_name, status, interview_report_id, job_ad_id) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.department (id, description, location, name, organisation_id) FROM stdin;
1	Responsible for software development, infrastructure, and QA.	Athens HQ - 3rd Floor	Engineering	1
2	Handles talent acquisition, employee relations, and payroll.	Athens HQ - 1st Floor	Human Resources	1
\.


--
-- Data for Name: interview; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.interview (id, description, title) FROM stdin;
\.


--
-- Data for Name: interview_report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.interview_report (id, interview_id) FROM stdin;
\.


--
-- Data for Name: job_ad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.job_ad (id, description, publish_date, status, title, interview_id, occupation_id) FROM stdin;
\.


--
-- Data for Name: jobad_department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobad_department (jobad_id, department_id) FROM stdin;
\.


--
-- Data for Name: occupation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.occupation (id, esco_id, title) FROM stdin;
1	http://data.europa.eu/esco/occupation/0464b062-cea6-4164-b10d-956c61956ae7	ICT security administrator
2	http://data.europa.eu/esco/occupation/04ba4d6c-957d-417f-bf63-5b9e015a9f86	software analyst
3	http://data.europa.eu/esco/occupation/056bef79-c125-47ab-b6b9-8eed05c9458c	telecommunications technician
4	http://data.europa.eu/esco/occupation/07e60525-1aad-4099-aaf3-2c7014c92212	integration engineer
5	http://data.europa.eu/esco/occupation/092fdeeb-a76f-4ed2-b248-90fd6eaaffef	search engine optimisation expert
6	http://data.europa.eu/esco/occupation/0ab5c12c-c1c1-4772-8345-aa287d0e391d	ICT test analyst
7	http://data.europa.eu/esco/occupation/0c448a27-10ec-43ba-b880-d9938bade424	digital forensics expert
8	http://data.europa.eu/esco/occupation/0ce5a9f4-e00a-4bbe-b255-3c63407167a4	cyber incident responder
9	http://data.europa.eu/esco/occupation/0d595b87-a1fc-410c-abbe-88b92cb0d334	ICT teacher secondary school
10	http://data.europa.eu/esco/occupation/0ea36a48-a27d-4515-b61f-3cab395cf60f	microelectronics engineering technician
11	http://data.europa.eu/esco/occupation/102e75c8-3b47-4964-9b47-30a980aed25c	ICT disaster recovery analyst
12	http://data.europa.eu/esco/occupation/10469d70-78a3-4650-9e29-d04de13c62c1	embedded system designer
13	http://data.europa.eu/esco/occupation/106f79e4-6264-45f1-9e7a-297435cd684b	software tester
14	http://data.europa.eu/esco/occupation/1242d99a-47f1-4a62-b884-33746db8a6ca	ICT help desk manager
15	http://data.europa.eu/esco/occupation/1562c7a3-c7d9-419d-b9b6-db26610bcf84	data warehouse designer
16	http://data.europa.eu/esco/occupation/15a7e87c-f7d5-4a60-bab7-9636b76143fe	smart home installer
17	http://data.europa.eu/esco/occupation/16605833-c196-48d7-a6f5-bbdebdc353df	ICT presales engineer
18	http://data.europa.eu/esco/occupation/1c5a45b9-440e-4726-b565-16a952abd341	computer vision engineer
19	http://data.europa.eu/esco/occupation/1c5a896a-e010-4217-a29a-c44db26e25da	embedded systems security engineer
20	http://data.europa.eu/esco/occupation/2079755f-d809-49e6-8037-4de6180e54c0	data engineer
21	http://data.europa.eu/esco/occupation/716df735-77eb-47c8-8c06-d86e46903989	smart home engineer
22	http://data.europa.eu/esco/occupation/7648d5d9-cfab-4981-ba82-b66a9a41d37e	battery system engineer
23	http://data.europa.eu/esco/occupation/22987b58-dbfa-4ecd-ae3f-82dd209255f6	green ICT consultant
24	http://data.europa.eu/esco/occupation/24135b84-cbdd-4d42-9ed2-02fd982d15b2	blockchain developer
25	http://data.europa.eu/esco/occupation/35553663-deab-4d9a-bf22-15c1625d28e8	artificial intelligence engineer
26	http://data.europa.eu/esco/occupation/81480b40-a318-47f3-9b2c-56b69ed67d95	ICT network administrator
27	http://data.europa.eu/esco/occupation/76ef0a87-6afe-4560-b5d0-9a086abe45c5	ethical hacker
28	http://data.europa.eu/esco/occupation/258e46f9-0075-4a2e-adae-1ff0477e0f30	data scientist
29	http://data.europa.eu/esco/occupation/276ba420-ef09-4a0e-b215-2c2e2f80ad28	chief ICT security officer
30	http://data.europa.eu/esco/occupation/27811419-407f-4868-a388-2f7df7aafd91	electronics engineering technician
31	http://data.europa.eu/esco/occupation/2bef94db-0088-4507-982a-2ca717529adb	enterprise architect
32	http://data.europa.eu/esco/occupation/2ed56c3f-61d6-4f7e-9ef8-8849eb102e4c	mobile application developer
33	http://data.europa.eu/esco/occupation/30ed83ba-cc89-4d9f-a59d-5c783c1da56e	web designer
34	http://data.europa.eu/esco/occupation/38a7f453-a7f0-45d2-a74d-5b92506e4a21	computer hardware engineering technician
35	http://data.europa.eu/esco/occupation/32ac76f6-20a0-469e-8cac-e68634087dd3	picture archiving and communication systems administrator
36	http://data.europa.eu/esco/occupation/33e4f026-a823-4ffc-99e4-60d3fe597a1e	digital games tester
37	http://data.europa.eu/esco/occupation/9729c0f3-c9bc-482e-ac59-a82ec3b67ba3	data centre operator
38	http://data.europa.eu/esco/occupation/3e7bf729-4442-4b9f-ad5e-83111963795c	ICT technician
39	http://data.europa.eu/esco/occupation/aaeec9a7-dc57-4485-890c-86b3eef735f9	ICT help desk agent
40	http://data.europa.eu/esco/occupation/a44a1dc5-be08-4840-8bd5-770c4ac1ca6d	ICT security technician
41	http://data.europa.eu/esco/occupation/591c5063-69ce-4551-ba60-e2304111130f	aviation data communications manager
42	http://data.europa.eu/esco/occupation/64c7d461-152c-477f-a8e2-c2c537e9d617	ICT network technician
43	http://data.europa.eu/esco/occupation/dc8ef7da-d2c0-4474-96a0-6d0385eeec1e	webmaster
44	http://data.europa.eu/esco/occupation/d84bf1d7-ef99-40c4-a407-3791d6531b44	telecommunications engineering technician
45	http://data.europa.eu/esco/occupation/3b1ea27c-781c-41eb-821f-214285260dd2	ICT change and configuration manager
46	http://data.europa.eu/esco/occupation/3ce4691e-ecea-4278-939e-b89ab01087b8	telecommunications manager
47	http://data.europa.eu/esco/occupation/3d190639-90f8-4402-b1b3-a104a17e0d67	database integrator
48	http://data.europa.eu/esco/occupation/4543bf7b-8ffb-4ade-88b9-58da34366f04	ICT capacity planner
49	http://data.europa.eu/esco/occupation/456ed487-02f2-45c9-9213-d0fd8e9a069d	ICT application configurator
50	http://data.europa.eu/esco/occupation/4588cd69-e6a5-4668-94c7-f02a3d86a649	digital literacy teacher
51	http://data.europa.eu/esco/occupation/4874fa37-0cd1-4a68-aed8-a838851f242d	language engineer
52	http://data.europa.eu/esco/occupation/490d0c6f-0dc8-4825-9f17-207749fb1785	ATM repair technician
53	http://data.europa.eu/esco/occupation/491cf76d-eb0d-4f15-90f0-3f5c9b11472a	gambling quality assurance engineer
54	http://data.europa.eu/esco/occupation/4b3201cb-ffc5-4f61-9fc3-5c0f0038fa5f	ICT business analysis manager
55	http://data.europa.eu/esco/occupation/4e82464b-e9d7-4d51-9116-294ab40c5169	assistive technologist
56	http://data.europa.eu/esco/occupation/50af07f0-7a75-424e-a66d-5a9deea10f4c	ICT usability tester
57	http://data.europa.eu/esco/occupation/5791a961-4717-4230-a245-a4082a675f04	automation engineering technician
58	http://data.europa.eu/esco/occupation/57b459d4-655c-4053-b189-3c249ce33faf	ICT business development manager
59	http://data.europa.eu/esco/occupation/586fe133-1987-41f4-b89a-f39d4bc58e1e	eBusiness manager
119	http://data.europa.eu/esco/occupation/cc325a8f-702e-4bf0-893f-5b5d456475ad	cloud identity manager
60	http://data.europa.eu/esco/occupation/591d1758-3036-407a-91f7-e0e1f5c9deea	electronics and automation vocational teacher
61	http://data.europa.eu/esco/occupation/62001bb7-4611-4b61-903e-d98589c0821a	games development manager
62	http://data.europa.eu/esco/occupation/c3b82711-273d-4fa8-8de7-0ac3d99c16fc	computer science lecturer
63	http://data.europa.eu/esco/occupation/6ce5f7e3-a534-4aa2-ab23-255408ddb53a	IoT developer
64	http://data.europa.eu/esco/occupation/9e2e6e1e-363b-4e1b-a673-7bc0f7343300	ICT system administrator
65	http://data.europa.eu/esco/occupation/6e92d4b5-3167-4166-802f-da7753951a31	ICT research consultant
66	http://data.europa.eu/esco/occupation/9ebaf3f0-0be0-47b7-b2b1-b3b04130fa81	digital games developer
67	http://data.europa.eu/esco/occupation/7086d0ca-1e77-4690-89c9-7ed1a0478fa3	data quality specialist
68	http://data.europa.eu/esco/occupation/731f38f1-b08f-4dd5-a25e-f8627c038273	ICT integration tester
69	http://data.europa.eu/esco/occupation/b37d15b3-402e-4792-8292-f18c0de7aca6	mobile devices technician
70	http://data.europa.eu/esco/occupation/76a1a76c-b014-4600-8901-56cb936de7ed	ICT auditor manager
71	http://data.europa.eu/esco/occupation/7754d570-9519-48c2-b1c9-8e165f8bca0f	cybersecurity risk manager
72	http://data.europa.eu/esco/occupation/781a6350-e686-45b9-b075-e4c8d5a05ff7	cloud software developer
73	http://data.europa.eu/esco/occupation/7833d5cd-873d-4fdd-b2f8-9762d68494a7	robotics engineering technician
74	http://data.europa.eu/esco/occupation/78faf623-2543-43a5-acb2-3c43a22d36e4	blockchain architect
75	http://data.europa.eu/esco/occupation/7a3996d8-b90d-4b81-bd5e-e37f005b2683	director of compliance and information security in gambling
76	http://data.europa.eu/esco/occupation/7b1b5da8-573a-49bb-a38e-68725a949f4f	chief technology officer
77	http://data.europa.eu/esco/occupation/7b4744a8-a4e3-4104-9b74-4ec54108af7b	microelectronics designer
78	http://data.europa.eu/esco/occupation/7f0fe7d3-54c6-41e9-88ba-9d4f0f1a46b4	microsystem engineer
79	http://data.europa.eu/esco/occupation/810e5e67-acd5-499a-b307-cf5bea330859	ICT information and knowledge manager
80	http://data.europa.eu/esco/occupation/812c217d-32b7-4f6a-9faf-993d3577ac7f	knowledge engineer
81	http://data.europa.eu/esco/occupation/866c7813-2c03-47d7-9bdc-192cfbace57c	user interface developer
82	http://data.europa.eu/esco/occupation/8c0f59c9-9a47-42e7-8287-aab19df4e6ab	microelectronics engineer
83	http://data.europa.eu/esco/occupation/8c57af09-719c-42b3-be40-6ed4946236cc	database administrator
84	http://data.europa.eu/esco/occupation/8d463763-5d38-4f47-903c-1c4df32141c1	smart city consultant
85	http://data.europa.eu/esco/occupation/8d9ec84d-cf2d-4179-87bc-335cda54a427	database designer
86	http://data.europa.eu/esco/occupation/8edd8bff-cb59-4c9c-ab0f-59e77d18be48	predictive maintenance expert
87	http://data.europa.eu/esco/occupation/91e35fd9-ac59-48ef-8416-c06a201b2da8	printed circuit board designer
88	http://data.europa.eu/esco/occupation/92bb3d8c-8a9f-4cd7-80ec-247bbf173004	computer hardware engineer
89	http://data.europa.eu/esco/occupation/96e20037-0a25-4bf6-a25e-808d1605d890	user interface designer
90	http://data.europa.eu/esco/occupation/9db7d74c-b46d-45c0-b611-6bcb7456ecc6	ICT research manager
91	http://data.europa.eu/esco/occupation/9e657046-67ce-4e16-ab2e-ddb918638910	ICT trainer
92	http://data.europa.eu/esco/occupation/e0b544dd-b621-4126-a55e-054af25c6ea0	ICT network architect
93	http://data.europa.eu/esco/occupation/e297ec12-4712-40a4-ad98-ba004cacb205	chief data officer
94	http://data.europa.eu/esco/occupation/e6800524-eec2-4c33-af0e-6f36d1d679bc	instrumentation engineer
95	http://data.europa.eu/esco/occupation/e6dfc67e-331e-4468-a249-347a08decbdb	microelectronics materials engineer
96	http://data.europa.eu/esco/occupation/e8bbc7fd-cfa2-406f-a664-57e5024cfbc5	ICT vendor relationship manager
97	http://data.europa.eu/esco/occupation/ec5b72d1-0206-4179-9abd-570c66bc44b9	e-learning developer
98	http://data.europa.eu/esco/occupation/ef5b17a5-3ca8-4965-bd3d-61c4aca490d1	document management officer
99	http://data.europa.eu/esco/occupation/ef909843-97c6-4c48-8038-2e7aefdfcad5	clinical informatics manager
100	http://data.europa.eu/esco/occupation/f0ca39a8-1e30-487c-95f9-ef2d5e734adc	ICT operations manager
101	http://data.europa.eu/esco/occupation/f2b15a0e-e65a-438a-affb-29b9d50b77d1	software developer
102	http://data.europa.eu/esco/occupation/f31f487b-4ce2-40f3-90e8-7d0011b4ef1d	software manager
103	http://data.europa.eu/esco/occupation/f8ab2e08-d14e-4938-a2cd-c04821556db7	consumer electronics repair technician
104	http://data.europa.eu/esco/occupation/fd1c83b3-60d5-4a5f-86c5-94dc2842c246	integrated circuit design engineer
105	http://data.europa.eu/esco/occupation/fde97584-d8e3-413e-a662-511c9055357e	live chat operator
106	http://data.europa.eu/esco/occupation/fe0fa514-b48d-4a53-9757-a283c0baacf0	ICT business analyst
107	http://data.europa.eu/esco/occupation/02eb0ae6-ecdd-4602-9c8e-60ffe6dbe1e2	telecommunications engineer
108	http://data.europa.eu/esco/occupation/dc97adbe-f807-4ad8-8f3c-c24b3416cdef	digital marketing manager
109	http://data.europa.eu/esco/occupation/bb609566-3ab6-44dd-8f48-cf0b15b96827	automation engineer
110	http://data.europa.eu/esco/occupation/bb6198c4-1d3e-40b9-9cc4-ad2dd9d7c74b	industrial mobile devices software developer
111	http://data.europa.eu/esco/occupation/bb95ef58-9139-4967-bfc1-da8386a4e672	ICT buyer
112	http://data.europa.eu/esco/occupation/bcde2372-fcf3-4270-8f62-c5583d1bb9ec	fibre optic installer
113	http://data.europa.eu/esco/occupation/bd272aee-adc9-4a06-a15c-a73b4b4a46a7	ICT application developer
114	http://data.europa.eu/esco/occupation/bd9d395a-d587-45c6-8d72-ceef226df9e1	ICT system integration consultant
115	http://data.europa.eu/esco/occupation/becbe3ca-e000-40c0-9f67-5c4035b930ea	computer hardware test technician
116	http://data.europa.eu/esco/occupation/c0c1364d-f784-4e76-8d3f-1e998dc6545d	security alarm technician
117	http://data.europa.eu/esco/occupation/e1c72b5f-4c5c-487c-a6df-e84b64a51dae	ICT system architect
118	http://data.europa.eu/esco/occupation/a99b38bc-6e71-4bef-b127-0f2b5e357815	ICT resilience manager
120	http://data.europa.eu/esco/occupation/cc867bee-ab5c-427f-9244-f7a204d9574b	cloud DevOps engineer
121	http://data.europa.eu/esco/occupation/cdd3d773-75a4-4f35-bd1d-1ac720afcf9d	IT auditor
122	http://data.europa.eu/esco/occupation/cf2b03cd-feb7-4f47-90f6-ff1ed6016d3d	ICT network engineer
123	http://data.europa.eu/esco/occupation/d07e6a57-a339-4cfd-bf22-a951713148a3	telecommunications equipment maintainer
124	http://data.europa.eu/esco/occupation/d0aa0792-4345-474b-9365-686cf4869d2e	software architect
125	http://data.europa.eu/esco/occupation/d5a43cd3-230e-46d0-ba05-d67d61e5cfbb	digital media designer
126	http://data.europa.eu/esco/occupation/d68ff35f-e34d-4e32-88ab-d6c06a6c25b9	digital games designer
127	http://data.europa.eu/esco/occupation/da00cd76-22fe-450d-aefc-f4e4a3864171	printed circuit board assembler
128	http://data.europa.eu/esco/occupation/da4589ce-7534-4cc1-9ce4-cabf9364b87c	localiser
129	http://data.europa.eu/esco/occupation/e0b544dd-b621-4126-a55e-054af25c6ea0	ICT network architect
130	http://data.europa.eu/esco/occupation/b493b10d-7131-4814-93bb-a2c1be4a095f	office equipment repair technician
131	http://data.europa.eu/esco/occupation/b849fd2a-5210-434b-a50b-2d92de3a4bac	electronics drafter
132	http://data.europa.eu/esco/occupation/68d973df-bf10-4bf7-9a1b-fbd9f604b9db	bioinformatics scientist
133	http://data.europa.eu/esco/occupation/e8fca903-6590-48a8-8902-094bb41ee90c	autonomous driving specialist
134	http://data.europa.eu/esco/occupation/ab360abd-32e2-4e03-967d-a10758efffa7	mechatronics engineer
135	http://data.europa.eu/esco/occupation/b1ed68f8-8d51-4bcc-8825-bd554859480f	director of compliance and information security
136	http://data.europa.eu/esco/occupation/8cb59bc4-1f39-477e-beea-effed12d186c	technical communicator
\.


--
-- Data for Name: organisation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organisation (id, description, name) FROM stdin;
1	A leading provider of innovative software solutions and IT consulting services.	MyOrganization
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.question (id, description, "position", title, step_id) FROM stdin;
\.


--
-- Data for Name: question_score; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.question_score (id, score, question_id, step_score_id) FROM stdin;
\.


--
-- Data for Name: question_skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.question_skill (question_id, skill_id) FROM stdin;
\.


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skill (id, esco_id, score, title) FROM stdin;
1	http://data.europa.eu/esco/skill/01d269d9-b058-4d6c-82a0-3779af9a124b	0	develop blockchain innovative architectures
2	http://data.europa.eu/esco/skill/001115fb-569f-4ee6-8381-c6807ef2527f	0	show initiative
3	http://data.europa.eu/esco/skill/03b9b491-fc9b-4868-914a-bf7cd47b5041	0	create solutions to problems
4	http://data.europa.eu/esco/skill/045f71e6-0699-4169-8a54-9c6b96f3174d	0	advise others
5	http://data.europa.eu/esco/skill/05aa7c09-46e7-433f-a81b-92841f4551e7	0	accept criticism and guidance
6	http://data.europa.eu/esco/skill/062320e5-79d1-45e8-8b7e-5deeb53279a2	0	perform online data analysis
7	http://data.europa.eu/esco/skill/06670261-ea6b-4b52-a915-c7d4ff837f74	0	identify statistical patterns
8	http://data.europa.eu/esco/skill/07e51c60-763a-4335-b4ec-70a15f66d328	0	propose ICT solutions to business problems
9	http://data.europa.eu/esco/skill/07e47d58-dd0e-4302-9e68-70a188e89065	0	apply system organisational policies
10	http://data.europa.eu/esco/skill/0823ccef-813f-4f22-afef-ac0d68615e8f	0	computer simulation
11	http://data.europa.eu/esco/skill/082967d4-b94c-4305-aa13-35a6aa8c5c7c	0	cooperate with colleagues
12	http://data.europa.eu/esco/skill/08b04e53-ed25-41a2-9f90-0b9cd939ba3d	0	manage research data
13	http://data.europa.eu/esco/skill/08e2ff26-88ff-47b5-9d37-d19ace01b075	0	manage feedback
14	http://data.europa.eu/esco/skill/09cac140-367e-45f5-b19f-6430e75e5a2a	0	prepare speeches
15	http://data.europa.eu/esco/skill/09f2f811-a3fb-4de3-a70f-6420a6935575	0	systems development life-cycle
16	http://data.europa.eu/esco/skill/09f4c52b-ac72-4f0e-a8ae-78bb1d7bffba	0	transportation software related to an ERP system
17	http://data.europa.eu/esco/skill/0a0532c2-ee60-4410-8e07-70e4d69370ec	0	operate automated process control
18	http://data.europa.eu/esco/skill/0af529ff-a95d-419b-ab2a-335f6894a966	0	maintain logistics databases
19	http://data.europa.eu/esco/skill/0b144726-21c2-46ed-8d13-c03d27f61604	0	perform multiple tasks at the same time
20	http://data.europa.eu/esco/skill/0b8da079-f587-403f-a6ad-cd18b8150044	0	gather technical information
21	http://data.europa.eu/esco/skill/0c66036a-3bdd-4955-8343-985f4697af64	0	manage donor database
22	http://data.europa.eu/esco/skill/0cc9c234-f817-4f4c-908a-4d28fe3b0f4a	0	coach employees
23	http://data.europa.eu/esco/skill/0d11711b-870f-4701-be93-fa175b6e4002	0	persuade clients with alternatives
24	http://data.europa.eu/esco/skill/0d6714c6-720e-4985-9791-5ab85d28da79	0	gather data
25	http://data.europa.eu/esco/skill/0d7f2cce-245a-4d02-9b8d-2e9946cc4c5d	0	deliver online training
26	http://data.europa.eu/esco/skill/0da516ee-e70e-4384-be13-f5ff80be8127	0	communicate with customers
27	http://data.europa.eu/esco/skill/0df2e216-68ae-4952-b9dc-3c2f2bc04fe3	0	maintain freelance database
28	http://data.europa.eu/esco/skill/0e0c9c11-b39e-43cf-ba95-2fe646f5de64	0	identify customer requirements
29	http://data.europa.eu/esco/skill/0e1fe34b-f4e7-4642-8c8b-5a05ac3438e5	0	manage schedule of tasks
30	http://data.europa.eu/esco/skill/0e5affa0-705e-4b19-94e8-19e902e0287d	0	analyse decentralised applications
31	http://data.europa.eu/esco/skill/0e9e3a56-3b26-4fa5-91df-6d9bfbea4259	0	electronic test procedures
32	http://data.europa.eu/esco/skill/0ee94af1-b445-4973-9c3f-459fab250342	0	apply conflict management
33	http://data.europa.eu/esco/skill/0f2eee6f-2203-4cc8-9d79-854d2d5d8131	0	use questioning techniques
34	http://data.europa.eu/esco/skill/0f46a403-9606-465f-8247-8ae975ff4f35	0	communicate verbal instructions
35	http://data.europa.eu/esco/skill/113b4428-0a31-4199-8496-070af7854b91	0	meet commitments
36	http://data.europa.eu/esco/skill/116083f9-8d05-4b2e-a15f-287b18de5f67	0	use global distribution system
37	http://data.europa.eu/esco/skill/1177c6f5-09c5-4c35-873c-afd22d170ad3	0	quality assurance procedures
38	http://data.europa.eu/esco/skill/118efbcd-8fc5-4668-81d1-c383a0d16070	0	handle helpdesk problems
39	http://data.europa.eu/esco/skill/11c56452-fcec-4b00-9695-cca4728e5048	0	marketing analytics
40	http://data.europa.eu/esco/skill/123cf7c5-6a3b-419d-be4f-49a6cc020f9f	0	interactive media
41	http://data.europa.eu/esco/skill/1258cc12-37bb-4a12-b219-9c3d6b294533	0	work in an organised manner
42	http://data.europa.eu/esco/skill/12c82224-6394-4c3c-9831-2a8198ed1274	0	optical character recognition software
43	http://data.europa.eu/esco/skill/130d8246-5d34-4cbf-93c6-c02990a26532	0	type error-free documents
44	http://data.europa.eu/esco/skill/143769cb-b61e-47d8-a61e-eedfbec1016c	0	business intelligence
45	http://data.europa.eu/esco/skill/14764a75-3104-4875-ba1d-57c059b9b013	0	telecommunications engineering
46	http://data.europa.eu/esco/skill/14832d87-2f2f-4895-b290-e4760ebae42a	0	solve technical problems
47	http://data.europa.eu/esco/skill/1605025e-a179-421f-8f35-5b07d182a6b2	0	web analytics
48	http://data.europa.eu/esco/skill/162c7407-14ec-43ef-a4c2-31ccd1267850	0	design firmware
49	http://data.europa.eu/esco/skill/16a00c69-9c74-4c37-96d7-6301d285e5ce	0	use e-services
50	http://data.europa.eu/esco/skill/17c9a790-5664-4673-8237-c4cf3c5a8da5	0	conduct impact evaluation of ICT processes on business
51	http://data.europa.eu/esco/skill/234aeb8d-56c3-4531-9193-1c5e6a8d16cb	0	use presentation software
52	http://data.europa.eu/esco/skill/1973c966-f236-40c9-b2d4-5d71a89019be	0	use spreadsheets software
53	http://data.europa.eu/esco/skill/19c0e68e-6e6c-4698-85dc-ef66a9de2c37	0	maintain information network hardware
54	http://data.europa.eu/esco/skill/19ec88aa-c0b1-4515-ba10-56b6cf27369e	0	electronic equipment standards
55	http://data.europa.eu/esco/skill/1a4cc54f-1e53-442b-a6d2-1682dc8ef8f9	0	creatively use digital technologies
56	http://data.europa.eu/esco/skill/1af2db15-2af9-44dd-9639-bf1fc69d4c34	0	manage relationships with stakeholders
57	http://data.europa.eu/esco/skill/1b3fc0e0-c6f9-45fc-9c6e-14bbba662979	0	develop information standards
58	http://data.europa.eu/esco/skill/1b70a55d-b8a4-49fc-96c6-15ab4cff2522	0	use data processing techniques
59	http://data.europa.eu/esco/skill/1f1d2ff8-c4c1-45cc-9812-6a7ee84a73cb	0	lead a team
60	http://data.europa.eu/esco/skill/1fc03dc8-0ee0-4876-83ec-86e0bfcb3876	0	crowdfunding
61	http://data.europa.eu/esco/skill/1fcce318-3212-487a-ac07-4941bc85060d	0	carry out project activities
62	http://data.europa.eu/esco/skill/1fce1197-3a5b-45b7-8797-575cd3b57a01	0	show commitment
63	http://data.europa.eu/esco/skill/20012caa-b63c-4cb9-b2b8-01a1cfdfc1d1	0	think quickly
64	http://data.europa.eu/esco/skill/206f5738-e91f-4390-84a2-fcb864bc11b1	0	use specialised computer models for weather forecasting
65	http://data.europa.eu/esco/skill/20a8fe89-d4eb-4698-8521-8881c13377e0	0	interact professionally in research and professional environments
66	http://data.europa.eu/esco/skill/21056f6a-8a85-4eb0-b709-468578b809e0	0	assess the feasibility of implementing developments
67	http://data.europa.eu/esco/skill/21c5790c-0930-4d74-b3b0-84caf5af12ea	0	manage budgets
68	http://data.europa.eu/esco/skill/21d2f96d-35f7-4e3f-9745-c533d2dd6e97	0	computer programming
69	http://data.europa.eu/esco/skill/21fecc8a-392e-49ce-ac26-fb0696ccfead	0	create project specifications
70	http://data.europa.eu/esco/skill/22225017-a02e-4171-8775-64c3adc87512	0	automatic meter reading
71	http://data.europa.eu/esco/skill/22b8039c-c890-4610-9228-5527e3b98f12	0	set quality assurance objectives
72	http://data.europa.eu/esco/skill/22c2af9e-ba0d-4cee-abb6-b6dbef006cd5	0	motivate employees
73	http://data.europa.eu/esco/skill/232cde64-186f-4fbe-b2ae-4a68aad70a67	0	organise wires
74	http://data.europa.eu/esco/skill/802e6973-3270-4cf0-86e4-a6835caf1ba6	0	project management methodology (PM2)
75	http://data.europa.eu/esco/skill/80f308e6-0e09-404a-80cd-ec5f50f6f304	0	communicate with target community
76	http://data.europa.eu/esco/skill/816cb632-848e-43ee-9be0-d13b685498f8	0	joint ventures
77	http://data.europa.eu/esco/skill/81a2db2c-7e55-44d0-9cd9-74c25147d7cd	0	analyse test data
78	http://data.europa.eu/esco/skill/81dc035c-921b-4fea-a453-94538e86097c	0	disseminate messages to people
79	http://data.europa.eu/esco/skill/81633a44-f1db-4a01-a940-804c6905e330	0	use word processing software
80	http://data.europa.eu/esco/skill/c753a3b5-d5cc-406d-adfe-3372bb267f4b	0	maintain customer records
81	http://data.europa.eu/esco/skill/c73ea1b8-e121-4f91-b8f0-dee4ee28d6ec	0	plan schedule
82	http://data.europa.eu/esco/skill/8269dc3d-50ee-46b5-a742-a7d2cb7d90bb	0	check for damaged items
83	http://data.europa.eu/esco/skill/82b6f3bc-5dc3-4c8b-a814-9b471df42e02	0	use technical equipment for sterilisation
84	http://data.europa.eu/esco/skill/82da5835-1759-4eeb-9d58-a834ee80384e	0	install pneumatic systems
85	http://data.europa.eu/esco/skill/c6c1af60-9594-460c-a328-00f9ad292be0	0	coaching techniques
86	http://data.europa.eu/esco/skill/8300443c-c793-4102-bff5-aa917a0cb39f	0	define roadmap for blockchain in applications
87	http://data.europa.eu/esco/skill/8316979b-df5a-4dc7-98ef-61ec6a10df84	0	conduct quantitative research
88	http://data.europa.eu/esco/skill/8330c86e-63cf-4be6-849f-4f77628cc5c5	0	satisfy customers
89	http://data.europa.eu/esco/skill/8359bd04-d2cb-4757-af1f-39a921df9efe	0	remove computer virus or malware from a computer
90	http://data.europa.eu/esco/skill/83e6510b-ffeb-4aec-959c-4265fd0ff7b7	0	attend to detail
91	http://data.europa.eu/esco/skill/8496d258-bf95-4041-a3d7-1cc19b629d14	0	liaise with industry experts
92	http://data.europa.eu/esco/skill/15d76317-c71a-4fa2-aadc-2ecc34e627b7	0	communication
93	http://data.europa.eu/esco/skill/85e6b82a-8244-45f6-8300-a6b2d62ee748	0	communicate test results to other departments
94	http://data.europa.eu/esco/skill/ba45db8f-34e8-4f29-af0b-e6645e1d693f	0	maintain electronic equipment
95	http://data.europa.eu/esco/skill/ba93b71b-c433-4a01-8246-ed2daa85a9a2	0	conduct web searches
96	http://data.europa.eu/esco/skill/bac209e9-d337-4312-9041-17c2e75fa4df	0	hardware industry
97	http://data.europa.eu/esco/skill/bad66a63-4e3f-41f9-9e5d-a4d5f12f8d36	0	create GIS reports
98	http://data.europa.eu/esco/skill/baf501a8-f0fe-4ad7-9b69-8e920fa1a87b	0	test electronic units
99	http://data.europa.eu/esco/skill/bb165899-d95f-4433-95f2-173fefd716d2	0	develop statistical software
100	http://data.europa.eu/esco/skill/bb664ebf-2e54-4a88-ab97-158c3d321af9	0	run preventive simulations
101	http://data.europa.eu/esco/skill/bbd57056-80e0-45bb-a2c1-658ed99a1251	0	conduct performance tests
102	http://data.europa.eu/esco/skill/bc0b0b5d-f6be-405a-b224-b6902a4dbe97	0	manage digital identity
103	http://data.europa.eu/esco/skill/bc1a03da-e78c-4956-9dc2-0da70711df80	0	nanoelectronics
104	http://data.europa.eu/esco/skill/26baf34d-6721-4bac-b7eb-add0bc566a82	0	attend to detail in preparation for audits
105	http://data.europa.eu/esco/skill/bcf002ce-90f8-42e5-ac1b-5dba208639b0	0	demonstrate trustworthiness
106	http://data.europa.eu/esco/skill/bd08f332-a295-4a59-a13a-05b08ca3761b	0	install monitors for process control
107	http://data.europa.eu/esco/skill/bd556223-d9af-434b-a6bf-e70fa3ed3d12	0	accurately estimate work hours
108	http://data.europa.eu/esco/skill/bd832a82-b079-4001-80d1-f59efed33688	0	create risk reports
109	http://data.europa.eu/esco/skill/bdcac0c8-b77a-4640-9eaf-c0cf3efd1e23	0	process payments
110	http://data.europa.eu/esco/skill/bdcf429c-5ccf-4c3d-bb61-4c987573a35e	0	show entrepreneurial spirit
111	http://data.europa.eu/esco/skill/be20d05c-f6b4-4580-9fcf-f00f4baab562	0	make data-driven decisions
112	http://data.europa.eu/esco/skill/be40c4c3-a855-4d67-9ca5-6f4428c34b0d	0	provide written content
113	http://data.europa.eu/esco/skill/be457a1c-5973-4781-9bb8-809703931f43	0	types of audiovisual formats
114	http://data.europa.eu/esco/skill/be6ab363-3de1-427f-a8ef-85d5b0250822	0	report facts
115	http://data.europa.eu/esco/skill/be727774-46d7-43d7-aee9-1a51b5cd8c71	0	carry out statistical forecasts
116	http://data.europa.eu/esco/skill/be7c80ee-0b7a-455c-8928-055cfa65076c	0	react to events in time-critical environments
117	http://data.europa.eu/esco/skill/bf05da8d-772a-4423-adb2-df79672f46f7	0	organise information
118	http://data.europa.eu/esco/skill/bf1f763e-c505-46e7-8af3-e48f13ec5f44	0	control engineering
119	http://data.europa.eu/esco/skill/bf4b6b71-3025-4129-babc-0e275804e058	0	optoelectronic devices
120	http://data.europa.eu/esco/skill/bf4d884f-c848-402a-b130-69c266b04164	0	apply basic programming skills
121	http://data.europa.eu/esco/skill/bf5d77ad-e18c-48d8-83f0-bc79c011c74a	0	develop professional network
122	http://data.europa.eu/esco/skill/bf942c60-8539-4951-83ee-63f770da1cb8	0	program a CNC controller
123	http://data.europa.eu/esco/skill/bf983f2a-e941-4646-811d-cc81060cb53f	0	build networks
124	http://data.europa.eu/esco/skill/c022ff1b-7783-4e64-89ef-0422c81ff51f	0	design microelectromechanical systems
125	http://data.europa.eu/esco/skill/c0326e27-5fa8-4dca-aecb-ed89ab491513	0	prepare visual data
126	http://data.europa.eu/esco/skill/c08c428e-858e-4e99-bcbd-3597ff31778a	0	work with broad variety of personalities
127	http://data.europa.eu/esco/skill/c10d5d87-36cf-42f5-8a12-e560fb5f4af8	0	demonstrate intercultural competence
128	http://data.europa.eu/esco/skill/c2296e2e-5fef-4f24-a24f-e5b3792268be	0	provide ICT support
129	http://data.europa.eu/esco/skill/26ed52cf-30ca-451e-9699-a6c04a30649f	0	solder electronics
130	http://data.europa.eu/esco/skill/c2999f0c-eb37-4cdf-b9b0-82107b628794	0	style sheet languages
131	http://data.europa.eu/esco/skill/c29aa9d2-4da8-4bdd-831c-8d4a2fb51730	0	work independently
132	http://data.europa.eu/esco/skill/c2a0c52c-0b4b-4180-a918-92650ea3b458	0	think innovatively
133	http://data.europa.eu/esco/skill/c2ce7fe9-203b-492a-961e-9698dce7de19	0	perform safety data analysis
134	http://data.europa.eu/esco/skill/c32ad607-0c4d-4e34-b73f-668298f7bf13	0	apply technical communication skills
135	http://data.europa.eu/esco/skill/c330db31-7fa9-4a8c-8ad6-baa957bcfed1	0	install operating system
136	http://data.europa.eu/esco/skill/c3687b34-fe53-4db2-ad1b-5055a6c5b6fd	0	organise project meetings
137	http://data.europa.eu/esco/skill/b34e2ba1-9080-48c9-9b42-ee9192a4d3f1	0	use CAD software
138	http://data.europa.eu/esco/skill/b363bb5f-2c79-40af-94da-33e06f9dee9f	0	apply blended learning
139	http://data.europa.eu/esco/skill/b42b1578-709f-4b59-b23a-fe4bfc7f6b9b	0	check system parameters against reference values
140	http://data.europa.eu/esco/skill/b4548845-dc4c-43fb-a55c-b9b7c6c1defd	0	document sharing procedures
141	http://data.europa.eu/esco/skill/1d6c7de4-350e-4868-a47b-333b4b0d9650	0	evaluate data, information and digital content
142	http://data.europa.eu/esco/skill/82313e12-9d39-47d1-b7c9-78bbd6bb50e2	0	CAE software
143	http://data.europa.eu/esco/skill/82394321-7f35-4a29-b2fa-4a58f66258f5	0	simulate transport problems
144	http://data.europa.eu/esco/skill/c77db25e-bb51-4a10-b2ad-99b48b1b4a37	0	maintain computer hardware
145	http://data.europa.eu/esco/skill/c7cc6dc5-d56b-4323-8e5c-47c4022f615f	0	quality assurance methodologies
146	http://data.europa.eu/esco/skill/ae57a9c3-f761-4b03-be2b-99a781704c73	0	use sales forecasting softwares
147	http://data.europa.eu/esco/skill/ae6af2c6-890d-40a7-9849-326a8c21df76	0	coordinate advertising campaigns
148	http://data.europa.eu/esco/skill/af1c7b89-679b-4fae-b67c-ed05c669719c	0	repair wiring
149	http://data.europa.eu/esco/skill/af6ea157-8c10-4c5b-8015-0e184946127a	0	outline blockchain-based identity management
150	http://data.europa.eu/esco/skill/afda6ca0-7aa8-41ef-ba5e-8dc607839daf	0	computer graphics
151	http://data.europa.eu/esco/skill/b04f377b-ee80-4b38-aca1-19d266a23b17	0	analyse business requirements
152	http://data.europa.eu/esco/skill/b0560439-14eb-41d1-aa53-1938efc24123	0	content marketing strategy
153	http://data.europa.eu/esco/skill/b080a008-a35d-4bd0-92e9-edf3773bb2b7	0	use communication and collaboration software
154	http://data.europa.eu/esco/skill/89f6560b-2194-45c9-9ece-d33049a73eef	0	computer engineering
155	http://data.europa.eu/esco/skill/f9e788df-d68a-4f92-92c7-80e135fc35ff	0	ICT networking hardware
156	http://data.europa.eu/esco/skill/5fd5c985-eaaa-47aa-8314-62359c54505a	0	develop digital content
157	http://data.europa.eu/esco/skill/5fed696b-77d6-46e1-aa57-e520928a9837	0	use free typing techniques
158	http://data.europa.eu/esco/skill/2b34a99f-9813-4c91-9509-b6b9b8c3132e	0	collaborate through digital tools
159	http://data.europa.eu/esco/skill/382c11ed-20d5-4ae7-b60e-15fec527fa6c	0	apply statistical analysis techniques
160	http://data.europa.eu/esco/skill/9e06bac6-6b91-48ca-8b7d-c1f48cdecd7c	0	solve ICT system problems
161	http://data.europa.eu/esco/skill/a12057b4-6d11-4a12-ab8e-15a028ef0a6d	0	interact through digital technologies
162	http://data.europa.eu/esco/skill/33a82b83-c838-4889-ae62-fae1317481eb	0	protect personal data and privacy
163	http://data.europa.eu/esco/skill/33e584f9-ff7a-4979-bfc0-5a3a374a145a	0	social network analysis
164	http://data.europa.eu/esco/skill/633a3637-2c6b-40ae-ac38-289eb2a62aa6	0	business analysis
165	http://data.europa.eu/esco/skill/426ceaba-6867-481c-bb6b-aee3933da7d2	0	ICT safety
166	http://data.europa.eu/esco/skill/429f440f-9dc4-48d3-80ae-e58fce165cca	0	use diagnostic tools for electronic repairs
167	http://data.europa.eu/esco/skill/41bf7ede-fc84-4a57-8c89-b548d11b0ba1	0	manage business knowledge
168	http://data.europa.eu/esco/skill/3c4c3fa1-d638-42df-8e98-2a38021da6f9	0	use software for data preservation
169	http://data.europa.eu/esco/skill/3c6fe585-7d12-4315-b579-e30c042088ce	0	use computer-aided engineering systems
170	http://data.europa.eu/esco/skill/7b0d5000-00da-4864-b776-6de49a87a669	0	computer vision
171	http://data.europa.eu/esco/skill/60b44dab-03f1-46de-be08-0e5ba8662b3d	0	telecommunication industry
172	http://data.europa.eu/esco/skill/3a2d5b45-56e4-4f5a-a55a-4a4a65afdc43	0	machine learning
173	http://data.europa.eu/esco/skill/41f2f9bf-1440-49f7-bbb1-2c3c3ea93f76	0	analyse blockchain use cases
174	http://data.europa.eu/esco/skill/5b26f08b-88bc-45f0-b901-530d7786466b	0	scientific computing
175	http://data.europa.eu/esco/skill/ce2dcc4b-d0a4-4aa4-b84a-a08da3c31d7d	0	explain distributed ledger technologies principles
176	http://data.europa.eu/esco/skill/7b5cce4d-c7fe-4119-b48f-70aa05391787	0	computer science
177	http://data.europa.eu/esco/skill/53403f06-6c51-4a24-9491-d8a6200526ce	0	create a product's virtual model
178	http://data.europa.eu/esco/skill/53456d90-8c0d-4bd2-9f1b-312619b6e2a6	0	hardware testing methods
179	http://data.europa.eu/esco/skill/5354a726-ee64-4f34-90f8-8436f9f374b8	0	analyse ecological data
180	http://data.europa.eu/esco/skill/37a438f3-e28c-4e32-83c5-299f047c1dc9	0	apply tools for content development
181	http://data.europa.eu/esco/skill/713fb616-118e-40bc-9366-4a69879a49d5	0	implement data quality processes
182	http://data.europa.eu/esco/skill/9d0d89be-bffa-4393-b6f6-8d05bea49051	0	data extraction, transformation and loading tools
183	http://data.europa.eu/esco/skill/5ce5236e-93e2-4899-8971-fff526f85a01	0	blockchain applications
184	http://data.europa.eu/esco/skill/b916d60e-38e9-4241-914a-4e2144bda711	0	operate computerised control systems
185	http://data.europa.eu/esco/skill/82de2df7-0d6c-42b1-94ac-b3e9a029e917	0	use back-up and recovery tools
186	http://data.europa.eu/esco/skill/541561bc-510c-4a99-881c-2d8bf5a85462	0	use technical drawing software
187	http://data.europa.eu/esco/skill/945b8655-5577-4c3a-946a-842d4527afa8	0	digital image processing
188	http://data.europa.eu/esco/skill/abdc7ac8-151f-40c6-bc1a-1e9b4b073290	0	augmented reality
189	http://data.europa.eu/esco/skill/ea9e1f2-ad03-4bb3-8960-1227fc76bb2a	0	interpret graphical communication interfaces
190	http://data.europa.eu/esco/skill/fdf15b35-9028-4acb-bfd2-43f00a015cd9	0	use personal organization software
191	http://data.europa.eu/esco/skill/7e5147d1-60b1-4a68-804b-1f5cb0396b91	0	problem-solving with digital tools
192	http://data.europa.eu/esco/skill/629685b8-5f9e-4522-8cff-b3e2c4ec625a	0	digital data processing
193	http://data.europa.eu/esco/skill/5da42cfd-1da8-4e4f-b68e-4f821d005fc5	0	virtual reality
194	http://data.europa.eu/esco/skill/97bd1c21-66b2-4b7e-ad0f-e3cda590e378	0	data analytics
195	http://data.europa.eu/esco/skill/9979e727-3104-42e0-8f41-4af2578111ea	0	perform PESTEL analysis
196	http://data.europa.eu/esco/skill/5608d5a0-6d5e-43b7-be37-616501729bb4	0	artificial neural networks
197	http://data.europa.eu/esco/skill/ecc4552a-92c5-4222-b18d-faf5ac841080	0	deep learning
198	http://data.europa.eu/esco/skill/b679ef35-eebf-4da8-8e45-fee6841c3214	0	collaborate in the development of marketing strategies
199	http://data.europa.eu/esco/skill/b6d14ab8-3441-4cbe-8a0e-5b4f7f994730	0	develop digital educational materials
200	http://data.europa.eu/esco/skill/1dabb413-18e8-48ed-a963-44978e67ad32	0	calculate probabilities
201	http://data.europa.eu/esco/skill/1dae8445-12e5-423a-bb26-824010e299b9	0	ensure compliance with legal requirements
202	http://data.europa.eu/esco/skill/1dd23dba-dd00-45ab-abf4-642902538317	0	perform risk analysis
203	http://data.europa.eu/esco/skill/1dea2f3a-857c-4fc3-b1f8-d5f2015c46a9	0	give instructions to staff
204	http://data.europa.eu/esco/skill/1e77e42a-181f-4b48-8e74-201ce50ffc29	0	interpret current data
205	http://data.europa.eu/esco/skill/c69587b4-05d3-45bb-b79b-9b85e6603fc2	0	provide technical expertise
206	http://data.europa.eu/esco/skill/1f6eac42-e5aa-4fa7-a75d-a4eea12c618e	0	disseminate internal communications
207	http://data.europa.eu/esco/skill/c683335e-b862-44a5-9d37-fc85b39cf022	0	establish communication with foreign cultures
208	http://data.europa.eu/esco/skill/c624c6a3-b0ba-4a31-a296-0d433fe47e41	0	think creatively
209	http://data.europa.eu/esco/skill/c3e36d05-8ae8-447f-bb2b-6f9409f85389	0	deliver visual presentation of data
210	http://data.europa.eu/esco/skill/c415ce6e-24f5-4130-add4-645b9d455c71	0	rig 3D characters
211	http://data.europa.eu/esco/skill/c4272323-cce6-4535-ac71-4f6841f4f89a	0	organisational structure
212	http://data.europa.eu/esco/skill/c46cf6f9-8b1e-44b9-a529-f5774c9167dd	0	desktop publishing
213	http://data.europa.eu/esco/skill/c4949dcf-bbcc-40f2-8584-6c6299beb7fb	0	tend computer numerical control lathe machine
214	http://data.europa.eu/esco/skill/c500f5d0-42d4-4341-904e-cd4ef2ff3181	0	electromagnetic spectrum
215	http://data.europa.eu/esco/skill/c544a9f3-5945-4b54-afed-de0697852817	0	report analysis results
216	http://data.europa.eu/esco/skill/c54b03a9-fe20-42af-9e8a-f8896af4a4f9	0	adjust priorities
217	http://data.europa.eu/esco/skill/c55caed2-de9e-4a25-819e-a0b0e83fba1b	0	give live presentation
218	http://data.europa.eu/esco/skill/c5a135be-218d-48e6-a422-5225a576dcd8	0	manage project metrics
219	http://data.europa.eu/esco/skill/c5c51528-ccfc-4c53-b409-c200aaa44222	0	liaise with engineers
\.


--
-- Data for Name: skill_score; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skill_score (id, comment, score, candidate_id, question_id, skill_id) FROM stdin;
\.


--
-- Data for Name: step; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.step (id, description, "position", score, title, interview_id) FROM stdin;
\.


--
-- Data for Name: step_score; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.step_score (id, interview_report_id, step_id) FROM stdin;
\.


--
-- Name: candidate_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.candidate_sequence', 1, false);


--
-- Name: department_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.department_sequence', 3, true);


--
-- Name: interview_report_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interview_report_sequence', 1, false);


--
-- Name: interview_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interview_sequence', 1, true);


--
-- Name: job_ad_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.job_ad_sequence', 1, true);


--
-- Name: occupation_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.occupation_sequence', 136, true);


--
-- Name: organisation_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.organisation_sequence', 1, true);


--
-- Name: questions_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.questions_sequence', 1, false);


--
-- Name: skill_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skill_score_id_seq', 1, false);


--
-- Name: skill_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skill_sequence', 219, true);


--
-- Name: step_score_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.step_score_sequence', 1, false);


--
-- Name: step_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.step_sequence', 1, false);


--
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: interview interview_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interview
    ADD CONSTRAINT interview_pkey PRIMARY KEY (id);


--
-- Name: interview_report interview_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interview_report
    ADD CONSTRAINT interview_report_pkey PRIMARY KEY (id);


--
-- Name: job_ad job_ad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_ad
    ADD CONSTRAINT job_ad_pkey PRIMARY KEY (id);


--
-- Name: jobad_department jobad_department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobad_department
    ADD CONSTRAINT jobad_department_pkey PRIMARY KEY (jobad_id, department_id);


--
-- Name: occupation occupation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.occupation
    ADD CONSTRAINT occupation_pkey PRIMARY KEY (id);


--
-- Name: organisation organisation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organisation
    ADD CONSTRAINT organisation_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: question_score question_score_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_score
    ADD CONSTRAINT question_score_pkey PRIMARY KEY (id);


--
-- Name: question_skill question_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_skill
    ADD CONSTRAINT question_skill_pkey PRIMARY KEY (question_id, skill_id);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- Name: skill_score skill_score_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_score
    ADD CONSTRAINT skill_score_pkey PRIMARY KEY (id);


--
-- Name: step step_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step
    ADD CONSTRAINT step_pkey PRIMARY KEY (id);


--
-- Name: step_score step_score_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step_score
    ADD CONSTRAINT step_score_pkey PRIMARY KEY (id);


--
-- Name: candidate uk_candidate_report; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT uk_candidate_report UNIQUE (interview_report_id);


--
-- Name: job_ad uk_jobad_interview; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_ad
    ADD CONSTRAINT uk_jobad_interview UNIQUE (interview_id);


--
-- Name: skill uk_skill_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT uk_skill_title UNIQUE (title);


--
-- Name: skill_score uq_candidate_question_skill; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_score
    ADD CONSTRAINT uq_candidate_question_skill UNIQUE (candidate_id, question_id, skill_id);


--
-- Name: step uq_interview_position; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step
    ADD CONSTRAINT uq_interview_position UNIQUE (interview_id, "position");


--
-- Name: idx_skillscore_candidate; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_skillscore_candidate ON public.skill_score USING btree (candidate_id);


--
-- Name: idx_skillscore_question; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_skillscore_question ON public.skill_score USING btree (question_id);


--
-- Name: idx_skillscore_skill; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_skillscore_skill ON public.skill_score USING btree (skill_id);


--
-- Name: candidate fk_candidate_jobad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_jobad FOREIGN KEY (job_ad_id) REFERENCES public.job_ad(id);


--
-- Name: candidate fk_candidate_report; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_report FOREIGN KEY (interview_report_id) REFERENCES public.interview_report(id);


--
-- Name: department fk_department_org; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT fk_department_org FOREIGN KEY (organisation_id) REFERENCES public.organisation(id);


--
-- Name: jobad_department fk_jobad_dept_dept; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobad_department
    ADD CONSTRAINT fk_jobad_dept_dept FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: jobad_department fk_jobad_dept_jobad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobad_department
    ADD CONSTRAINT fk_jobad_dept_jobad FOREIGN KEY (jobad_id) REFERENCES public.job_ad(id);


--
-- Name: job_ad fk_jobad_interview; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_ad
    ADD CONSTRAINT fk_jobad_interview FOREIGN KEY (interview_id) REFERENCES public.interview(id);


--
-- Name: job_ad fk_jobad_occupation; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_ad
    ADD CONSTRAINT fk_jobad_occupation FOREIGN KEY (occupation_id) REFERENCES public.occupation(id);


--
-- Name: question fk_question_step; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fk_question_step FOREIGN KEY (step_id) REFERENCES public.step(id);


--
-- Name: question_score fk_questionscore_question; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_score
    ADD CONSTRAINT fk_questionscore_question FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: question_score fk_questionscore_stepscore; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_score
    ADD CONSTRAINT fk_questionscore_stepscore FOREIGN KEY (step_score_id) REFERENCES public.step_score(id);


--
-- Name: question_skill fk_questionskill_question; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_skill
    ADD CONSTRAINT fk_questionskill_question FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: question_skill fk_questionskill_skill; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_skill
    ADD CONSTRAINT fk_questionskill_skill FOREIGN KEY (skill_id) REFERENCES public.skill(id);


--
-- Name: interview_report fk_report_interview; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interview_report
    ADD CONSTRAINT fk_report_interview FOREIGN KEY (interview_id) REFERENCES public.interview(id);


--
-- Name: skill_score fk_skillscore_candidate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_score
    ADD CONSTRAINT fk_skillscore_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidate(id) ON DELETE CASCADE;


--
-- Name: skill_score fk_skillscore_question; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_score
    ADD CONSTRAINT fk_skillscore_question FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: skill_score fk_skillscore_skill; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_score
    ADD CONSTRAINT fk_skillscore_skill FOREIGN KEY (skill_id) REFERENCES public.skill(id);


--
-- Name: step fk_step_interview; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step
    ADD CONSTRAINT fk_step_interview FOREIGN KEY (interview_id) REFERENCES public.interview(id);


--
-- Name: step_score fk_stepscore_report; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step_score
    ADD CONSTRAINT fk_stepscore_report FOREIGN KEY (interview_report_id) REFERENCES public.interview_report(id);


--
-- Name: step_score fk_stepscore_step; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.step_score
    ADD CONSTRAINT fk_stepscore_step FOREIGN KEY (step_id) REFERENCES public.step(id);


--
-- PostgreSQL database dump complete
--

\unrestrict Q3rBMeSo7hbNwtepMUN6lwQa8IRxyyeNZQe9r4l0KbK7izhKyKlF6Lm5jXa1Oo0


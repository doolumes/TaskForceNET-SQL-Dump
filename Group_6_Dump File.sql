--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-07 20:38:07

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
-- TOC entry 223 (class 1259 OID 16694)
-- Name: Authentication; Type: TABLE; Schema: public; Owner: psatt2002
--

CREATE TABLE public."Authentication" (
    "Username" character varying(64)[] NOT NULL,
    "Password" character varying(64)[] NOT NULL,
    "Role" character varying(64)[] NOT NULL,
    "EmployeeID" integer NOT NULL
);


ALTER TABLE public."Authentication" OWNER TO psatt2002;

--
-- TOC entry 220 (class 1259 OID 16503)
-- Name: Checkpoint; Type: TABLE; Schema: public; Owner: dion
--

CREATE TABLE public."Checkpoint" (
    "Name" character varying(128),
    "Description" character varying(1024),
    "StartDate" date,
    "DueDate" date,
    "ProjectID" integer NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."Checkpoint" OWNER TO dion;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "Checkpoint"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON TABLE public."Checkpoint" IS 'checkpoint entity';


--
-- TOC entry 218 (class 1259 OID 16456)
-- Name: Client; Type: TABLE; Schema: public; Owner: mz
--

CREATE TABLE public."Client" (
    "Company Name" character varying(128) NOT NULL,
    "Description" character varying(1024),
    "Email" character varying(256),
    "Phone Number" integer,
    "ID" integer NOT NULL,
    "ProjectID" integer
);


ALTER TABLE public."Client" OWNER TO mz;

--
-- TOC entry 214 (class 1259 OID 16410)
-- Name: Department; Type: TABLE; Schema: public; Owner: psatt2002
--

CREATE TABLE public."Department" (
    "ID" integer NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Number_of_Employees" integer DEFAULT 0,
    "SupervisorID" integer
);


ALTER TABLE public."Department" OWNER TO psatt2002;

--
-- TOC entry 222 (class 1259 OID 16553)
-- Name: Employee; Type: TABLE; Schema: public; Owner: dion
--

CREATE TABLE public."Employee" (
    "ID" integer NOT NULL,
    "PhoneNumber" bigint,
    "Email" character varying(256),
    "Address" character varying(512),
    "Title" character varying(256),
    "Wage" double precision DEFAULT 0,
    "StartDate" date,
    "DepartmentID" integer,
    "SupervisorID" integer,
    "FirstName" character varying(256) NOT NULL,
    "LastName" character varying(256) NOT NULL
);


ALTER TABLE public."Employee" OWNER TO dion;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Employee"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON TABLE public."Employee" IS 'Employee entity';


--
-- TOC entry 215 (class 1259 OID 16418)
-- Name: Expense; Type: TABLE; Schema: public; Owner: psatt2002
--

CREATE TABLE public."Expense" (
    "ExpenseID" integer NOT NULL,
    "Name" character varying(128)[] NOT NULL,
    "Description" character varying(1024),
    "Cost" double precision DEFAULT 0 NOT NULL,
    "ProjectID" integer
);


ALTER TABLE public."Expense" OWNER TO psatt2002;

--
-- TOC entry 217 (class 1259 OID 16435)
-- Name: Outsource; Type: TABLE; Schema: public; Owner: nico
--

CREATE TABLE public."Outsource" (
    "Name" character varying(128) NOT NULL,
    "Oursource ID" integer NOT NULL,
    "Email" character varying(256) NOT NULL,
    "Phone Number" integer,
    "Job" character varying(256) NOT NULL,
    "TaskID" integer
);


ALTER TABLE public."Outsource" OWNER TO nico;

--
-- TOC entry 219 (class 1259 OID 16500)
-- Name: Project; Type: TABLE; Schema: public; Owner: dion
--

CREATE TABLE public."Project" (
    "ID" integer NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Hours" double precision,
    "Cost" double precision,
    "ClientID" integer,
    "Budget" double precision,
    "DepartmentID" integer,
    "ManagerID" integer,
    "Status" character varying(256),
    "Description" character varying(256)
);


ALTER TABLE public."Project" OWNER TO dion;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Project"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON TABLE public."Project" IS 'project entity';


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."ID"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."ID" IS 'project ID';


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."Name"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."Name" IS 'name of project';


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."Hours"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."Hours" IS 'Cumulative hours worked on project';


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."Cost"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."Cost" IS 'total cost of project';


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."ClientID"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."ClientID" IS 'id of the client project is being made for';


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."Budget"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."Budget" IS 'cost limit of the project';


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Project"."DepartmentID"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Project"."DepartmentID" IS 'id department controlling project (or made for)';


--
-- TOC entry 221 (class 1259 OID 16508)
-- Name: Task; Type: TABLE; Schema: public; Owner: dion
--

CREATE TABLE public."Task" (
    "Start" date,
    "Due" date,
    "CheckpointID" integer,
    "Assignee" integer,
    "ID" integer NOT NULL,
    "Name" character varying(128),
    "Status" character varying(128),
    "Description" character varying(2048)
);


ALTER TABLE public."Task" OWNER TO dion;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "Task"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON TABLE public."Task" IS 'project tasks';


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN "Task"."Start"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Task"."Start" IS 'start date';


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN "Task"."Due"; Type: COMMENT; Schema: public; Owner: dion
--

COMMENT ON COLUMN public."Task"."Due" IS 'Due date ';


--
-- TOC entry 216 (class 1259 OID 16430)
-- Name: Timesheet Entry; Type: TABLE; Schema: public; Owner: nico
--

CREATE TABLE public."Timesheet Entry" (
    "Date" date NOT NULL,
    "Hours Worked" double precision NOT NULL,
    "Entry ID" integer NOT NULL,
    "Project ID" integer NOT NULL,
    "Worker ID" integer NOT NULL
);


ALTER TABLE public."Timesheet Entry" OWNER TO nico;

--
-- TOC entry 3398 (class 0 OID 16694)
-- Dependencies: 223
-- Data for Name: Authentication; Type: TABLE DATA; Schema: public; Owner: psatt2002
--

COPY public."Authentication" ("Username", "Password", "Role", "EmployeeID") FROM stdin;
\.


--
-- TOC entry 3395 (class 0 OID 16503)
-- Dependencies: 220
-- Data for Name: Checkpoint; Type: TABLE DATA; Schema: public; Owner: dion
--

COPY public."Checkpoint" ("Name", "Description", "StartDate", "DueDate", "ProjectID", "ID") FROM stdin;
\.


--
-- TOC entry 3393 (class 0 OID 16456)
-- Dependencies: 218
-- Data for Name: Client; Type: TABLE DATA; Schema: public; Owner: mz
--

COPY public."Client" ("Company Name", "Description", "Email", "Phone Number", "ID", "ProjectID") FROM stdin;
\.


--
-- TOC entry 3389 (class 0 OID 16410)
-- Dependencies: 214
-- Data for Name: Department; Type: TABLE DATA; Schema: public; Owner: psatt2002
--

COPY public."Department" ("ID", "Name", "Number_of_Employees", "SupervisorID") FROM stdin;
5	Research	0	\N
1	Headquarters	0	\N
4	Administration	0	\N
\.


--
-- TOC entry 3397 (class 0 OID 16553)
-- Dependencies: 222
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: dion
--

COPY public."Employee" ("ID", "PhoneNumber", "Email", "Address", "Title", "Wage", "StartDate", "DepartmentID", "SupervisorID", "FirstName", "LastName") FROM stdin;
1234566789	\N	\N	731 Fodren, Houston, TX	\N	15	\N	5	\N	John	Smith
333445555	\N	\N	638 Voss, Houston, TX	\N	20	\N	5	\N	Franklin	Wong
999887777	\N	\N	3321 Castle, Spring, TX	\N	13	\N	4	\N	Alicia	Zelaya
987654321	\N	\N	291 Berry Bellaire, TX	\N	22	\N	4	\N	Jennifer	Wallce
666884444	\N	\N	975 Fire Oak, Humble, TX	\N	19	\N	5	\N	Ramesh	Narayan
453453453	\N	\N	5631 Rice, Houston, TX	\N	13	\N	5	\N	Joyce	English
987987987	\N	\N	980 Dallas, Houston, TX	\N	13	\N	4	\N	Ahmad	Jabbar
888665555	\N	\N	450 Stone, Houston, TX	\N	28	\N	1	\N	James	Borg
\.


--
-- TOC entry 3390 (class 0 OID 16418)
-- Dependencies: 215
-- Data for Name: Expense; Type: TABLE DATA; Schema: public; Owner: psatt2002
--

COPY public."Expense" ("ExpenseID", "Name", "Description", "Cost", "ProjectID") FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 16435)
-- Dependencies: 217
-- Data for Name: Outsource; Type: TABLE DATA; Schema: public; Owner: nico
--

COPY public."Outsource" ("Name", "Oursource ID", "Email", "Phone Number", "Job", "TaskID") FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 16500)
-- Dependencies: 219
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: dion
--

COPY public."Project" ("ID", "Name", "Hours", "Cost", "ClientID", "Budget", "DepartmentID", "ManagerID", "Status", "Description") FROM stdin;
1	ProductX	\N	\N	\N	\N	5	\N	\N	\N
2	ProductY	\N	\N	\N	\N	5	\N	\N	\N
3	ProductZ	\N	\N	\N	\N	5	\N	\N	\N
10	Computerization	\N	\N	\N	\N	4	\N	\N	\N
20	Reorganization	\N	\N	\N	\N	1	\N	\N	\N
30	Newbenefits	\N	\N	\N	\N	4	\N	\N	\N
\.


--
-- TOC entry 3396 (class 0 OID 16508)
-- Dependencies: 221
-- Data for Name: Task; Type: TABLE DATA; Schema: public; Owner: dion
--

COPY public."Task" ("Start", "Due", "CheckpointID", "Assignee", "ID", "Name", "Status", "Description") FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 16430)
-- Dependencies: 216
-- Data for Name: Timesheet Entry; Type: TABLE DATA; Schema: public; Owner: nico
--

COPY public."Timesheet Entry" ("Date", "Hours Worked", "Entry ID", "Project ID", "Worker ID") FROM stdin;
\.


--
-- TOC entry 3230 (class 2606 OID 16727)
-- Name: Authentication Authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Authentication"
    ADD CONSTRAINT "Authentication_pkey" PRIMARY KEY ("Username");


--
-- TOC entry 3224 (class 2606 OID 16603)
-- Name: Checkpoint Checkpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Checkpoint"
    ADD CONSTRAINT "Checkpoint_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3220 (class 2606 OID 16531)
-- Name: Client Client ID; Type: CONSTRAINT; Schema: public; Owner: mz
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client ID" PRIMARY KEY ("ID");


--
-- TOC entry 3212 (class 2606 OID 16417)
-- Name: Department Department_pkey; Type: CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3228 (class 2606 OID 16557)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3214 (class 2606 OID 16424)
-- Name: Expense Expense_pkey; Type: CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Expense"
    ADD CONSTRAINT "Expense_pkey" PRIMARY KEY ("ExpenseID");


--
-- TOC entry 3218 (class 2606 OID 16439)
-- Name: Outsource Outsource_pkey; Type: CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public."Outsource"
    ADD CONSTRAINT "Outsource_pkey" PRIMARY KEY ("Oursource ID");


--
-- TOC entry 3222 (class 2606 OID 16514)
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3226 (class 2606 OID 16625)
-- Name: Task Task_pkey; Type: CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3216 (class 2606 OID 16434)
-- Name: Timesheet Entry Timesheet Entry_pkey; Type: CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public."Timesheet Entry"
    ADD CONSTRAINT "Timesheet Entry_pkey" PRIMARY KEY ("Entry ID");


--
-- TOC entry 3241 (class 2606 OID 16597)
-- Name: Checkpoint Checkpoint_ProjectID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Checkpoint"
    ADD CONSTRAINT "Checkpoint_ProjectID_fkey" FOREIGN KEY ("ProjectID") REFERENCES public."Project"("ID");


--
-- TOC entry 3238 (class 2606 OID 16532)
-- Name: Project ClientID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "ClientID_fkey" FOREIGN KEY ("ClientID") REFERENCES public."Client"("ID") NOT VALID;


--
-- TOC entry 3236 (class 2606 OID 16619)
-- Name: Client Client_ProjectID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mz
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_ProjectID_fkey" FOREIGN KEY ("ProjectID") REFERENCES public."Project"("ID");


--
-- TOC entry 3239 (class 2606 OID 16525)
-- Name: Project DepartmentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "DepartmentID_fkey" FOREIGN KEY ("DepartmentID") REFERENCES public."Department"("ID") NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 16701)
-- Name: Authentication EmployeeID; Type: FK CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Authentication"
    ADD CONSTRAINT "EmployeeID" FOREIGN KEY ("EmployeeID") REFERENCES public."Employee"("ID") NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 16565)
-- Name: Employee Employee_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_department_fkey" FOREIGN KEY ("DepartmentID") REFERENCES public."Department"("ID");


--
-- TOC entry 3245 (class 2606 OID 16570)
-- Name: Employee Employee_supervision_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_supervision_fkey" FOREIGN KEY ("SupervisorID") REFERENCES public."Employee"("ID");


--
-- TOC entry 3240 (class 2606 OID 16683)
-- Name: Project ManagerID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "ManagerID_fkey" FOREIGN KEY ("ManagerID") REFERENCES public."Employee"("ID") NOT VALID;


--
-- TOC entry 3235 (class 2606 OID 16626)
-- Name: Outsource Outsource_TaskID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public."Outsource"
    ADD CONSTRAINT "Outsource_TaskID_fkey" FOREIGN KEY ("TaskID") REFERENCES public."Task"("ID");


--
-- TOC entry 3232 (class 2606 OID 16515)
-- Name: Expense ProjectID; Type: FK CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Expense"
    ADD CONSTRAINT "ProjectID" FOREIGN KEY ("ProjectID") REFERENCES public."Project"("ID") NOT VALID;


--
-- TOC entry 3237 (class 2606 OID 16543)
-- Name: Client ProjectID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mz
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "ProjectID_fkey" FOREIGN KEY ("ID") REFERENCES public."Project"("ID") NOT VALID;


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 3237
-- Name: CONSTRAINT "ProjectID_fkey" ON "Client"; Type: COMMENT; Schema: public; Owner: mz
--

COMMENT ON CONSTRAINT "ProjectID_fkey" ON public."Client" IS 'PROJECT FOR CLIENT';


--
-- TOC entry 3231 (class 2606 OID 16578)
-- Name: Department Supervisor; Type: FK CONSTRAINT; Schema: public; Owner: psatt2002
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Supervisor" FOREIGN KEY ("SupervisorID") REFERENCES public."Employee"("ID") NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 16614)
-- Name: Task Task_Assignee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_Assignee_fkey" FOREIGN KEY ("Assignee") REFERENCES public."Employee"("ID");


--
-- TOC entry 3243 (class 2606 OID 16609)
-- Name: Task Task_CheckpointID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dion
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_CheckpointID_fkey" FOREIGN KEY ("CheckpointID") REFERENCES public."Checkpoint"("ID");


--
-- TOC entry 3233 (class 2606 OID 16583)
-- Name: Timesheet Entry Timesheet Entry_Project ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public."Timesheet Entry"
    ADD CONSTRAINT "Timesheet Entry_Project ID_fkey" FOREIGN KEY ("Project ID") REFERENCES public."Project"("ID");


--
-- TOC entry 3234 (class 2606 OID 16588)
-- Name: Timesheet Entry Timesheet Entry_Worker ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public."Timesheet Entry"
    ADD CONSTRAINT "Timesheet Entry_Worker ID_fkey" FOREIGN KEY ("Worker ID") REFERENCES public."Employee"("ID");


-- Completed on 2023-03-07 20:38:10

--
-- PostgreSQL database dump complete
--


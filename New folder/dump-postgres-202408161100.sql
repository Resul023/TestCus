--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-08-16 11:00:35

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16422)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    name character varying(400),
    quizid integer
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16421)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.question ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16416)
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16415)
-- Name: quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quiz ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16433)
-- Name: variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variant (
    id integer NOT NULL,
    name character varying(2000),
    istrue boolean,
    questionid integer
);


ALTER TABLE public.variant OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16432)
-- Name: variant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.variant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3339 (class 0 OID 16422)
-- Dependencies: 217
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.question OVERRIDING SYSTEM VALUE VALUES (1, 'Gömrük bəyannaməsini təqdim edən şəxsə nə ad verilir?', 1);
INSERT INTO public.question OVERRIDING SYSTEM VALUE VALUES (2, 'Malların yoxlanması nə məqsəd daşıyır?', 1);
INSERT INTO public.question OVERRIDING SYSTEM VALUE VALUES (3, 'Gömrük işi nəyi əhatə edir?', 2);
INSERT INTO public.question OVERRIDING SYSTEM VALUE VALUES (4, 'Gömrük tənzimlənməsi nəyi nəzərdə tutur?', 2);


--
-- TOC entry 3337 (class 0 OID 16416)
-- Dependencies: 215
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.quiz OVERRIDING SYSTEM VALUE VALUES (1, 'Bu Məcəllədə istifadə olunan əsas anlayışlar');
INSERT INTO public.quiz OVERRIDING SYSTEM VALUE VALUES (2, 'Gömrük işi və gömrük tənzimlənməsi');
INSERT INTO public.quiz OVERRIDING SYSTEM VALUE VALUES (3, 'Gömrük ərazisi və gömrük sərhədi');
INSERT INTO public.quiz OVERRIDING SYSTEM VALUE VALUES (4, 'Gömrük qanunvericiliyi');
INSERT INTO public.quiz OVERRIDING SYSTEM VALUE VALUES (5, 'Müvafiq icra hakimiyyəti orqanının normativ hüquqi aktları');


--
-- TOC entry 3341 (class 0 OID 16433)
-- Dependencies: 219
-- Data for Name: variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (1, 'Gömrük auditi', false, 1);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (2, 'Bəyannaməçi', true, 1);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (3, 'Daşıyıcı', false, 1);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (10, 'Malların bazar qiymətini müəyyən etmək', false, 2);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (11, 'Malların gömrük bəyannaməsində göstərilən xassə, mənşə, vəziyyət, miqdar və dəyərlə uyğunluğunu müəyyən etmək', true, 2);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (12, 'Malların idxal icazələrini təsdiqləmək', false, 2);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (13, 'Dövlətlərarası ticarət mübahisələrinin həlli üçün arbitraj proseslərinin idarə olunması.', false, 3);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (14, 'İxrac və idxal əməliyyatlarının statistik qeydiyyatı və təhlili.', false, 3);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (15, 'Gömrük sərhədindən keçən mallar və nəqliyyat vasitələri üzərindəki gömrük-tarif tənzimlənməsi tədbirləri, xarici ticarətin iştirakçılarının gömrük qanunvericiliyi ilə müəyyənləşdirilmiş qadağalarına riayət olunmasını təmin edən üsullar toplusu.', true, 3);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (16, 'Gömrük sərhədindən keçən malların avtomatik olaraq yoxlanmasını və rəsmiləşdirilməsini.', false, 4);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (17, 'Malların idxal və ixrac qiymətlərinin beynəlxalq bazar qiymətlərinə uyğunlaşdırılmasını.', false, 4);
INSERT INTO public.variant OVERRIDING SYSTEM VALUE VALUES (18, 'Gömrük sərhədindən malları və nəqliyyat vasitələrini keçirmək hüququndan istifadə edən şəxslərin riayət etməli olduğu norma və qaydaların müəyyən olunmasını.', true, 4);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 216
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 4, true);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 214
-- Name: quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_id_seq', 5, true);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 218
-- Name: variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variant_id_seq', 18, true);


--
-- TOC entry 3189 (class 2606 OID 16426)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 16420)
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 16439)
-- Name: variant variant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16427)
-- Name: question question_quizid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_quizid_fkey FOREIGN KEY (quizid) REFERENCES public.quiz(id);


--
-- TOC entry 3193 (class 2606 OID 16440)
-- Name: variant variant_questionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_questionid_fkey FOREIGN KEY (questionid) REFERENCES public.question(id);


-- Completed on 2024-08-16 11:00:36

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

-- Started on 2021-07-26 16:10:25

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
-- TOC entry 203 (class 1259 OID 16409)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16407)
-- Name: authors_authorId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."authors_authorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."authors_authorId_seq" OWNER TO postgres;

--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 202
-- Name: authors_authorId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."authors_authorId_seq" OWNED BY public.authors.author_id;


--
-- TOC entry 205 (class 1259 OID 16417)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title text NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16415)
-- Name: books_bookId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."books_bookId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."books_bookId_seq" OWNER TO postgres;

--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 204
-- Name: books_bookId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."books_bookId_seq" OWNED BY public.books.book_id;


--
-- TOC entry 207 (class 1259 OID 16454)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    file_id integer NOT NULL,
    file_path character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL,
    row_in_file smallint
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16452)
-- Name: files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_file_id_seq OWNER TO postgres;

--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 206
-- Name: files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_file_id_seq OWNED BY public.files.file_id;


--
-- TOC entry 2701 (class 2604 OID 16412)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public."authors_authorId_seq"'::regclass);


--
-- TOC entry 2702 (class 2604 OID 16420)
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public."books_bookId_seq"'::regclass);


--
-- TOC entry 2703 (class 2604 OID 16457)
-- Name: files file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- TOC entry 2841 (class 0 OID 16409)
-- Dependencies: 203
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, name) FROM stdin;
2955	Isak Azimov
2956	Edgar Allan Poe
2957	
2959	Jules Verne
2960	H. P. Lovecraft
2961	William Shakespeare
2967	ㅁ ㅂ ㅅ ㅇ ㅈ ㅊ ㅋ ㅌ ㅍ ㅎ
2968	ルビ ンツア ウェブア ふべからず セシビリテ
2969	Димитър Талев
\.


--
-- TOC entry 2843 (class 0 OID 16417)
-- Dependencies: 205
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, title, author_id) FROM stdin;
2927	Asimov's Guide to Shakespeare	2955
2928	The Raven	2956
2929	Annabel Lee	2957
2930	The Masque of the Red Death	2956
2931	Journey to the Center of the Earth	2959
2932		2960
2933	A Midsummer Night's Dream	2961
2934	The Black Cat	2956
2935	End of spirit	2955
2936	The Call of Cthulhu	2960
2937	The Fall of the House of Usher	2956
2938	The Tempest	2961
2939	ㅏ ㅑ ㅓ ㅕ ㅗ ㅛ ㅜ ㅠ ㅡ ㅣ	2967
2940	びそのマ を始めてみよう サイト作成のヒ	2968
2941	Железният светилник	2969
\.


--
-- TOC entry 2845 (class 0 OID 16454)
-- Dependencies: 207
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (file_id, file_path, file_name, book_id, author_id, row_in_file) FROM stdin;
2331	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2332	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2333	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2334	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2335	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2336	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2337	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2338	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2339	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2340	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2341	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2342	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2343	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2344	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2345	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2346	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2347	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2348	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2349	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2350	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2351	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2352	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2353	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2354	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2355	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2356	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2357	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2358	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2359	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2360	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2361	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2362	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2363	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2364	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2365	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2366	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2367	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2368	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2369	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2370	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2371	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2372	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2373	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2374	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2375	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2376	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2377	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2378	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2379	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2380	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2381	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2382	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2383	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2384	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2385	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2386	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2387	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2388	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2389	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2390	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2391	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2392	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2393	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2394	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2395	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2396	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2397	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2398	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2399	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2400	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2401	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2402	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2403	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2404	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2405	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2406	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2407	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2408	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2409	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2410	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2411	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2412	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2413	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2414	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2415	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2416	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2417	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2418	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2419	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2420	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2421	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2422	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2423	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2424	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2425	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2426	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2427	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2428	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2429	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2430	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2431	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2432	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2433	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2434	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2435	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2436	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2437	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2438	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2439	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2440	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2441	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2442	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2443	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2444	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2445	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2446	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2447	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2448	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2449	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2450	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2451	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2452	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2453	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2454	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2455	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2456	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2457	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2458	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2459	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2460	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2461	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2462	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2463	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2464	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2465	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2466	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2467	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2468	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2469	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2470	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2471	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2472	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2473	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2474	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2475	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2476	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2477	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2478	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2479	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2480	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2481	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2482	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2483	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2484	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2485	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2486	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2487	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2488	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2489	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2490	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2491	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2492	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2493	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2494	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2495	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2496	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2497	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2498	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2499	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2500	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2501	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2502	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2503	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2504	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2505	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2506	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2507	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2508	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2509	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2510	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2511	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2512	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2513	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2514	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2515	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2516	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2517	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2518	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2519	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2520	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2521	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2522	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2523	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2524	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2525	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2526	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2527	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2528	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2529	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2530	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2531	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2532	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2533	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2534	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2535	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2536	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2537	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2538	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2539	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2540	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2541	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2542	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2543	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2544	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2545	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2546	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2547	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2548	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2549	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2550	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2551	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2552	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2553	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2554	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2555	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2556	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2557	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2558	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2559	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2560	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2561	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2562	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2563	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2564	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2565	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2566	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2567	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2568	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2569	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2570	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2571	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2572	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2573	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2574	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2575	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2576	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2577	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2578	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2579	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2580	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2581	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2582	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2583	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2584	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2585	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2586	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2587	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2588	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2589	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2590	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2591	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2592	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2593	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2594	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2595	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2596	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2597	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2598	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2599	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2600	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2601	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2602	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2603	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2604	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2605	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2606	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2607	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2608	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2609	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2610	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2611	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2612	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2613	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2614	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2615	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2616	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2617	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2618	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2619	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2620	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2621	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2622	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2623	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2624	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2625	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2626	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2627	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2628	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2629	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2630	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2631	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2632	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2633	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2634	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2635	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2636	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2637	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2638	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2639	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2640	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2641	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2642	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2643	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2644	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2645	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2646	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2647	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2648	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2649	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2650	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2651	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2652	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2653	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2654	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2655	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2656	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2657	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2658	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2659	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2660	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2661	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2662	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2663	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2664	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2665	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2666	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2667	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2668	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2669	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2670	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2671	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2672	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2673	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2674	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2675	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2676	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2677	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2678	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2679	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2680	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2681	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2682	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2683	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2684	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2685	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2686	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2687	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2688	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2689	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2690	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2691	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2692	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2693	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2694	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2695	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2696	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2697	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2698	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2699	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2700	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2701	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2702	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2703	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2704	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2705	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2706	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2707	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2708	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2709	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2710	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2711	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2712	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2713	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2714	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2715	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2716	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2717	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2718	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2719	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2720	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2721	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2722	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2723	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2724	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2725	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2726	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2727	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2728	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2729	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2730	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2731	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2732	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2733	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2734	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2735	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2736	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2737	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2738	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2739	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2740	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2741	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2742	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2743	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2744	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2745	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2746	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2747	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2748	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2749	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2750	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2751	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2752	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2753	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2754	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2755	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2756	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2757	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2758	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2759	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2760	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2761	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2762	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2763	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2764	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2765	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2766	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2767	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2768	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2769	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2770	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2771	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2772	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2773	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2774	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2775	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2776	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2777	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2778	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2779	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2780	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2781	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2782	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2783	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2784	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2785	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2786	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2787	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2788	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2789	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2790	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2791	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2792	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2793	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2794	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2795	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2796	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2797	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2798	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2799	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2800	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2801	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2802	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2803	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2804	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2805	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2806	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2807	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2808	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2809	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2810	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2811	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2812	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2813	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2814	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2815	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2816	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2817	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2818	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2819	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2820	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2821	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2822	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2823	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2824	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2825	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2826	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2827	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2828	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2829	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2830	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2831	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2832	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2833	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2834	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2835	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2836	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2837	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2838	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2839	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2840	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2841	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2842	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2843	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2844	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2845	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2846	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2847	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2848	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2849	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2850	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2851	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2852	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2853	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2854	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2855	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2856	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2857	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2858	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2859	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2860	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2861	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2862	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2863	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2864	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2865	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2866	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2867	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2868	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2869	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2870	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2871	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2872	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2873	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2874	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2875	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2876	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2877	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2878	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2879	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2880	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2881	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2882	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2883	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2884	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2885	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
2886	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2927	2955	1
2887	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2928	2956	2
2888	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\dir 2	test2.xml	2929	2957	3
2889	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2930	2956	1
2890	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2931	2959	2
2891	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1\\random dir 3	test3.xml	2932	2960	3
2892	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2933	2961	1
2893	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir\\random-dir-1	test1.xml	2934	2956	2
2894	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2935	2955	1
2895	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2936	2960	2
2896	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2937	2956	3
2897	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2938	2961	4
2898	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2939	2967	5
2899	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2940	2968	6
2900	C:\\wamp64\\www\\TaskPHPTransfermate\\xml_root_dir	test.xml	2941	2969	7
\.


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 202
-- Name: authors_authorId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."authors_authorId_seq"', 3524, true);


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 204
-- Name: books_bookId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."books_bookId_seq"', 3496, true);


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 206
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_file_id_seq', 2900, true);


--
-- TOC entry 2705 (class 2606 OID 16414)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 2709 (class 2606 OID 16425)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 2713 (class 2606 OID 16462)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- TOC entry 2707 (class 2606 OID 16433)
-- Name: authors name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT name UNIQUE (name);


--
-- TOC entry 2711 (class 2606 OID 16431)
-- Name: books title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT title UNIQUE (title);


-- Completed on 2021-07-26 16:10:25

--
-- PostgreSQL database dump complete
--


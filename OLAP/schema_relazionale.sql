--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-08 18:42:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16520)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 16549)
-- Name: Anno accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Anno accademico" (
    k_aa integer NOT NULL,
    nome_anno_2 text,
    nome_anno_1 text
);


ALTER TABLE "Anno accademico" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16547)
-- Name: Anno accademico_k_aa_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "Anno accademico_k_aa_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Anno accademico_k_aa_seq" OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 199
-- Name: Anno accademico_k_aa_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "Anno accademico_k_aa_seq" OWNED BY "Anno accademico".k_aa;


--
-- TOC entry 205 (class 1259 OID 16666)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso" (
    numero_crediti numeric,
    nome text,
    ssd text,
    codice_corso text,
    k_corso integer NOT NULL
);


ALTER TABLE "Corso" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16575)
-- Name: Corso di studi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso di studi" (
    k_cds integer NOT NULL,
    data_inizio text,
    data_fine text,
    numero_programmato numeric,
    is_programmato text,
    durata_legale numeric,
    codice_ateneo text,
    nome_dipartimento text,
    nome_cds text,
    tipo_cds text,
    codice_dipartimento numeric
);


ALTER TABLE "Corso di studi" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16573)
-- Name: Corso di studi_k_cds_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "Corso di studi_k_cds_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Corso di studi_k_cds_seq" OWNER TO postgres;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 201
-- Name: Corso di studi_k_cds_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "Corso di studi_k_cds_seq" OWNED BY "Corso di studi".k_cds;


--
-- TOC entry 204 (class 1259 OID 16664)
-- Name: Corso_k_corso_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "Corso_k_corso_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Corso_k_corso_seq" OWNER TO postgres;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 204
-- Name: Corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "Corso_k_corso_seq" OWNED BY "Corso".k_corso;


--
-- TOC entry 209 (class 1259 OID 16780)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tempo" (
    k_data integer NOT NULL,
    giorno numeric,
    mese numeric,
    anno numeric
);


ALTER TABLE "Tempo" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16778)
-- Name: Data_k_data_seq1; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "Data_k_data_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Data_k_data_seq1" OWNER TO postgres;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 208
-- Name: Data_k_data_seq1; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "Data_k_data_seq1" OWNED BY "Tempo".k_data;


--
-- TOC entry 206 (class 1259 OID 16687)
-- Name: Esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Esami" (
    voto numeric,
    cfu_acquisiti numeric,
    k_corso integer NOT NULL,
    k_studente integer NOT NULL,
    k_cds integer NOT NULL,
    k_data integer NOT NULL,
    k_aa integer NOT NULL
);


ALTER TABLE "Esami" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16584)
-- Name: Ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Ingressi" (
    punteggio_test numeric,
    immatricolato text,
    k_aa integer NOT NULL,
    k_cds integer NOT NULL,
    k_studente integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    k_data_iscrizione integer NOT NULL
);


ALTER TABLE "Ingressi" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16725)
-- Name: Lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Lauree" (
    voto_laurea numeric,
    k_studente integer NOT NULL,
    k_cds integer NOT NULL,
    k_aa integer NOT NULL,
    k_data integer NOT NULL
);


ALTER TABLE "Lauree" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16521)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Studente" (
    nome text,
    cognome text,
    matricola numeric,
    data_di_nascita text,
    cf text,
    tipo_maturita text,
    coorte text,
    provincia text,
    regione text,
    nazione text,
    k_studente integer NOT NULL,
    voto_maturita text
);


ALTER TABLE "Studente" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16527)
-- Name: Studente_k_studente_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "Studente_k_studente_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Studente_k_studente_seq" OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 196
-- Name: Studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "Studente_k_studente_seq" OWNED BY "Studente".k_studente;


--
-- TOC entry 198 (class 1259 OID 16540)
-- Name: Tipo immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tipo immatricolazione" (
    k_tipo_immatricolazione integer NOT NULL,
    codice text
);


ALTER TABLE "Tipo immatricolazione" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16538)
-- Name: tipo immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "tipo immatricolazione_k_tipo_immatricolazione_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tipo immatricolazione_k_tipo_immatricolazione_seq" OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 197
-- Name: tipo immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "tipo immatricolazione_k_tipo_immatricolazione_seq" OWNED BY "Tipo immatricolazione".k_tipo_immatricolazione;


--
-- TOC entry 2114 (class 2604 OID 16552)
-- Name: k_aa; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Anno accademico" ALTER COLUMN k_aa SET DEFAULT nextval('"Anno accademico_k_aa_seq"'::regclass);


--
-- TOC entry 2116 (class 2604 OID 16669)
-- Name: k_corso; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso" ALTER COLUMN k_corso SET DEFAULT nextval('"Corso_k_corso_seq"'::regclass);


--
-- TOC entry 2115 (class 2604 OID 16578)
-- Name: k_cds; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso di studi" ALTER COLUMN k_cds SET DEFAULT nextval('"Corso di studi_k_cds_seq"'::regclass);


--
-- TOC entry 2112 (class 2604 OID 16529)
-- Name: k_studente; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente" ALTER COLUMN k_studente SET DEFAULT nextval('"Studente_k_studente_seq"'::regclass);


--
-- TOC entry 2117 (class 2604 OID 16783)
-- Name: k_data; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo" ALTER COLUMN k_data SET DEFAULT nextval('"Data_k_data_seq1"'::regclass);


--
-- TOC entry 2113 (class 2604 OID 16543)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tipo immatricolazione" ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('"tipo immatricolazione_k_tipo_immatricolazione_seq"'::regclass);


--
-- TOC entry 2123 (class 2606 OID 16613)
-- Name: Anno accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Anno accademico"
    ADD CONSTRAINT "Anno accademico_pkey" PRIMARY KEY (k_aa);


--
-- TOC entry 2125 (class 2606 OID 16583)
-- Name: Corso di studi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso di studi"
    ADD CONSTRAINT "Corso di studi_pkey" PRIMARY KEY (k_cds);


--
-- TOC entry 2129 (class 2606 OID 16674)
-- Name: Corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY (k_corso);


--
-- TOC entry 2135 (class 2606 OID 16788)
-- Name: Data_pkey1; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT "Data_pkey1" PRIMARY KEY (k_data);


--
-- TOC entry 2131 (class 2606 OID 16805)
-- Name: Esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_pkey" PRIMARY KEY (k_corso, k_studente, k_cds, k_data, k_aa);


--
-- TOC entry 2127 (class 2606 OID 16620)
-- Name: Ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_pkey" PRIMARY KEY (k_aa, k_cds, k_studente, k_tipo_immatricolazione, k_data_iscrizione);


--
-- TOC entry 2133 (class 2606 OID 16807)
-- Name: Lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_pkey" PRIMARY KEY (k_studente, k_cds, k_aa, k_data);


--
-- TOC entry 2119 (class 2606 OID 16537)
-- Name: Studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT "Studente_pkey" PRIMARY KEY (k_studente);


--
-- TOC entry 2121 (class 2606 OID 16546)
-- Name: tipo immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tipo immatricolazione"
    ADD CONSTRAINT "tipo immatricolazione_pkey" PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2141 (class 2606 OID 16695)
-- Name: Esami_k_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_k_aa_fkey" FOREIGN KEY (k_aa) REFERENCES "Anno accademico"(k_aa);


--
-- TOC entry 2143 (class 2606 OID 16710)
-- Name: Esami_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_k_cds_fkey" FOREIGN KEY (k_cds) REFERENCES "Corso di studi"(k_cds);


--
-- TOC entry 2142 (class 2606 OID 16700)
-- Name: Esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_k_corso_fkey" FOREIGN KEY (k_corso) REFERENCES "Corso"(k_corso);


--
-- TOC entry 2145 (class 2606 OID 16789)
-- Name: Esami_k_data_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_k_data_fkey" FOREIGN KEY (k_data) REFERENCES "Tempo"(k_data);


--
-- TOC entry 2144 (class 2606 OID 16720)
-- Name: Esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_k_studente_fkey" FOREIGN KEY (k_studente) REFERENCES "Studente"(k_studente);


--
-- TOC entry 2139 (class 2606 OID 16614)
-- Name: Ingressi_k_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_k_aa_fkey" FOREIGN KEY (k_aa) REFERENCES "Anno accademico"(k_aa);


--
-- TOC entry 2136 (class 2606 OID 16592)
-- Name: Ingressi_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_k_cds_fkey" FOREIGN KEY (k_cds) REFERENCES "Corso di studi"(k_cds);


--
-- TOC entry 2140 (class 2606 OID 16794)
-- Name: Ingressi_k_data_iscrizione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_k_data_iscrizione_fkey" FOREIGN KEY (k_data_iscrizione) REFERENCES "Tempo"(k_data);


--
-- TOC entry 2137 (class 2606 OID 16602)
-- Name: Ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_k_studente_fkey" FOREIGN KEY (k_studente) REFERENCES "Studente"(k_studente);


--
-- TOC entry 2138 (class 2606 OID 16607)
-- Name: Ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_k_tipo_immatricolazione_fkey" FOREIGN KEY (k_tipo_immatricolazione) REFERENCES "Tipo immatricolazione"(k_tipo_immatricolazione);


--
-- TOC entry 2146 (class 2606 OID 16733)
-- Name: Lauree_k_aa_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_k_aa_fkey" FOREIGN KEY (k_aa) REFERENCES "Anno accademico"(k_aa);


--
-- TOC entry 2147 (class 2606 OID 16738)
-- Name: Lauree_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_k_cds_fkey" FOREIGN KEY (k_cds) REFERENCES "Corso di studi"(k_cds);


--
-- TOC entry 2149 (class 2606 OID 16799)
-- Name: Lauree_k_data_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_k_data_fkey" FOREIGN KEY (k_data) REFERENCES "Tempo"(k_data);


--
-- TOC entry 2148 (class 2606 OID 16753)
-- Name: Lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_k_studente_fkey" FOREIGN KEY (k_studente) REFERENCES "Studente"(k_studente);


-- Completed on 2016-04-08 18:42:00

--
-- PostgreSQL database dump complete
--


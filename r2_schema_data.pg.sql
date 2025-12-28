--
-- PostgreSQL database dump
--

\restrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp

-- Dumped from database version 15.15 (Debian 15.15-1.pgdg13+1)
-- Dumped by pg_dump version 15.15 (Debian 15.15-1.pgdg13+1)

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
-- Name: r2_dillfrog; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE r2_dillfrog WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE r2_dillfrog OWNER TO postgres;

\unrestrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp
\connect r2_dillfrog
\restrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp

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
-- Name: r2_dillfrog; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE r2_dillfrog SET search_path TO 'public', 'r2_dillfrog';


\unrestrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp
\connect r2_dillfrog
\restrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp

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
-- Name: r2_dillfrog; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA r2_dillfrog;


ALTER SCHEMA r2_dillfrog OWNER TO postgres;

--
-- Name: event_log_entry_type; Type: TYPE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TYPE r2_dillfrog.event_log_entry_type AS ENUM (
    'New Character',
    'Sell Item',
    'PKill',
    'Suspicious',
    'Monolith Capture',
    'First Kill',
    'Become General',
    'Become Soldier',
    'Complete Quest',
    'Make Alliance',
    'Manage Alliance',
    'Complete Course',
    'Change PVP Level Restirction',
    'Give Item',
    'Give Cryl',
    'Daily Win',
    'Idea',
    'Bug'
);


ALTER TYPE r2_dillfrog.event_log_entry_type OWNER TO postgres;

--
-- Name: on_ask_responses_response_type; Type: TYPE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TYPE r2_dillfrog.on_ask_responses_response_type AS ENUM (
    'Say',
    'Echo',
    'Command'
);


ALTER TYPE r2_dillfrog.on_ask_responses_response_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.accounts (
    id_member bigint NOT NULL,
    member_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    passwd character varying(255) DEFAULT ''::character varying NOT NULL,
    active character varying(255) NOT NULL,
    userid_formatted character varying(255) NOT NULL,
    prefer_censor character varying(255) NOT NULL,
    gender character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_dillfrog.accounts OWNER TO postgres;

--
-- Name: accounts_id_member_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.accounts_id_member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.accounts_id_member_seq OWNER TO postgres;

--
-- Name: accounts_id_member_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.accounts_id_member_seq OWNED BY r2_dillfrog.accounts.id_member;


--
-- Name: altwatch; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.altwatch (
    ip character varying(15) DEFAULT ''::character varying NOT NULL,
    namea character varying(20) DEFAULT ''::character varying NOT NULL,
    nameb character varying(20) DEFAULT ''::character varying NOT NULL,
    ldate timestamp with time zone
);


ALTER TABLE r2_dillfrog.altwatch OWNER TO postgres;

--
-- Name: auction_bids; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.auction_bids (
    bid_id bigint NOT NULL,
    auction_id bigint DEFAULT '0'::bigint NOT NULL,
    bidder_uin bigint DEFAULT '0'::bigint NOT NULL,
    max_bid bigint DEFAULT '0'::bigint NOT NULL,
    bid_date timestamp with time zone
);


ALTER TABLE r2_dillfrog.auction_bids OWNER TO postgres;

--
-- Name: auction_bids_bid_id_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.auction_bids_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.auction_bids_bid_id_seq OWNER TO postgres;

--
-- Name: auction_bids_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.auction_bids_bid_id_seq OWNED BY r2_dillfrog.auction_bids.bid_id;


--
-- Name: auctions; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.auctions (
    auction_id bigint NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    min_price bigint DEFAULT '0'::bigint NOT NULL,
    bid_increment bigint DEFAULT '0'::bigint NOT NULL,
    seller_uin bigint DEFAULT '0'::bigint NOT NULL,
    item_name character varying(128) DEFAULT ''::character varying NOT NULL,
    item_desc character varying(255) DEFAULT ''::character varying NOT NULL,
    item_data bytea NOT NULL,
    high_bid_uin bigint,
    high_bid bigint,
    claimed_item character(1) DEFAULT 'N'::bpchar,
    returned_cryl character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE r2_dillfrog.auctions OWNER TO postgres;

--
-- Name: auctions_auction_id_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.auctions_auction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.auctions_auction_id_seq OWNER TO postgres;

--
-- Name: auctions_auction_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.auctions_auction_id_seq OWNED BY r2_dillfrog.auctions.auction_id;


--
-- Name: bad_passwords; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.bad_passwords (
    ipc character varying(11) DEFAULT ''::character varying NOT NULL,
    pdate date NOT NULL
);


ALTER TABLE r2_dillfrog.bad_passwords OWNER TO postgres;

--
-- Name: daily_scores; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.daily_scores (
    score_id bigint NOT NULL,
    score_date date NOT NULL,
    uin bigint DEFAULT '0'::bigint NOT NULL,
    max_hp bigint,
    max_mana bigint,
    dp double precision DEFAULT '0'::double precision NOT NULL,
    exp_gained bigint DEFAULT '0'::bigint NOT NULL,
    level bigint DEFAULT '0'::bigint NOT NULL,
    min_online bigint DEFAULT '0'::bigint NOT NULL,
    pvpdeaths bigint DEFAULT '0'::bigint NOT NULL,
    pvpkills bigint DEFAULT '0'::bigint NOT NULL,
    race bigint DEFAULT '0'::bigint NOT NULL,
    repu bigint DEFAULT '0'::bigint NOT NULL,
    turns_max bigint DEFAULT '0'::bigint NOT NULL,
    turns_used bigint DEFAULT '0'::bigint NOT NULL,
    worth bigint DEFAULT '0'::bigint NOT NULL,
    kno bigint DEFAULT '0'::bigint NOT NULL,
    maj bigint DEFAULT '0'::bigint NOT NULL,
    cha bigint DEFAULT '0'::bigint NOT NULL,
    agi bigint DEFAULT '0'::bigint NOT NULL,
    str bigint DEFAULT '0'::bigint NOT NULL,
    def bigint DEFAULT '0'::bigint NOT NULL,
    kmec bigint DEFAULT '0'::bigint NOT NULL,
    ksoc bigint DEFAULT '0'::bigint NOT NULL,
    kmed bigint DEFAULT '0'::bigint NOT NULL,
    kcom bigint DEFAULT '0'::bigint NOT NULL,
    moff bigint DEFAULT '0'::bigint NOT NULL,
    mdef bigint DEFAULT '0'::bigint NOT NULL,
    mele bigint DEFAULT '0'::bigint NOT NULL,
    mmen bigint DEFAULT '0'::bigint NOT NULL,
    dphy bigint DEFAULT '0'::bigint NOT NULL,
    dene bigint DEFAULT '0'::bigint NOT NULL,
    dmen bigint DEFAULT '0'::bigint NOT NULL,
    capp bigint DEFAULT '0'::bigint NOT NULL,
    catt bigint DEFAULT '0'::bigint NOT NULL,
    aupp bigint DEFAULT '0'::bigint NOT NULL,
    alow bigint DEFAULT '0'::bigint NOT NULL,
    supp bigint DEFAULT '0'::bigint NOT NULL,
    slow bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE r2_dillfrog.daily_scores OWNER TO postgres;

--
-- Name: daily_scores_score_id_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.daily_scores_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.daily_scores_score_id_seq OWNER TO postgres;

--
-- Name: daily_scores_score_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.daily_scores_score_id_seq OWNED BY r2_dillfrog.daily_scores.score_id;


--
-- Name: event_log; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.event_log (
    entry_id bigint NOT NULL,
    entry_type r2_dillfrog.event_log_entry_type DEFAULT 'New Character'::r2_dillfrog.event_log_entry_type NOT NULL,
    entry_desc character varying(255) DEFAULT ''::character varying NOT NULL,
    uin_by bigint,
    arg_a bigint,
    arg_b bigint,
    arg_c bigint,
    entry_date timestamp with time zone
);


ALTER TABLE r2_dillfrog.event_log OWNER TO postgres;

--
-- Name: event_log_entry_id_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.event_log_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.event_log_entry_id_seq OWNER TO postgres;

--
-- Name: event_log_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.event_log_entry_id_seq OWNED BY r2_dillfrog.event_log.entry_id;


--
-- Name: game_server_settings; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.game_server_settings (
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying
);


ALTER TABLE r2_dillfrog.game_server_settings OWNER TO postgres;

--
-- Name: item_names_by_rec; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.item_names_by_rec (
    item_id bigint DEFAULT '0'::bigint NOT NULL,
    item_name character varying(255) DEFAULT ''::character varying NOT NULL,
    item_desc text
);


ALTER TABLE r2_dillfrog.item_names_by_rec OWNER TO postgres;

--
-- Name: lottery; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.lottery (
    name character varying(20) DEFAULT ''::character varying NOT NULL,
    edate date NOT NULL,
    won character varying(20) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_dillfrog.lottery OWNER TO postgres;

--
-- Name: mailing_list; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.mailing_list (
    email character varying(80) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_dillfrog.mailing_list OWNER TO postgres;

--
-- Name: members; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.members (
    id_member bigint NOT NULL,
    member_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    passwd character varying(255) DEFAULT ''::character varying NOT NULL,
    active character varying(255) NOT NULL,
    userid_formatted character varying(255) NOT NULL,
    prefer_censor character varying(255) NOT NULL,
    gender character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_dillfrog.members OWNER TO postgres;

--
-- Name: members_id_member_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.members_id_member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.members_id_member_seq OWNER TO postgres;

--
-- Name: members_id_member_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.members_id_member_seq OWNED BY r2_dillfrog.members.id_member;


--
-- Name: messages; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.messages (
    body character varying(255) NOT NULL,
    id_topic bigint NOT NULL,
    subject character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_dillfrog.messages OWNER TO postgres;

--
-- Name: monolith_capture_status; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.monolith_capture_status (
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    owned_by_race bigint DEFAULT '0'::bigint NOT NULL,
    date_captured timestamp with time zone,
    date_contested timestamp with time zone,
    captured_by_uin bigint
);


ALTER TABLE r2_dillfrog.monolith_capture_status OWNER TO postgres;

--
-- Name: on_ask_responses; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.on_ask_responses (
    trigger_id bigint NOT NULL,
    item_id bigint DEFAULT '0'::bigint NOT NULL,
    response_match character varying(255) DEFAULT ''::character varying NOT NULL,
    response_type r2_dillfrog.on_ask_responses_response_type DEFAULT 'Say'::r2_dillfrog.on_ask_responses_response_type NOT NULL,
    response_text text NOT NULL,
    match_order bigint DEFAULT '0'::bigint NOT NULL,
    is_visible character(1) DEFAULT 'Y'::bpchar NOT NULL
);


ALTER TABLE r2_dillfrog.on_ask_responses OWNER TO postgres;

--
-- Name: on_ask_responses_trigger_id_seq; Type: SEQUENCE; Schema: r2_dillfrog; Owner: postgres
--

CREATE SEQUENCE r2_dillfrog.on_ask_responses_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_dillfrog.on_ask_responses_trigger_id_seq OWNER TO postgres;

--
-- Name: on_ask_responses_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_dillfrog; Owner: postgres
--

ALTER SEQUENCE r2_dillfrog.on_ask_responses_trigger_id_seq OWNED BY r2_dillfrog.on_ask_responses.trigger_id;


--
-- Name: players; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.players (
    name character varying(20) DEFAULT NULL::character varying,
    lev bigint,
    kno bigint,
    maj bigint,
    cha bigint,
    agi bigint,
    str bigint,
    def bigint,
    worth bigint,
    repu bigint,
    admin character(1) DEFAULT NULL::bpchar,
    email character varying(80) DEFAULT NULL::character varying,
    race bigint,
    pvpkills bigint,
    pvpdeaths bigint,
    dp double precision,
    arena_pts double precision,
    inventory text,
    pw character varying(60) DEFAULT NULL::character varying,
    last_saved timestamp with time zone
);


ALTER TABLE r2_dillfrog.players OWNER TO postgres;

--
-- Name: rock_certs; Type: TABLE; Schema: r2_dillfrog; Owner: postgres
--

CREATE TABLE r2_dillfrog.rock_certs (
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    c_type character(1) DEFAULT ''::bpchar NOT NULL,
    c_val bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE r2_dillfrog.rock_certs OWNER TO postgres;

--
-- Name: accounts id_member; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.accounts ALTER COLUMN id_member SET DEFAULT nextval('r2_dillfrog.accounts_id_member_seq'::regclass);


--
-- Name: auction_bids bid_id; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.auction_bids ALTER COLUMN bid_id SET DEFAULT nextval('r2_dillfrog.auction_bids_bid_id_seq'::regclass);


--
-- Name: auctions auction_id; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.auctions ALTER COLUMN auction_id SET DEFAULT nextval('r2_dillfrog.auctions_auction_id_seq'::regclass);


--
-- Name: daily_scores score_id; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.daily_scores ALTER COLUMN score_id SET DEFAULT nextval('r2_dillfrog.daily_scores_score_id_seq'::regclass);


--
-- Name: event_log entry_id; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.event_log ALTER COLUMN entry_id SET DEFAULT nextval('r2_dillfrog.event_log_entry_id_seq'::regclass);


--
-- Name: members id_member; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.members ALTER COLUMN id_member SET DEFAULT nextval('r2_dillfrog.members_id_member_seq'::regclass);


--
-- Name: on_ask_responses trigger_id; Type: DEFAULT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.on_ask_responses ALTER COLUMN trigger_id SET DEFAULT nextval('r2_dillfrog.on_ask_responses_trigger_id_seq'::regclass);


--
-- Name: accounts idx_16434_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.accounts
    ADD CONSTRAINT idx_16434_primary PRIMARY KEY (id_member);


--
-- Name: auctions idx_16450_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.auctions
    ADD CONSTRAINT idx_16450_primary PRIMARY KEY (auction_id);


--
-- Name: auction_bids idx_16464_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.auction_bids
    ADD CONSTRAINT idx_16464_primary PRIMARY KEY (bid_id);


--
-- Name: daily_scores idx_16476_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.daily_scores
    ADD CONSTRAINT idx_16476_primary PRIMARY KEY (score_id);


--
-- Name: event_log idx_16516_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.event_log
    ADD CONSTRAINT idx_16516_primary PRIMARY KEY (entry_id);


--
-- Name: item_names_by_rec idx_16529_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.item_names_by_rec
    ADD CONSTRAINT idx_16529_primary PRIMARY KEY (item_id);


--
-- Name: lottery idx_16536_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.lottery
    ADD CONSTRAINT idx_16536_primary PRIMARY KEY (name, edate);


--
-- Name: mailing_list idx_16541_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.mailing_list
    ADD CONSTRAINT idx_16541_primary PRIMARY KEY (email);


--
-- Name: members idx_16546_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.members
    ADD CONSTRAINT idx_16546_primary PRIMARY KEY (id_member);


--
-- Name: on_ask_responses idx_16567_primary; Type: CONSTRAINT; Schema: r2_dillfrog; Owner: postgres
--

ALTER TABLE ONLY r2_dillfrog.on_ask_responses
    ADD CONSTRAINT idx_16567_primary PRIMARY KEY (trigger_id);


--
-- Name: idx_16434_username; Type: INDEX; Schema: r2_dillfrog; Owner: postgres
--

CREATE UNIQUE INDEX idx_16434_username ON r2_dillfrog.accounts USING btree (member_name);


--
-- Name: idx_16443_idx_altwatch_namea; Type: INDEX; Schema: r2_dillfrog; Owner: postgres
--

CREATE INDEX idx_16443_idx_altwatch_namea ON r2_dillfrog.altwatch USING btree (namea);


--
-- Name: idx_16443_idx_altwatch_nameb; Type: INDEX; Schema: r2_dillfrog; Owner: postgres
--

CREATE INDEX idx_16443_idx_altwatch_nameb ON r2_dillfrog.altwatch USING btree (nameb);


--
-- Name: idx_16546_username; Type: INDEX; Schema: r2_dillfrog; Owner: postgres
--

CREATE UNIQUE INDEX idx_16546_username ON r2_dillfrog.members USING btree (member_name);


--
-- Name: idx_16578_name_idx; Type: INDEX; Schema: r2_dillfrog; Owner: postgres
--

CREATE UNIQUE INDEX idx_16578_name_idx ON r2_dillfrog.players USING btree (name);


--
-- PostgreSQL database dump complete
--

\unrestrict qmpDgGa1D9acAoHUlIE6pbISG6oisb06RnSTc7LzlMpLKqWePUYiuW2Exy4mVgp

--
-- PostgreSQL database dump
--

\restrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx

-- Dumped from database version 15.15 (Debian 15.15-1.pgdg13+1)
-- Dumped by pg_dump version 15.15 (Debian 15.15-1.pgdg13+1)

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
-- Name: r2_fuzzem; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE r2_fuzzem WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE r2_fuzzem OWNER TO postgres;

\unrestrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx
\connect r2_fuzzem
\restrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx

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
-- Name: r2_fuzzem; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE r2_fuzzem SET search_path TO 'public', 'r2_fuzzem';


\unrestrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx
\connect r2_fuzzem
\restrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx

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
-- Name: r2_fuzzem; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA r2_fuzzem;


ALTER SCHEMA r2_fuzzem OWNER TO postgres;

--
-- Name: r2_event_log_entry_type; Type: TYPE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TYPE r2_fuzzem.r2_event_log_entry_type AS ENUM (
    'New Character',
    'Sell Item',
    'PKill',
    'Suspicious',
    'Monolith Capture',
    'First Kill',
    'Become General',
    'Become Soldier',
    'Complete Quest',
    'Make Alliance',
    'Manage Alliance',
    'Complete Course',
    'Change PVP Level Restirction',
    'Give Item',
    'Give Cryl',
    'Daily Win',
    'Idea',
    'Bug'
);


ALTER TYPE r2_fuzzem.r2_event_log_entry_type OWNER TO postgres;

--
-- Name: r2_on_ask_responses_response_type; Type: TYPE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TYPE r2_fuzzem.r2_on_ask_responses_response_type AS ENUM (
    'Say',
    'Echo',
    'Command'
);


ALTER TYPE r2_fuzzem.r2_on_ask_responses_response_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: r2_accounts; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_accounts (
    uin bigint NOT NULL,
    userid character varying(40) NOT NULL,
    userid_formatted character varying(40) NOT NULL,
    gender character(1) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(40) NOT NULL,
    prefer_censor smallint NOT NULL
);


ALTER TABLE r2_fuzzem.r2_accounts OWNER TO postgres;

--
-- Name: r2_accounts_uin_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_accounts_uin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_accounts_uin_seq OWNER TO postgres;

--
-- Name: r2_accounts_uin_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_accounts_uin_seq OWNED BY r2_fuzzem.r2_accounts.uin;


--
-- Name: r2_altwatch; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_altwatch (
    ip character varying(15) DEFAULT ''::character varying NOT NULL,
    namea character varying(20) DEFAULT ''::character varying NOT NULL,
    nameb character varying(20) DEFAULT ''::character varying NOT NULL,
    ldate timestamp with time zone
);


ALTER TABLE r2_fuzzem.r2_altwatch OWNER TO postgres;

--
-- Name: r2_auction_bids; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_auction_bids (
    bid_id bigint NOT NULL,
    auction_id bigint DEFAULT '0'::bigint NOT NULL,
    bidder_uin bigint DEFAULT '0'::bigint NOT NULL,
    max_bid bigint DEFAULT '0'::bigint NOT NULL,
    bid_date timestamp with time zone
);


ALTER TABLE r2_fuzzem.r2_auction_bids OWNER TO postgres;

--
-- Name: r2_auction_bids_bid_id_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_auction_bids_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_auction_bids_bid_id_seq OWNER TO postgres;

--
-- Name: r2_auction_bids_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_auction_bids_bid_id_seq OWNED BY r2_fuzzem.r2_auction_bids.bid_id;


--
-- Name: r2_auctions; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_auctions (
    auction_id bigint NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    min_price bigint DEFAULT '0'::bigint NOT NULL,
    bid_increment bigint DEFAULT '0'::bigint NOT NULL,
    seller_uin bigint DEFAULT '0'::bigint NOT NULL,
    item_name character varying(128) DEFAULT ''::character varying NOT NULL,
    item_desc character varying(255) DEFAULT ''::character varying NOT NULL,
    item_data bytea NOT NULL,
    high_bid_uin bigint,
    high_bid bigint,
    claimed_item character(1) DEFAULT 'N'::bpchar,
    returned_cryl character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE r2_fuzzem.r2_auctions OWNER TO postgres;

--
-- Name: r2_auctions_auction_id_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_auctions_auction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_auctions_auction_id_seq OWNER TO postgres;

--
-- Name: r2_auctions_auction_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_auctions_auction_id_seq OWNED BY r2_fuzzem.r2_auctions.auction_id;


--
-- Name: r2_bad_passwords; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_bad_passwords (
    ipc character varying(11) DEFAULT ''::character varying NOT NULL,
    pdate date NOT NULL
);


ALTER TABLE r2_fuzzem.r2_bad_passwords OWNER TO postgres;

--
-- Name: r2_daily_scores; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_daily_scores (
    score_id bigint NOT NULL,
    score_date date NOT NULL,
    uin bigint DEFAULT '0'::bigint NOT NULL,
    max_hp bigint,
    max_mana bigint,
    dp double precision DEFAULT '0'::double precision NOT NULL,
    exp_gained bigint DEFAULT '0'::bigint NOT NULL,
    level bigint DEFAULT '0'::bigint NOT NULL,
    min_online bigint DEFAULT '0'::bigint NOT NULL,
    pvpdeaths bigint DEFAULT '0'::bigint NOT NULL,
    pvpkills bigint DEFAULT '0'::bigint NOT NULL,
    race bigint DEFAULT '0'::bigint NOT NULL,
    repu bigint DEFAULT '0'::bigint NOT NULL,
    turns_max bigint DEFAULT '0'::bigint NOT NULL,
    turns_used bigint DEFAULT '0'::bigint NOT NULL,
    worth bigint DEFAULT '0'::bigint NOT NULL,
    kno bigint DEFAULT '0'::bigint NOT NULL,
    maj bigint DEFAULT '0'::bigint NOT NULL,
    cha bigint DEFAULT '0'::bigint NOT NULL,
    agi bigint DEFAULT '0'::bigint NOT NULL,
    str bigint DEFAULT '0'::bigint NOT NULL,
    def bigint DEFAULT '0'::bigint NOT NULL,
    kmec bigint DEFAULT '0'::bigint NOT NULL,
    ksoc bigint DEFAULT '0'::bigint NOT NULL,
    kmed bigint DEFAULT '0'::bigint NOT NULL,
    kcom bigint DEFAULT '0'::bigint NOT NULL,
    moff bigint DEFAULT '0'::bigint NOT NULL,
    mdef bigint DEFAULT '0'::bigint NOT NULL,
    mele bigint DEFAULT '0'::bigint NOT NULL,
    mmen bigint DEFAULT '0'::bigint NOT NULL,
    dphy bigint DEFAULT '0'::bigint NOT NULL,
    dene bigint DEFAULT '0'::bigint NOT NULL,
    dmen bigint DEFAULT '0'::bigint NOT NULL,
    capp bigint DEFAULT '0'::bigint NOT NULL,
    catt bigint DEFAULT '0'::bigint NOT NULL,
    aupp bigint DEFAULT '0'::bigint NOT NULL,
    alow bigint DEFAULT '0'::bigint NOT NULL,
    supp bigint DEFAULT '0'::bigint NOT NULL,
    slow bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE r2_fuzzem.r2_daily_scores OWNER TO postgres;

--
-- Name: r2_daily_scores_score_id_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_daily_scores_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_daily_scores_score_id_seq OWNER TO postgres;

--
-- Name: r2_daily_scores_score_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_daily_scores_score_id_seq OWNED BY r2_fuzzem.r2_daily_scores.score_id;


--
-- Name: r2_event_log; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_event_log (
    entry_id bigint NOT NULL,
    entry_type r2_fuzzem.r2_event_log_entry_type DEFAULT 'New Character'::r2_fuzzem.r2_event_log_entry_type NOT NULL,
    entry_desc character varying(255) DEFAULT ''::character varying NOT NULL,
    uin_by bigint,
    arg_a bigint,
    arg_b bigint,
    arg_c bigint,
    entry_date timestamp with time zone
);


ALTER TABLE r2_fuzzem.r2_event_log OWNER TO postgres;

--
-- Name: r2_event_log_entry_id_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_event_log_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_event_log_entry_id_seq OWNER TO postgres;

--
-- Name: r2_event_log_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_event_log_entry_id_seq OWNED BY r2_fuzzem.r2_event_log.entry_id;


--
-- Name: r2_game_server_settings; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_game_server_settings (
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying
);


ALTER TABLE r2_fuzzem.r2_game_server_settings OWNER TO postgres;

--
-- Name: r2_item_names_by_rec; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_item_names_by_rec (
    item_id bigint DEFAULT '0'::bigint NOT NULL,
    item_name character varying(255) DEFAULT ''::character varying NOT NULL,
    item_desc text NOT NULL
);


ALTER TABLE r2_fuzzem.r2_item_names_by_rec OWNER TO postgres;

--
-- Name: r2_lottery; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_lottery (
    name character varying(20) DEFAULT ''::character varying NOT NULL,
    edate date NOT NULL,
    won character varying(20) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_fuzzem.r2_lottery OWNER TO postgres;

--
-- Name: r2_mailing_list; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_mailing_list (
    email character varying(80) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_fuzzem.r2_mailing_list OWNER TO postgres;

--
-- Name: r2_members; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_members (
    id_member bigint NOT NULL,
    member_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    passwd character varying(255) DEFAULT ''::character varying NOT NULL,
    active character varying(255) NOT NULL,
    userid_formatted character varying(255) NOT NULL,
    prefer_censor character varying(255) NOT NULL,
    gender character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_fuzzem.r2_members OWNER TO postgres;

--
-- Name: r2_members_id_member_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_members_id_member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_members_id_member_seq OWNER TO postgres;

--
-- Name: r2_members_id_member_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_members_id_member_seq OWNED BY r2_fuzzem.r2_members.id_member;


--
-- Name: r2_messages; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_messages (
    body character varying(255) NOT NULL,
    id_topic bigint NOT NULL,
    subject character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE r2_fuzzem.r2_messages OWNER TO postgres;

--
-- Name: r2_monolith_capture_status; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_monolith_capture_status (
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    owned_by_race bigint DEFAULT '0'::bigint NOT NULL,
    date_captured timestamp with time zone,
    date_contested timestamp with time zone,
    captured_by_uin bigint
);


ALTER TABLE r2_fuzzem.r2_monolith_capture_status OWNER TO postgres;

--
-- Name: r2_on_ask_responses; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_on_ask_responses (
    trigger_id bigint NOT NULL,
    item_id bigint DEFAULT '0'::bigint NOT NULL,
    response_match character varying(255) DEFAULT ''::character varying NOT NULL,
    response_type r2_fuzzem.r2_on_ask_responses_response_type DEFAULT 'Say'::r2_fuzzem.r2_on_ask_responses_response_type NOT NULL,
    response_text text NOT NULL,
    match_order bigint DEFAULT '0'::bigint NOT NULL,
    is_visible character(1) DEFAULT 'Y'::bpchar NOT NULL
);


ALTER TABLE r2_fuzzem.r2_on_ask_responses OWNER TO postgres;

--
-- Name: r2_on_ask_responses_trigger_id_seq; Type: SEQUENCE; Schema: r2_fuzzem; Owner: postgres
--

CREATE SEQUENCE r2_fuzzem.r2_on_ask_responses_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE r2_fuzzem.r2_on_ask_responses_trigger_id_seq OWNER TO postgres;

--
-- Name: r2_on_ask_responses_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: r2_fuzzem; Owner: postgres
--

ALTER SEQUENCE r2_fuzzem.r2_on_ask_responses_trigger_id_seq OWNED BY r2_fuzzem.r2_on_ask_responses.trigger_id;


--
-- Name: r2_players; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_players (
    name character varying(20) DEFAULT NULL::character varying,
    lev bigint,
    kno bigint,
    maj bigint,
    cha bigint,
    agi bigint,
    str bigint,
    def bigint,
    worth bigint,
    repu bigint,
    admin character(1) DEFAULT NULL::bpchar,
    email character varying(80) DEFAULT NULL::character varying,
    race bigint,
    pvpkills bigint,
    pvpdeaths bigint,
    dp double precision,
    arena_pts double precision,
    inventory text,
    pw character varying(60) DEFAULT NULL::character varying,
    last_saved timestamp with time zone
);


ALTER TABLE r2_fuzzem.r2_players OWNER TO postgres;

--
-- Name: r2_rock_certs; Type: TABLE; Schema: r2_fuzzem; Owner: postgres
--

CREATE TABLE r2_fuzzem.r2_rock_certs (
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    c_type character(1) DEFAULT ''::bpchar NOT NULL,
    c_val bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE r2_fuzzem.r2_rock_certs OWNER TO postgres;

--
-- Name: r2_accounts uin; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_accounts ALTER COLUMN uin SET DEFAULT nextval('r2_fuzzem.r2_accounts_uin_seq'::regclass);


--
-- Name: r2_auction_bids bid_id; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_auction_bids ALTER COLUMN bid_id SET DEFAULT nextval('r2_fuzzem.r2_auction_bids_bid_id_seq'::regclass);


--
-- Name: r2_auctions auction_id; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_auctions ALTER COLUMN auction_id SET DEFAULT nextval('r2_fuzzem.r2_auctions_auction_id_seq'::regclass);


--
-- Name: r2_daily_scores score_id; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_daily_scores ALTER COLUMN score_id SET DEFAULT nextval('r2_fuzzem.r2_daily_scores_score_id_seq'::regclass);


--
-- Name: r2_event_log entry_id; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_event_log ALTER COLUMN entry_id SET DEFAULT nextval('r2_fuzzem.r2_event_log_entry_id_seq'::regclass);


--
-- Name: r2_members id_member; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_members ALTER COLUMN id_member SET DEFAULT nextval('r2_fuzzem.r2_members_id_member_seq'::regclass);


--
-- Name: r2_on_ask_responses trigger_id; Type: DEFAULT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_on_ask_responses ALTER COLUMN trigger_id SET DEFAULT nextval('r2_fuzzem.r2_on_ask_responses_trigger_id_seq'::regclass);


--
-- Name: r2_accounts idx_16670_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_accounts
    ADD CONSTRAINT idx_16670_primary PRIMARY KEY (uin);


--
-- Name: r2_auctions idx_16681_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_auctions
    ADD CONSTRAINT idx_16681_primary PRIMARY KEY (auction_id);


--
-- Name: r2_auction_bids idx_16695_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_auction_bids
    ADD CONSTRAINT idx_16695_primary PRIMARY KEY (bid_id);


--
-- Name: r2_daily_scores idx_16707_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_daily_scores
    ADD CONSTRAINT idx_16707_primary PRIMARY KEY (score_id);


--
-- Name: r2_event_log idx_16747_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_event_log
    ADD CONSTRAINT idx_16747_primary PRIMARY KEY (entry_id);


--
-- Name: r2_item_names_by_rec idx_16760_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_item_names_by_rec
    ADD CONSTRAINT idx_16760_primary PRIMARY KEY (item_id);


--
-- Name: r2_lottery idx_16767_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_lottery
    ADD CONSTRAINT idx_16767_primary PRIMARY KEY (name, edate);


--
-- Name: r2_mailing_list idx_16772_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_mailing_list
    ADD CONSTRAINT idx_16772_primary PRIMARY KEY (email);


--
-- Name: r2_members idx_16777_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_members
    ADD CONSTRAINT idx_16777_primary PRIMARY KEY (id_member);


--
-- Name: r2_on_ask_responses idx_16798_primary; Type: CONSTRAINT; Schema: r2_fuzzem; Owner: postgres
--

ALTER TABLE ONLY r2_fuzzem.r2_on_ask_responses
    ADD CONSTRAINT idx_16798_primary PRIMARY KEY (trigger_id);


--
-- Name: idx_16674_idx_altwatch_namea; Type: INDEX; Schema: r2_fuzzem; Owner: postgres
--

CREATE INDEX idx_16674_idx_altwatch_namea ON r2_fuzzem.r2_altwatch USING btree (namea);


--
-- Name: idx_16674_idx_altwatch_nameb; Type: INDEX; Schema: r2_fuzzem; Owner: postgres
--

CREATE INDEX idx_16674_idx_altwatch_nameb ON r2_fuzzem.r2_altwatch USING btree (nameb);


--
-- Name: idx_16777_username; Type: INDEX; Schema: r2_fuzzem; Owner: postgres
--

CREATE UNIQUE INDEX idx_16777_username ON r2_fuzzem.r2_members USING btree (member_name);


--
-- Name: idx_16809_name_idx; Type: INDEX; Schema: r2_fuzzem; Owner: postgres
--

CREATE UNIQUE INDEX idx_16809_name_idx ON r2_fuzzem.r2_players USING btree (name);


--
-- PostgreSQL database dump complete
--

\unrestrict F6wiryoXr9b2mp6CwSGMbCfP2pXkQQmJRmJgvIClYCAh07eIqFjqdmDHiqI2oxx


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
                                 customer_id integer DEFAULT nextval('public.customer_customer_id_seq'::regclass) NOT NULL,
                                 store_id smallint NOT NULL,
                                 first_name character varying(45) NOT NULL,
                                 last_name character varying(45) NOT NULL,
                                 email character varying(50),
                                 address_id smallint NOT NULL,
                                 activebool boolean DEFAULT true NOT NULL,
                                 create_date date DEFAULT ('now'::text)::date NOT NULL,
                                 last_update timestamp without time zone DEFAULT now(),
                                 active integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
                              actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
                              first_name character varying(45) NOT NULL,
                              last_name character varying(45) NOT NULL,
                              last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
                                 category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
                                 name character varying(25) NOT NULL,
                                 last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
                             film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
                             title character varying(255) NOT NULL,
                             description text,
                             release_year integer,
                             language_id smallint NOT NULL,
                             rental_duration smallint DEFAULT 3 NOT NULL,
                             rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
                             length smallint,
                             replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
                             rating character varying(16) DEFAULT 'G',
                             last_update timestamp without time zone DEFAULT now() NOT NULL,
                             special_features text[],
                             fulltext tsvector NOT NULL
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
                                   actor_id smallint NOT NULL,
                                   film_id smallint NOT NULL,
                                   last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
                                      film_id smallint NOT NULL,
                                      category_id smallint NOT NULL,
                                      last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
                                address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
                                address character varying(50) NOT NULL,
                                address2 character varying(50),
                                district character varying(20) NOT NULL,
                                city_id smallint NOT NULL,
                                postal_code character varying(10),
                                phone character varying(20) NOT NULL,
                                last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
                             city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
                             city character varying(50) NOT NULL,
                             country_id smallint NOT NULL,
                             last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
                                country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
                                country character varying(50) NOT NULL,
                                last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
                                  inventory_id integer DEFAULT nextval('public.inventory_inventory_id_seq'::regclass) NOT NULL,
                                  film_id smallint NOT NULL,
                                  store_id smallint NOT NULL,
                                  last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
                                 language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
                                 name character(20) NOT NULL,
                                 last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
                                payment_id integer DEFAULT nextval('public.payment_payment_id_seq'::regclass) NOT NULL,
                                customer_id smallint NOT NULL,
                                staff_id smallint NOT NULL,
                                rental_id integer NOT NULL,
                                amount numeric(5,2) NOT NULL,
                                payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

--
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
                               rental_id integer DEFAULT nextval('public.rental_rental_id_seq'::regclass) NOT NULL,
                               rental_date timestamp without time zone NOT NULL,
                               inventory_id integer NOT NULL,
                               customer_id smallint NOT NULL,
                               return_date timestamp without time zone,
                               staff_id smallint NOT NULL,
                               last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
                              staff_id integer DEFAULT nextval('public.staff_staff_id_seq'::regclass) NOT NULL,
                              first_name character varying(45) NOT NULL,
                              last_name character varying(45) NOT NULL,
                              address_id smallint NOT NULL,
                              email character varying(50),
                              store_id smallint NOT NULL,
                              active boolean DEFAULT true NOT NULL,
                              username character varying(16) NOT NULL,
                              password character varying(40),
                              last_update timestamp without time zone DEFAULT now() NOT NULL,
                              picture bytea
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
                              store_id integer DEFAULT nextval('public.store_store_id_seq'::regclass) NOT NULL,
                              manager_staff_id smallint NOT NULL,
                              address_id smallint NOT NULL,
                              last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

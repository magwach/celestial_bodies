--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronomical_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_event (
    astronomical_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    event_date date NOT NULL,
    event_type character varying(50),
    observed_by character varying(100),
    details text
);


ALTER TABLE public.astronomical_event OWNER TO freecodecamp;

--
-- Name: astronomical_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_event_event_id_seq OWNED BY public.astronomical_event.astronomical_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_from_earth character varying(30),
    number_of_stars character varying(30),
    discovery_date date
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(10),
    orbital_period integer NOT NULL,
    diameter integer NOT NULL,
    composition text,
    planet_id integer,
    is_habitable boolean,
    discovery_date date
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_type text,
    number_of_moons integer,
    star_id integer,
    orbital_period character varying(40),
    mass character varying(40),
    discovery_date date,
    diameter character varying(50),
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type text,
    mass_in_solar_masses numeric(9,2),
    luminosity numeric(10,2),
    galaxy_id integer,
    is_visible boolean,
    has_planets boolean,
    radius numeric(9,3),
    age character varying(40),
    temperature character varying(40),
    discovery_date date
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomical_event astronomical_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event ALTER COLUMN astronomical_event_id SET DEFAULT nextval('public.astronomical_event_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomical_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_event VALUES (1, 'Total Solar Eclipse', '2024-04-08', 'Eclipse', 'NASA', 'A total solar eclipse visible in parts of the U.S. and Mexico.');
INSERT INTO public.astronomical_event VALUES (2, 'Supernova SN 2024A', '2024-03-15', 'Supernova', 'Hubble Space Telescope', 'A type II supernova observed in the galaxy NGC 1234.');
INSERT INTO public.astronomical_event VALUES (3, 'Transit of Venus', '2024-12-08', 'Transit', 'European Southern Observatory', 'The transit of Venus across the Sun visible from Europe.');
INSERT INTO public.astronomical_event VALUES (4, 'Meteor Shower Peak', '2024-08-12', 'Meteor Shower', 'International Meteor Organization', 'The peak of the Perseid meteor shower with high visibility.');
INSERT INTO public.astronomical_event VALUES (5, 'Comet Halley Close Approach', '2024-07-10', 'Comet', 'SpaceX', 'Comet Halley makes its closest approach to Earth in 2024.');
INSERT INTO public.astronomical_event VALUES (6, 'Lunar Eclipse', '2024-05-05', 'Eclipse', 'Royal Observatory Greenwich', 'A partial lunar eclipse visible in parts of Europe and Africa.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', '0', '100000000000', '1930-01-01');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', '2200000', '100000000000', '1785-08-01');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', '3000000', '50000000', '1784-10-01');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', '23000000', '50000000', '1773-02-01');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', '28000000', '10000000000', '1780-04-01');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', '163000', '1000000000', '1960-05-01');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 3474, NULL, 1, false, '1800-01-01');
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 22, NULL, 2, false, '1800-01-01');
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 12, NULL, 2, false, '1800-01-01');
INSERT INTO public.moon VALUES (4, 'Ganymede', 7, 5268, NULL, 3, false, '1800-01-01');
INSERT INTO public.moon VALUES (5, 'Callisto', 17, 4821, NULL, 3, false, '1800-01-01');
INSERT INTO public.moon VALUES (6, 'Io', 2, 3643, NULL, 3, false, '1800-01-01');
INSERT INTO public.moon VALUES (7, 'Europa', 4, 3121, NULL, 3, false, '1800-01-01');
INSERT INTO public.moon VALUES (8, 'Titan', 16, 5150, NULL, 4, true, '1800-01-01');
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1528, NULL, 4, false, '1800-01-01');
INSERT INTO public.moon VALUES (10, 'Iapetus', 79, 1469, NULL, 4, false, '1800-01-01');
INSERT INTO public.moon VALUES (11, 'Oberon', 14, 1523, NULL, 5, false, '1800-01-01');
INSERT INTO public.moon VALUES (12, 'Titania', 9, 1578, NULL, 5, false, '1800-01-01');
INSERT INTO public.moon VALUES (13, 'Umbriel', 4, 1169, NULL, 5, false, '1800-01-01');
INSERT INTO public.moon VALUES (14, 'Ariel', 3, 1158, NULL, 5, false, '1800-01-01');
INSERT INTO public.moon VALUES (15, 'Triton', 6, 2706, NULL, 6, false, '1800-01-01');
INSERT INTO public.moon VALUES (16, 'Proteus', 1, 420, NULL, 6, false, '1800-01-01');
INSERT INTO public.moon VALUES (17, 'Nereid', 360, 340, NULL, 6, false, '1800-01-01');
INSERT INTO public.moon VALUES (18, 'Charon', 6, 1212, NULL, 6, false, '1800-01-01');
INSERT INTO public.moon VALUES (19, 'Miranda', 1, 472, NULL, 5, false, '1800-01-01');
INSERT INTO public.moon VALUES (20, 'Puck', 1, 162, NULL, 5, false, '1800-01-01');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, 1, '365.25', '5972000000000000000000000', '1800-01-01', '12742', true);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, NULL, 1, '687', '641000000000000000000000', '1800-01-01', '6779', false);
INSERT INTO public.planet VALUES (3, 'Jupiter', NULL, NULL, 1, '4333', '1898000000000000000000000000', '1800-01-01', '139820', false);
INSERT INTO public.planet VALUES (4, 'Saturn', NULL, NULL, 1, '10759', '568300000000000000000000000', '1800-01-01', '116460', false);
INSERT INTO public.planet VALUES (5, 'Uranus', NULL, NULL, 1, '30687', '86810000000000000000000000', '1800-01-01', '50724', false);
INSERT INTO public.planet VALUES (6, 'Neptune', NULL, NULL, 1, '60190', '102400000000000000000000000', '1800-01-01', '49244', false);
INSERT INTO public.planet VALUES (7, 'Proxima b', NULL, NULL, 6, '11.2', '127000000000000000000000', '1960-01-01', '1.2', true);
INSERT INTO public.planet VALUES (8, 'Proxima c', NULL, NULL, 6, '5.2', '140000000000000000000000', '1960-01-01', '1.8', false);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', NULL, NULL, 7, '12.5', '1800000000000000000000000', '1850-01-01', '1.5', true);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bc', NULL, NULL, 7, '7.3', '2200000000000000000000000', '1850-01-01', '1.7', false);
INSERT INTO public.planet VALUES (11, 'Beta Centauri b', NULL, NULL, 8, '15.3', '1900000000000000000000000', '1860-01-01', '1.6', false);
INSERT INTO public.planet VALUES (12, 'Beta Centauri c', NULL, NULL, 8, '9.8', '2000000000000000000000000', '1860-01-01', '1.4', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', NULL, NULL, NULL, 1, true, true, 1.710, '200000000', '9940', '1860-01-01');
INSERT INTO public.star VALUES (2, 'Betelgeuse', NULL, NULL, NULL, 1, false, false, 1.200, '10000000', '3500', '1830-01-01');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', NULL, NULL, NULL, 1, true, true, 1.200, '5000000000', '5700', '1835-01-01');
INSERT INTO public.star VALUES (4, 'Canopus', NULL, NULL, NULL, 1, true, false, 1.500, '80000000', '7500', '1840-01-01');
INSERT INTO public.star VALUES (5, 'Rigel', NULL, NULL, NULL, 1, true, true, 1.800, '10000000', '12000', '1845-01-01');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', NULL, NULL, NULL, 1, true, true, 0.140, '4500000000', '3050', '1915-01-01');
INSERT INTO public.star VALUES (7, 'Vega', NULL, NULL, NULL, 2, true, false, 2.100, '455000000', '9600', '1850-01-01');
INSERT INTO public.star VALUES (8, 'Altair', NULL, NULL, NULL, 2, true, true, 1.300, '1000000000', '7700', '1855-01-01');
INSERT INTO public.star VALUES (9, 'Deneb', NULL, NULL, NULL, 2, true, false, 2.200, '20000000', '8500', '1865-01-01');
INSERT INTO public.star VALUES (10, 'Spica', NULL, NULL, NULL, 2, false, false, 1.800, '25000000', '24000', '1860-01-01');
INSERT INTO public.star VALUES (11, 'Fomalhaut', NULL, NULL, NULL, 3, true, true, 1.100, '44000000', '8800', '1880-01-01');
INSERT INTO public.star VALUES (12, 'Antares', NULL, NULL, NULL, 3, false, false, 1.200, '12000000', '3500', '1890-01-01');


--
-- Name: astronomical_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_event_event_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: astronomical_event astronomical_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_pkey PRIMARY KEY (astronomical_event_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--



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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(20) NOT NULL,
    mass_in_kg integer,
    galaxy_age integer,
    habitable_zones_present boolean,
    galactic_dust_present boolean,
    description text,
    distance_from_earth_in_light_years numeric(10,4)
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    mass integer,
    surface_gravity integer,
    volcanic_activities boolean,
    natural_satellite boolean NOT NULL,
    distance_from_earth_in_light_years numeric(6,3),
    description text
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
-- Name: new_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.new_table (
    new_table_id integer NOT NULL,
    numeric_data numeric(10,2) NOT NULL,
    text_data text NOT NULL,
    boolean_data_1 boolean NOT NULL,
    boolean_data_2 boolean,
    name character varying(50),
    int_data_1 integer,
    int_data_2 integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.new_table OWNER TO freecodecamp;

--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.new_table_new_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_table_new_table_id_seq OWNER TO freecodecamp;

--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.new_table_new_table_id_seq OWNED BY public.new_table.new_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    mass integer,
    number_of_moons integer,
    distance_from_earth numeric(7,3),
    habitable boolean NOT NULL,
    retrograde_rotation boolean,
    description text
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
    galaxy_id integer NOT NULL,
    mass integer NOT NULL,
    surface_temp_in_kelvin integer,
    binary_star_system boolean,
    pulsar boolean,
    description text,
    distance_from_earth_in_light_years numeric(12,4)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: new_table new_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table ALTER COLUMN new_table_id SET DEFAULT nextval('public.new_table_new_table_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000, 13000, true, false, 'The Milky Way is our home galaxy.', 270.1230);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1400000, 13000, false, true, 'The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way.', 2540.0010);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 800000, 5000, false, true, 'The Triangulum Galaxy is the third-largest member of the Local Group of galaxies.', 3010.3120);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 900000, 3000, false, false, 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy.', 2300.0120);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 1600000, 4000, false, true, 'The Sombrero Galaxy is notable for its prominent bulge and dust lane, giving it the appearance of a sombrero.', 2870.7640);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 1200000, 2000, false, true, 'The Cartwheel Galaxy is a lenticular galaxy and is famous for its cartwheel-like shape formed by a violent galactic collision.', 5000.2230);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Luna', 1, 0, 2, false, true, 0.003, 'Luna, commonly known as the Moon, is Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (12, 'Phobos', 3, 0, 0, true, true, 1.168, 'Phobos is the larger and innermost of the two natural satellites of Mars.');
INSERT INTO public.moon VALUES (13, 'Deimos', 3, 0, 0, true, true, 1.276, 'Deimos is the smaller and outermost of the two natural satellites of Mars.');
INSERT INTO public.moon VALUES (14, 'Io', 4, 0, 2, true, true, 5.205, 'Io is the innermost and third-largest of the four Galilean moons of Jupiter.');
INSERT INTO public.moon VALUES (15, 'Europa', 4, 0, 1, false, true, 5.208, 'Europa is the smallest of the four Galilean moons of Jupiter.');
INSERT INTO public.moon VALUES (16, 'Ganymede', 4, 0, 1, false, true, 5.208, 'Ganymede is the largest and most massive moon of Jupiter and in the Solar System.');
INSERT INTO public.moon VALUES (17, 'Titan', 5, 0, 1, false, true, 9.583, 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.');
INSERT INTO public.moon VALUES (18, 'Triton', 7, 0, 0, false, true, 30.050, 'Triton is the largest natural satellite of Neptune.');
INSERT INTO public.moon VALUES (19, 'Charon', 7, 0, 0, false, true, 30.050, 'Charon is the largest of the five known natural satellites of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (20, 'Pluto Moon 1', 24, 0, 0, false, true, 30.050, 'Pluto Moon 1 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (21, 'Pluto Moon 2', 24, 0, 0, false, true, 30.050, 'Pluto Moon 2 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (22, 'Pluto Moon 3', 24, 0, 0, false, true, 30.050, 'Pluto Moon 3 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (23, 'Pluto Moon 4', 24, 0, 0, false, true, 30.050, 'Pluto Moon 4 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (24, 'Pluto Moon 5', 24, 0, 0, false, true, 30.050, 'Pluto Moon 5 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (25, 'Pluto Moon 6', 24, 0, 0, false, true, 30.050, 'Pluto Moon 6 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (26, 'Pluto Moon 7', 24, 0, 0, false, true, 30.050, 'Pluto Moon 7 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (27, 'Pluto Moon 8', 24, 0, 0, false, true, 30.050, 'Pluto Moon 8 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (28, 'Pluto Moon 9', 24, 0, 0, false, true, 30.050, 'Pluto Moon 9 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (29, 'Pluto Moon 10', 24, 0, 0, false, true, 30.050, 'Pluto Moon 10 is a moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES (30, 'Pluto Moon 11', 24, 0, 0, false, true, 30.050, 'Pluto Moon 11 is a moon of the dwarf planet Pluto.');


--
-- Data for Name: new_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.new_table VALUES (1, 10.50, 'Example Text 1', true, false, 'Data 1', 100, 200, 1);
INSERT INTO public.new_table VALUES (2, 20.30, 'Example Text 2', true, true, 'Data 2', 150, 250, 2);
INSERT INTO public.new_table VALUES (3, 15.80, 'Example Text 3', false, true, 'Data 3', 200, 300, 3);
INSERT INTO public.new_table VALUES (4, 8.20, 'Example Text 4', true, false, 'Data 4', 250, 350, 4);
INSERT INTO public.new_table VALUES (5, 30.10, 'Example Text 5', false, false, 'Data 5', 300, 400, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 0, 0.390, false, false, 'Mercury is the smallest planet in the Solar System and the closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 0, 0.723, false, true, 'Venus is the second planet from the Sun and the hottest planet in the Solar System.');
INSERT INTO public.planet VALUES (3, 'Mars', 1, 0, 2, 1.520, false, false, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System.');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 318, 79, 5.200, false, false, 'Jupiter is the largest planet in the Solar System and the fifth planet from the Sun.');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 95, 82, 9.580, false, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 15, 27, 19.220, false, false, 'Uranus is the seventh planet from the Sun and the third-largest in the Solar System.');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 17, 14, 30.050, false, false, 'Neptune is the eighth and farthest known planet from the Sun in the Solar System.');
INSERT INTO public.planet VALUES (16, 'Kepler-11b', 6, 2, 0, 2000.000, false, false, 'Kepler-11b is an exoplanet orbiting the star Kepler-11. It was the innermost and the least massive of the six exoplanets discovered around the star.');
INSERT INTO public.planet VALUES (17, 'Kepler-11c', 6, 3, 0, 2000.000, false, false, 'Kepler-11c is an exoplanet orbiting the star Kepler-11.');
INSERT INTO public.planet VALUES (18, 'Kepler-11d', 6, 7, 0, 2000.000, false, false, 'Kepler-11d is an exoplanet orbiting the star Kepler-11.');
INSERT INTO public.planet VALUES (19, 'Kepler-11e', 6, 8, 0, 2000.000, false, false, 'Kepler-11e is an exoplanet orbiting the star Kepler-11.');
INSERT INTO public.planet VALUES (20, 'Kepler-11f', 6, 3, 0, 2000.000, false, false, 'Kepler-11f is an exoplanet orbiting the star Kepler-11.');
INSERT INTO public.planet VALUES (21, 'Kepler-11g', 6, 6, 0, 2000.000, false, false, 'Kepler-11g is an exoplanet orbiting the star Kepler-11.');
INSERT INTO public.planet VALUES (22, 'HD 10180 b', 7, 13, 0, 127.900, false, false, 'HD 10180 b is an exoplanet orbiting the star HD 10180.');
INSERT INTO public.planet VALUES (23, 'HD 10180 c', 7, 25, 0, 127.900, false, false, 'HD 10180 c is an exoplanet orbiting the star HD 10180.');
INSERT INTO public.planet VALUES (24, 'Pluto', 7, 0, 5, 39.480, false, false, 'Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the ninth planet to be discovered and the first to be visited by a spacecraft from Earth (New Horizons).');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 5778, false, false, 'The Sun is the star at the center of the Solar System.', 8.3000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1, 5790, true, false, 'Alpha Centauri A is the primary star of the Alpha Centauri star system.', 4.3700);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 1, 5260, true, false, 'Alpha Centauri B is the secondary star of the Alpha Centauri star system.', 4.3700);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2, 9940, false, false, 'Sirius is the brightest star in the night sky.', 8.6000);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 0, 3050, false, false, 'Proxima Centauri is a red dwarf star and the closest known star to the Sun.', 4.2400);
INSERT INTO public.star VALUES (6, 'Barnard''s Star', 2, 0, 3134, false, false, 'Barnard''s Star is a red dwarf star and the fourth-nearest known individual star to the Sun.', 5.9600);
INSERT INTO public.star VALUES (7, 'Kepler-11', 1, 1, 5660, true, false, 'Kepler-11 is a Sun-like star around which six exoplanets were discovered in a closely packed system.', 2000.0000);
INSERT INTO public.star VALUES (8, 'HD 10180', 3, 1, 6120, false, false, 'HD 10180 is a Sun-like star with a system of at least seven exoplanets.', 127.9000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.new_table_new_table_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: new_table new_table_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: new_table new_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_pkey PRIMARY KEY (new_table_id);


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
-- Name: new_table new_table_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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


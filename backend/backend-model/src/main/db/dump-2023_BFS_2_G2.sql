--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-11-29 15:11:12

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

DROP DATABASE "2023_BFS_2_G2";
--
-- TOC entry 3047 (class 1262 OID 290891)
-- Name: 2023_BFS_2_G2; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "2023_BFS_2_G2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect "2023_BFS_2_G2"

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 212 (class 1259 OID 292607)
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    p_id integer NOT NULL,
    p_name character varying(255) NOT NULL,
    p_description text,
    p_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    p_finished boolean DEFAULT false NOT NULL,
    p_max_hours integer
);


--
-- TOC entry 211 (class 1259 OID 292605)
-- Name: projects_p_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 211
-- Name: projects_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_p_id_seq OWNED BY public.projects.p_id;


--
-- TOC entry 214 (class 1259 OID 292703)
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    t_id integer NOT NULL,
    t_name character varying(255) NOT NULL,
    t_description text,
    p_id integer,
    t_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    t_finished boolean DEFAULT false NOT NULL,
    t_owner character varying NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 292701)
-- Name: tasks_t_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_t_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 213
-- Name: tasks_t_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_t_id_seq OWNED BY public.tasks.t_id;


--
-- TOC entry 210 (class 1259 OID 291693)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 209 (class 1259 OID 291691)
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ti18n_id_i18n_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ti18n_id_i18n_seq OWNED BY public.ti18n.id_i18n;


--
-- TOC entry 216 (class 1259 OID 292715)
-- Name: timers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timers (
    tm_id integer NOT NULL,
    user_ character varying(50) NOT NULL,
    t_id integer NOT NULL,
    tm_start_time timestamp without time zone NOT NULL,
    tm_end_time timestamp without time zone
);


--
-- TOC entry 215 (class 1259 OID 292713)
-- Name: timers_tm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.timers_tm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 215
-- Name: timers_tm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.timers_tm_id_seq OWNED BY public.timers.tm_id;


--
-- TOC entry 198 (class 1259 OID 291613)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer NOT NULL,
    rolename character varying(255),
    xmlclientpermission character varying(10485760)
);


--
-- TOC entry 197 (class 1259 OID 291611)
-- Name: trole_id_rolename_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_id_rolename_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_id_rolename_seq OWNED BY public.trole.id_rolename;


--
-- TOC entry 204 (class 1259 OID 291653)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 203 (class 1259 OID 291651)
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_server_permission_id_role_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 203
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_server_permission_id_role_server_permission_seq OWNED BY public.trole_server_permission.id_role_server_permission;


--
-- TOC entry 202 (class 1259 OID 291642)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer NOT NULL,
    permission_name character varying(10485760)
);


--
-- TOC entry 201 (class 1259 OID 291640)
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tserver_permission_id_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tserver_permission_id_server_permission_seq OWNED BY public.tserver_permission.id_server_permission;


--
-- TOC entry 206 (class 1259 OID 291671)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer NOT NULL,
    setting_key character varying(10485760),
    setting_value character varying(10485760),
    setting_comment character varying(10485760)
);


--
-- TOC entry 205 (class 1259 OID 291669)
-- Name: tsetting_id_setting_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tsetting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tsetting_id_setting_seq OWNED BY public.tsetting.id_setting;


--
-- TOC entry 196 (class 1259 OID 291601)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(255),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true
);


--
-- TOC entry 208 (class 1259 OID 291682)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value character varying(10485760)
);


--
-- TOC entry 207 (class 1259 OID 291680)
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_preference_id_user_preference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_preference_id_user_preference_seq OWNED BY public.tuser_preference.id_user_preference;


--
-- TOC entry 200 (class 1259 OID 291624)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 199 (class 1259 OID 291622)
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_role_id_user_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_role_id_user_role_seq OWNED BY public.tuser_role.id_user_role;


--
-- TOC entry 218 (class 1259 OID 294044)
-- Name: users_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_projects (
    up_id integer NOT NULL,
    p_id integer NOT NULL,
    user_ character varying(50) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 294042)
-- Name: users_projects_up_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_projects_up_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_projects_up_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_projects_up_id_seq OWNED BY public.users_projects.up_id;


--
-- TOC entry 2855 (class 2604 OID 292610)
-- Name: projects p_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN p_id SET DEFAULT nextval('public.projects_p_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 292706)
-- Name: tasks t_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN t_id SET DEFAULT nextval('public.tasks_t_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 291696)
-- Name: ti18n id_i18n; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n ALTER COLUMN id_i18n SET DEFAULT nextval('public.ti18n_id_i18n_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 292718)
-- Name: timers tm_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timers ALTER COLUMN tm_id SET DEFAULT nextval('public.timers_tm_id_seq'::regclass);


--
-- TOC entry 2848 (class 2604 OID 291616)
-- Name: trole id_rolename; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole ALTER COLUMN id_rolename SET DEFAULT nextval('public.trole_id_rolename_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 291656)
-- Name: trole_server_permission id_role_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission ALTER COLUMN id_role_server_permission SET DEFAULT nextval('public.trole_server_permission_id_role_server_permission_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 291645)
-- Name: tserver_permission id_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission ALTER COLUMN id_server_permission SET DEFAULT nextval('public.tserver_permission_id_server_permission_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 291674)
-- Name: tsetting id_setting; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting ALTER COLUMN id_setting SET DEFAULT nextval('public.tsetting_id_setting_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 291685)
-- Name: tuser_preference id_user_preference; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference ALTER COLUMN id_user_preference SET DEFAULT nextval('public.tuser_preference_id_user_preference_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 291627)
-- Name: tuser_role id_user_role; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role ALTER COLUMN id_user_role SET DEFAULT nextval('public.tuser_role_id_user_role_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 294047)
-- Name: users_projects up_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_projects ALTER COLUMN up_id SET DEFAULT nextval('public.users_projects_up_id_seq'::regclass);


--
-- TOC entry 3035 (class 0 OID 292607)
-- Dependencies: 212
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.projects VALUES (132, 'Control de calidad', 'Revisión de proyectos y tareas finalizadas.', '2023-11-23 11:33:01.171692', false, 0);
INSERT INTO public.projects VALUES (3, 'Fitness Tracking', 'App de seguimiento y gestión de tus entrenamientos.', '2023-10-05 10:55:24.025716', false, 100);
INSERT INTO public.projects VALUES (4, 'Reservation Manager', 'Aplicación de reservas hoteleras.', '2023-10-05 10:55:24.025716', true, 750);
INSERT INTO public.projects VALUES (139, 'Tareas Diarias', 'Organización del día a día', '2023-11-27 12:20:29.240248', false, 0);
INSERT INTO public.projects VALUES (5, 'E-commerce', 'Tienda virtual exclusiva a la venta de todo aquello que se use en reposteria', '2023-10-05 10:55:24.025716', true, 100);
INSERT INTO public.projects VALUES (1, 'Social Network', 'Red Social destinada para una poblacion concreta', '2023-10-05 10:55:24.025716', true, 150);
INSERT INTO public.projects VALUES (138, 'Reuniones', 'Destinado a medir el tiempo empleado en reuniones y charlas.', '2023-11-24 08:53:33.861355', false, 0);
INSERT INTO public.projects VALUES (99, 'Proyecto Fullstack', 'Presentaciones del proyecto en sus diferentes fases.', '2023-11-08 08:55:27.950813', false, 0);
INSERT INTO public.projects VALUES (2, 'Time Tracker', 'Componente para contabilizar tiempo dedicado a tareas.', '2023-10-05 10:55:24.025716', false, 500);


--
-- TOC entry 3037 (class 0 OID 292703)
-- Dependencies: 214
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tasks VALUES (11, 'Crear Proyecto', 'Crear una proyecto con una pequeña descripcion', 2, '2023-10-05 11:04:56.171816', false, 'gabriel');
INSERT INTO public.tasks VALUES (105, 'Revisión de proyectos', 'Análisis de los proyectos en curso', 132, '2023-11-23 11:34:51.641643', false, 'angel');
INSERT INTO public.tasks VALUES (106, 'Revisión de tareas', 'Análisis de las tareas en curso', 132, '2023-11-23 11:35:51.003779', false, 'angel');
INSERT INTO public.tasks VALUES (75, 'Sprint review 1', 'Primer sprint review.', 99, '2023-11-08 08:56:06.318262', false, 'xabier');
INSERT INTO public.tasks VALUES (76, 'Sprint review 2', 'Segundo sprint review', 99, '2023-11-08 08:56:32.824747', false, 'xabier');
INSERT INTO public.tasks VALUES (119, 'Con la gerencia', 'Reuniones con la gerencia de la empresa', 138, '2023-11-24 08:56:43.146683', false, 'angel');
INSERT INTO public.tasks VALUES (77, 'Sprint review 3', 'Tercer sprint review', 99, '2023-11-08 08:56:47.861299', false, 'angel');
INSERT INTO public.tasks VALUES (78, 'Sprint review 4', 'Cuarto sprint review', 99, '2023-11-08 08:57:13.550571', false, 'xabier');
INSERT INTO public.tasks VALUES (108, 'Support', 'Resolución de conflictos', 132, '2023-11-23 11:41:46.128442', false, 'angel');
INSERT INTO public.tasks VALUES (5, 'Crear/Editar Perfil', 'Completar un formulario completo', 1, '2023-10-05 11:04:56.171816', true, 'angel');
INSERT INTO public.tasks VALUES (3, 'Crear Login-Signup', 'Controlar formato y evitar inserciones nulas', 1, '2023-10-05 11:04:56.171816', true, 'gabriel');
INSERT INTO public.tasks VALUES (6, 'Crear Grupos', 'Crear grupos con otros usuarios y poder mandar invitaciones', 1, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (15, 'Crear rutinas personalizadas ', 'Permite personalizar tabla de ejercicios para cada usuario', 3, '2023-10-05 11:04:56.171816', false, 'xabier');
INSERT INTO public.tasks VALUES (120, 'Añadir usuarios', 'Opciones para añadir o eliminar un usuario', 2, '2023-11-27 11:59:55.154306', false, 'angel');
INSERT INTO public.tasks VALUES (4, 'Crear Ver muro', 'Ver los ultimos post que se subieron', 1, '2023-10-05 11:04:56.171816', true, 'gabriel');
INSERT INTO public.tasks VALUES (18, 'Gestor de reservas', 'Permite crear, modificar, eliminar una reserva.', 4, '2023-10-05 11:04:56.171816', true, 'angel');
INSERT INTO public.tasks VALUES (7, 'Opciones de seguir y no seguir', 'Poder seguir y dejar de seguir de forma intuitiva', 1, '2023-10-05 11:04:56.171816', true, 'xabier');
INSERT INTO public.tasks VALUES (25, 'Crear/Editar Perfil', 'Poder editar los datos de mi perfil direcciones,datos personales,etc..', 5, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (24, 'Crear/Ver muro con ofertas', 'Ver productos con un descuento u oferta', 5, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (23, 'Crear Login-Signup', 'Controlar formato y evitar inserciones nulas', 5, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (26, 'Crear Carrito/Cesta y mantenerlos en el tiempo', 'poder guardar cuantas cosas quiera en la cesta y que solo desaparezcan si las quito manualmente', 5, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (27, 'Crear Seguimiento de pedido', 'Poder ver en que punto de la cadena de envio estas', 5, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (22, 'Crear control de Gastos', 'Saber los gatos divididos por zona o por tuno', 4, '2023-10-05 11:04:56.171816', true, 'sebas');
INSERT INTO public.tasks VALUES (79, 'Presentacion final', 'Presentación y demo del proyecto.', 99, '2023-11-21 09:33:25.866', false, 'angel');
INSERT INTO public.tasks VALUES (20, 'Sección de usuarios', 'Perfil, preferencias de usuario', 4, '2023-10-05 11:04:56.171816', true, 'gabriel');
INSERT INTO public.tasks VALUES (21, 'Crear Complementos', 'Mostrar actividades de asociados y sus ofertas', 4, '2023-10-05 11:04:56.171816', true, 'angel');
INSERT INTO public.tasks VALUES (101, 'Preparación demo day', 'Ensayo de la presentación final', 99, '2023-11-20 13:39:01.682', false, 'angel');
INSERT INTO public.tasks VALUES (36, 'Crear perfil de usuario', 'Creación de una vista para la gestión de la información de usuario.', 3, '2023-10-26 13:34:51.374826', true, 'sebas');
INSERT INTO public.tasks VALUES (16, 'Crear opcion favoritos', 'Poder dar favorito a un ejercicio/post/rutina', 3, '2023-10-05 11:04:56.171816', false, 'xabier');
INSERT INTO public.tasks VALUES (112, 'Turno de preguntas', 'Espacio para preguntas al finalizar la presentación', 99, '2023-11-23 13:41:10.881389', false, 'UserDemo');
INSERT INTO public.tasks VALUES (14, 'Crear/Ver Sugerencias de entrenamientos', 'Segun tu actividad anterior sugerir nuevos ejercicio', 3, '2023-10-05 11:04:56.171816', false, 'gabriel');
INSERT INTO public.tasks VALUES (19, 'Vista de detalles', 'Mostrar toda la informacion del hotel asi como sus asociados', 4, '2023-10-05 11:04:56.171816', true, 'gabriel');
INSERT INTO public.tasks VALUES (9, 'Crear Ver muro', 'Con las tareas abiertas y que aun no has finalizado', 2, '2023-10-05 11:04:56.171816', false, 'xabier');
INSERT INTO public.tasks VALUES (10, 'Crear Tarea', 'Crear una tarea con una pequeña descripcion', 2, '2023-10-05 11:04:56.171816', false, 'angel');
INSERT INTO public.tasks VALUES (12, 'Opciones de contador', 'Inicio/pausa/reanudar/finalizar', 2, '2023-10-05 11:04:56.171816', false, 'sebas');
INSERT INTO public.tasks VALUES (13, 'Crear Login-Signup', 'Controlar formato y evitar inserciones nulas', 3, '2023-10-05 11:04:56.171816', false, 'angel');
INSERT INTO public.tasks VALUES (17, 'Opciones de seguir entranadores/sus rutinas', 'Usar un formato de red social para que al inicio te aparezcan rutinas de otras personas que aportan contenido', 3, '2023-10-05 11:04:56.171816', false, 'gabriel');
INSERT INTO public.tasks VALUES (118, 'Con RR. HH.', 'Reuniones con el departamento de selección.', 138, '2023-11-24 08:55:45.447808', false, 'angel');
INSERT INTO public.tasks VALUES (117, 'Con el equipo', 'Reuniones con el equipo de desarrollo', 138, '2023-11-24 08:55:10.099651', false, 'angel');
INSERT INTO public.tasks VALUES (121, 'Responder correo', 'Revisar bandeja de entrada del correo de empresa', 139, '2023-11-27 12:21:09.069209', false, 'xabier');


--
-- TOC entry 3033 (class 0 OID 291693)
-- Dependencies: 210
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ti18n VALUES (0, 'i18n.bundle', 'Resource bundle in database');


--
-- TOC entry 3039 (class 0 OID 292715)
-- Dependencies: 216
-- Data for Name: timers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.timers VALUES (27196, 'angel', 15, '2023-11-27 10:24:13.226861', '2023-11-27 11:30:00');
INSERT INTO public.timers VALUES (26984, 'angel', 22, '2023-07-26 10:00:00', '2023-07-26 16:00:00');
INSERT INTO public.timers VALUES (27201, 'angel', 118, '2023-11-27 12:19:22.973621', '2023-11-27 12:53:46.257835');
INSERT INTO public.timers VALUES (26416, 'gabriel', 18, '2023-10-24 11:21:00', '2023-10-24 14:21:35.575802');
INSERT INTO public.timers VALUES (27033, 'angel', 10, '2022-12-02 14:59:00', '2022-12-03 08:50:00');
INSERT INTO public.timers VALUES (26332, 'pablo', 12, '2023-10-24 00:00:00', '2023-10-24 19:00:00');
INSERT INTO public.timers VALUES (26478, 'gabriel', 11, '2023-10-25 08:00:00', '2023-10-25 14:00:00');
INSERT INTO public.timers VALUES (26326, 'gabriel', 18, '2023-10-16 08:00:00', '2023-10-16 14:00:00');
INSERT INTO public.timers VALUES (26329, 'gabriel', 12, '2022-10-24 08:00:00', '2022-10-24 15:00:00');
INSERT INTO public.timers VALUES (26331, 'gabriel', 12, '2022-10-25 08:00:00', '2022-10-25 15:00:00');
INSERT INTO public.timers VALUES (26322, 'gabriel', 18, '2022-10-26 08:00:00', '2022-10-26 15:00:00');
INSERT INTO public.timers VALUES (27174, 'tester1', 101, '2023-11-27 08:50:44.378572', '2023-11-27 08:52:53.723842');
INSERT INTO public.timers VALUES (27095, 'gabriel', 101, '2023-11-23 11:59:40.135809', '2023-11-23 13:12:44.846113');
INSERT INTO public.timers VALUES (27173, 'angel', 16, '2023-11-27 08:12:19.585264', '2023-11-27 10:20:00');
INSERT INTO public.timers VALUES (27096, 'pablo', 101, '2023-11-23 11:30:00', '2023-11-23 12:28:00');
INSERT INTO public.timers VALUES (26469, 'gabriel', 18, '2023-10-25 08:00:00', '2023-10-25 09:25:50.534941');
INSERT INTO public.timers VALUES (26477, 'gabriel', 18, '2023-10-25 08:00:00', '2023-10-25 09:00:00');
INSERT INTO public.timers VALUES (26479, 'gabriel', 18, '2023-10-25 09:00:00', '2023-10-25 10:00:00');
INSERT INTO public.timers VALUES (26480, 'gabriel', 11, '2023-10-25 09:30:00', '2023-10-25 11:00:00');
INSERT INTO public.timers VALUES (26316, 'angel', 16, '2023-10-23 11:04:08.118249', '2023-10-23 11:33:30.833969');
INSERT INTO public.timers VALUES (26317, 'gabriel', 21, '2023-10-17 00:00:00', '2023-10-25 00:00:00');
INSERT INTO public.timers VALUES (26328, 'gabriel', 12, '2023-10-17 00:00:00', '2023-10-17 07:00:00');
INSERT INTO public.timers VALUES (26353, 'angel', 5, '2023-10-24 10:09:21.439477', '2023-10-24 10:19:08.072457');
INSERT INTO public.timers VALUES (26373, 'angel', 3, '2023-10-24 12:11:46.190271', '2023-10-24 12:37:32.003596');
INSERT INTO public.timers VALUES (26385, 'angel', 3, '2023-10-24 13:07:55.607572', '2023-10-24 13:14:03.372982');
INSERT INTO public.timers VALUES (26389, 'gabriel', 18, '2023-10-24 20:00:00', '2023-10-24 23:00:00');
INSERT INTO public.timers VALUES (27050, 'gabriel', 101, '2023-11-22 08:34:28.296422', '2023-11-22 14:40:00');
INSERT INTO public.timers VALUES (26426, 'gabriel', 18, '2023-10-24 14:21:50.618673', '2023-10-24 18:00:00');
INSERT INTO public.timers VALUES (27202, 'xabier', 120, '2023-11-27 12:21:55.722349', '2023-11-27 14:37:36.288535');
INSERT INTO public.timers VALUES (26474, 'gabriel', 21, '2023-10-25 08:00:00', '2023-10-25 09:30:00');
INSERT INTO public.timers VALUES (26975, 'angel', 36, '2023-11-15 12:00:00', '2023-11-15 14:00:00');
INSERT INTO public.timers VALUES (27097, 'pablo', 11, '2023-11-22 09:06:00', '2023-11-22 10:18:00');
INSERT INTO public.timers VALUES (26483, 'cristina', 15, '2023-10-25 11:25:02.75735', '2023-10-25 11:50:00.795535');
INSERT INTO public.timers VALUES (27175, 'tester1', 101, '2023-11-27 08:53:18.475932', '2023-11-27 08:55:30.453833');
INSERT INTO public.timers VALUES (27198, 'tester1', 101, '2023-11-27 12:11:23.115637', '2023-11-27 12:11:30.319069');
INSERT INTO public.timers VALUES (26462, 'angel', 15, '2023-10-25 07:59:54.943084', '2023-10-25 08:11:35.441988');
INSERT INTO public.timers VALUES (26600, 'sebas', 13, '2023-10-30 08:09:17.630123', '2023-10-30 11:34:00');
INSERT INTO public.timers VALUES (26607, 'sebas', 19, '2023-10-30 08:36:35.761098', '2023-10-30 10:06:00');
INSERT INTO public.timers VALUES (27203, 'tester1', 112, '2023-11-27 12:24:56.649348', '2023-11-27 12:45:56.000032');
INSERT INTO public.timers VALUES (27133, 'gabriel', 18, '2023-10-30 08:00:00', '2023-10-30 14:40:00');
INSERT INTO public.timers VALUES (27134, 'gabriel', 18, '2023-11-13 08:00:00', '2023-11-13 14:40:00');
INSERT INTO public.timers VALUES (28003, 'pablo', 9, '2010-11-12 12:11:10', '2010-11-14 20:11:00');
INSERT INTO public.timers VALUES (27148, 'angel', 22, '2023-11-24 10:23:40.768387', '2023-11-24 10:30:00');
INSERT INTO public.timers VALUES (28000, 'gabriel', 20, '2022-10-09 15:00:00', '2022-10-10 15:00:00');
INSERT INTO public.timers VALUES (28002, 'gabriel', 20, '2022-11-13 00:00:00', '2022-11-13 02:00:00');
INSERT INTO public.timers VALUES (27081, 'pablo', 18, '2022-08-12 00:00:00', '2022-08-12 07:04:00');
INSERT INTO public.timers VALUES (28004, 'sebas', 11, '2022-09-12 00:00:00', '2022-09-12 10:00:00');
INSERT INTO public.timers VALUES (27162, 'angel', 19, '2022-01-02 10:11:24', '2022-01-03 18:10:23');
INSERT INTO public.timers VALUES (27163, 'angel', 19, '2022-02-02 02:02:02', '2022-02-04 02:45:23');
INSERT INTO public.timers VALUES (27003, 'gabriel', 13, '2023-11-16 08:00:00', '2023-11-16 10:00:00');
INSERT INTO public.timers VALUES (27164, 'angel', 20, '2022-04-05 04:00:02', '2022-04-05 17:52:31');
INSERT INTO public.timers VALUES (27165, 'pablo', 19, '2022-03-08 12:23:24', '2022-03-09 13:24:53');
INSERT INTO public.timers VALUES (27166, 'angel', 20, '2022-07-07 21:21:21', '2022-07-08 14:43:04');
INSERT INTO public.timers VALUES (27082, 'pablo', 18, '2022-08-17 00:00:00', '2022-08-17 06:28:32');
INSERT INTO public.timers VALUES (27080, 'pablo', 18, '2023-08-12 00:00:00', '2023-08-12 03:23:44');
INSERT INTO public.timers VALUES (28001, 'gabriel', 18, '2022-10-12 08:00:00', '2022-10-12 15:00:00');
INSERT INTO public.timers VALUES (27176, 'tester1', 101, '2023-11-27 08:55:52.612409', '2023-11-27 08:58:17.958657');
INSERT INTO public.timers VALUES (27178, 'tester1', 101, '2023-11-27 09:01:45.801444', '2023-11-27 09:03:39.126639');
INSERT INTO public.timers VALUES (27153, 'tester1', 112, '2023-11-24 11:00:46.990012', '2023-11-24 11:24:57.880323');
INSERT INTO public.timers VALUES (27180, 'tester1', 101, '2023-11-27 09:06:32.850277', '2023-11-27 09:07:36.761367');
INSERT INTO public.timers VALUES (27199, 'tester1', 79, '2023-11-27 12:11:32.245062', '2023-11-27 12:14:30.407189');
INSERT INTO public.timers VALUES (27099, 'angel', 10, '2023-11-23 12:56:25.791145', '2023-11-23 13:14:34.669181');
INSERT INTO public.timers VALUES (27171, 'angel', 10, '2023-11-25 11:00:00', '2023-11-25 14:47:00');
INSERT INTO public.timers VALUES (27172, 'angel', 11, '2023-11-01 08:00:00', '2023-11-01 13:26:00');
INSERT INTO public.timers VALUES (27124, 'sebas', 22, '2023-11-20 09:00:00', '2023-11-23 10:00:00');
INSERT INTO public.timers VALUES (27200, 'angel', 105, '2023-11-27 12:14:21.457327', '2023-11-27 12:18:52.017863');
INSERT INTO public.timers VALUES (27109, 'lucia', 112, '2023-11-23 13:41:21.196732', '2023-11-23 13:45:43.331718');
INSERT INTO public.timers VALUES (27135, 'angel', 22, '2023-11-24 09:16:41.3714', '2023-11-24 09:29:57.059811');
INSERT INTO public.timers VALUES (27177, 'tester1', 101, '2023-11-27 08:58:47.730678', '2023-11-27 09:01:11.472158');
INSERT INTO public.timers VALUES (27183, 'tester1', 101, '2023-11-27 09:10:40.450899', '2023-11-27 09:13:06.274646');
INSERT INTO public.timers VALUES (27186, 'tester1', 101, '2023-11-27 09:13:26.224982', '2023-11-27 09:15:38.371651');
INSERT INTO public.timers VALUES (26969, 'sebas', 18, '2023-11-13 08:00:00', '2023-11-13 11:00:00');
INSERT INTO public.timers VALUES (26982, 'angel', 7, '2023-08-16 00:00:00', '2023-08-16 04:00:00');
INSERT INTO public.timers VALUES (27125, 'angel', 9, '2023-11-23 14:35:06.90309', '2023-11-23 14:55:00');
INSERT INTO public.timers VALUES (27100, 'lucia', 79, '2023-11-23 12:59:04.104651', '2023-11-23 13:00:59.209781');
INSERT INTO public.timers VALUES (27149, 'tester1', 101, '2023-11-24 10:50:21.46431', '2023-11-24 10:50:28.746916');
INSERT INTO public.timers VALUES (27179, 'tester1', 101, '2023-11-27 09:03:58.362243', '2023-11-27 09:05:57.573466');
INSERT INTO public.timers VALUES (27181, 'tester1', 101, '2023-11-27 09:07:53.289694', '2023-11-27 09:10:00.954258');
INSERT INTO public.timers VALUES (27031, 'angel', 75, '2023-10-27 09:00:00', '2023-10-27 10:00:00');
INSERT INTO public.timers VALUES (27182, 'pablo', 18, '2022-08-13 10:02:02', '2022-08-13 17:31:29');
INSERT INTO public.timers VALUES (27184, 'pablo', 18, '2023-01-04 12:01:44', '2023-01-04 17:45:31');
INSERT INTO public.timers VALUES (27160, 'angel', 11, '2023-11-26 21:25:58.147331', '2023-11-26 21:30:48.937317');
INSERT INTO public.timers VALUES (27185, 'pablo', 18, '2023-02-11 14:21:00', '2023-02-11 19:42:12');
INSERT INTO public.timers VALUES (27187, 'pablo', 18, '2023-02-12 14:21:00', '2023-02-12 21:06:00');
INSERT INTO public.timers VALUES (26973, 'angel', 17, '2023-11-15 08:00:00', '2023-11-15 11:00:00');
INSERT INTO public.timers VALUES (27188, 'pablo', 18, '2023-02-13 14:21:00', '2023-02-13 22:11:00');
INSERT INTO public.timers VALUES (27189, 'pablo', 18, '2023-02-15 08:43:00', '2023-02-15 15:36:00');
INSERT INTO public.timers VALUES (26983, 'gabriel', 15, '2023-11-15 10:00:00', '2023-11-15 11:00:00');
INSERT INTO public.timers VALUES (27190, 'pablo', 18, '2023-02-16 07:55:00', '2023-02-16 14:51:00');
INSERT INTO public.timers VALUES (27191, 'pablo', 18, '2023-02-17 14:21:00', '2023-02-17 22:03:00');
INSERT INTO public.timers VALUES (27192, 'pablo', 18, '2023-02-18 14:21:00', '2023-02-18 19:31:00');
INSERT INTO public.timers VALUES (27193, 'pablo', 18, '2022-02-19 10:50:00', '2022-02-23 01:21:00');
INSERT INTO public.timers VALUES (27194, 'pablo', 18, '2022-02-25 10:50:00', '2022-02-28 10:50:00');
INSERT INTO public.timers VALUES (27195, 'angel', 21, '2022-10-17 00:00:00', '2022-10-18 00:00:00');
INSERT INTO public.timers VALUES (27197, 'pablo', 18, '2023-05-16 00:00:00', '2023-05-16 08:00:00');
INSERT INTO public.timers VALUES (27011, 'gabriel', 13, '2023-11-16 12:00:00', '2023-11-16 14:00:00');
INSERT INTO public.timers VALUES (27150, 'tester1', 79, '2023-11-24 10:50:31.630876', '2023-11-24 11:00:46.997109');
INSERT INTO public.timers VALUES (27028, 'gabriel', 78, '2023-11-17 12:27:41.76714', '2023-11-17 13:02:06.891311');
INSERT INTO public.timers VALUES (27032, 'angel', 76, '2023-11-03 09:00:00', '2023-11-03 09:48:00');
INSERT INTO public.timers VALUES (27088, 'lucia', 77, '2023-11-08 01:00:00', '2023-11-08 01:55:00');
INSERT INTO public.timers VALUES (27085, 'lucia', 78, '2023-11-17 10:00:00', '2023-11-17 11:52:00');
INSERT INTO public.timers VALUES (27101, 'lucia', 79, '2023-11-23 13:13:28.774443', '2023-11-23 13:40:41.078855');
INSERT INTO public.timers VALUES (26688, 'sebas', 18, '2023-10-30 10:22:12.763667', '2023-10-30 16:54:00');
INSERT INTO public.timers VALUES (26908, 'gabriel', 18, '2023-11-03 06:00:00', '2023-11-03 08:00:00');
INSERT INTO public.timers VALUES (26912, 'gabriel', 18, '2023-11-03 09:00:00', '2023-11-03 11:00:00');
INSERT INTO public.timers VALUES (26915, 'gabriel', 11, '2023-11-03 12:00:00', '2023-11-03 14:00:00');
INSERT INTO public.timers VALUES (26916, 'gabriel', 11, '2023-11-03 14:30:00', '2023-11-03 15:30:00');
INSERT INTO public.timers VALUES (26935, 'gabriel', 4, '2023-11-06 08:00:00', '2023-11-06 10:00:00');
INSERT INTO public.timers VALUES (26939, 'sebas', 9, '2023-11-07 08:00:00', '2023-11-07 09:30:00');


--
-- TOC entry 3021 (class 0 OID 291613)
-- Dependencies: 198
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole VALUES (0, 'admin', '<?xml version="1.0" encoding="UTF-8"?><security></security>');


--
-- TOC entry 3027 (class 0 OID 291653)
-- Dependencies: 204
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole_server_permission VALUES (0, 0, 0);


--
-- TOC entry 3025 (class 0 OID 291642)
-- Dependencies: 202
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tserver_permission VALUES (0, 'com.ontimize.jee.common.services.user.IUserInformationService/getUserInformation');


--
-- TOC entry 3029 (class 0 OID 291671)
-- Dependencies: 206
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tsetting VALUES (0, 'mail_host', 'smtp.gmail.com', 'Host del servidor');
INSERT INTO public.tsetting VALUES (1, 'mail_port', '587', 'Puerto del servidor de email');
INSERT INTO public.tsetting VALUES (2, 'mail_protocol', 'smtp', 'Protocolo de env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (3, 'mail_user', 'mi.mail@example.com', 'Usuario para el env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (4, 'mail_password', 'mis_credenciales', 'Password del servidor de mail');
INSERT INTO public.tsetting VALUES (5, 'mail_encoding', 'UTF-8', 'Codificaci\u005cu00f3n de mails');
INSERT INTO public.tsetting VALUES (6, 'mail_properties', 'mail.smtp.auth:true;mail.smtp.starttls.enable:true;', 'Propiedades de mails');
INSERT INTO public.tsetting VALUES (7, 'report_folder', 'C:/applications/ontimize-boot-app/reports', 'Carpeta de las plantillas de report');


--
-- TOC entry 3019 (class 0 OID 291601)
-- Dependencies: 196
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('demo', 'demouser', 'manuel', 'demo', NULL, '44460713B', NULL, NULL, NULL);
INSERT INTO public.tuser VALUES ('sebas', 'demosebas', 'sebas', 'solano', 'sebas@mail.com', '44460714C', NULL, '2023-10-23 10:04:47.703302', true);
INSERT INTO public.tuser VALUES ('angel', 'demoAngel', 'angel', 'miranda', NULL, NULL, NULL, '2023-10-23 10:08:13.667277', true);
INSERT INTO public.tuser VALUES ('gabriel', 'demoGabriel', 'gabriel', 'motto', NULL, NULL, NULL, '2023-10-23 10:08:13.667277', true);
INSERT INTO public.tuser VALUES ('lucia', 'DemoPassword', 'lucia', NULL, NULL, NULL, NULL, '2023-11-23 11:34:08.014032', true);
INSERT INTO public.tuser VALUES ('cristina', 'password', 'cristina', 'admin', 'admin', '44460714C', NULL, '2023-10-06 10:55:12.188905', true);
INSERT INTO public.tuser VALUES ('pablo', 'demoXabier', 'pablo', '', NULL, NULL, NULL, '2023-10-23 10:08:13.667277', true);
INSERT INTO public.tuser VALUES ('tester1', 'passtester1', 'tester1', 'tester1', NULL, NULL, NULL, '2023-11-07 11:30:12.581985', true);
INSERT INTO public.tuser VALUES ('tester2', 'passtester2', 'tester2', 'tester2', NULL, NULL, NULL, '2023-11-07 11:30:12.589698', true);
INSERT INTO public.tuser VALUES ('xabier', 'quesodecabra', 'xabier', NULL, NULL, NULL, NULL, '2023-11-27 12:19:50.330113', true);


--
-- TOC entry 3031 (class 0 OID 291682)
-- Dependencies: 208
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_preference VALUES (0, 'user_preference', 'demo', 'Iw0KI1R1ZSBNYXkgMTYgMTI6NTc6MDYgQ0VTVCAyMDE3DQpkZW1vX2FwcF9zdGF0dXNfYmFyX3Zpc2libGU9eWVzDQpkZW1vX2FkanVzdF90cmVlX3NwYWNlPXRydWUNCmRlbW9fYXBwX3dpbmRvd19zdGF0ZT0wDQpkZW1vX3RhYmxlX2NvbmZfc29ydF9maWx0ZXJfZm9ybUN1c3RvbWVyLnhtbF9DdXN0b21lclNlcnZpY2UuY3VzdG9tZXJfVEVTVD1udWxsO251bGw7U1VSTkFNRVw9OThcOjF8SURcPTc1XDoyfE5BTUVcPTk5XDozfENVU1RPTUVSVFlQRUlEXD0wXDo0fENVU1RPTUVSSURcPTEyNVw6NXxBRERSRVNTXD0xMjNcOjZ8UEhPTkVcPTEyMVw6N3xTVEFSVERBVEVcPTEzNlw6OHxMT05HSVRVREVcPTExNlw6OXxMQVRJVFVERVw9MTEzXDoxMHxFTUFJTFw9MTcwXDoxMnw7QkFTRTY0ck8wQUJYTnlBQk5xWVhaaExuVjBhV3d1U0dGemFIUmhZbXhsRTdzUEpTRks1TGdEQUFKR0FBcHNiMkZrUm1GamRHOXlTUUFKZEdoeVpYTm9iMnhrZUhBL1FBQUFBQUFBQ0hjSUFBQUFDd0FBQUFCNA0KZGVtb190YWJsZV9jb25mX3NvcnRfZmlsdGVyX2NvbmZpZ3VyYXRpb25zX2Zvcm1DdXN0b21lci54bWxfQ3VzdG9tZXJTZXJ2aWNlLmN1c3RvbWVyPVRFU1QNCmRlbW9fdGFibGVfY29udHJvbF9wYW5lbF9mb3JtQWNjb3VudHMtZGV0YWlsLnhtbF9Nb3ZlbWVudFNlcnZpY2UubW92ZW1lbnQ9Z3JvdXB0YWJsZWtleTtkZWZhdWx0Y2hhcnRidXR0b247ZXhjZWxleHBvcnRidXR0b247c3Vtcm93YnV0dG9uO2NhbGN1bGVkY29sc2J1dHRvbjtwcmludGluZ2J1dHRvbjtmaWx0ZXJzYXZlYnV0dG9uO3Zpc2libGVjb2xzYnV0dG9uO2h0bWxleHBvcnRidXR0b247Y29weWJ1dHRvbjtncm91cHRhYmxla2V5O2luc2VydGJ1dHRvbjtyZWZyZXNoYnV0dG9uDQpkZW1vX2Zvcm1CcmFuY2hlcy1kZXRhaWwueG1sPTg4MDs1MDU7LTExNTA7MzY5DQpkZW1vX2RldGFpbF9kaWFsb2dfc2l6ZV9wb3NpdGlvbl9mb3JtQ3VzdG9tZXIueG1sX0N1c3RvbWVyU2VydmljZS5jdXN0b21lcj03NDk7MzUwOy0xOTA1OzM5MQ0KZGVtb19hcHBfdG9vbGJhcl9sb2NhdGlvbj1Ob3J0aA0KZGVtb19hcHBfd2luZG93X3Bvc2l0aW9uPS0xNTgwOzExDQpkZW1vX2FwcF93aW5kb3dfc2l6ZT0xNTg0OzEwNDQNCmRlbW9fZm9ybUVtcGxveWVlcy1kZXRhaWwueG1sPTExMTY7NzM5OzYxMDsxOTUNCmRlbW9fZm9ybUFjY291bnRzLWRldGFpbC54bWw9OTE1OzUwMDstMTE1MDszNjkNCg==');


--
-- TOC entry 3023 (class 0 OID 291624)
-- Dependencies: 200
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_role VALUES (0, 0, 'demo');


--
-- TOC entry 3041 (class 0 OID 294044)
-- Dependencies: 218
-- Data for Name: users_projects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_projects VALUES (150, 99, 'gabriel');
INSERT INTO public.users_projects VALUES (201, 99, 'lucia');
INSERT INTO public.users_projects VALUES (216, 138, 'angel');
INSERT INTO public.users_projects VALUES (130, 1, 'sebas');
INSERT INTO public.users_projects VALUES (131, 3, 'gabriel');
INSERT INTO public.users_projects VALUES (132, 5, 'sebas');
INSERT INTO public.users_projects VALUES (133, 5, 'gabriel');
INSERT INTO public.users_projects VALUES (220, 4, 'pablo');
INSERT INTO public.users_projects VALUES (2, 1, 'cristina');
INSERT INTO public.users_projects VALUES (137, 5, 'angel');
INSERT INTO public.users_projects VALUES (35, 5, 'cristina');
INSERT INTO public.users_projects VALUES (36, 3, 'sebas');
INSERT INTO public.users_projects VALUES (37, 3, 'angel');
INSERT INTO public.users_projects VALUES (215, 99, 'tester1');
INSERT INTO public.users_projects VALUES (142, 5, 'tester1');
INSERT INTO public.users_projects VALUES (148, 1, 'tester1');
INSERT INTO public.users_projects VALUES (45, 4, 'sebas');
INSERT INTO public.users_projects VALUES (46, 4, 'angel');
INSERT INTO public.users_projects VALUES (143, 5, 'tester2');
INSERT INTO public.users_projects VALUES (48, 4, 'gabriel');
INSERT INTO public.users_projects VALUES (49, 2, 'sebas');
INSERT INTO public.users_projects VALUES (50, 2, 'angel');
INSERT INTO public.users_projects VALUES (149, 1, 'tester2');
INSERT INTO public.users_projects VALUES (52, 2, 'gabriel');
INSERT INTO public.users_projects VALUES (223, 2, 'lucia');
INSERT INTO public.users_projects VALUES (54, 1, 'angel');
INSERT INTO public.users_projects VALUES (224, 139, 'xabier');
INSERT INTO public.users_projects VALUES (56, 1, 'gabriel');
INSERT INTO public.users_projects VALUES (225, 2, 'xabier');
INSERT INTO public.users_projects VALUES (180, 99, 'sebas');
INSERT INTO public.users_projects VALUES (200, 132, 'angel');
INSERT INTO public.users_projects VALUES (38, 3, 'pablo');
INSERT INTO public.users_projects VALUES (42, 5, 'pablo');
INSERT INTO public.users_projects VALUES (51, 2, 'pablo');
INSERT INTO public.users_projects VALUES (55, 1, 'pablo');
INSERT INTO public.users_projects VALUES (181, 99, 'pablo');


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 211
-- Name: projects_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_p_id_seq', 139, true);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 213
-- Name: tasks_t_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_t_id_seq', 121, true);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ti18n_id_i18n_seq', 1, false);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 215
-- Name: timers_tm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.timers_tm_id_seq', 27203, true);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_id_rolename_seq', 1, false);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 203
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_server_permission_id_role_server_permission_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tserver_permission_id_server_permission_seq', 1, false);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tsetting_id_setting_seq', 1, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_preference_id_user_preference_seq', 1, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_role_id_user_role_seq', 1, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_projects_up_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_projects_up_id_seq', 225, true);


--
-- TOC entry 2882 (class 2606 OID 292712)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (t_id);


--
-- TOC entry 2878 (class 2606 OID 291698)
-- Name: ti18n ti18n_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT ti18n_pkey PRIMARY KEY (id_i18n);


--
-- TOC entry 2884 (class 2606 OID 292721)
-- Name: timers timers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT timers_pkey PRIMARY KEY (tm_id);


--
-- TOC entry 2880 (class 2606 OID 292616)
-- Name: projects tprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT tprojects_pkey PRIMARY KEY (p_id);


--
-- TOC entry 2866 (class 2606 OID 291621)
-- Name: trole trole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT trole_pkey PRIMARY KEY (id_rolename);


--
-- TOC entry 2872 (class 2606 OID 291658)
-- Name: trole_server_permission trole_server_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT trole_server_permission_pkey PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2870 (class 2606 OID 291650)
-- Name: tserver_permission tserver_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT tserver_permission_pkey PRIMARY KEY (id_server_permission);


--
-- TOC entry 2874 (class 2606 OID 291679)
-- Name: tsetting tsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT tsetting_pkey PRIMARY KEY (id_setting);


--
-- TOC entry 2864 (class 2606 OID 291610)
-- Name: tuser tuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_pkey PRIMARY KEY (user_);


--
-- TOC entry 2876 (class 2606 OID 291690)
-- Name: tuser_preference tuser_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT tuser_preference_pkey PRIMARY KEY (id_user_preference);


--
-- TOC entry 2868 (class 2606 OID 291629)
-- Name: tuser_role tuser_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT tuser_role_pkey PRIMARY KEY (id_user_role);


--
-- TOC entry 2886 (class 2606 OID 294049)
-- Name: users_projects users_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_projects
    ADD CONSTRAINT users_projects_pkey PRIMARY KEY (up_id);


--
-- TOC entry 2888 (class 2606 OID 294662)
-- Name: users_projects users_projects_un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_projects
    ADD CONSTRAINT users_projects_un UNIQUE (p_id, user_);


--
-- TOC entry 2890 (class 2606 OID 291635)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2891 (class 2606 OID 291659)
-- Name: trole_server_permission fk_trole_server_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_trole_server_permission FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2892 (class 2606 OID 291664)
-- Name: trole_server_permission fk_tserver_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_tserver_permission FOREIGN KEY (id_server_permission) REFERENCES public.tserver_permission(id_server_permission);


--
-- TOC entry 2889 (class 2606 OID 291630)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2893 (class 2606 OID 294962)
-- Name: tasks tasks_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_fk FOREIGN KEY (p_id) REFERENCES public.projects(p_id) ON UPDATE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 294967)
-- Name: timers timers_t_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT timers_t_id_fkey FOREIGN KEY (t_id) REFERENCES public.tasks(t_id) ON UPDATE CASCADE;


--
-- TOC entry 2895 (class 2606 OID 294972)
-- Name: timers timers_user__fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT timers_user__fkey FOREIGN KEY (user_) REFERENCES public.tuser(user_) ON UPDATE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 295042)
-- Name: users_projects users_projects_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_projects
    ADD CONSTRAINT users_projects_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.projects(p_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2896 (class 2606 OID 295037)
-- Name: users_projects users_projects_user__fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_projects
    ADD CONSTRAINT users_projects_user__fkey FOREIGN KEY (user_) REFERENCES public.tuser(user_) ON UPDATE CASCADE;


-- Completed on 2023-11-29 15:11:16

--
-- PostgreSQL database dump complete
--


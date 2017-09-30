--Consultas

CREATE TABLE CAMPEONATO(
       id_campeonato NUMBER(5),     
       ds_campeonato VARCHAR2(50),
       fecha_inicio DATE,
       fecha_fin DATE,
       tipo_campeonato VARCHAR2(20)
);


CREATE TABLE EQUIPO(
       id_equipo NUMBER(5),       
       ds_equipo VARCHAR2(50),
       ciudad    VARCHAR2(50)
);


CREATE TABLE EQUIPOS_X_CAMPEONATO
(
       id_campeonato NUMBER(5),
       id_equipo NUMBER(5)
);


CREATE TABLE JUGADOR(
       id_jugador NUMBER(5),
       ds_jugador VARCHAR2(50),
       fecha_nacimiento DATE
);

CREATE TABLE JUGADORES_X_EQUIPO(
       id_campeonato NUMBER(5),
       id_equipo NUMBER(5),
       id_jugador NUMBER(5)
);

CREATE TABLE JUEGO(
       id_juego NUMBER(10),
       id_campeonato NUMBER(5),
       fecha DATE,
       id_equipo_local NUMBER(5),
       id_equipo_visitante NUMBER(5),
       marcador_equipo_local NUMBER(5),
       marcador_equipo_visitante NUMBER(5)
);

CREATE TABLE ANOTACION(
       id_anotacion NUMBER(18),
       id_juego NUMBER(5),
       id_jugador NUMBER(5),  
       id_equipo_anotador NUMBER(5),
       minuto NUMBER(5),
       tiempo NUMBER(5)
);

--ADICCIONAR COLUMNA
ALTER TABLE JUGADORES_X_EQUIPO ADD NUMERO_CAMISETA NUMBER(5);

--CONSTRAINT
--PRIMARY KEYS
ALTER TABLE CAMPEONATO ADD CONSTRAINT CAMPEONATO_PK PRIMARY KEY (id_campeonato);
ALTER TABLE EQUIPO ADD CONSTRAINT EQUIPO_PK PRIMARY KEY (id_equipo);
ALTER TABLE EQUIPOS_X_CAMPEONATO ADD CONSTRAINT EQUIPOS_X_CAMPEONATO_PK PRIMARY KEY (id_campeonato,id_equipo);
ALTER TABLE JUGADOR ADD CONSTRAINT JUGADOR_PK PRIMARY KEY (id_jugador);
ALTER TABLE JUGADORES_X_EQUIPO ADD CONSTRAINT JUGADORES_X_EQUIPO_PK PRIMARY KEY (id_campeonato,id_equipo, id_jugador);
ALTER TABLE JUEGO ADD CONSTRAINT JUEGO_PK PRIMARY KEY (id_juego);
ALTER TABLE ANOTACION ADD CONSTRAINT ANOTACION_PK PRIMARY KEY (id_anotacion);
ALTER TABLE CAMPEONATO MODIFY ds_campeonato NOT NULL;
ALTER TABLE EQUIPO MODIFY ds_equipo NOT NULL;
ALTER TABLE JUGADOR MODIFY ds_jugador NOT NULL;
--UNIQUE
ALTER TABLE EQUIPO ADD CONSTRAINT EQUIPO_UN UNIQUE(ds_equipo);
--FORAIGN KEYS
ALTER TABLE EQUIPOS_X_CAMPEONATO ADD CONSTRAINT EQUIPOS_X_CAMPEONATO_FK1 FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato);
ALTER TABLE EQUIPOS_X_CAMPEONATO ADD CONSTRAINT EQUIPOS_X_CAMPEONATO_FK2 FOREIGN KEY (id_equipo) REFERENCES EQUIPO(id_equipo);
ALTER TABLE JUGADORES_X_EQUIPO ADD CONSTRAINT JUGADORES_X_EQUIPO_FK1 FOREIGN KEY (id_jugador) REFERENCES JUGADOR(id_jugador);
ALTER TABLE JUGADORES_X_EQUIPO ADD CONSTRAINT JUGADORES_X_EQUIPO_FK2 FOREIGN KEY (id_equipo) REFERENCES EQUIPO(id_equipo);
ALTER TABLE JUGADORES_X_EQUIPO ADD CONSTRAINT JUGADORES_X_EQUIPO_FK3 FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato);
--CHECKS
ALTER TABLE CAMPEONATO ADD CONSTRAINT CAMPEONATO_CK1 CHECK (fecha_inicio < fecha_fin);
ALTER TABLE CAMPEONATO ADD CONSTRAINT CAMPEOATO_CK2 CHECK (tipo_campeonato IN ('MASCULINO','FEMENINO'));
ALTER TABLE ANOTACION ADD CONSTRAINT ANOTACION_CK1 CHECK  (minuto > 0 );

--DEFAULTS
ALTER TABLE JUEGO MODIFY marcador_equipo_local DEFAULT 0;
ALTER TABLE JUEGO MODIFY marcador_equipo_visitante DEFAULT 0;










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


--Group by agrupar datos
--Cuente el número de goles por jugador para un equipo
select count(1) goles, 
       j.ds_jugador,
       e.ds_equipo
from jugador j,
     jugadores_x_equipo je,
     anotacion a,
     equipo e
where j.id_jugador = je.id_jugador
and   j.id_jugador = a.id_jugador
and   je.id_equipo = e.id_equipo
and   je.id_equipo = 1
group by j.ds_jugador, e.ds_equipo;

select * from jugador
select * from jugadores_x_equipo
select * from anotacion;
select * from equipo;

--Having una condición
--Consulte los jugadores, con su equipo, que hayan marcado 2 goles o má
select count(1) goles, 
       j.ds_jugador,
       e.ds_equipo
from jugador j,
     jugadores_x_equipo je,
     anotacion a,
     equipo e
where j.id_jugador = je.id_jugador
and   j.id_jugador = a.id_jugador
and   je.id_equipo = e.id_equipo
and   je.id_equipo = 1
group by j.ds_jugador, e.ds_equipo
having count(1) >=2;



SELECT NVL(NULL, '0') FROM  DUAL;



SELECT NVL2(NULL,  '0', '1') FROM DUAL;


SELECT DECODE('1', '1', 1, 0 ) FROM DUAL; 

SELECT
   CASE '1' WHEN '1' THEN 'PRIMERO'
            WHEN '2' THEN 'SEGUNDO'
            ELSE 'DEFAULT'
   END
FROM DUAL;


SELECT TO_CHAR(-1234566666.56) FROM DUAL;


SELECT TO_CHAR(-1234566666.56, 'L9G999G999G999D9PR') FROM DUAL;


SELECT TO_CHAR(SYSDATE,'DD-Mon-YYYY HH24:MI:SS' ) FROM DUAL;

--Un IN es un or
--
SELECT * FROM JUGADOR WHERE ID_JUGADOR IN (1,2, NULL);


--jugadores y fechas de nacimientos
--600 jugadores
SELECT PAGINACION.DS_JUGADOR,
       PAGINACION.FECHA_NACIMIENTO,
       PAGINACION.NUMERO_REGISTRO,
       PAGINACION.TOTAL_REGISTROS
FROM (
         SELECT 
             DATOS.DS_JUGADOR,
             DATOS.FECHA_NACIMIENTO,
             ROWNUM NUMERO_REGISTRO,
             COUNT(1) OVER (PARTITION BY 1) TOTAL_REGISTROS 
         FROM 
              (
                  SELECT J.DS_JUGADOR, J.FECHA_NACIMIENTO
                  FROM   JUGADOR J
                  ORDER BY J.DS_JUGADOR
               ) DATOS
      )PAGINACION      
WHERE PAGINACION.NUMERO_REGISTRO >= 1 AND
      PAGINACION.NUMERO_REGISTRO <= 10





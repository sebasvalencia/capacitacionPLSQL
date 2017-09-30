--Creamos usuario 
create user CEIBABD identified by PASS;

--Asigna todos los privilegios a la bd
grant all privileges to CEIBABD;

--Nos volvemos a conectar con el usuario y la contraseña a la BD = XE de modo Normal

--Creamos una tabla
CREATE TABLE PERSONAS(
       CONSECUTIVO        NUMBER(10),
       TIPOIDENTIFICACION CHAR(2),
       IDENTIFICACION     VARCHAR2(30),
       NOMBRE             VARCHAR2(100),
       SEXO               CHAR(1),
       FECHANACIMIENTO    DATE
);

--Insertamos un registro
INSERT INTO PERSONAS(CONSECUTIVO, TIPOIDENTIFICACION, IDENTIFICACION, NOMBRE, SEXO, FECHANACIMIENTO)
VALUES (1, 'CC', '254856545', 'LIONEL MESA', 'M', to_date('09-06-1992', 'dd-mm-yyyy'));
COMMIT;

--Creamos llave primaria
--Una llave primaria no puede ser nula
ALTER TABLE PERSONAS
ADD CONSTRAINT CLAVEPRIMARIA PRIMARY KEY (CONSECUTIVO);
COMMIT;

--Creamos la tabla TIPODE_DOCUMENTO
CREATE TABLE TIPOS_DOCUMENTO(
       CODIGO      CHAR(2) PRIMARY KEY,--SE PONE LA LLAVE
       DESCRIPCION VARCHAR2(20) NOT NULL
);

--Creamos la llave foranea
ALTER TABLE PERSONAS
ADD CONSTRAINT TIPOS_FK FOREIGN KEY(TIPOIDENTIFICACION)
REFERENCES TIPOS_DOCUMENTO(CODIGO);
--SALE UN ERROR , PRIMERO INSERTAR DATOS

--Insertamos información
INSERT INTO TIPOS_DOCUMENTO (CODIGO, DESCRIPCION )
VALUES('CC', 'Cédula ciudadanía');
COMMIT;
--Listamos los tipos de documento
SELECT * FROM TIPOS_DOCUMENTO;

--Creamos un constraint UNIQUE para el campo identificación
ALTER TABLE PERSONAS
ADD CONSTRAINT IDUNICO_UK
UNIQUE (IDENTIFICACION);

--Creamos un check constraint para el campo sexo F y M
ALTER TABLE PERSONAS
ADD CONSTRAINT SEXO_CK
CHECK(SEXO IN ('M', 'F'));

--Listamos los constraint
SELECT * FROM ALL_CONSTRAINTS WHERE OWNER = 'CEIBABD';

--Organizar errores
INSERT INTO PERSONAS
(CONSECUTIVO, TIPOIDENTIFICACION, IDENTIFICACION, NOMBRE, SEXO, FECHANACIMIENTO)
VALUES (2, 'CC', '254856546', 'CHRISTIAN ROLANDO', 'M', to_date('09-06-1992', 'dd-mm-yyyy'));
COMMIT;

--Valida que lo que se inserta en el campo sea mayúsculas
alter table PERSONAS
  add constraint PERSONAS_CK2
  check (NOMBRE = UPPER(NOMBRE));

--Agregamos un nuevo campo a la tabla NROHIJOS por defecto sea 0
ALTER TABLE PERSONAS ADD NROHIJOS NUMBER(2) DEFAULT 0;

--Listamos la información de la tabla
SELECT * FROM PERSONAS;

--Crear otro usuario
CREATE USER CEIBACONSULTAS IDENTIFIED BY PASS;
GRANT CREATE SESSION TO CEIBACONSULTAS;
grant select on PERSONAS to CEIBACONSULTAS;

--Create un sinonimo
CREATE OR REPLACE PUBLIC SYNONYM PERSONAS FOR CEIBABD.PERSONAS;











prompt Importing table CAMPEONATO...
set feedback off
set define off
insert into CAMPEONATO (ID_CAMPEONATO, DS_CAMPEONATO, FECHA_INICIO, FECHA_FIN, TIPO_CAMPEONATO)
values (1, 'LIGA AGUILA', to_date('21-01-2017', 'dd-mm-yyyy'), to_date('17-06-2017', 'dd-mm-yyyy'), 'MASCULINO');

prompt Done.

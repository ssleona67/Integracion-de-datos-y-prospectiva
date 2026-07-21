insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values ('NIT','10','Solipo Soluciones', 'PYME', 'INACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT', '09876543', 'Hola', 'Empresa grande', 'ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('CC', '10267399087', 'Alfredo Arango', 'Persona Natural', 'ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('CC', '256478392', 'Juanita', 'PYME', 'ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','3','Claudio','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','8','Claudia','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','727272','Mario','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC','5829574','Jean','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','1111','Marta','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC','98764','Ramiro Yepes','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC','22222222','Catalunya','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','447','Comercializadora LOL','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('NIT','223', 'Colegio privado Pedro','INACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC','6676767','Ignacio Pepo','INACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT','1000','Claude', 'Empresa mediana','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT','09909','Maria', 'Empresa mediana','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT','8383838','Mariana', 'Empresa grande','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT','88888','Marie', 'PYME','ACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT', '1108345855', 'Aguamartina Decoraciones', 'PYME', 'INACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento, estado)values('NIT', '98582194','Pepayork S.A', 'Sociedad Anonima', 'INACTIVO');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento)values('CC','11983467','Lady Martinez','Emprendimeinto');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento)values('CC','12345678','Juan Nito','PYME');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento)values('NIT','1026848982','Pepo Florez','Emprendimiento');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento)values('CC','349856','Carla Osorio','Persona Juridica');
insert into ar_clientes2 (tipo_documento, num_documento, nombre, segmento)values('NIT','9994446663','Industrias Cemento','Multinacional');

--Inserciones Invalidas


--      Caso A: Duplicado 
--insert into ar_clientes2(tipo_documento, num_documento, nombre, segmento)values('NIT','9994446663','Industrias Cemento','Multinacional');
--Error report - ORA-00001: unique constraint (G05_E00002.UQ_AR_CLIENTES) violated
--correccion:
insert into ar_clientes2(tipo_documento, num_documento, nombre, segmento)values('CC','4446663','Industrias Cemento','Multinacional');

--      Caso B: Estado Invalido 
--insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC', '98582194','Pepayork S.A', 'NO ACTIVO');
--Error report - ORA-02290: check constraint (G05_E00002.CK_AR_CLIENTES_ESTADO) violated
--correccio
insert into ar_clientes2 (tipo_documento, num_documento, nombre, estado)values('CC', '98582194','Pepayork S.A', 'INACTIVO');


--      Caso C: Falta un No Null
--insert into ar_clientes2 (segmento, estado)values('PYME', 'INACTIVO');
--Error report - ORA-01400: cannot insert NULL into ("G05_E00002"."AR_CLIENTES2"."TIPO_DOCUMENTO")
--correccion:
insert into ar_clientes2 (tipo_documento, num_documento, nombre,segmento, estado)values('CC','8111','Adiela Restrepo','PYME', 'INACTIVO');

select * from ar_clientes2;

-- 4.Commit y rollback 
--SELECT COUNT(*) FROM ar_clientes2;
--Count: 28

--rollback;

--SELECT COUNT(*) FROM ar_clientes2;
--Count: 25 

--por que pasa eso: rollback solo elimina los datos que no han sido guardados con commit. Al inicio da 28, que son los 25 usuarios + 3 de correccion de 
--inserciones invalidas, los cuales no estan guardados. Luego al ejecutar rollback y pedirle que me de la cuenta de ar_clientes, me da solo los 25 
--guardados con commit


--1. ¿Qué evita el UNIQUE(tipo_documento, num_documento) en un proyecto BI?
--      R//= en clase se menciono que UNIQUE ayuda a mantener la integralidad de los datos, ya que bloquea los datos imposibles, tales como tener dos
--          clientes con la misma identificacion

--2. ¿Por qué DEFAULT ayuda a estandarizar datos en una organización?
--      R//= si no se proporciona un dato, el motor de base de datos completa automáticamente el valor definido en DEFAULT. 
--           Esto ayuda a mantener la consistencia de los registros y a simplificar la inserción de datos. (fuente: https://aprendersql.es/glosario-sql/default/)

--3. ¿Qué diferencia práctica viste entre ROLLBACK y COMMIT?
--      R//= Commit protege datos al guardarlos y rollback corrige 














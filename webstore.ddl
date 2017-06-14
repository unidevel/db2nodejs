-- This CLP file was created using DB2LOOK Version "11.1" 
-- Timestamp: Wed Jun 14 18:19:14 2017
-- Database Name: WEBSTORE       
-- Database Manager Version: DB2/LINUXX8664 Version 11.1.2.2
-- Database Codepage: 1208
-- Database Collating Sequence is: SYSTEM_819
-- Alternate collating sequence(alt_collate): null
-- varchar2 compatibility(varchar2_compat): OFF


CONNECT TO WEBSTORE;

------------------------------------------------
-- DDL Statements for Schemas
------------------------------------------------

-- Running the DDL below will explicitly create a schema in the
-- new database that corresponds to an implicitly created schema
-- in the original database.

CREATE SCHEMA "WEBSTORE";



------------------------------------------------
-- DDL Statements for Table "WEBSTORE"."CUSTOMER"
------------------------------------------------
 

CREATE TABLE "WEBSTORE"."CUSTOMER"  (
		  "C_SALUTATION" VARCHAR(5 OCTETS) , 
		  "C_LAST_NAME" VARCHAR(20 OCTETS) , 
		  "C_FIRST_NAME" VARCHAR(20 OCTETS) , 
		  "C_CUSTOMER_SK" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "WEBSTORE"."CUSTOMER"

ALTER TABLE "WEBSTORE"."CUSTOMER" 
	ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY
		("C_CUSTOMER_SK")
	NOT ENFORCED;



ALTER TABLE "WEBSTORE"."CUSTOMER" ALTER COLUMN "C_CUSTOMER_SK" RESTART WITH 221;

------------------------------------------------
-- DDL Statements for Table "WEBSTORE"."INVENTORY"
------------------------------------------------
 

CREATE TABLE "WEBSTORE"."INVENTORY"  (
		  "INV_ITEM_SK" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "INV_QUANTITY_ON_HAND" INTEGER NOT NULL WITH DEFAULT 0 )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "WEBSTORE"."INVENTORY"

ALTER TABLE "WEBSTORE"."INVENTORY" 
	ADD CONSTRAINT "ITEM_PK" PRIMARY KEY
		("INV_ITEM_SK")
	NOT ENFORCED;



ALTER TABLE "WEBSTORE"."INVENTORY" ALTER COLUMN "INV_ITEM_SK" RESTART WITH 1001;

------------------------------------------------
-- DDL Statements for Table "WEBSTORE"."WEBSALES"
------------------------------------------------
 

CREATE TABLE "WEBSTORE"."WEBSALES"  (
		  "WS_ORDER_NUMBER" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "WS_CUSTOMER_SK" INTEGER , 
		  "WS_QUANTITY" INTEGER NOT NULL WITH DEFAULT 1 , 
		  "WS_ITEM_SK" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "WEBSTORE"."WEBSALES"

ALTER TABLE "WEBSTORE"."WEBSALES" 
	ADD CONSTRAINT "ORDER_NUMBER_PK" PRIMARY KEY
		("WS_ORDER_NUMBER")
	NOT ENFORCED;



ALTER TABLE "WEBSTORE"."WEBSALES" ALTER COLUMN "WS_ORDER_NUMBER" RESTART WITH 21;

------------------------------------------------
-- DDL Statements for Table "WEBSTORE"."TESTJSON"
------------------------------------------------
 

CREATE TABLE "WEBSTORE"."TESTJSON"  (
		  "JSON_FIELD" BLOB(4000) INLINE LENGTH 4000 LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- DDL Statements for Foreign Keys on Table "WEBSTORE"."WEBSALES"

ALTER TABLE "WEBSTORE"."WEBSALES" 
	ADD CONSTRAINT "CUSTOMER_SK" FOREIGN KEY
		("WS_CUSTOMER_SK")
	REFERENCES "WEBSTORE"."CUSTOMER"
		("C_CUSTOMER_SK")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT ENFORCED
	TRUSTED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "WEBSTORE"."WEBSALES" 
	ADD CONSTRAINT "ITEM_SK" FOREIGN KEY
		("WS_ITEM_SK")
	REFERENCES "WEBSTORE"."INVENTORY"
		("INV_ITEM_SK")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT ENFORCED
	TRUSTED
	ENABLE QUERY OPTIMIZATION;







COMMIT WORK;

CONNECT RESET;

TERMINATE;


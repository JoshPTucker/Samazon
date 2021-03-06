--------------------------------------------------------
--  File created - Friday-July-15-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SPPRODUCTS
--------------------------------------------------------

  CREATE TABLE "ORA1"."SPPRODUCTS" 
   (	"PRODUCTID" NUMBER, 
	"PRODUCTNAME" VARCHAR2(50 BYTE), 
	"PRODUCTDESCRIPTION" VARCHAR2(200 BYTE), 
	"PRODUCTPRICE" NUMBER, 
	"PRODUCTPICTURE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPPRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORA1"."SPPRODUCTS_PK" ON "ORA1"."SPPRODUCTS" ("PRODUCTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SPPRODUCTS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPPRODUCTS" ADD CONSTRAINT "SPPRODUCTS_PK" PRIMARY KEY ("PRODUCTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ORA1"."SPPRODUCTS" MODIFY ("PRODUCTID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Trigger SPPRODUCTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORA1"."SPPRODUCTS_TRG" 
BEFORE INSERT ON SPPRODUCTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PRODUCTID IS NULL THEN
      SELECT SPPRODUCTS_SEQ.NEXTVAL INTO :NEW.PRODUCTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORA1"."SPPRODUCTS_TRG" ENABLE;

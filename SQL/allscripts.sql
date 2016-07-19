--------------------------------------------------------
--  File created - Tuesday-July-19-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SPPRODUCTS
--------------------------------------------------------

  CREATE TABLE "ORA1"."SPPRODUCTS" 
   (	"PRODUCTID" NUMBER, 
	"PRODUCTNAME" VARCHAR2(50 BYTE), 
	"PRODUCTDESCRIPTION" VARCHAR2(200 BYTE), 
	"PRODUCTPRICE" NUMBER, 
	"PRODUCTPICTURE" VARCHAR2(100 BYTE), 
	"TAX" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPREVIEWS
--------------------------------------------------------

  CREATE TABLE "ORA1"."SPREVIEWS" 
   (	"REVIEWID" NUMBER, 
	"PRODUCTID" NUMBER, 
	"USERID" NUMBER, 
	"PRODUCTREVIEW" VARCHAR2(350 BYTE), 
	"SENTIMENT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPUSERS
--------------------------------------------------------

  CREATE TABLE "ORA1"."SPUSERS" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(50 BYTE), 
	"USEREMAIL" VARCHAR2(50 BYTE), 
	"HASHEDPASSWORD" VARCHAR2(100 BYTE), 
	"SALT" VARCHAR2(100 BYTE), 
	"ADMIN" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPORDERS
--------------------------------------------------------

  CREATE TABLE "ORA1"."SPORDERS" 
   (	"ORDERID" NUMBER, 
	"PRODUCTID" NUMBER, 
	"USERID" NUMBER, 
	"QUANTITY" NUMBER, 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ORA1.SPPRODUCTS
SET DEFINE OFF;
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (5,'Murach''s Java Programing','Awesome Book for those wanting to learn java',40.5,'http://images-eu.amazon.com/images/P/1890774650.02.LZZZZZZZ.jpg',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (6,'The Time Machine: HG Wells','The story of a time traveler',10,'https://tse3.mm.bing.net/th?id=OIP.M7785fd9b566e3ef8d7a247192dc8e03fH0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (7,'Hitchiker''s guide to the galaxy','A great tale',20,'https://tse2.mm.bing.net/th?id=OIP.M764decf04a9f1c02597c248ef865adcbo0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (8,'Drawing Book','A great book that teache syou how to draw',50,'https://tse3.mm.bing.net/th?id=OIP.M746c508fa762c5be9789b350f654661fH0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (9,'RollerBlades','roller blades for when you dont feel like walking',100,'https://tse1.mm.bing.net/th?id=OIP.Mb4857352a45a07a0c636322235f924e8H0&pid=15.1&P=0&w=200&h=161',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (10,'The complete Lord of the rings','the entire trilogy',40,'https://tse1.mm.bing.net/th?id=OIP.Mcdf9ca82211df4eb3977f0404df797b4o0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (11,'Galaxy s7 phone case','a case to protect your phone',30,'https://tse3.mm.bing.net/th?id=OIP.M3a75068b9da20856367adacd90eeaf29o0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (12,'dragon keychain','a small keychain featuring a dragon',5,'https://tse1.mm.bing.net/th?id=OIP.M750e5933c929699411eb02fb888bb518o0&pid=15.1&P=0&w=174&h=172',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (13,'tiger keychain','a small keychain featuring a tiger',5,'https://tse1.mm.bing.net/th?id=OIP.M45d51ea99055c5d1def1874db6e084afo0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (14,'universal charger','a charging station featuring the most popular connections',10,'https://tse1.mm.bing.net/th?id=OIP.M5104eaf153dd52b28b72b26fb10c2444o0&pid=15.1&P=0&w=259&h=191',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (15,'iphone 6+ phone case','a case to protect your phone',30,'https://tse3.mm.bing.net/th?id=OIP.M0ae5d9bc6efe386b8591d72d81eb0db8o0&pid=15.1&P=0&w=192&h=177',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (16,'Mystery grab bag','we send you a box of random items whose total price equals this price',40,'https://tse2.mm.bing.net/th?id=OIP.Me77ced0c1b86335b95c13fc3b9a0ad8dH0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (17,'backup battery','small travel battery for mobile devices',20,'https://tse2.mm.bing.net/th?id=OIP.Md92d44b0335cf1136083232b6683ffcao0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (18,'Desktop fish tank','for keeping your fishy friends hydrated',25,'https://tse1.mm.bing.net/th?id=OIP.M0081ac307119be45190ac6203bd2eff4H0&pid=15.1&P=0&w=300&h=300',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (19,'Longboard','Awesome and chep longboard for getting from where you are to where you''re going',80,'https://tse3.mm.bing.net/th?id=OIP.Mcc7d866f2ae04f32daa96ae6b943a9efH0&pid=15.1&P=0&w=286&h=170',null);
Insert into ORA1.SPPRODUCTS (PRODUCTID,PRODUCTNAME,PRODUCTDESCRIPTION,PRODUCTPRICE,PRODUCTPICTURE,TAX) values (20,'Pikachu','The cutest pokemon ever',100,'https://tse2.mm.bing.net/th?id=OIP.Mb85121f5781d23c442ca0c51f90707a7H0&pid=15.1&P=0&w=300&h=300',null);
REM INSERTING into ORA1.SPREVIEWS
SET DEFINE OFF;
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (4,5,1,'awesome book',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (1,null,1,'This book is awesome
',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (6,null,1,'test review',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (7,5,1,'Awesome book',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (2,null,1,'This book is awesome',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (5,null,1,'awesom story',0);
Insert into ORA1.SPREVIEWS (REVIEWID,PRODUCTID,USERID,PRODUCTREVIEW,SENTIMENT) values (3,null,1,'awesome book',0);
REM INSERTING into ORA1.SPUSERS
SET DEFINE OFF;
Insert into ORA1.SPUSERS (USERID,USERNAME,USEREMAIL,HASHEDPASSWORD,SALT,ADMIN) values (1,'user1','u1@d.com','17d4063d5cf51dafc104d67427b91fc64ad987de4233bfc99b0f2d2c50493b3c','3rcfjNzKUPmNsQH+avlc93xaxraDDYjigodbpBHDIx4=',0);
REM INSERTING into ORA1.SPORDERS
SET DEFINE OFF;
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (11,19,1,1,'2');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (2,5,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (3,5,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (7,5,1,1,'2');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (8,5,1,1,'3');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (21,20,1,1,'2');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (1,5,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (4,5,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (5,8,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (6,9,1,1,'1');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (9,5,null,1,'2');
Insert into ORA1.SPORDERS (ORDERID,PRODUCTID,USERID,QUANTITY,STATUS) values (10,19,null,1,'2');
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
--  DDL for Index SPREVIEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORA1"."SPREVIEWS_PK" ON "ORA1"."SPREVIEWS" ("REVIEWID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPUSERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORA1"."SPUSERS_PK" ON "ORA1"."SPUSERS" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORA1"."SPORDERS_PK" ON "ORA1"."SPORDERS" ("ORDERID") 
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
--  Constraints for Table SPREVIEWS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPREVIEWS" ADD CONSTRAINT "SPREVIEWS_PK" PRIMARY KEY ("REVIEWID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ORA1"."SPREVIEWS" MODIFY ("REVIEWID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPUSERS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPUSERS" ADD CONSTRAINT "SPUSERS_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ORA1"."SPUSERS" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPORDERS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPORDERS" ADD CONSTRAINT "SPORDERS_PK" PRIMARY KEY ("ORDERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ORA1"."SPORDERS" MODIFY ("ORDERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SPREVIEWS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPREVIEWS" ADD CONSTRAINT "SPREVIEWS_FK1" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "ORA1"."SPPRODUCTS" ("PRODUCTID") ENABLE;
  ALTER TABLE "ORA1"."SPREVIEWS" ADD CONSTRAINT "SPREVIEWS_FK2" FOREIGN KEY ("USERID")
	  REFERENCES "ORA1"."SPUSERS" ("USERID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPORDERS
--------------------------------------------------------

  ALTER TABLE "ORA1"."SPORDERS" ADD CONSTRAINT "SPORDERS_FK1" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "ORA1"."SPPRODUCTS" ("PRODUCTID") ENABLE;
  ALTER TABLE "ORA1"."SPORDERS" ADD CONSTRAINT "SPORDERS_FK2" FOREIGN KEY ("USERID")
	  REFERENCES "ORA1"."SPUSERS" ("USERID") ENABLE;
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
--------------------------------------------------------
--  DDL for Trigger SPREVIEWS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORA1"."SPREVIEWS_TRG" 
BEFORE INSERT ON SPREVIEWS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.REVIEWID IS NULL THEN
      SELECT SPREVIEWS_SEQ.NEXTVAL INTO :NEW.REVIEWID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORA1"."SPREVIEWS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPUSERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORA1"."SPUSERS_TRG" 
BEFORE INSERT ON SPUSERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.USERID IS NULL THEN
      SELECT SPUSERS_SEQ.NEXTVAL INTO :NEW.USERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORA1"."SPUSERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPORDERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORA1"."SPORDERS_TRG" 
BEFORE INSERT ON SPORDERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ORDERID IS NULL THEN
      SELECT SPORDERS_SEQ.NEXTVAL INTO :NEW.ORDERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORA1"."SPORDERS_TRG" ENABLE;

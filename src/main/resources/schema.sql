-- ISSUER table
DROP TABLE IF EXISTS ISSUER;
CREATE TABLE PUBLIC.ISSUER (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(64) UNIQUE NOT NULL,
	ADDRESS VARCHAR(256),
	DESCRIPTION VARCHAR(256),
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT 0 NOT NULL
);
ALTER TABLE PUBLIC.ISSUER ADD CONSTRAINT ISSUER_PK PRIMARY KEY (ID);

-- TENDER table
DROP TABLE IF EXISTS TENDER;
CREATE TABLE PUBLIC.TENDER (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	ISSUER_ID INTEGER NOT NULL,
	NAME VARCHAR(64) UNIQUE NOT NULL,
	PROJECT_DESCRIPTION VARCHAR(256),
	PROJECT_DATE_START TIMESTAMP,
	PROJECT_DATE_END TIMESTAMP,
	TENDER_DATE_START TIMESTAMP,
	TENDER_DATE_END TIMESTAMP,
	STARTED BOOLEAN DEFAULT 0 NOT NULL,
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT 0 NOT NULL
) ;
ALTER TABLE PUBLIC.TENDER ADD CONSTRAINT TENDER_PK PRIMARY KEY (ID);
ALTER TABLE PUBLIC.TENDER ADD CONSTRAINT TENDER_ISSUER__FK FOREIGN KEY (ISSUER_ID) REFERENCES PUBLIC.ISSUER(ID);

-- TENDER_CONDITION table
DROP TABLE IF EXISTS TENDER_CONDITION;
CREATE TABLE PUBLIC.TENDER_CONDITION (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	TENDER_ID INTEGER NOT NULL,
	NAME VARCHAR(64),
	REQUEST VARCHAR(256),
	REQUEST_INFO VARCHAR(512),
	DESCRIPTION VARCHAR(512),
	OBLIGATORY BOOLEAN DEFAULT FALSE NOT NULL,
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT FALSE NOT NULL
) ;
ALTER TABLE PUBLIC.TENDER_CONDITION ADD CONSTRAINT TENDERCONDITION_PK PRIMARY KEY (ID);
ALTER TABLE PUBLIC.TENDER_CONDITION ADD CONSTRAINT TENDERCONDITION_TENDER_FK FOREIGN KEY (TENDER_ID) REFERENCES PUBLIC.TENDER(ID);

-- CURRENCY table
DROP TABLE IF EXISTS CURRENCY;
CREATE TABLE PUBLIC.CURRENCY (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(32) UNIQUE NOT NULL,
	CODE VARCHAR(3) UNIQUE NOT NULL,
	DEFAULT_ BOOLEAN DEFAULT 0 NOT NULL,
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT 0 NOT NULL
) ;
ALTER TABLE PUBLIC.CURRENCY ADD CONSTRAINT CURRENCY_PK PRIMARY KEY (ID);

-- Bidder table
DROP TABLE IF EXISTS BIDDER;
CREATE TABLE PUBLIC.BIDDER (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(64) NOT NULL,
	ADDRESS VARCHAR(256),
	DESCRIPTION VARCHAR(256),
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT 0 NOT NULL
) ;
ALTER TABLE PUBLIC.BIDDER ADD CONSTRAINT BIDDER_PK PRIMARY KEY (ID);

-- OFFER_CONDITION table
DROP TABLE IF EXISTS OFFER;
CREATE TABLE PUBLIC.OFFER (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	BIDDER_ID INTEGER NOT NULL,
	TENDER_ID INTEGER NOT NULL,
	NAME VARCHAR(64) NOT NULL,
	DESCRIPTION VARCHAR(512),
	STATUS VARCHAR(32) DEFAULT 'CREATING' NOT NULL,
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN DEFAULT 0 NOT NULL
) ;
ALTER TABLE PUBLIC.OFFER ADD CONSTRAINT OFFER_PK PRIMARY KEY (ID);
ALTER TABLE PUBLIC.OFFER ADD CONSTRAINT OFFER_BIDDER_FK FOREIGN KEY (BIDDER_ID) REFERENCES PUBLIC.BIDDER(ID);
ALTER TABLE PUBLIC.OFFER ADD CONSTRAINT OFFER_TENDER_FK FOREIGN KEY (TENDER_ID) REFERENCES PUBLIC.TENDER(ID);

-- BID_HISTORY table
DROP TABLE IF EXISTS OFFER_CONDITION;
CREATE TABLE PUBLIC.OFFER_CONDITION (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	OFFER_ID INTEGER NOT NULL,
	TENDER_CONDITION_ID INTEGER NOT NULL,
	RESPONSE VARCHAR(256),
	RESPONSE_DESCRIPTION VARCHAR(512),
	DATE_CREATED TIMESTAMP NOT NULL,
	DATE_MODIFIED TIMESTAMP,
	DELETED BOOLEAN NOT NULL DEFAULT 0
) ;
ALTER TABLE PUBLIC.OFFER_CONDITION ADD CONSTRAINT OFFERCONDITION_PK PRIMARY KEY (ID);
ALTER TABLE PUBLIC.OFFER_CONDITION ADD CONSTRAINT OFFERCONDITION_OFFER_FK FOREIGN KEY (OFFER_ID) REFERENCES PUBLIC.OFFER(ID);

---- BidHistory table
--DROP TABLE IF EXISTS BID_HISTORY;
--CREATE TABLE PUBLIC.BID_HISTORY (
--	ID INTEGER NOT NULL AUTO_INCREMENT,
--	OFFER_ID INTEGER NOT NULL,
--	TENDER_ID INTEGER NOT NULL,
--	NOTE VARCHAR(512),
--	
--	DATE_CREATED TIMESTAMP NOT NULL,
--	DATE_MODIFIED TIMESTAMP,
--	DELETED BOOLEAN NOT NULL DEFAULT 0
--) ;
--ALTER TABLE PUBLIC.BID_HISTORY ADD CONSTRAINT BIDHISTORY_OFFER_FK FOREIGN KEY (OFFER_ID) REFERENCES PUBLIC.OFFER(ID);
--ALTER TABLE PUBLIC.BID_HISTORY ADD CONSTRAINT BIDHISTORY_TENDER_FK FOREIGN KEY (TENDER_ID) REFERENCES PUBLIC.TENDER(ID);

--INSERT INTO CURRENCY (name, code)
--VALUES 
--('Euro', 'EUR'),
--('Swiss Franc', 'CHF'),
--('US Dollar', 'USD'),
;

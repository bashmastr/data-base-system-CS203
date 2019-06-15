
CREATE Table CUSTOMER(
  custno 	VARCHAR(10) 	PRIMARY Key,
  custname 	VARCHAR(100) 	NOT NULL,
  address 	VARCHAR(100)	NOT NULL ,
  internal 	VARCHAR(1) 		NOT NULL ,
  contact 	VARCHAR(100)	NOT NULL,
  phone 	INT 			NOT NULL,
  city 		VARCHAR(100) 	NOT NULL,
  state 	VARCHAR(100) 	NOT NULL,
  zip 		INT 			NOT NULL
);

CREATE Table EMPLOYEE(
  empno VARCHAR(10) 	 	PRIMARY Key,
  empname VARCHAR(100)  	NOT NULL,
  department VARCHAR(100) 	NOT NULL,
  email VARCHAR(100) 		NOT NULL,
  phone VARCHAR(100)		NOT NULL
);

CREATE Table FACILITY(
  facno VARCHAR(10)  	PRIMARY Key,
  facname VARCHAR(100) 	NOT NULL
);

CREATE Table LOCATION(
  locno VARCHAR(10) 	PRIMARY Key,
  facno VARCHAR(10) 	NOT NULL,
  CONSTRAINT fr_FACILITY_loct FOREIGN Key(facno)
  REFERENCES FACILITY(facno),
  locname VARCHAR(100) 	NOT NULL

);

CREATE Table RESOURCETBL(
  resno VARCHAR(10) 	PRIMARY Key,
  resname VARCHAR(100)  NOT NULL,
  rate VARCHAR(100)		NOT NULL
);

CREATE Table EVENTREQUEST(
  eventno VARCHAR(10) 		PRIMARY Key,
  dateheld DATE 			NOT NULL,
  datereq DATE 				NOT NULL,
  facno VARCHAR(10),
  CONSTRAINT fr_FACILITY_eventR FOREIGN Key(facno)
  REFERENCES FACILITY(facno),
  custno VARCHAR(10) 		NOT NULL,
  CONSTRAINT fr_cust_eventR FOREIGN Key(custno)
  REFERENCES CUSTOMER(custno)NOT NULL,
  dateauth DATE 			NOT NULL,
  status VARCHAR(50) 		NOT NULL,
  estcost VARCHAR(50) 		NOT NULL,
  estaudience INT 			NOT NULL,
  budno VARCHAR(20) 		NOT NULL
);

CREATE Table EVENTPLAN(
  planno VARCHAR(10) PRIMARY Key,
  eventno VARCHAR(10) NOT NULL,
  workdate DATE  		NOT NULL,
  notes VARCHAR(100) 	NOT NULL,
  activity VARCHAR(100) NOT NULL,
  empno VARCHAR(10) 	NOT NULL,
  CONSTRAINT fr_emp_eventP FOREIGN Key(empno)
  REFERENCES EMPLOYEE(empno)
);

CREATE Table EVENTPLANLINE(
  planno VARCHAR(10),
  CONSTRAINT fr_eventP_eventPL FOREIGN Key(planno)
  REFERENCES EVENTPLAN(planno) NOT NULL,
  LineNo INT 					NOT NULL,
  TimeStart DATE NOT NULL,
  TimeEnd DATE,
  Numberfld INT,
  locno VARCHAR(10),
  CONSTRAINT fr_loct_eventPL FOREIGN Key(locno)
  REFERENCES LOCATION(locno),
  resno VARCHAR(10) 			NOT NULL,
  CONSTRAINT fr_resour_evenPL FOREIGN Key(resno)
  REFERENCES RESOURCETBL(resno)
);

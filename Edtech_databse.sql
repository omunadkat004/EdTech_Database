drop table admin
truncate table admin 
create table admin(
    aid varchar  (100) not null primary key,
    pswd varchar (80) not null
);
drop table student
CREATE TABLE STUDENT(
    sid varchar(100) not null primary key,
    pwd varchar(100) not null,
    s_name varchar(15),
    sage varchar(2),
    sdob date,
    s_email varchar(25),
    s_phone numeric(10)
);
DROP TABLE TEST
CREATE TABLE TEST 
    ( 
    tid varchar(100) NOT NULL PRIMARY KEY, 
    aid,                       
    sid,                           
    name varchar2(20) NOT NULL, 
    test_date date, 
    test_time timestamp, 
    test_length timestamp, 
    CONSTRAINT t_aid FOREIGN KEY (aid) REFERENCES admin(aid), 
    CONSTRAINT t_sid FOREIGN KEY (sid) REFERENCES student(sid) 
)
    drop table results 
CREATE TABLE results ( 
    rid VARCHAR2(100) primary key , 
    tid, 
    sid, 
    ob_marks numeric(3),
    CONSTRAINT r_tid FOREIGN KEY (tid) REFERENCES test(tid), 
    CONSTRAINT r_sid FOREIGN KEY (sid) REFERENCES student(sid) 
)
    drop table course
CREATE TABLE COURSE 
( 
    cid varchar2(100) NOT NULL PRIMARY KEY, 
    sid, 
    aid,   
    rating numeric(2), 
    CONSTRAINT c_tid FOREIGN KEY (aid) REFERENCES admin(aid), 
    CONSTRAINT c_sid FOREIGN KEY (sid) REFERENCES student(sid) 
)
    drop table free_course
CREATE TABLE  FREE_COURSE 
( 
    free_cid varchar(100) NOT NULL PRIMARY KEY, 
    cid, 
    stage integer, 
    duration_In_Days numeric, 
     CONSTRAINT f_cid FOREIGN KEY (cid) REFERENCES course(cid) 
)
    drop table paid_course
CREATE TABLE PAID_COURSE 
( 
    paid_cid varchar2(100) NOT NULL PRIMARY KEY, 
    cid , 
    stage numeric(3), 
    duration_In_Days numeric(3), 
    CONSTRAINT p_cid FOREIGN KEY (cid) REFERENCES course(cid) 
)
create table certificate( 
    certi_id varchar(100) not null primary key, 
    cid , 
    sid , 
    CONSTRAINT certi_cid FOREIGN KEY (cid) REFERENCES course(cid), 
    CONSTRAINT certi_sid FOREIGN KEY (sid) REFERENCES student(sid) 
)
create table feedback( 
    fid varchar2(100) PRIMARY KEY NOT NULL, 
    sid , 
    comments varchar2(200), 
    CONSTRAINT feed_sid FOREIGN KEY (sid) REFERENCES student(sid) 
    
)
    drop table videolec
create table videolec( 
    videoid varchar2(10) not null primary key, 
    sid, 
    cid, 
    length_In_Hrs numeric(2), 
    tutor varchar(20), 
    CONSTRAINT vid_course FOREIGN KEY (cid) REFERENCES course(cid), 
    CONSTRAINT vid_student FOREIGN KEY (sid) REFERENCES student(sid)     
)
create table payment( 
    p_id varchar2(160) not null primary key, 
    sid , 
    cid , 
    amount numeric(10), 
    payment_date date, 
    constraints pay_cid foreign key(cid) references course(cid), 
    constraints pay_sid foreign key(sid) references student(sid) 
     
)
    drop table methods
CREATE TABLE METHODS( 
      p_id , 
      method_id varchar2(100) not null primary key, 
      constraints pid_method foreign key(p_id) references payment(p_id) 
       
)
    drop table UPI    
CREATE TABLE UPI( 
     method_id , 
     p_id , 
     upi_id VARCHAR2(20) primary key , 
    constraints upi_pid foreign key(p_id) references payment(p_id), 
    constraints upi_mid foreign key(method_id) references methods(method_id) 
    )

CREATE TABLE DEBIT_CREDIT_CARDS 
( 
    dc_id varchar2(20) primary key, 
    method_id , 
    p_id , 
    bank_name varchar2(25) not null, 
    bank_acc_no numeric(20) unique not null, 
    cvv numeric(3) not null, 
    expiry_date date, 
    constraints dc_pid foreign key(p_id) references payment(p_id), 
    constraints dc_mid foreign key(method_id) references methods(method_id) 
)

CREATE TABLE NET_BANKING1 ( 
    NB_id varchar2(200) primary key, 
    method_id, 
    p_id , 
    bank_name varchar2(25) not null, 
    CONSTRAINT nb_pid1 FOREIGN KEY(p_id) REFERENCES payment(p_id), 
    CONSTRAINT nb_method_id1 FOREIGN KEY(method_id) REFERENCES methods(method_id) 
)

INSERT INTO admin (aid, pswd) VALUES ('admin001', 'pass123');
INSERT INTO admin (aid, pswd) VALUES  ('admin002', 'admin456');
INSERT INTO admin (aid, pswd) VALUES  ('admin003', 'secure789');
INSERT INTO admin (aid, pswd) VALUES  ('admin004', 'secret321');
INSERT INTO admin (aid, pswd) VALUES  ('admin005', 'adminpass');
INSERT INTO admin (aid, pswd) VALUES  ('admin006', 'passadmin');
INSERT INTO admin (aid, pswd) VALUES ('admin007', 'password1');
INSERT INTO admin (aid, pswd) VALUES  ('admin008', 'passadmin123');
INSERT INTO admin (aid, pswd) VALUES  ('admin009', 'securepass');
INSERT INTO admin (aid, pswd) VALUES  ('admin010', 'passadmin456');
desc admin
select * from admin ;
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std001', 'stdpass1', 'John Doe', '20', '10-JAN-2004', 'john@example.com', '1234567890');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std002', 'stdpass2', 'Jane Smith', '22', '13-FEB-2003', 'jane@example.com', '9876543210');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std003', 'stdpass3', 'Michael Johnson', '19', '09-MAR-2005', 'michael@example.com', '4567890123');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std004', 'stdpass4', 'Emily Brown', '21', '25-JULY-2005', 'emily@example.com', '7890123456');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email,s_phone) VALUES ('std005', 'stdpass5', 'David Wilson', '23', '30-MAR-2001', 'david@example.com', '2109876543');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std006', 'stdpass6', 'Sarah Lee', '20', '05-AUG-2004', 'sarah@example.com', '3210987654');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std007', 'stdpass7', 'Christo Garcia', '22', '11-DEC-2002', 'chris@example.com', '6543210987');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std008', 'stdpass8', 'Amanda Martinez', '19', '18-FEB-2005', 'amanda@example.com', '2345678901');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std009', 'stdpass9', 'James Rodriguez', '21', '23-APR-2004', 'james@example.com', '8901234567');
INSERT INTO Student (sid, pwd, s_name, sage, sdob, s_email, s_phone) VALUES ('std010', 'stdpass10', 'Ashley Herna', '23', '20-JUN-2002', 'ashley@example.com', '4321098765');
desc student
select * from student;
delete from test where tid='test0001';
INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test001', 'admin001', 'std001', 'Math Test','21-APR-2023');
INSERT INTO Test (tid, aid, sid, name,test_date) VALUES   ('test002', 'admin002', 'std002', 'Science Test', '20-AUG-2024' );
INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test003', 'admin003', 'std003', 'English Test', '12-JUN-2023' );
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test004', 'admin004', 'std004', 'History Test', '20-NOV-2023' );
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test005', 'admin005', 'std005', 'Geography Test', '23-JUN-2023');
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test006', 'admin006', 'std006', 'Physics Test', '2-AUG-2022' );
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test007', 'admin007', 'std007', 'Chemistry Test', '16-FEB-2024');
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test008', 'admin008', 'std008', 'Biology Test', '18-JULY-2024' );
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test009', 'admin009', 'std009', 'Computer Science Test', '18-MAR-2024' );
 INSERT INTO Test (tid, aid, sid, name,test_date) VALUES  ('test010', 'admin010', 'std010', 'Art Test', '19-FEB-2024' );
select * from test;
truncate table test;

INSERT INTO results (rid, tid, sid, ob_marks) VALUES   ('res001', 'test001', 'std001', 85);
INSERT INTO results (rid, tid, sid, ob_marks) VALUES ('res002', 'test002', 'std002', 78);
 INSERT INTO results (rid, tid, sid, ob_marks) VALUES  ('res003', 'test003', 'std003', 92);
 INSERT INTO results (rid, tid, sid, ob_marks) VALUES  ('res004', 'test004', 'std004', 79);
INSERT INTO results (rid, tid, sid, ob_marks) VALUES   ('res005', 'test005', 'std005', 88);
 INSERT INTO results (rid, tid, sid, ob_marks) VALUES  ('res006', 'test006', 'std006', 95);
 INSERT INTO results (rid, tid, sid, ob_marks) VALUES  ('res007', 'test007', 'std007', 82);
 INSERT INTO results (rid, tid, sid, ob_marks) VALUES  ('res008', 'test008', 'std008', 90);
INSERT INTO results (rid, tid, sid, ob_marks) VALUES   ('res009', 'test009', 'std009', 87);
INSERT INTO results (rid, tid, sid, ob_marks) VALUES   ('res010', 'test010', 'std010', 91) ;
select * from results ;
truncate table results ;

 INSERT INTO course (cid, sid, aid, rating) VALUES ('course001', 'std001', 'admin001', 4);
 INSERT INTO course (cid, sid, aid, rating) VALUES ('course002', 'std002', 'admin002', 3);
 INSERT INTO course (cid, sid, aid, rating) VALUES ('course003', 'std003', 'admin003', 5);
 INSERT INTO course (cid, sid, aid, rating) VALUES ('course004', 'std004', 'admin004', 4);5
INSERT INTO course (cid, sid, aid, rating) VALUES  ('course005', 'std005', 'admin005', 3);
 INSERT INTO course (cid, sid, aid, rating) VALUES ('course006', 'std006', 'admin006', 5);
 INSERT INTO course (cid, sid, aid, rating) VALUES ('course007', 'std007', 'admin007', 4);
  INSERT INTO course (cid, sid, aid, rating) VALUES('course008', 'std008', 'admin008', 3);
  INSERT INTO course (cid, sid, aid, rating) VALUES('course009', 'std009', 'admin009', 5);
INSERT INTO course (cid, sid, aid, rating) VALUES  ('course010', 'std010', 'admin010', 4);
desc course ;
select * from course;


INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) ('free_course001', 'course001', 1, 60);
INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES  ('free_course002', 'course002', 1, 70 );
  INSERT INTO free_course (free_cid, cid, stage, duration_In_Days)VALUES('free_course003', 'course003', 1, 90 );
INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES ('free_course004', 'course004', 1, 160 );
 INSERT INTO free_course (free_cid, cid, stage, duration_In_Days)VALUES ('free_course005', 'course005', 1, 50 );
INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES ('free_course006', 'course006', 1, 60 );
 INSERT INTO free_course (free_cid, cid, stage, duration_In_Days)VALUES ('free_course007', 'course007', 1, 80 );
 INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES('free_course008', 'course008', 1, 60);
INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES ('free_course009', 'course009', 1, 60 );
 INSERT INTO free_course (free_cid, cid, stage, duration_In_Days) VALUES('free_course010', 'course010', 1, 80);
select * from free_course;
truncate table free_course

INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES ('paid_course001', 'course001', 1, 90 );
INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES   ('paid_course002', 'course002', 2, 120);
 INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES  ('paid_course003', 'course003', 1, 90 );
 INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES  ('paid_course004', 'course004', 3, 150);
 INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES  ('paid_course005', 'course005', 2, 120);
 INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES  ('paid_course006', 'course006', 1, 90 );
INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES   ('paid_course007', 'course007', 3, 150);
INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES   ('paid_course008', 'course008', 2, 120 );
INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES   ('paid_course009', 'course009', 1, 90 );
INSERT INTO paid_course (paid_cid, cid, stage, duration_In_Days) VALUES   ('paid_course010', 'course010', 3, 150 );
select * from paid_course


INSERT INTO feedback (fid, sid, comments) VALUES  ('feedback001', 'std001', 'Great course content!');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback002', 'std002', 'Enjoyed learning, thanks!');
INSERT INTO feedback (fid, sid, comments) VALUES  ('feedback003', 'std003', 'Could use more practice exercises.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback004', 'std004', 'Lectures were engaging.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback005', 'std005', 'Good explanations, but too fast.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback006', 'std006', 'Could improve video quality.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback007', 'std007', 'Clear instructions, easy to follow.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback008', 'std008', 'Interesting topics covered.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback009', 'std009', 'Needs more real-world examples.');
 INSERT INTO feedback (fid, sid, comments) VALUES ('feedback010', 'std010', 'Excellent support from tutors!');
select * from feedback;


 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert001', 'course001', 'std001');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert002', 'course002', 'std002');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert003', 'course003', 'std003');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert004', 'course004', 'std004');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert005', 'course005', 'std005');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert006', 'course006', 'std006');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert007', 'course007', 'std007');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert008', 'course008', 'std008');
  INSERT INTO certificate (certi_id, cid, sid) VALUES('cert009', 'course009', 'std009');
 INSERT INTO certificate (certi_id, cid, sid) VALUES ('cert010', 'course010', 'std010');
select * from certificate ;

INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES  ('video001', 'std001', 'course001', 15, 'Dr. Smith');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video002', 'std002', 'course002', 20, 'Prof. Johnson');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video003', 'std003', 'course003', 25, 'Dr. Lee');
  INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES('video004', 'std004', 'course004', 30, 'Prof. Brown');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video005', 'std005', 'course005', 35, 'Dr. Martinez');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video006', 'std006', 'course006', 34, 'Prof. Rodriguez');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video007', 'std007', 'course007', 45, 'Dr. Garcia');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video008', 'std008', 'course008', 59, 'Prof. Hernandez');
  INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES('video009', 'std009', 'course009', 44, 'Dr. Wilson');
 INSERT INTO videolec (videoid, sid, cid, length_In_Hrs, tutor) VALUES ('video010', 'std010', 'course010', 60, 'Prof. Smith');
select * from videolec;

INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES ('pay001', 'std001', 'course001', 50.00, '01-JAN-2024');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay002', 'std002', 'course002', 60.00, '02-FEB-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay003', 'std003', 'course003', 55.00, '03-FEB-2024');
 INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES ('pay004', 'std004', 'course004', 70.00, '23-APR-2024');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay005', 'std005', 'course005', 65.00, '20-MAR-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay006', 'std006', 'course006', 45.00, '20-JUN-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay007', 'std007', 'course007', 75.00, '07-AUG-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay008', 'std008', 'course008', 40.00, '18-JUL-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES  ('pay009', 'std009', 'course009', 85.00, '19-NOV-2023');
INSERT INTO payment (p_id, sid, cid, amount, payment_date) VALUES ('pay010', 'std010', 'course010', 55.00, '30-OCT-2024');
select * from payment ;

INSERT INTO methods (p_id, method_id) VALUES ('pay001', 'method001');
 INSERT INTO methods (p_id, method_id) VALUES ('pay002', 'method002');
 INSERT INTO methods (p_id, method_id) VALUES ('pay003', 'method003');
INSERT INTO methods (p_id, method_id) VALUES ('pay004', 'method004');
INSERT INTO methods (p_id, method_id) VALUES  ('pay005', 'method005');
INSERT INTO methods (p_id, method_id) VALUES  ('pay006', 'method006');
INSERT INTO methods (p_id, method_id) VALUES  ('pay007', 'method007');
 INSERT INTO methods (p_id, method_id) VALUES ('pay008', 'method008');
 INSERT INTO methods (p_id, method_id) VALUES ('pay009', 'method009');
  INSERT INTO methods (p_id, method_id) VALUES('pay010', 'method010');
select *from methods ;
truncate table methods;

INSERT INTO upi (method_id, p_id, upi_id) VALUES  ('method001', 'pay001', 'upi_id001');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method002', 'pay002', 'upi_id002');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method003', 'pay003', 'upi_id003');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method004', 'pay004', 'upi_id004');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method005', 'pay005', 'upi_id005');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method006', 'pay006', 'upi_id006');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method007', 'pay007', 'upi_id007');
INSERT INTO upi (method_id, p_id, upi_id) VALUES  ('method008', 'pay008', 'upi_id008');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method009', 'pay009', 'upi_id009');
 INSERT INTO upi (method_id, p_id, upi_id) VALUES ('method010', 'pay010', 'upi_id010');
select * from upi;

INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id001', 'method001', 'pay001', 'Bank of America');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id002', 'method002', 'pay002', 'Chase Bank');
INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES  ('NB_id003', 'method003', 'pay003', 'Wells Fargo');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id004', 'method004', 'pay004', 'Citi Bank');
  INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES('NB_id005', 'method005', 'pay005', 'HSBC Bank');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id006', 'method006', 'pay006', 'Barclays Bank');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id007', 'method007', 'pay007', 'TD Bank');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id008', 'method008', 'pay008', 'Capital One');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id009', 'method009', 'pay009', 'US Bank');
 INSERT INTO Net_Banking1 (NB_id, method_id, p_id, bank_name) VALUES ('NB_id010', 'method010', 'pay010', 'PNC Bank');
select * from net_banking1;

INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES ('dc_id001', 'method001', 'pay001', 'Visa', 1234567890123456, 123 );
 INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES  ('dc_id002', 'method002', 'pay002', 'Mastercard', 9876543210987654, 456 );
INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES   ('dc_id003', 'method003', 'pay003', 'American Express', 2468109753216548, 789 );
 INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES  ('dc_id004', 'method004', 'pay004', 'Discover', 1357924680246813, 159 );
 INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES  ('dc_id005', 'method005', 'pay005', 'JCB', 3692581470369258, 357);
 INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES  ('dc_id006', 'method006', 'pay006', 'Diners Club', 2581470369258147, 258);
INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES   ('dc_id007', 'method007', 'pay007', 'UnionPay', 1470369258147036, 369);
 INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES  ('dc_id008', 'method008', 'pay008', 'Maestro', 0369258147036925, 147 );
INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES   ('dc_id009', 'method009', 'pay009', 'RuPay', 3692581470369258, 258 );
INSERT INTO DEBIT_CREDIT_CARDS   (dc_id, method_id, p_id, bank_name, bank_acc_no, cvv ) VALUES   ('dc_id010', 'method010', 'pay010', 'Dankort', 2581470369258147, 369 );
select * from DEBIT_CREDIT_CARDS ;

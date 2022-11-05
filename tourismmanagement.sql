CREATE TABLE admin(admin_id NUMERIC, admin_username VARCHAR2(30), admin_password VARCHAR2(30));
CREATE TABLE tours(tour_id NUMERIC, tour_name varchar2(100), tour_package varchar2(100), admin_id NUMERIC, PRIMARY KEY(tour_id), FOREIGN KEY (admin_id) REFERENCES admin(admin_id));
CREATE TABLE class_info(class_id NUMERIC, class_name VARCHAR(15) NOT NULL, PRIMARY KEY(class_id));
CREATE TABLE details(class_id NUMERIC, tour_id NUMERIC, tour_price NUMERIC, FOREIGN KEY (class_id) REFERENCES class_info(class_id) ON DELETE CASCADE);
CREATE TABLE users(user_id NUMERIC, user_name VARCHAR2(30), user_password VARCHAR2(30), contact NUMERIC, address_id NUMERIC, email VARCHAR2(30), PRIMARY KEY(user_id), FOREIGN KEY(address_id) REFERENCES address(address_id));    
CREATE TABLE bookings(booking_id NUMERIC, user_id NUMERIC, tour_id NUMERIC, class_id NUMERIC, tour_date DATE, return_date DATE, booking_status VARCHAR2(15),  no_of_people NUMERIC, total_payment NUMERIC, payment_method VARCHAR2(25), time_of_booking TIMESTAMP, PRIMARY KEY(booking_id), FOREIGN KEY(user_id) REFERENCES users(user_id), FOREIGN KEY(tour_id) REFERENCES tours(tour_id), CHECK (booking_status IN ('confirmed', 'reject', 'pending')), CHECK (payment_method IN ('upi', 'credit card', 'net banking'))); 
CREATE TABLE hotel(hotel_id NUMERIC, hotel_name VARCHAR2(30), tour_id NUMERIC, PRIMARY KEY(hotel_id), FOREIGN KEY(tour_id) REFERENCES tours(tour_id));
CREATE TABLE traveller_detail(user_id NUMERIC, payment_time TIMESTAMP, name varchar2(10), age NUMERIC,gender check(gender='male' OR gender='female' OR gender='other'));
CREATE TABLE state(state_id NUMERIC PRIMARY KEY , state_name VARCHAR2(30));
CREATE TABLE district(district_id NUMERIC PRIMARY KEY , state_id NUMERIC, district_name VARCHAR2(15), FOREIGN KEY(state_id) REFERENCES state(state_id));
CREATE TABLE address(address_id NUMERIC PRIMARY KEY,  state_id NUMERIC,  district_id NUMERIC ,  area VARCHAR2(100), FOREIGN KEY (state_id) REFERENCES state(state_id), FOREIGN KEY (district_id) REFERENCES district(district_id));

-- INSERTING DATA INTO ADMIN TABLE
INSERT INTO admin VALUES (1, 'rajan', 'rajan123');
INSERT INTO admin VALUES (2, 'bhargav', 'bhargav123');

-- INSERTING DATA INTO TOUR TABLE
INSERT INTO tours VALUES (1, 'Dubai - The city of gold', 'Includes transportation, meal and hotel', 1);
INSERT INTO tours VALUES (2, 'Thailand - Bliss amidst Nature', 'Includes transportation, meal and hotel', 1);
INSERT INTO tours VALUES (3, 'Singapore - Blend of Adventure and Serenity', 'Includes transportation, meal and hotel', 1);
INSERT INTO tours VALUES (4, 'Bali, Indonesia – Land of the Gods', 'Includes transportation, meal and hotel', 1);
INSERT INTO tours VALUES (5, 'Nepal – Home to Mount Everest and Kanchenjunga', 'Includes transportation, meal and hotel', 2);
INSERT INTO tours VALUES (6, 'Maldives – Clear Emerald Waters', 'Includes transportation, meal', 2);
INSERT INTO tours VALUES (7, 'Malaysia – Diversity of Races, Religions, and Cultures', 'Includes transportation, meal', 2);
INSERT INTO tours VALUES (8, 'Egypt – The Country of the Great Pyramids', 'Includes transportation, meal', 2);
INSERT INTO tours VALUES (9, 'Sri Lanka – The Teardrop of India', 'Includes transportation, meal', 2);
INSERT INTO tours VALUES (10, 'Bhutan – World’s Happiest Country ', 'Includes transportation, meal', 2);

-- INSERTING DATA INTO DETAILS TABLE
INSERT INTO DETAILS VALUES (1, 1, 50000);
INSERT INTO DETAILS VALUES (2, 1, 44000);
INSERT INTO DETAILS VALUES (1, 2, 35000);
INSERT INTO DETAILS VALUES (2, 2, 29000);
INSERT INTO DETAILS VALUES (3, 2, 26000);
INSERT INTO DETAILS VALUES (1, 3, 60000);
INSERT INTO DETAILS VALUES (1, 4, 18000);
INSERT INTO DETAILS VALUES (2, 4, 15000);
INSERT INTO DETAILS VALUES (1, 5, 50000);
INSERT INTO DETAILS VALUES (2, 5, 45000);
INSERT INTO DETAILS VALUES (3, 5, 40000);
INSERT INTO DETAILS VALUES (1, 6, 65000);
INSERT INTO DETAILS VALUES (2, 6, 59000);
INSERT INTO DETAILS VALUES (2, 7, 70000);
INSERT INTO DETAILS VALUES (2, 8, 250000);
INSERT INTO DETAILS VALUES (3, 8, 244000);
INSERT INTO DETAILS VALUES (1, 9, 80000);
INSERT INTO DETAILS VALUES (2, 9, 75000);
INSERT INTO DETAILS VALUES (3, 9, 71000);
INSERT INTO DETAILS VALUES (1, 10, 22000);
INSERT INTO DETAILS VALUES (2, 10, 17000);
INSERT INTO DETAILS VALUES (3, 10, 13000);

-- INSERTING DATA INTO USERS TABLE
INSERT INTO users VALUES (1, 'akshar', 'akshar123', '1234567890', 1, 'akshar@gmail.com');
INSERT INTO users VALUES (2, 'rahul', 'rahul123', '1234567899', 2, 'rahul@gmail.com');
INSERT INTO users VALUES (3, 'harsh', 'harsh123', '1234567880', 3, 'harsh@gmail.com');
INSERT INTO users VALUES (4, 'soham', 'soham123', '1234567790', 4, 'soham@gmail.com');
INSERT INTO users VALUES (5, 'dhruvin', 'dhruvin123', '1234555670', 1, 'dhruvin@gmail.com');
INSERT INTO users VALUES (6, 'abhishek', '#abhishek', '9999999888', 6, 'abhishek@gmail.com');
INSERT INTO users VALUES (7, 'dhruv', 'dhruv123', '1231234569', 2, 'dhruv@gmail.com');
INSERT INTO users VALUES (8, 'devanshu', 'devanshu123', '1234567891', 8, 'devanshu@gmail.com');
INSERT INTO users VALUES (9, 'jaiveer', 'jaiveer123', '1230000000', 9, 'jaiveer@gmail.com');
INSERT INTO users VALUES (10, 'parth', 'parth1234', '1112223334', 9, 'parth@gmail.com');

--INSERTING DATA INTO STATE TABLE
INSERT INTO state VALUES (1,'GUJARAT');
INSERT INTO state VALUES (2,'RAJASTAN');
INSERT INTO state VALUES (3,'MAHARASTRA');

--INSERTING DATA INTO DISTRICT TABLE
INSERT INTO district VALUES (1,1,'Valsad');
INSERT INTO district VALUES (2,1,'Navsari');
INSERT INTO district VALUES (3,1,'Surat');
INSERT INTO district VALUES (4,2,'Jaipur');
INSERT INTO district VALUES (5,2,'Jaisalmer');
INSERT INTO district VALUES (6,2,'Jalore');
INSERT INTO district VALUES (7,3,'Amravati');
INSERT INTO district VALUES (8,3,'Thane');

--INSERTING DATA INTO ADDRESS TABLE
INSERT INTO ADDRESS VALUES (1, 1, 1, '9, 403-404, Sundaram Space, Ring Rd, opposite Dawer Chambers');
INSERT INTO ADDRESS VALUES (2, 1, 2, '	Mann Complex, Gynecologist, Anand Mahal Rd, Muktanand Nagar, Adajan');
INSERT INTO ADDRESS VALUES (3, 1, 8, '1st Floor Shalby Hospital, Rander road, near Navyug Arts College,');
INSERT INTO ADDRESS VALUES (4, 2, 7, '5 Jankipark, On Althan Naher, Nr. Vanita Residency, Althan');
INSERT INTO ADDRESS VALUES (5, 2, 5, 'Mazenine Floor, B Block, N. J. Complex, Opp C. N. G. Pump, Magob , Magob gam BRTS, Parvat Patiya');
INSERT INTO ADDRESS VALUES (6, 3, 1, '2,3,4 GROUND FLOOR, MILLENIUM POINT, OPP GABANI KEDNEY HOSPITAL, Lal Darwaja Station Rd');
INSERT INTO ADDRESS VALUES (7, 3, 1, '2,3,4 GROUND FLOOR, MILLENIUM POINT, OPP GABANI KEDNEY HOSPITAL, Lal Darwaja Station Rd');
INSERT INTO ADDRESS VALUES (8, 2, 3, 'Patidar Bhavan, Rampura, Rampura');
INSERT INTO ADDRESS VALUES (9, 3, 4, '201, Sargam Complex, Hira Baug, Varachha Road, Hira Baug');
INSERT INTO ADDRESS VALUES (10, 3, 6, 'Kashi Plaza, Majura Gate Rd, Kailash Nagar, Majura Gate');


--INSERTING DATA INTO BOOKINGS TABLE
INSERT INTO BOOKINGS VALUES (1, 2, 7, 2, '04-11-2022', '11-11-2022', 'confirmed', 6, 'upi', 420000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (2, 1, 1, 1, '19-11-2022', '25-11-2022', 'pending', 4, 'net banking', 200000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (3, 2, 3, 1, '18-11-2022', '26-11-2022', 'confirmed', 4, 'credit card', 200000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (4, 3, 4, 2, '22-11-2022', '27-11-2022', 'pending', 5, 'net banking', 75000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (5, 4, 8, 3, '19-11-2022', '26-11-2022', 'reject', 2, 'upi', 488000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (6, 5, 5, 1, '21-11-2022', '27-11-2022', 'confirmed', 8, 'credit card', 400000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (7, 6, 9, 3, '15-11-2022', '25-11-2022', 'pending', 4, 'net banking', 284000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (8, 7, 10, 1, '23-11-2022', '29-11-2022', 'reject', 2, 'net banking', 44000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (9, 8, 8, 3, '24-11-2022', '01-12-2022', 'pending', 4, 'credit card', 976000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (10, 9, 6, 1, '25-11-2022', '29-11-2022', 'confirmed', 3, 'credit card', 195000, CURRENT_TIMESTAMP);
INSERT INTO BOOKINGS VALUES (11, 10, 10, 3, '25-11-2022', '29-11-2022', 'confirmed', 1, 'net banking', 13000, CURRENT_TIMESTAMP);


--INSERTING DATA INTO TRAVELLER_DETAILS TABLE
INSERT INTO TRAVELLER_DETAIL VALUES (2, '05-11-22 2:44:55.870000000 PM', 'aman',20,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (2, '05-11-22 2:44:55.870000000 PM', 'anuj',20,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (2, '05-11-22 2:44:55.870000000 PM' , 'ankita',40,'female');
INSERT INTO TRAVELLER_DETAIL VALUES (2, '05-11-22 2:44:55.870000000 PM' , 'aarvi',60,'female');
INSERT INTO TRAVELLER_DETAIL VALUES (2,'05-11-22 2:44:55.870000000 PM', 'kesav',40,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (2, '05-11-22 2:44:55.870000000 PM', 'vinita',22,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (1, '05-11-22 2:45:01.840000000 PM', 'manan',22,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (1,  '05-11-22 2:45:01.840000000 PM', 'mayur',21,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (1,  '05-11-22 2:45:01.840000000 PM', 'manav',21,'male');
INSERT INTO TRAVELLER_DETAIL VALUES (1,  '05-11-22 2:45:01.840000000 PM', 'sahu',21,'male');
INSERT INTO traveller_detail values(3,'05-11-22 2:45:01.852000000 PM' , 'kamal',26,'male');
INSERT INTO traveller_detail values(3,'05-11-22 2:45:01.852000000 PM'  , 'nayan',26,'male');
INSERT INTO traveller_detail values(3,'05-11-22 2:45:01.852000000 PM'  , 'vinod',18,'male');
INSERT INTO traveller_detail values(3,'05-11-22 2:45:01.852000000 PM', 'deep',61,'male');
INSERT INTO traveller_detail values(3, '05-11-22 2:45:01.852000000 PM', 'shan',60,'male');
INSERT INTO traveller_detail values(4, '05-11-22 2:45:01.858000000 PM'  , 'akur',22,'male');
INSERT INTO traveller_detail values(4, '05-11-22 2:45:01.858000000 PM' , 'ankita',22,'female');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'neel',22,'male');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'nikita',22,'female');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'parth',22,'male');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'disha',22,'female');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'gurav',50,'male');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'sali',52,'female');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'archit',45,'male');
INSERT INTO traveller_detail values(5, '05-11-22 2:45:01.864000000 PM' , 'archita',45,'female');
INSERT INTO traveller_detail values(6, '05-11-22 2:45:01.870000000 PM' , 'shan',30,'male');
INSERT INTO traveller_detail values(6, '05-11-22 2:45:01.870000000 PM' , 'krusal',31,'male');
INSERT INTO traveller_detail values(6, '05-11-22 2:45:01.870000000 PM' , 'deep',32,'male');
INSERT INTO traveller_detail values(6, '05-11-22 2:45:01.870000000 PM' , 'shail',29,'male');
INSERT INTO traveller_detail values(7, '05-11-22 2:45:01.875000000 PM' , 'aarvi',22,'female');
INSERT INTO traveller_detail values(7, '05-11-22 2:45:01.875000000 PM' , 'anoj',22,'male');
INSERT INTO traveller_detail values(8, '05-11-22 2:45:01.881000000 PM' , 'sankit',30,'male');
INSERT INTO traveller_detail values(8, '05-11-22 2:45:01.881000000 PM' , 'samit',31,'male');
INSERT INTO traveller_detail values(8, '05-11-22 2:45:01.881000000 PM' , 'silu',32,'male');
INSERT INTO traveller_detail values(8, '05-11-22 2:45:01.881000000 PM' , 'nilu',29,'male');
INSERT INTO traveller_detail values(9, '05-11-22 2:45:01.887000000 PM' , 'sila',31,'female');
INSERT INTO traveller_detail values(9, '05-11-22 2:45:01.887000000 PM'  , 'megna',31,'female');
INSERT INTO traveller_detail values(10, '05-11-22 2:45:01.898000000 PM' , 'zeel',22,'male');

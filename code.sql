/*Registered User Table*/
CREATE TABLE RegisteredUser(
UserID CHAR(10) NOT NULL,
Postal_code CHAR(5) NOT NULL,
City VARCHAR(200) NOT NULL,
Street VARCHAR(100) NOT NULL,
Email VARCHAR(100),
First_Name VARCHAR(20) NOT NULL,
Second_Name VARCHAR(20),
Last_Name VARCHAR(20),
Registered_Date VARCHAR(10),
DOB VARCHAR(10),
Age INT,
Status CHAR(20),
NIC CHAR(20) NOT NULL,
Password VARCHAR(255),
GENDER CHAR(20),
CONSTRAINT user_PK PRIMARY KEY(UserID),
CONSTRAINT User_first_name UNIQUE (First_Name),
CONSTRAINT check_user_id CHECK (UserID LIKE '[U-u]%'),
CONSTRAINT check_user_password CHECK (LEN(Password) <= 10),
CONSTRAINT chk_user_Email CHECK (Email LIKE '%@%'),
);
/*Create User_Contact table*/
CREATE TABLE User_Contact(
UserID CHAR(10) NOT NULL,
Contact CHAR(20) NOT NULL,
CONSTRAINT PK_User_Contact PRIMARY KEY (UserID, Contact),
CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES RegisteredUser(UserID),
CONSTRAINT chk_user_Contact CHECK (LEN(Contact) > 0 AND 10 >= LEN(Contact))
);
/*Create payment table*/
CREATE TABLE Payment(
Payment_ID CHAR(10) NOT NULL,
Amount NUMERIC(10,2),
Date CHAR(20),
Time CHAR(10),
UserID CHAR(10) NOT NULL,
CONSTRAINT payment_PK PRIMARY KEY (Payment_ID),
CONSTRAINT user_FK FOREIGN KEY (UserID) REFERENCES RegisteredUser(UserID),
CONSTRAINT chk_payment_ID CHECK (Payment_ID LIKE '[PAY-pay]%')
);/*create employee table*/
CREATE TABLE Employee(
Emp_ID CHAR(10) NOT NULL,
Employee_type CHAR(40) NOT NULL,
Contact CHAR(10),
First_Name VARCHAR(60),
Second_Name VARCHAR(60),
Last_Name VARCHAR(60),
DOB CHAR(10),
Salary NUMERIC(10,2),
Street VARCHAR(100),
City VARCHAR(100),
NIC CHAR(12) NOT NULL,
CONSTRAINT emp_PK PRIMARY KEY (Emp_ID),
CONSTRAINT chk_employee_ID CHECK (Emp_ID LIKE 'EMP%')
);
/*Create table promotion*/
CREATE TABLE Promotion(
Promotion_ID CHAR(10) NOT NULL,
Promotion_Name CHAR(30),
Promotion_description VARCHAR(2000),
Start_Date CHAR(20),
End_Date CHAR(20),
Payment_method CHAR(20) NOT NULL,
CONSTRAINT promotion_PK PRIMARY KEY (Promotion_ID),
CONSTRAINT chk_promotion_ID CHECK (Promotion_ID LIKE '[PR-pr]%')
);
/*Create Pet table*/
CREATE TABLE Pet(
Pet_ID CHAR(20) NOT NULL,
UserID CHAR(10) NOT NULL,
Pet_Name VARCHAR(30),
DOB CHAR(15),
Age INT,
Color CHAR(20),
Breed CHAR(30),
Weight CHAR(30),
CONSTRAINT pet_PK PRIMARY KEY(Pet_ID),
CONSTRAINT user_FK_pet FOREIGN KEY (UserID) REFERENCES RegisteredUser(UserID),
CONSTRAINT pet_name UNIQUE (Pet_Name),
CONSTRAINT check_pet_id CHECK (Pet_ID LIKE '[PT-pt]%')
);
/*Create table BLOG*/
CREATE TABLE Blog(Blog_ID CHAR(10)NOT NULL,
Content VARCHAR(3000),
View_Count VARCHAR(1000),
UserID CHAR(10) NOT NULL,
Day CHAR(10),
Month CHAR(10),
Year CHAR(10),
CONSTRAINT blog_PK PRIMARY KEY (Blog_ID),
CONSTRAINT user_FK_blog FOREIGN KEY (UserID) REFERENCES RegisteredUser (UserID),
CONSTRAINT check_blog_id CHECK (Blog_ID LIKE '[B-b]%')
);
/*create service table*/
CREATE TABLE Service(
Service_ID CHAR(10) NOT NULL,
Service_Name VARCHAR(50),
Service_category VARCHAR(100) NOT NULL,
Availability CHAR(30) NOT NULL,
Rating CHAR(10),
CONSTRAINT service_PK PRIMARY KEY (Service_ID),
CONSTRAINT check_service_ID CHECK (Service_ID LIKE '[S-s]%')
);
/*Create appoinment table*/
CREATE TABLE Appointment(
Appointment_ID CHAR(20) NOT NULL,
Day CHAR(10) NOT NULL,
Month CHAR(10) NOT NULL,
Year CHAR(10) NOT NULL,
Time CHAR(10) NOT NULL,
Status CHAR(20) NOT NULL,
UserID CHAR(10) NOT NULL,
Service_ID CHAR(10) NOT NULL,
Promotion_ID CHAR(10) NOT NULL,
Payment_ID CHAR(10) NOT NULL,
CONSTRAINT appointment_PK PRIMARY KEY (Appointment_ID),
CONSTRAINT service_FK_appointment FOREIGN KEY(Service_ID) REFERENCES Service
(Service_ID),
CONSTRAINT promo_FK_appointment FOREIGN KEY (Promotion_ID) REFERENCES Promotion
(Promotion_ID),
CONSTRAINT payment_FK_appointment FOREIGN KEY (Payment_ID) REFERENCES Payment
(Payment_ID),
CONSTRAINT user_FK_appointment FOREIGN KEY (UserID) REFERENCES RegisteredUser
(UserID),
CONSTRAINT check_appointment_id CHECK (Appointment_ID LIKE '[AP-ap]%')
);
/*create review table*/
CREATE TABLE Review(
Review_ID CHAR(10) NOT NULL,
Review_Content VARCHAR(2000),UserID CHAR(10) NOT NULL,
Likes INT,
Dislikes INT,
Rating INT,
Day CHAR(10),
Month CHAR(10),
Year CHAR(10),
CONSTRAINT review_PK PRIMARY KEY (Review_ID),
CONSTRAINT user_FK_review FOREIGN KEY (UserID) REFERENCES RegisteredUser (UserID),
CONSTRAINT check_review_id CHECK (Review_ID LIKE '[REV-rev]%')
);
/*Create Blog_employee table*/
CREATE TABLE Blog_Employee(
Blog_ID CHAR(10) NOT NULL,
Emp_ID CHAR(10) NOT NULL,
CONSTRAINT PK_Blog_Employee PRIMARY KEY (Blog_ID, Emp_ID),
CONSTRAINT FK_Blog_Employee_Blog FOREIGN KEY (Blog_ID) REFERENCES Blog(Blog_ID),
CONSTRAINT FK_Blog_Employee_Employee FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);
/*create table Employee_register user table*/
CREATE TABLE Employee_Registered_User(
UserID CHAR(10) NOT NULL,
Emp_ID CHAR(10) NOT NULL,
CONSTRAINT PK_Employee_reg_user PRIMARY KEY (UserID, Emp_ID),
CONSTRAINT User_FK_emp_reg FOREIGN KEY (UserID) REFERENCES RegisteredUser(UserID),
CONSTRAINT Employee_FK_emp_reg FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);
/*create Employee_service table*/
CREATE TABLE Employee_Service(
Emp_ID CHAR(10) NOT NULL,
Service_ID CHAR(10)NOT NULL,
CONSTRAINT employee_service_PK PRIMARY KEY (Emp_ID,Service_ID),
CONSTRAINT employee_service_EMPID_FK FOREIGN KEY (Emp_ID) REFERENCES Employee
(Emp_ID),
CONSTRAINT employee_service_serviceID_FK FOREIGN KEY (Service_ID) REFERENCES
Service (Service_ID)
);
/*Create Product table*/
CREATE TABLE Product(
Item_ID CHAR(10) NOT NULL,
Item_Name VARCHAR(100),
Quantity INT,
Item_Description VARCHAR(1000),
Day CHAR(10),
Month CHAR(10),Year CHAR(10),
Item_category CHAR(50),
Price NUMERIC(10,2) NOT NULL,
Supplier_Name CHAR(50),
CONSTRAINT product_PK PRIMARY KEY (Item_ID),
CONSTRAINT check_product_id CHECK (Item_ID LIKE '[PROD-prod]%')
);
/*create table Order*/
CREATE TABLE Order_Detail(
OrderID CHAR(10) NOT NULL,
UserID CHAR(10) NOT NULL,
Order_Info VARCHAR(100),
Order_day CHAR(10),
Order_month CHAR(10),
Order_year CHAR(10),
Emp_ID CHAR(10) NOT NULL,
Promotion_ID CHAR(10) NOT NULL,
Price NUMERIC(10,2) NOT NULL,
Order_Status CHAR(10) NOT NULL,
Payment_ID CHAR(10) NOT NULL,
CONSTRAINT order_PK PRIMARY KEY (OrderID),
CONSTRAINT user_FK_orderdetails FOREIGN KEY (UserID) REFERENCES
RegisteredUser(UserID),
CONSTRAINT employee_FK_orderDetails FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
CONSTRAINT promotion_FK_orderdetails FOREIGN KEY (Promotion_ID) REFERENCES Promotion
(Promotion_ID),
CONSTRAINT payment_FK_orderDetails FOREIGN KEY (Payment_ID) REFERENCES Payment
(Payment_ID),
CONSTRAINT check_order_id CHECK (OrderID LIKE '[ORD-ord]%')
);
/*create table product order*/
CREATE TABLE Product_Order(
OrderID CHAR(10) NOT NULL,
Item_ID CHAR(10) NOT NULL,
CONSTRAINT order_item_PK PRIMARY KEY (OrderID,Item_ID),
CONSTRAINT order_FK_productOrder FOREIGN KEY (OrderID) REFERENCES
Order_Detail(OrderID),
CONSTRAINT product_FK_productOrder FOREIGN KEY (Item_ID) REFERENCES
Product(Item_ID)
);
/*Create table contact us form*/
CREATE TABLE Contact_US_Form(
Contact_ID CHAR(10) NOT NULL,
Subject VARCHAR(100),
Message VARCHAR(1000),
UserID CHAR(10) NOT NULL,Email CHAR(200),
Emp_ID CHAR(10) NOT NULL,
CONSTRAINT contact_us_form_PK PRIMARY KEY (Contact_ID),
CONSTRAINT user_FK_contactus FOREIGN KEY (UserID) REFERENCES RegisteredUser(UserID),
CONSTRAINT employee_FK_contactus FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
CONSTRAINT check_contact_id CHECK (Contact_ID LIKE '[CON-con]%')
);
/*Create promotion user table*/
CREATE TABLE Promotion_User(
Promotion_ID CHAR(10) NOT NULL,
UserID CHAR(10) NOT NULL,
CONSTRAINT promotion_user_PK PRIMARY KEY (Promotion_ID,UserID),
CONSTRAINT promotion_FK_promotionUser FOREIGN KEY (Promotion_ID) REFERENCES
Promotion(Promotion_ID),
CONSTRAINT registered_user_FK_promotionUser FOREIGN KEY (UserID) REFERENCES
RegisteredUser(UserID)
);
/*Create pet_medical_history table*/
CREATE TABLE Pet_Medical_History(
Med_ID CHAR(10) NOT NULL,
Pet_ID CHAR(20) NOT NULL,
Allergies VARCHAR(100),
Vet_Visit_Date CHAR(30),
Medication VARCHAR(2000),
Medical_Condition VARCHAR(2000),
Vaccination_history VARCHAR(2000),
CONSTRAINT PK_Pet_Medical_History PRIMARY KEY (Med_ID),
CONSTRAINT FK_petID FOREIGN KEY (Pet_ID) REFERENCES Pet(Pet_ID),
CONSTRAINT chk_med_ID CHECK (Med_ID LIKE '[MH-mh]%')
);
/*Sample data for RegisteredUser table*/
INSERT INTO RegisteredUser (UserID, Postal_code, City, Street, Email, First_Name,
Second_Name, Last_Name, Registered_Date, DOB, Age, Status, NIC, Password, GENDER)
VALUES
('U001', '00200', 'Colombo', 'Galle Road', 'dilshan@example.com',
'Dilshan', 'Chathuska','Samarasekara', '2024-05-01', '1990-01-15', 34, 'Suspended',
'901234567V', 'local1345', 'Male'),
('U002', '20000', 'Kandy', 'Peradeniya Road', 'lakmal@example.com',
'Lakmal', 'Lahiru', 'Jayawardhane', '2024-05-02', '1985-08-22', 39, 'Active',
'855432109V', 'pass45784', 'Female'),
('U003', '30000', 'Galle', 'Matara Road', 'jude@example.com', 'Pathum',
'Jude', 'Perera', '2024-05-03', '1995-11-10', 29, 'Active', '942345678V', 'secure892',
'Male'),
('U004', '40000', 'Matara', 'Hakmana Road', 'kalum@example.com', 'Bandara',
'Kalum', 'Sarath', '2024-05-04', '1982-03-25', 42, 'Suspended', '823456789V',
'password6', 'Female'),('U005', '50000', 'Jaffna', 'KKS Road', 'ruwan@example.com', 'Ruwan',
'Chirath','Wanninayake', '2024-05-05', '1998-07-12', 26, 'Active', '967890123V',
'xyzhytj13', 'Female');
/*Sample data for User_Contact table*/
INSERT INTO User_Contact (UserID, Contact)
VALUES
('U001', '0712345678'),
('U002', '0776543210'),
('U003', '0756789012'),
('U004', '0765432109'),
('U005', '0723456789');
/*Sample data for Payment table*/
INSERT INTO Payment (Payment_ID, Amount, Date, Time, UserID)
VALUES
('PAY001', 1000.00, '2024-05-01', '10:00', 'U001'),
('PAY002', 1500.00, '2024-05-02', '11:00', 'U002'),
('PAY003', 2000.00, '2024-05-03', '12:00', 'U003'),
('PAY004', 2500.00, '2024-05-04', '13:00', 'U004'),
('PAY005', 3000.00, '2024-05-05', '14:00', 'U005');
/*Sample data for Employee table*/
INSERT INTO Employee (Emp_ID, Employee_type, Contact, First_Name, Second_Name, Last_Name,
DOB, Salary, Street, City, NIC)
VALUES
('EMP001', 'Shop Manager', '0712345678', 'Nuwan', 'upul', 'Senadeera',
'1980-05-01', 50000.00, 'marvan Street', 'Colombo', '901234567V'),
('EMP002', 'Shop Mssistant', '0776543210', 'Samith', 'Iman',
'Rathnasekara', '1982-07-15', 40000.00, '6th Lane', 'Kandy', '851432109V'),
('EMP003', 'Shop Administrator', '0756789012', 'Ranil', 'Yomal',
'Wdanagamage', '1984-10-30', 30000.00, '123 Road', 'Galle', '941325678V'),
('EMP004', 'Shop Assistant', '0765432109', 'Kamal', 'Asitha',
'Addaraarachchi', '1986-12-25', 35000.00, 'xyz Road', 'Matara', '821416789V'),
('EMP005', 'Shop Manager', '0723456789', 'Sumal', 'sasika', 'Deepal',
'1988-03-10', 25000.00, 'abc Street', 'Jaffna', '961820123V');
/*Sample data for Promotion table*/
INSERT INTO Promotion (Promotion_ID, Promotion_Name, Promotion_description, Start_Date,
End_Date, Payment_method)
VALUES
('PR001', 'Special August Sale', 'Get 20% off on all items!', '2024-06-01',
'2024-06-30', 'Credit Card'),
('PR002', 'Internation Pet Day', 'Buy one, get one free on selected
items!', '2024-07-01', '2024-07-31', 'Cash'),
('PR003', 'Holiday Special', 'Limited time offer - 30% off on all
services!', '2024-08-01', '2024-08-31', 'Debit Card'),
('PR004', 'Year End Clearance Sale', 'Biggest sale of the year - up to 50%
off!', '2024-09-01', '2024-09-30', 'PayPal'),('PR005', 'Sinhala And Tamil New Year', 'Do not miss massive discounts
storewide!', '2024-10-01', '2024-10-31', 'Bank Transfer');
/*Sample data for Pet table*/
INSERT INTO Pet (Pet_ID, UserID, Pet_Name, DOB, Age, Color, Breed, Weight)
VALUES
('PT001', 'U001', 'Buddy', '2019-03-15', 5, 'Brown', 'Labrador Retriever',
'25kg'),
('PT002', 'U002', 'Max', '2020-07-20', 4, 'Black', 'German Shepherd',
'30kg'),
('PT003', 'U003', 'Bella', '2018-11-10', 6, 'White', 'Golden Retriever',
'20kg'),
('PT004', 'U004', 'Luna', '2017-05-25', 8, 'Grey', 'Siberian Husky',
'28kg'),
('PT005', 'U005', 'Charlie', '2016-09-12', 9, 'Golden', 'Poodle', '15kg');
/*Sample data for Blog table*/
INSERT INTO Blog (Blog_ID, Content, View_Count, UserID, Day, Month, Year)
VALUES
('B001', 'Tips for training your new puppy!', '1000', 'U001', '01', '05',
'2024'),
('B002', 'The importance of regular vet check-ups', '800', 'U002', '02',
'05', '2024'),
('B003', 'Choosing the right food for your cat', '1200', 'U003', '03',
'05', '2024'),
('B004', 'How to deal with separation anxiety in dogs', '900', 'U004',
'04', '05', '2024'),
('B005', 'Common health problems in senior pets', '1100', 'U005', '05',
'05', '2024');
/*Sample data for Service table*/
INSERT INTO Service (Service_ID, Service_Name, Service_category, Availability, Rating)
VALUES
('S001', 'Dog Grooming', 'Pet Care', 'Available', '4.5'),
('S002', 'Cat Boarding', 'Pet Care', 'Available', '4.0'),
('S003', 'Dog Walking', 'Pet Care', 'Available', '4.2'),
('S004', 'Veterinary Services', 'Pet Care', 'Available', '4.8'),
('S005', 'Pet Training', 'Pet Care', 'Available', '4.7');
/*Sample data for Appointment table*/
INSERT INTO Appointment (Appointment_ID, Day, Month, Year, Time, Status, UserID,
Service_ID, Promotion_ID, Payment_ID)
VALUES
('AP001', '01', '06', '2024', '10:00', 'Confirmed', 'U001', 'S001',
'PR001', 'PAY001'),('AP002', '02', '06', '2024', '11:00', 'Confirmed', 'U002', 'S002',
'PR002', 'PAY002'),
('AP003', '03', '06', '2024', '12:00', 'Confirmed', 'U003', 'S003',
'PR003', 'PAY003'),
('AP004', '04', '06', '2024', '13:00', 'Confirmed', 'U004', 'S004',
'PR004', 'PAY004'),
('AP005', '05', '06', '2024', '14:00', 'Confirmed', 'U005', 'S005',
'PR005', 'PAY005');
/*Sample data for Review table*/
INSERT INTO Review (Review_ID, Review_Content, UserID, Likes, Dislikes, Rating, Day,
Month, Year)
VALUES
('REV001', 'Great service, highly recommend!', 'U001', 10, 2, 5, '01',
'06', '2024'),
('REV002', 'Very friendly staff, will definitely come back!', 'U002', 8, 1,
4, '02', '06', '2024'),
('REV003', 'Excellent experience, my pet loved it!', 'U003', 9, 0, 4.5,
'03', '06', '2024'),
('REV004', 'Knowledgeable vets and clean facilities', 'U004', 7, 1, 4.2,
'04', '06', '2024'),
('REV005', 'Professional trainers, saw results right away', 'U005', 9, 0,
4.7, '05', '06', '2024');
/*Sample data for Blog_Employee table*/
INSERT INTO Blog_Employee (Blog_ID, Emp_ID)
VALUES
('B001', 'EMP001'),
('B002', 'EMP002'),
('B003', 'EMP003'),
('B004', 'EMP004'),
('B005', 'EMP005');
/*Sample data for Employee_Registered_User table*/
INSERT INTO Employee_Registered_User (UserID, Emp_ID)
VALUES
('U001', 'EMP001'),
('U002', 'EMP002'),
('U003', 'EMP003'),
('U004', 'EMP004'),
('U005', 'EMP005');
/*Sample data for Employee_Service table*/
INSERT INTO Employee_Service (Emp_ID, Service_ID)
VALUES
('EMP001', 'S001'),
('EMP002', 'S002'),
('EMP003', 'S003'),('EMP004', 'S004'),
('EMP005', 'S005');
/*Sample data for Product table*/
INSERT INTO Product (Item_ID, Item_Name, Quantity, Item_Description, Day, Month, Year,
Item_category, Price, Supplier_Name)
VALUES
('PROD001', 'Dog Food', 100, 'Premium quality dog food', '01', '06', '2024', 'Pet
Supplies', 20.00, 'PetMart'),
('PROD002', 'Cat Litter', 50, 'Odor-absorbing cat litter', '02', '06', '2024',
'Pet Supplies', 15.00, 'PetCo'),
('PROD003', 'Dog Collar', 200, 'Adjustable dog collar', '03', '06', '2024', 'Pet
Supplies', 10.00, 'PetSmart'),
('PROD004', 'Cat Toy', 75, 'Interactive cat toy', '04', '06', '2024', 'Pet
Supplies', 8.00, 'PetLand'),
('PROD005', 'Bird Cage', 30, 'Spacious bird cage', '05', '06', '2024', 'Pet
Supplies', 50.00, 'Feathered Friends');
/*Sample data for Order_Detail table*/
INSERT INTO Order_Detail (OrderID, UserID, Order_Info, Order_day, Order_month,
Order_year, Emp_ID, Promotion_ID, Price, Order_Status, Payment_ID)
VALUES
('ORD001', 'U001', 'PROD001 x 2, PROD002 x 1', '01', '06', '2024', 'EMP001',
'PR001', 55.00, 'Completed', 'PAY001'),
('ORD002', 'U002', 'PROD003 x 3, PROD004 x 2', '02', '06', '2024', 'EMP002',
'PR002', 59.00, 'Completed', 'PAY002'),
('ORD003', 'U003', 'PROD005 x 1, PROD001 x 1', '03', '06', '2024', 'EMP003',
'PR003', 70.00, 'Completed', 'PAY003'),
('ORD004', 'U004', 'PROD002 x 2, PROD003 x 1', '04', '06', '2024', 'EMP004',
'PR004', 45.00, 'Completed', 'PAY004'),
('ORD005', 'U005', 'PROD004 x 1, PROD005 x 2', '05', '06', '2024', 'EMP005',
'PR005', 108.00, 'Completed', 'PAY005');
/*Sample data for Product_Order table*/
INSERT INTO Product_Order (OrderID, Item_ID)
VALUES
('ORD001', 'PROD001'),
('ORD001', 'PROD002'),
('ORD002', 'PROD003'),
('ORD002', 'PROD004'),
('ORD003', 'PROD005');
/*Sample data for Contact_US_Form table*/
INSERT INTO Contact_US_Form (Contact_ID, Subject, Message, UserID, Email, Emp_ID)
VALUES
('CON001', 'Query about grooming services', 'I would like to know more about the
grooming services offered.', 'U001', 'dilshan@example.com', 'EMP001'),
('CON002', 'Feedback on recent visit', 'I wanted to provide feedback on my recent
visit to your clinic.', 'U002', 'lakmal@example.com', 'EMP002'),('CON003', 'Complaint about product quality', 'I received a damaged product and
would like a refund.', 'U003', 'jude@example.com', 'EMP003'),
('CON004', 'Request for service appointment', 'I would like to schedule an
appointment for my pet.', 'U004', 'kalum@example.com', 'EMP004'),
('CON005', 'General inquiry', 'I have some questions about your products and
services.', 'U005', 'ruwan@example.com', 'EMP005');
/*Sample data for Promotion_User table*/
INSERT INTO Promotion_User (Promotion_ID, UserID)
VALUES
('PR001', 'U001'),
('PR002', 'U002'),
('PR003', 'U003'),
('PR004', 'U004'),
('PR005', 'U005');
/*Sample data for Pet_Medical_History table*/
INSERT INTO Pet_Medical_History (Med_ID, Pet_ID, Allergies, Vet_Visit_Date, Medication,
Medical_Condition, Vaccination_history)
VALUES
('MH001', 'PT001', 'None', '2023-12-10', 'None', 'Healthy', 'Up to date'),
('MH002', 'PT002', 'Pollen', '2023-11-20', 'Antihistamines', 'Allergy',
'Incomplete'),
('MH003', 'PT003', 'Flea bites', '2024-01-05', 'Flea treatment',
'Dermatitis', 'Complete'),
('MH004', 'PT004', 'Dust mites', '2024-02-15', 'Antibiotics', 'Respiratory
infection', 'Incomplete'),
('MH005', 'PT005', 'None', '2023-10-30', 'None', 'Healthy', 'Up to date');
/*Table Reading*/
SELECT * FROM RegisteredUser;
SELECT * FROM Appointment;
SELECT * FROM Blog;
SELECT * FROM Blog_Employee;
SELECT * FROM Contact_US_Form;
SELECT * FROM Employee;
SELECT * FROM Employee_Registered_User;
SELECT * FROM Employee_Service;
SELECT * FROM Order_Detail;
SELECT * FROM Payment;
SELECT * FROM Pet;
SELECT * FROM Pet_Medical_History;
SELECT * FROM Product;
SELECT * FROM Product_Order;
SELECT * FROM Promotion;
SELECT * FROM Promotion_User;
SELECT * FROM Review;
SELECT * FROM Service;
SELECT * FROM User_Contact;

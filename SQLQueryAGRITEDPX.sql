


USE AGRITEDPX

CREATE TABLE FARMER ( 
FarmerId INT IDENTITY(1,1) PRIMARY KEY, 
Name VARCHAR(50) NOT NULL, 
Age INT NOT NULL, 
PhoneNumber VARCHAR(15) NOT NULL, 
Address TEXT, 
PaymentMethod VARCHAR(20) NOT NULL, 
Experience INT,
Gender VARCHAR(20)
); 
CREATE TABLE FIELD (  
FieldId INT IDENTITY(1,1) PRIMARY KEY, 
RentalFee DECIMAL(10, 2) NOT NULL, 
Name VARCHAR(50) NOT NULL, 
Size DECIMAL(10, 2) NOT NULL
);  
CREATE TABLE CROP (  
CropId INT IDENTITY(1,1) PRIMARY KEY, 
Type VARCHAR(50) NOT NULL, 
AvarageYield DECIMAL(10, 2) CHECK (AvarageYield <= 100), 
Price DECIMAL(10, 2) NOT NULL
);  
CREATE TABLE EQUIPMENT (  
EquipmentId INT IDENTITY(1,1) PRIMARY KEY, 
Type VARCHAR(50), 
Price DECIMAL(10, 2) NOT NULL,

);  
CREATE TABLE FERTILIZER (  
FertilizerId INT IDENTITY(1,1) PRIMARY KEY, 
Type VARCHAR(50) NOT NULL, 
Amount DECIMAL(10, 2) NOT NULL,  
Price DECIMAL(10, 2) NOT NULL
);  
CREATE TABLE SUPPLIER (  
SupplierId INT IDENTITY(1,1) PRIMARY KEY, 
Email VARCHAR(50), 
CompanyName VARCHAR(50) NOT NULL, 
PhoneNumber VARCHAR(15) NOT NULL, 
ProductType VARCHAR(50) NOT NULL  
); 
CREATE TABLE RESERVATION ( 
ReservationId INT IDENTITY(1,1), 
FieldId INT,                  
FarmerId INT,                
CropId INT,
EquipmentId INT,
FertilizerId INT,
TotalPrice DECIMAL(10, 2) NOT NULL,             
StartDate DATE NOT NULL,               
EndDate DATE NOT NULL,                 
Status VARCHAR(50) NOT NULL,
PRIMARY KEY (ReservationId),
FOREIGN KEY (FieldId) REFERENCES FIELD(FieldId), 
FOREIGN KEY (FarmerId) REFERENCES Farmer(FarmerId), 
FOREIGN KEY (CropId) REFERENCES Crop(CropId),
FOREIGN KEY (EquipmentId) REFERENCES EQUIPMENT(EquipmentId), 
FOREIGN KEY (FertilizerId) REFERENCES FERTILIZER(FertilizerId)
); 

CREATE TABLE USEDFOR (  
EquipmentId INT, 
CropId INT, 
PRIMARY KEY (EquipmentId, CropId), 
FOREIGN KEY (EquipmentId) REFERENCES EQUIPMENT(EquipmentId), 
FOREIGN KEY (CropId) REFERENCES Crop(CropId) 
); 
CREATE TABLE FERTILIZERSUPPLIER ( 
FertilizerId INT, 
SupplierId INT, 
PRIMARY KEY (FertilizerId, SupplierId), 
FOREIGN KEY (FertilizerId) REFERENCES FERTILIZER(FertilizerId), 
FOREIGN KEY (SupplierId) REFERENCES SUPPLIER(SupplierId) 
); 
CREATE TABLE CROPSUPPLIER ( 
CropId INT, 
SupplierId INT, 
PRIMARY KEY (CropId, SupplierId), 
FOREIGN KEY (CropId) REFERENCES CROP(CropId), 
FOREIGN KEY (SupplierId) REFERENCES SUPPLIER(SupplierId) 
); 
CREATE TABLE CROPFERTILIZER ( 
CropId INT, 
FertilizerId INT, 
PRIMARY KEY (CropId, FertilizerId), 
FOREIGN KEY (CropId) REFERENCES CROP(CropId), 
FOREIGN KEY (FertilizerId) REFERENCES FERTILIZER(FertilizerId) 
); 

CREATE TABLE QUALITY (
    QualityId INT IDENTITY (1,1),              
    FertilizerId INT,
	QualityDescription VARCHAR(50),
    PRIMARY KEY (QualityId,FertilizerId), 
    FOREIGN KEY (FertilizerId) REFERENCES FERTILIZER(FertilizerId)
);

INSERT INTO CROP (Type, AvarageYield, Price) VALUES
('Wheat', 80.00, 300.00),
('Corn', 70.00, 300.00),
('Strawberry', 40.00, 500.00),
('Cucumber', 70.00, 300.00),
('Potato', 60.00, 200.00),
('Tomato', 50.00, 200.00);

INSERT INTO EQUIPMENT (Type, Price)
VALUES 
('Planting Machine', 1000.00),
('Harvest Machine', 1500.00),
('Fertilizer Machine', 2000.00);

INSERT INTO FERTILIZER (Type, Amount, Price)
VALUES 
('Organic Fertilizer', 3.00, 700.00),
('Chemical Fertilizer', 5.00, 500.00);

INSERT INTO FIELD (RentalFee, Name, Size)
VALUES 
(5000.00, 'Main Field', 5000.00);



